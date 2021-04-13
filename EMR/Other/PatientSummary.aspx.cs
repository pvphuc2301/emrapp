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

namespace EMR
{
    public partial class PatientSummary : System.Web.UI.Page
    {
        public string varPID = "";
        public bool showPopup = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            varPID = Request.QueryString["pid"];
            LoadPatientInfomation(varPID);

        }

        public void LoadPatientInfomation(string varPID)//object sender, EventArgs e
        {
            string _jsonData = WebHelpers.GetAPI("api/emr/demographic/" + varPID);

            if (_jsonData != null)
            {
                DataTable dtl = WebHelpers.GetJSONToDataTable(_jsonData);

                PatientInfo patient = new PatientInfo();

                WebHelpers.BindingDatafield(dtl, patient);

                lblAddress.Text = patient.address_line_l + " " + patient.address_subregion_l + " " + patient.address_region_l + " " + patient.address_country_l;
                lblName.Text = patient.first_name_l + " " + patient.last_name_l;
                lblGender.Text = patient.gender_l;
                lblAge.Text = patient.date_of_birth;

                //lblPhone1

                //patient.Name = data.first_name_l + " " + data.last_name_l;
                //patient.Gender = data.gender_e;
                //patient.Title = data.title_l;
                //patient.PID = data.visible_patient_id;
                //patient.Age = DataHelpers.CalculateAge(DateTime.Parse(data.date_of_birth.ToString())).ToString();
                //patient.DOB = data.date_of_birth.ToString("dd-MM-yyyy");
            }
            
        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

            string _jsonData = WebHelpers.GetAPI("api/patient/encounter-history/" + varPID + "?pageIndex=1&pageSize=4&keyword=my.nguyen");
            //
            //
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


        protected void RadGrid1_SelectedCellChanged(object sender, EventArgs e)
        {

        }

        protected void RadGrid1_PageIndexChanged(object sender, GridPageChangedEventArgs e)
        {

        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {

        }

        protected void ddlDocList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

           ListItem selectedItem = ddlDocList.SelectedItem;

            string[] _params = selectedItem.Value.Split('|');

            string PVID = _params[2];
            string modelID = _params[0];
            string userName = "my.nguyen";

            string _jsonData = WebHelpers.GetAPI("api/emr/check-document-exists/" + PVID + "/" + modelID);

            #region response
            //{ "document_id":"4c71060a-e1bd-d180-07f8-b0baae73439d","model_id":"a90ce47a-4e06-485a-b205-8a67eb778407","patient_visit_id":"3afc144a-86ca-11eb-9dfe-dca2660bc0a2","status":"DRAFT","amend_reason":null,"created_user_id":"long.do","created_name_e":"Mr. Do Van Long","created_name_l":"Ông Đỗ Văn Long","created_date_time":"2021-04-06T20:38:43.567","modified_user_id":null,"modified_name_e":null,"modified_name_l":null,"modified_date_time":null,"submited_user_id":null,"submited_name_e":null,"submited_name_l":null,"submited_date_time":null,"signed_user_id":null,"signed_name_e":null,"signed_name_l":null,"signed_date_time":null,"delete_user_id":null,"delete_name_e":null,"delete_name_l":null,"delete_date_time":null,"document_type_rcd":"EMR","documentid":0}
            //document_id
            //model_id
            //patient_visit_id
            //status

            #endregion

            if (_jsonData != null)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(_jsonData);
                
                _jsonData = WebHelpers.GetAPI("api/emr/get-api/" + modelID);

                #region response
                //"model_id": "a90ce47a-4e06-485a-b205-8a67eb778407",
                //"model_name": "OUTPATIENT MEDICAL RECORD",
                //"url": "OPD/OutPatMedRec.aspx",
                //"api": "omr",
                //"model_type_rcd": "OPD",
                //"model_type_name": "OPD"
                #endregion

                dynamic data = JObject.Parse(_jsonData);

                for (int i = 0; i <db.Rows.Count; i++)
                {
                    if(db.Rows[i].Field<string>("status") == "DRAFT")
                    {
                        string docID = db.Rows[i].Field<string>("document_id");
                        Response.Redirect("../" + _params[1] + "?docId=" + docID);
                    }
                }

                Guid docId = Guid.NewGuid();

                string jsonData = "{\"document_id\":" + "\"" + docId + "\", \"patient_visit_id\": \"" + PVID + "\", \"model_id\": \"" + modelID + "\", \"user_name\": \"" + userName + "\"}";

                _jsonData = WebHelpers.PostAPI("api/" + data.api + "/add", jsonData);
                
                _jsonData = WebHelpers.PostAPI("api/" + data.api + "/log/" + docId);

                Response.Redirect("../" + _params[1]);

            }
        }

        protected void loadModalSource_Click(object sender, EventArgs e)
        {

        }
    }
}