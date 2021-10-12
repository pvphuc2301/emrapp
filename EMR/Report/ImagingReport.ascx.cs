using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;

namespace EMR
{
    public partial class ImagingReport : System.Web.UI.UserControl
    {
        public string varPID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //WebHelpers.AddJS(Page, "showInfo()");
            string varReportID = (string)Session["radid"]; //Request.QueryString["radid"];//   varReportID = "f076907a-ecf6-475a-4315-0000219f339b";
            varPID = Request.QueryString["pid"];

            if (!string.IsNullOrEmpty(varReportID))
            {
                dynamic response = WebHelpers.GetAPI("api/patient/menu-rad-report/" + varReportID);//f076907a-ecf6-475a-4315-0000219f339b
                dynamic jsonObject;
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(response.Data);
                    lbFullName.Text = jsonObject.patient_name_l;
                    if (jsonObject.gender_name_e == "Male")
                        lbSex.Text = "Nam/ Man";
                    else if (jsonObject.gender_name_e == "Female")
                        lbSex.Text = "Nữ/ Woman";
                    lbPID.Text = jsonObject.visible_patient_id;
                    lbBirthday.Text = jsonObject.date_of_birth.ToString("dd-MM-yyyy");
                    lbVisitType.Text = jsonObject.visit_type_name_e + "/ " + jsonObject.visit_code;
                    lbRadRequestNo.Text = jsonObject.radiology_requested_procedure_id;
                    lbOrderDr.Text = jsonObject.doctor_name_l;
                    lbOrderDate.Text = jsonObject.created_date_time.ToString("dd-MM-yyyy HH:MM");
                    lbCompletedDate.Text = jsonObject.completed_date_time.ToString("dd-MM-yyyy HH:MM");
                    lbOrderName.Text = jsonObject.procedure_name_l + "/" + jsonObject.procedure_name_e;

                    var toltalRegion = jsonObject.total_region;

                    //lbl_diagnosis.InnerHtml = jsonObject.region_1;

                    WebHelpers.VisibleControl(false, diagnosis_field, history_field, technique_field, findings_field, impression_field);


                    if (!string.IsNullOrEmpty(Convert.ToString(jsonObject.region_4)))
                    {
                        //lbl_technique.InnerHtml = jsonObject.region_2;
                        //lbl_findings.InnerHtml = jsonObject.region_3;
                        //lbl_impression.InnerHtml = jsonObject.region_4;
                        lbl_diagnosis.Text = GetCorrectValue(Convert.ToString(jsonObject.region_1));
                        lbl_technique.Text = GetCorrectValue(Convert.ToString(jsonObject.region_2));
                        lbl_findings.Text = GetCorrectValue(Convert.ToString(jsonObject.region_3));
                        lbl_impression.Text = GetCorrectValue(Convert.ToString(jsonObject.region_4));

                        WebHelpers.VisibleControl(true, diagnosis_field, technique_field, findings_field, impression_field);
                    }
                    else if (!string.IsNullOrEmpty(Convert.ToString(jsonObject.region_3)))
                    {
                        //lbl_technique.InnerHtml = jsonObject.region_2;
                        //lbl_findings.InnerHtml = jsonObject.region_3;
                        lbl_history.Text = GetCorrectValue(Convert.ToString(jsonObject.region_1));
                        lbl_technique.Text = GetCorrectValue(Convert.ToString(jsonObject.region_2));
                        lbl_impression.Text = GetCorrectValue(Convert.ToString(jsonObject.region_3));

                        WebHelpers.VisibleControl(true, history_field, technique_field, impression_field);
                    }
                    else if (!string.IsNullOrEmpty(Convert.ToString(jsonObject.region_2)))
                    {
                        //lbl_technique.InnerHtml = jsonObject.region_2;
                        lbl_findings.Text = GetCorrectValue(Convert.ToString(jsonObject.region_1));
                        lbl_impression.Text = GetCorrectValue(Convert.ToString(jsonObject.region_2));
                        WebHelpers.VisibleControl(true, findings_field, impression_field);
                    }
                    else if (!string.IsNullOrEmpty(Convert.ToString(jsonObject.region_1)))
                    {
                        lbl_findings.Text = GetCorrectValue(Convert.ToString(jsonObject.region_1));
                        WebHelpers.VisibleControl(true, findings_field);
                    }

                    if (!string.IsNullOrEmpty(Convert.ToString(jsonObject.addendum)))
                    {
                        lbl_addendum.InnerHtml = GetCorrectValue(Convert.ToString(jsonObject.addendum));
                        addendum_field.Visible = true;
                    }
                    else
                    {
                        addendum_field.Visible = false;
                    }
                }

                Session["radid"] = "";
            }
        }

        private string GetCorrectValue(string value)
        {
            string result = "";
            int start = value.IndexOf("<xsl:if");
            int end = value.LastIndexOf("</xsl:if>");
            if(start > 1 && end > 1)
            {
                result = value.Substring(0, start);
                result += value.Substring(end);
            }
            else
            {
                result = value;
            }

            return result;
        }
    }
}