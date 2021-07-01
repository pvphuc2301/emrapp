using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.Other
{
    public partial class index : System.Web.UI.Page
    {
        public string varPID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            varPID = Request.QueryString["pid"];
            if (!IsPostBack)
            {
                LoadPatientInfo();
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
        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            string apiString = $"api/patient/encounter-history/{DataHelpers._LOCATION}/{varPID}";

            dynamic response = WebHelpers.GetAPI(apiString);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
            }
        }

        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "addNew":
                    GridDataItem item = (e.Item as GridDataItem);
                    //DocumentList.Visible = true;
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
                
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), ScriptKey.SHOW_POPUP, "setTimeout(()=> { $('#DocumentList').modal('show'); },0);", true);

            }
        }
        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                LinkButton btnAction = e.Item.FindControl("btnAddNew") as LinkButton;

                GridEditableItem editableItem = e.Item as GridEditableItem;

                string closure_date_time = editableItem["closure_date_time"].Text;
                string allow_date_time = ((GridDataItem)e.Item).GetDataKeyValue("allow_date_time").ToString();

                //DateTime dateTime1 = DateTime.Parse(closure_date_time);

                if (DateTime.TryParse(closure_date_time, out DateTime dateTime))
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
                WebHelpers.SendError(Page, ex);
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
                //DataTable db = WebHelpers.GetJSONToDataTable(response.Data);

                dynamic response2 = WebHelpers.GetAPI(string.Format("api/emr/get-api/{0}/{1}", DataHelpers._LOCATION, modelID));

                if (response2.Status == System.Net.HttpStatusCode.OK)
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
                        if (response4.Status == System.Net.HttpStatusCode.OK)
                        {
                            string url = $"../{_params[1]}?modelId={modelID}&docId={docId}&pId={varPID}&vpId={Request["vpid"]}&pvid={PVID}";

                            if (WebHelpers.CanOpenForm(Page, docId, DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
                            {
                                Response.Redirect(url, false);

                            }
                        }
                    }
                }
            }
        }

    }
}