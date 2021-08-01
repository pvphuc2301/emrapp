using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using ZXing;
using ZXing.Common;

namespace EMR
{
    public partial class OutPathIniNurAss : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }

            if (!IsPostBack)
            {
                Initial();
            }

            PostBackEvent();
        }

        private void PostBackEvent()
        {
            switch (Request["__EVENTTARGET"])
            {
                //case "clearSession":
                //    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
                //    break;

            }
        }

        #region Binding Data
        private void BindingDataForm(Oina oina, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(oina);
            }
            else
            {
                BindingDataFormView(oina);
            }
        }
        private void BindingDataFormEdit(Oina oina)
        {
            try
            {
                txt_amend_reason.Text = "";
                //I.
                txt_vs_temperature.Value = oina.vs_temperature;
                txt_vs_heart_rate.Value = oina.vs_heart_rate;
                txt_vs_weight.Value = oina.vs_weight;
                txt_vs_respiratory_rate.Value = oina.vs_respiratory_rate;
                txt_vs_height.Value = oina.vs_height;
                txt_vs_blood_pressure.Value = oina.vs_blood_pressure;
                txt_vs_bmi.Value = oina.vs_BMI;
                txt_vs_spo2.Value = oina.vs_spO2;
                txt_pulse.Value = oina.pulse;
                
                //II.
                //1.
                txt_chief_complaint.Value = oina.chief_complaint;
                //2.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + oina.allergy);
                txt_allergy_note.Value = oina.allergy_note;
                //3.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_mental_status_" + oina.mental_status);
                txt_mental_status_note.Value = oina.mental_status_note;
                //4
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_paint_score_code_" + oina.paint_score_code);
                //5
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_fall_risk_" + oina.fall_risk);
                txt_fall_risk_assistance.Value = oina.fall_risk_assistance;
                //6.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_nutrition_status_code_" + oina.nutrition_status_code);
                //III.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_housing_code_" + oina.housing_code, "aln");
                //IV.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_prioritization_code_" + oina.prioritization_code, "wa");

                WebHelpers.BindDateTimePicker(dtpk_assessment_date_time, oina.assessment_date_time);

                DataObj.Value = JsonConvert.SerializeObject(oina);
                Session["docid"] = oina.document_id;
                WebHelpers.AddScriptFormEdit(Page, oina, (string)Session["emp_id"]);
                
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Oina oina)
        {
            try
            {

                lbl_fall_risk.Text = WebHelpers.FormatString(WebHelpers.GetBool(oina.fall_risk, $"Có, cung cấp phương tiện hỗ trợ/ Yes, provide assistance: {WebHelpers.FormatString(oina.fall_risk_assistance)}", "Không có nguy cơ/ No risk"));

                lbl_mental_status.Text = WebHelpers.FormatString(WebHelpers.GetBool(oina.mental_status, "Có/ Yes", $"Không, ghi rõ/ No, specify: {WebHelpers.FormatString(oina.mental_status_note)}"));
                lbl_paint_score_description.Text = WebHelpers.FormatString(oina.paint_score_description);
                lbl_chief_complaint.Text = WebHelpers.FormatString(oina.chief_complaint);

                lbl_allergy.Text = WebHelpers.FormatString(WebHelpers.GetBool(oina.allergy, $"Có, ghi rõ/ Yes, specify: {WebHelpers.FormatString(oina.allergy_note)}"));
                
                lbl_mental_status.Text = WebHelpers.FormatString(WebHelpers.GetBool(oina.mental_status, "Có/ Yes", $"Không, ghi rõ/ No, specify: {WebHelpers.FormatString(oina.mental_status_note)}"));

                lbl_nutrition_status_description.Text = WebHelpers.FormatString(oina.nutrition_status_description);
                lbl_housing_description.Text = WebHelpers.FormatString(oina.housing_description);
                lbl_prioritization_description.Text = WebHelpers.FormatString(oina.prioritization_description);
                //
                lbl_vs_temperature.Text = WebHelpers.FormatString(oina.vs_temperature) + " °C";
                lbl_vs_heart_rate.Text = WebHelpers.FormatString(oina.vs_heart_rate) + " / phút (m)";
                lbl_vs_weight.Text = WebHelpers.FormatString(oina.vs_weight) + " kg";
                lbl_vs_height.Text = WebHelpers.FormatString(oina.vs_height) + " cm";
                lbl_vs_respiratory_rate.Text = WebHelpers.FormatString(oina.vs_respiratory_rate) + " / phút (min)";
                lbl_vs_bmi.Text = WebHelpers.FormatString(oina.vs_BMI) + " (Kg/m <sup>2</sup>)";
                lbl_vs_blood_pressure.Text = WebHelpers.FormatString(oina.vs_blood_pressure) + " mmHg";
                lbl_pulse.Text = WebHelpers.FormatString(oina.pulse) + " cm";
                lbl_vs_spo2.Text = WebHelpers.FormatString(oina.vs_spO2) + " %";
                lbl_assessment_date_time.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(oina.assessment_date_time, "dd-MM-yyyy HH:mm"));

            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        private void BindingDataFormPrint(Oina oina)
        {
            try
            {
                Patient patient = Patient.Instance();
                prt_fullname.Text = $"{patient.GetFullName()} ({patient.GetTitle()})";
                prt_DOB.Text = $"{WebHelpers.FormatDateTime(patient.date_of_birth)} | {patient.GetGender()}";
                prt_vpid.Text = patient.visible_patient_id;

                WebHelpers.gen_BarCode(patient.visible_patient_id, BarCode);

                prt_vs_temperature.Text = oina.vs_temperature;
                prt_vs_weight.Text = oina.vs_weight;
                prt_vs_height.Text = oina.vs_height;
                prt_vs_BMI.Text = oina.vs_BMI;
                prt_pulse.Text = oina.vs_heart_rate;
                prt_vs_respiratory_rate.Text = oina.vs_respiratory_rate;
                prt_vs_blood_pressure.Text = oina.vs_blood_pressure;
                prt_vs_spO2.Text = oina.vs_spO2;

                var lable = new HtmlGenericControl("lable");

                lable.InnerHtml = oina.chief_complaint;
                lable.InnerText = oina.chief_complaint;

                string a = lable.InnerHtml.Replace("&lt;font color=&quot;red&quot;&gt;", "");
                a = a.Replace("&lt;/font&gt;&lt;br&gt;", "");

                prt_chief_complaint.Text = a;
                prt_allergy.Text = oina.allergy ? "Có, ghi rõ/ Yes, specify: " + oina.allergy_note : "Không";

                prt_mental_status.Text = WebHelpers.CreateOptions(new Option { Text = "Có/ Yes", Value = true }, new Option { Text = "No, ghi rõ/ No, specify: " + oina.mental_status_note, Value = false }, oina.mental_status, "display: grid; grid-template-columns: 80px 1fr");

                prt_paint_score_code.Text = oina.paint_score_code;

                prt_fall_risk.Text = WebHelpers.GetBool(oina.fall_risk, "Có, cung cấp phương tiện hỗ trợ/ Yes, provide assistance: " + oina.fall_risk_assistance, "Không có nguy cơ/ No risk");

                prt_nutrition_status_code.Text = oina.nutrition_status_description;

                prt_housing.Text = WebHelpers.CreateOptions(Oina.HOUSING_CODE, (string)oina.housing_code, "display: grid; grid-template-columns: 1fr 1fr");

                DateTime signature_date = (DateTime)Session["signature_date"];

                prt_signature_date.Text = signature_date.ToString("dd-MM-yyyy");
                prt_prioritization_code.Text = oina.prioritization_description;
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Oina oina = new Oina(Request.QueryString["docId"]);
                oina.status = DocumentStatus.FINAL;

                UpdateData(oina);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Oina oina = new Oina(Request.QueryString["docId"]);
                oina.status = DocumentStatus.DRAFT;

                UpdateData(oina);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Oina.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
                }
            } catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request["docid"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Oina oina = new Oina(Request["docid"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, oina, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(oina);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            
            Initial();
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
        }
        #endregion

        #region METHODS
        private void Initial()
        {
            //if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            //if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            //if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {
                Oina oina;

                if (Request.QueryString["docIdLog"] != null)
                {
                    oina = new Oina(Request.QueryString["docIdLog"], true);
                    currentLog.Visible = true;

                    string item = (string)Session["viewLogInfo"];

                    RadLabel2.Text = $"You are viewing an old version of this document ( { item })";
                }
                else
                {
                    oina = new Oina(Request.QueryString["docId"]);
                    currentLog.Visible = false;
                }

                loadRadGridHistoryLog();

                WebHelpers.setBmi(bmiStr, oina.vs_BMI);
                
                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                if (oina.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(oina, WebHelpers.LoadFormControl(form1, oina, ControlState.View, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                    BindingDataFormPrint(oina);
                }
                else if (oina.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(oina, WebHelpers.LoadFormControl(form1, oina, ControlState.Edit, (string)Session["location"], Request.QueryString["docIdLog"] != null, (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, oina.status, (string)Session["access_authorize"], (string)Session["location"], Request.QueryString["docIdLog"] != null);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void UpdateData(Oina oina)
        {
            try
            {
                oina.vs_temperature = txt_vs_temperature.Value;
                oina.vs_heart_rate = txt_vs_heart_rate.Value;
                oina.vs_weight = txt_vs_weight.Value;
                oina.vs_respiratory_rate = txt_vs_respiratory_rate.Value;
                oina.vs_height = txt_vs_height.Value;
                oina.vs_blood_pressure = txt_vs_blood_pressure.Value;
                oina.vs_BMI = txt_vs_bmi.Value;
                oina.vs_spO2 = txt_vs_spo2.Value;
                oina.pulse = txt_pulse.Value;
                //1.
                oina.chief_complaint = txt_chief_complaint.Value;
                //2.
                oina.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(),"rad_allergy_");
                oina.allergy_note = WebHelpers.GetBool(oina.allergy, txt_allergy_note.Value, null);
                //3.
                oina.mental_status = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_mental_status_");
                oina.mental_status_note = WebHelpers.GetBool(oina.mental_status, null, txt_mental_status_note.Value);
                //4.
                oina.paint_score_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_paint_score_code_", Oina.PAINT_SCORE_CODE);
                oina.paint_score_description = WebHelpers.GetDicDesc(oina.paint_score_code, Oina.PAINT_SCORE_CODE);
                //5.
                oina.fall_risk = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_fall_risk_");
                oina.fall_risk_assistance = WebHelpers.GetBool(oina.fall_risk, txt_fall_risk_assistance.Value, null);

                oina.nutrition_status_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_nutrition_status_code_", Oina.NUTRITION_STATUS_CODE);
                oina.nutrition_status_description = WebHelpers.GetDicDesc(oina.nutrition_status_code, Oina.NUTRITION_STATUS_CODE);

                oina.housing_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_housing_code_", Oina.HOUSING_CODE);
                oina.housing_description = WebHelpers.GetDicDesc(oina.housing_code, Oina.HOUSING_CODE);

                oina.prioritization_code = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_prioritization_code_", Oina.PRIORITIZATION_CODE);
                oina.prioritization_description = WebHelpers.GetDicDesc(oina.prioritization_code, Oina.PRIORITIZATION_CODE);

                oina.assessment_date_time = DataHelpers.ConvertSQLDateTime(dtpk_assessment_date_time.SelectedDate);

                if (JsonConvert.SerializeObject(oina) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                //
                oina.amend_reason = txt_amend_reason.Text;
                oina.user_name = (string)Session["UserID"];

                dynamic result = oina.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.MESSAGE_SAVE_SUCCESS);
                    Initial();
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }

        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = "Amended by";
            if (Convert.ToString(status) == DocumentStatus.FINAL && string.IsNullOrEmpty(Convert.ToString(amend_reason)))
            {
                result = "Submitted by";
            }

            if (Convert.ToString(status) == DocumentStatus.DRAFT) result = "Saved by";

            if (string.IsNullOrEmpty(Convert.ToString(modified_name)))
            {
                result += $" {created_name} on {created_date_time}";
            }
            else
            {
                result += $" {modified_name} on {modified_date_time}";
            }
            return result;
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();

                string url = $"/OPD/OutPatIniNurAss.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";

                if (doc_log_id != Request.QueryString["docId"])
                {
                    url += $"&docIdLog={doc_log_id}";
                    Session["viewLogInfo"] = (item.FindControl("RadLabel1") as RadLabel).Text;
                }

                Response.Redirect(url);
            }
        }
        protected void RadButton1_Click(object sender, EventArgs e)
        {
            string url = $"/OPD/OutPatIniNurAss.aspx?modelId={Request.QueryString["modelId"]}&docId={Request.QueryString["docId"]}&pId={Request.QueryString["modelId"]}&vpId={Request.QueryString["vpId"]}";
            Response.Redirect(url);
        }
        private void loadRadGridHistoryLog()
        {
            DataTable dt = Oina.Logs(Request.QueryString["docId"]);
            RadGrid1.DataSource = dt;
            DateTime last_updated_date_time = new DateTime();
            string last_updated_doctor = "";

            if (dt.Rows.Count == 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("created_name_l");
                last_updated_date_time = dt.Rows[0].Field<DateTime>("created_date_time");
            }
            else if (dt.Rows.Count > 1)
            {
                last_updated_doctor = dt.Rows[0].Field<string>("modified_name_l");
                last_updated_date_time = dt.Rows[0].Field<DateTime>("modified_date_time");
            }

            Session["signature_date"] = last_updated_date_time;
            Session["signature_doctor"] = last_updated_doctor;
            RadLabel1.Text = $"Last updated by {last_updated_doctor} on " + WebHelpers.FormatDateTime(last_updated_date_time, "dd-MM-yyyy HH:mm");
            RadGrid1.DataBind();
        }
        #endregion

        #region Validation
        protected void CustomValidatorAllergy_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_allergy_note.Value.Length <= 256;
        }
        protected void CustomValidatorMentalStatusNote_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_mental_status_note.Value.Length <= 256;
        }
        protected void CustomValidatorFallRiskAssistance_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_fall_risk_assistance.Value.Length <= 256;
        }
        
        protected void CustomValidatorMentalStatus_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_mental_status_true.Checked || rad_mental_status_false.Checked;
        }

        protected void CustomValidatorFallRisk_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_fall_risk_true.Checked || rad_fall_risk_false.Checked;
        }
        #endregion

        protected void clearSession_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
        }
    }
}