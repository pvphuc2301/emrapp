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
            varPID = Request.QueryString["pid"];
            varVbID = Request.QueryString["vbid"];

            RadPageView1.ContentUrl = "~/phar/orderlist.aspx?pid=" + varPID + "&vbid=" + varVbID;
            RadPageView3.ContentUrl = "~/phar/opdpreslist.aspx?pid=" + varPID;

            if (!IsPostBack)
            {
                LoadPatientInfo(true);
            }

            if (Request["__EVENTTARGET"] == "goToPage")
            {
                dynamic args = JsonConvert.DeserializeObject<dynamic>(Request["__EVENTARGUMENT"]);

                string apiString = string.Format("api/patient/encounter-history/{0}?pageIndex={1}&pageSize={2}&keyword={3}", args.varPID, args.pageIndex, args.pageSize, args.userName);

                UpdateRadGrid(RadGrid1, apiString, args);
                RadGrid1.DataBind();
            }
        }

        public void LoadPatientInfo(bool vi_laganue)
        {
            if (vi_laganue) //Language = Vietnamese ( Default)
            {
                lblGender.InnerText = DataHelpers.patient.gender_l;
                lblAge.InnerText = DataHelpers.patient.date_of_birth;
                lblAddress.InnerText = DataHelpers.patient.address_line_l + " " + DataHelpers.patient.address_subregion_l + " " + DataHelpers.patient.address_region_l + " " + DataHelpers.patient.address_country_l;
                lblPhone.InnerText = DataHelpers.patient.contact_phone_number;
                lblName.InnerText = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
                lblRelationship.InnerText = DataHelpers.patient.relationship_type_rcd;
                
            }
            else
            {
                lblGender.InnerText = DataHelpers.patient.gender_e;
                lblAge.InnerText = DataHelpers.patient.date_of_birth;
                lblAddress.InnerText = DataHelpers.patient.address_line_e + " " + DataHelpers.patient.address_subregion_e + " " + DataHelpers.patient.address_region_e + " " + DataHelpers.patient.address_country_e;
                lblPhone.InnerText = DataHelpers.patient.contact_phone_number;
                lblName.InnerText = DataHelpers.patient.first_name_e + " " + DataHelpers.patient.last_name_e;
                lblRelationship.InnerText = DataHelpers.patient.relationship_type_rcd;

            }
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

            string apiString = string.Format("api/patient/encounter-history/{0}?pageIndex={1}&pageSize={2}&keyword={3}", varPID, args.pageIndex, args.pageSize, args.userName);

            UpdateRadGrid(RadGrid1, apiString, args);
        }

        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick")
            {
                bool lastState = e.Item.Expanded;

            }
        }

        //protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    GridDataItem item = (GridDataItem)(sender as RadGrid).SelectedItems[0];

        //    string PVID = item.GetDataKeyValue("patient_visit_id").ToString();
        //    string visitType = item.GetDataKeyValue("visit_type_rcd").ToString();
        //    string closureDateTime = item.GetDataKeyValue("closure_date_time").ToString();

        //    if(closureDateTime != "")
        //    {
                
        //    }
        //    else
        //    {
        //        string apiStr = "api/emr/list-form/" + PVID + "/" + visitType;

        //        string _jsonData = WebHelpers.GetAPI(apiStr);

        //        if (_jsonData != null)
        //        {
        //            DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);
        //            ddlDocList.Items.Clear();

        //            foreach (DataRow row in db.Rows)
        //            {
        //                ListItem item1 = new ListItem();

        //                item1.Value = row.Field<string>("model_id") + "|" + row.Field<string>("url") + "|" + PVID;
        //                item1.Text = row.Field<string>("model_name");

        //                ddlDocList.Items.Add(item1);
        //            }
        //        }

        //        showPopup = true;
        //    }
        //}

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if(e.Item is GridDataItem)
            {
                Button btnAction = e.Item.FindControl("btnAction") as Button;
                
                GridEditableItem editableItem = e.Item as GridEditableItem;

                string closure_date_time = editableItem["closure_date_time"].Text;
                string allow_date_time = ((GridDataItem)e.Item).GetDataKeyValue("allow_date_time").ToString();
                

                DateTime dateTime;
                btnAction.Attributes["data-pvid"] = ((GridDataItem)e.Item).GetDataKeyValue("patient_visit_id").ToString();
                btnAction.Attributes["data-visitType"] = ((GridDataItem)e.Item).GetDataKeyValue("visit_type_rcd").ToString();
                
                if (DateTime.TryParse(closure_date_time, out dateTime))
                {
                    btnAction.Text = "Update";
                    btnAction.CssClass = "btn btn-warning";

                    if (allow_date_time != null)
                    {
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

            string _jsonData = WebHelpers.GetAPI("api/emr/check-document-exists/" + PVID + "/" + modelID);

            if (!string.IsNullOrEmpty(_jsonData))
            {
                DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);
                
                _jsonData = WebHelpers.GetAPI("api/emr/get-api/" + modelID);

                dynamic data = JObject.Parse(_jsonData);

                for (int i = 0; i <db.Rows.Count; i++)
                {
                    if(db.Rows[i].Field<string>("status") == DocumentStatus.DRAFT)
                    {
                        DataHelpers.varDocId = db.Rows[i].Field<string>("document_id");
                        isDraft = true;
                        break;
                    }
                }

                if (!isDraft)
                {
                    string docId = Guid.NewGuid().ToString();

                    var objTemp = new { document_id = docId, patient_visit_id = PVID, model_id = modelID, user_name = userName };

                    DataHelpers.varDocId = docId;
                    DataHelpers.varModelId = modelID;
                    DataHelpers.varPVId = PVID;

                    string statusCode = WebHelpers.PostAPI("api/" + data.api + "/add", objTemp);
                    
                    if(statusCode == WebHelpers.ResponseStatus.OK)
                    {
                        statusCode = WebHelpers.PostAPI("api/" + data.api + "/log/" + docId);
                        Response.Redirect("../" + _params[1]);
                    }
                }
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

        protected void btnAction_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            string pvid = btn.Attributes["data-pvid"].ToString();
            string visitType = btn.Attributes["data-visittype"].ToString();
            
            if (btn.Text == "Add new")
            {
                AddForm(pvid, visitType);
            }
        }

        private void AddForm(string pvid, string visitType)
        {
            string apiStr = "api/emr/list-form/" + pvid + "/" + visitType;

            string _jsonData = WebHelpers.GetAPI(apiStr);
            
            if (!string.IsNullOrEmpty(_jsonData))
            {
                DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);
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
            string _jsonData = WebHelpers.GetAPI(apiString);

            if (!string.IsNullOrEmpty(_jsonData))
            {
                JObject json = JObject.Parse(_jsonData);
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