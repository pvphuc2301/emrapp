using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Windows.Documents.Flow.Model.Fields;

namespace EMR
{
    public partial class PatientSummary : System.Web.UI.Page
    {
        public string varPID = "";
        public bool showPopup = false;
        public bool isDraft = false;
        public string docId = "";
        string varVbID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            DocumentList.Visible = false;

            varPID = Request.QueryString["pid"];
            varVbID = Request.QueryString["vpid"];

            RadPageView1.ContentUrl = "~/phar/orderlist.aspx?pid=" + varPID + "&vbid=" + varVbID;
            RadPageView3.ContentUrl = "~/phar/opdpreslist.aspx?pid=" + varPID;

            if (!IsPostBack)
            {
                LoadPatientInfo();
            }
            PostBackEvent();
        }

        private void PostBackEvent()
        {
            if (Request["__EVENTTARGET"] == "goToPage")
            {
                dynamic args = JsonConvert.DeserializeObject<dynamic>(Request["__EVENTARGUMENT"]);

                string apiString = string.Format("api/patient/encounter-history/{0}?pageIndex={1}&pageSize={2}&keyword={3}", args.varPID, args.pageIndex, args.pageSize, args.userName);

                UpdateRadGrid(RadGrid1, apiString, args);
                RadGrid1.DataBind();
            }
        }

