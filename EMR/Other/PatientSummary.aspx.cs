using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            varPID = Request.QueryString["pid"];

            if (!IsPostBack)
            {
                LoadPatientInfo(true);
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
            string _jsonData = WebHelpers.GetAPI("api/patient/encounter-history/" + varPID + "?pageIndex=1&pageSize=4&keyword=my.nguyen");
            
            if (_jsonData != null)
            {
                JObject json = JObject.Parse(_jsonData);
                string strJSON = "";
                strJSON += json["items"];
                
                (sender as RadGrid).DataSource = WebHelpers.GetJSONToDataTable(strJSON);

            }
        }

        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick")
            {
                bool lastState = e.Item.Expanded;

            }
        }

        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridDataItem item = (GridDataItem)(sender as RadGrid).SelectedItems[0];

            string PVID = item.GetDataKeyValue("patient_visit_id").ToString();
            string visitType = item.GetDataKeyValue("visit_type_rcd").ToString();
            string closureDateTime = item.GetDataKeyValue("closure_date_time").ToString();

            if(closureDateTime != "")
            {
                
            }
            else
            {
                string apiStr = "api/emr/list-form/" + PVID + "/" + visitType;

                string _jsonData = WebHelpers.GetAPI(apiStr);
                #region response
                //"model_id": "7c5a578b-301e-4da4-b8b1-0b0df261c092",
                //"model_name": "SUMMARY OF COMPLEX OUTPATIENT CASES",
                //"url": "OPD/SumOfComOutpCase.aspx",
                //"api": null,
                //"model_type_rcd": "OPD",
                //"model_type_name": "OPD"
                #endregion

                if (_jsonData != null)
                {
                    DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);
                    ddlDocList.Items.Clear();

                    foreach (DataRow row in db.Rows)
                    {
                        ListItem item1 = new ListItem();

                        item1.Value = row.Field<string>("model_id") + "|" + row.Field<string>("url") + "|" + PVID;
                        item1.Text = row.Field<string>("model_name");

                        ddlDocList.Items.Add(item1);
                    }
                }

                showPopup = true;
            }
        }


        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ListItem selectedItem = ddlDocList.Items[ddlDocList.SelectedIndex];

            string[] _params = selectedItem.Value.Split('|');

            string PVID = _params[2];
            string modelID = _params[0];
            string userName = (string)Session["UserID"];

            string _jsonData = WebHelpers.GetAPI("api/emr/check-document-exists/" + PVID + "/" + modelID);

            if (_jsonData != null)
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

        protected void btnOpen_ServerClick(object sender, EventArgs e)
        {
            try
            {
                ListItem selectedItem = ddlDocList.Items[ddlDocList.SelectedIndex];
                string[] _params = selectedItem.Value.Split('|');
                
                Response.Redirect("../" + _params[1] + "?docId=" + DataHelpers.varDocId, false);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}