        public void LoadPatientInfo()
        {
            Patient patient = Patient.Instance();

            lblGender.InnerText = patient.GetGender();
            lblAge.InnerText = WebHelpers.FormatDateTime(patient.date_of_birth);
            lblAddress.InnerText = patient.GetAddress();
            lblPhone.InnerText = patient.contact_phone_number;
            lblName.InnerText = patient.GetFullName();
            lblRelationship.InnerText = patient.relationship_type_rcd;
        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            dynamic args = new System.Dynamic.ExpandoObject();
            args.varPID = 1;
            args.pageIndex = 1;
            args.pageSize = 4;
            args.totalRows = -1;
            args.totalPages = -1;
            args.userName = "my.nguyen";

            string apiString = $"api/patient/encounter-history/{DataHelpers._LOCATION}/{varPID}?pageIndex={args.pageIndex}&pageSize={args.pageSize}&keyword={args.userName}";

            UpdateRadGrid(RadGrid1, apiString, args);
        }

        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "addNew":
                    GridDataItem item = (e.Item as GridDataItem);
                    DocumentList.Visible = true;
                    string pvid = item.GetDataKeyValue("patient_visit_id").ToString();
                    string visitType = item.GetDataKeyValue("visit_type_rcd").ToString();
                    AddForm(pvid, visitType);
                    break;
            }
            if (e.CommandName == "RowClick")
            {
                bool lastState = e.Item.Expanded;

            }
        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if(e.Item is GridDataItem)
            {
                LinkButton btnAction = e.Item.FindControl("btnAddNew") as LinkButton;
                
                GridEditableItem editableItem = e.Item as GridEditableItem;

                string closure_date_time = editableItem["closure_date_time"].Text;
                string allow_date_time = ((GridDataItem)e.Item).GetDataKeyValue("allow_date_time").ToString();
                
                DateTime dateTime;
                if (DateTime.TryParse(closure_date_time, out dateTime))
                {
                    btnAction.Text = "Update";
                    btnAction.CssClass = "btn btn-sm btn-secondary waves-effect ";

                    if (string.IsNullOrEmpty(allow_date_time))
                    {
                        btnAction.CssClass += "disabled";
                        btnAction.Enabled = false;
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string selectedItem = Request.Form.Get("ddlDocList");

            string[] _params = selectedItem.Split('|');

            string PVID = _params[2];
            string modelID = _params[0];
            string userName = (string)Session["UserID"];

            dynamic response = WebHelpers.GetAPI(string.Format("api/emr/check-document-exists/{0}/{1}/{2}", DataHelpers._LOCATION, PVID, modelID));

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                dynamic response2 = WebHelpers.GetAPI(string.Format("api/emr/get-api/{0}/{1}",DataHelpers._LOCATION, modelID));

                if(response2.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic data = JObject.Parse(response2.Data);

                    string docId = Guid.NewGuid().ToString();

                    var objTemp = new { document_id = docId, patient_visit_id = PVID, model_id = modelID, user_name = userName };

                    DataHelpers.varDocId = docId;
                    DataHelpers.varModelId = modelID;
                    DataHelpers.varPVId = PVID;

                    dynamic response3 = WebHelpers.PostAPI($"api/{data.api}/add/{DataHelpers._LOCATION}", objTemp);

                    if (response3.Status == System.Net.HttpStatusCode.OK)
                    {
                        dynamic response4 = WebHelpers.PostAPI($"api/{data.api}/log/{DataHelpers._LOCATION}/{docId}");
                        if(response4.Status == System.Net.HttpStatusCode.OK)
                        {
                            string url = $"../{_params[1]}?modelId={modelID}&docId={docId}&pId={varPID}&vpId={Request["vpid"]}&pvid={PVID}";

                            if(WebHelpers.CanOpenForm(Page, docId, DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
                            {
                                Response.Redirect(url, false);
                            }

                        }
                    }
                }

                //for (int i = 0; i <db.Rows.Count; i++)
                //{
                //    if(db.Rows[i].Field<string>("status") == DocumentStatus.DRAFT)
                //    {
                //        DataHelpers.varDocId = db.Rows[i].Field<string>("document_id");
                //        isDraft = true;
                //        break;
                //    }
                //}

                //if (!isDraft)
                //{
                    
                //}
            }
        }

        protected void btnOpen_Click(object sender, EventArgs e)
        {
            try
            {
                string selectedItem = Request.Form.Get("ddlDocList");

                string[] _params = selectedItem.Split('|');
                
                Response.Redirect("../" + _params[1] + "?docId=" + DataHelpers.varDocId, false);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }

        private void AddForm(string pvid, string visitType)
        {
            string apiStr = "api/emr/list-form/" + pvid + "/" + visitType;

            dynamic response = WebHelpers.GetAPI(apiStr);
            
            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);
                ddlDocList.Items.Clear();

                foreach (DataRow row in db.Rows)
                {
                    ListItem item1 = new ListItem();

                    item1.Value = row.Field<string>("model_id") + "|" + row.Field<string>("url") + "|" + pvid;
                    item1.Text = row.Field<string>("model_name");

                    ddlDocList.Items.Add(item1);
                }
                showPopup = true;
            }
        }

        private void UpdateRadGrid(RadGrid radGrid, string apiString, dynamic args)
        {
            dynamic response = WebHelpers.GetAPI(apiString);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                JObject json = JObject.Parse(response.Data);
                string strJSON = "";
                strJSON += json["items"];

                radGrid.DataSource = WebHelpers.GetJSONToDataTable(strJSON);
                
                args.pageIndex = Int32.Parse(json["pageIndex"].ToString());
                args.pageSize = Int32.Parse(json["pageSize"].ToString());
                args.totalRows = Int32.Parse(json["totalRows"].ToString());
                args.totalPages = Int32.Parse(json["totalPages"].ToString());

                HtmlGenericControl li = new HtmlGenericControl("li");

                li.Attributes.Add("class", args.pageIndex == 1 ? "page-item disabled" : "page-item");

                HtmlGenericControl anchor = new HtmlGenericControl("a");
                anchor.InnerText = "Previous";
                anchor.Attributes.Add("onclick", string.Format("goToPage('{0}', {1}, {2}, '{3}')", args.varPID, 1, args.pageSize, args.userName));
                anchor.Attributes.Add("class", "page-link");
                anchor.Attributes.Add("href", "javascript:void(0)");

                li.Controls.Add(anchor);

                pagination1.Controls.Add(li);
                
                for (int i = 0; i < int.Parse(Convert.ToString(args.totalPages)); i++)
                {
                    li = new HtmlGenericControl("li");
                    li.Attributes.Add("class", args.pageIndex == (i + 1) ? "page-item active" : "page-item");

                    anchor = new HtmlGenericControl("a");

                    anchor.Attributes.Add("onclick", string.Format("goToPage('{0}', {1}, {2}, '{3}')", varPID, (i + 1), args.pageSize, args.userName));
                    anchor.InnerText = (i + 1).ToString();
                    anchor.Attributes.Add("class", "page-link");
                    anchor.Attributes.Add("href", "javascript:void(0)");

                    li.Controls.Add(anchor);

                    pagination1.Controls.Add(li);
                }

                li = new HtmlGenericControl("li");
                li.Attributes.Add("class", args.pageIndex == args.totalPages ? "page-item disabled" : "page-item");

                anchor = new HtmlGenericControl("a");

                anchor.InnerText = "Next";

                anchor.Attributes.Add("onclick", string.Format("goToPage('{0}', {1}, {2}, '{3}')", args.varPID, args.totalPages, args.pageSize, args.userName));

                anchor.Attributes.Add("class", "page-link");
                anchor.Attributes.Add("href", "javascript:void(0)");

                li.Controls.Add(anchor);

                pagination1.Controls.Add(li);
            }
        }
    }
}