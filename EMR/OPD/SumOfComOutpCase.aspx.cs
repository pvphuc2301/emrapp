using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class SummaryOfComplexOutpatientCases : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }

            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Scoc scoc = new Scoc(Request.QueryString["docId"]);
                scoc.status = DocumentStatus.FINAL;

                UpdateData(scoc);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Scoc scoc = new Scoc(Request.QueryString["docId"]);
                scoc.status = DocumentStatus.DRAFT;

                UpdateData(scoc);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                dynamic result = Scoc.Delete((string)Session["UserId"], Request.QueryString["docId"])[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, Request["docid"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Scoc scoc = new Scoc(Request["docid"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, scoc, ControlState.Edit, (string)Session["location"], (string)Session["access_authorize"]);
                //binding data
                BindingDataFormEdit(scoc);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Scoc scoc = new Scoc(Request["docid"]);
            BindingDataFormPrint(scoc);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={Request["pid"]}&vpid={Request["vpid"]}");
        }
        #endregion

        private void Initial()
        {
            //if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            //if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            //if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {
                Scoc scoc = new Scoc(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                prt_barcode.Text = Patient.Instance().visible_patient_id;
                if (scoc.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(scoc, WebHelpers.LoadFormControl(form1, scoc, ControlState.View, (string)Session["location"], (string)Session["access_authorize"]));

                }
                else if (scoc.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(scoc, WebHelpers.LoadFormControl(form1, scoc, ControlState.Edit, (string)Session["location"], (string)Session["access_authorize"]));
                }

                WebHelpers.getAccessButtons(form1, scoc.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void UpdateData(Scoc scoc)
        {
            try
            {
                scoc.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
                scoc.allergy_note = txt_allergy_note.Value;
                scoc.remarkable = txt_remarkable.Value;
                scoc.past_history = txt_past_history.Value;
                scoc.diagnosis = txt_diagnosis.Value;
                scoc.cur_treatment = txt_cur_treatment.Value;
                scoc.cur_care_plans = txt_cur_care_plans.Value;
                scoc.recommendation = txt_recommendation.Value;
                scoc.created_date_time = DataHelpers.ConvertSQLDateTime(scoc.created_date_time);

                if (JsonConvert.SerializeObject(scoc) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }
                scoc.modified_date_time = null;
                scoc.signed_date_time = null;
                scoc.submited_date_time = null;
                //
                scoc.amend_reason = txt_amend_reason.Text;
                scoc.user_name = (string)Session["UserID"];

                dynamic result = scoc.Update()[0];

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

        #region Binding Data
        private void BindingDataForm(Scoc scoc, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(scoc);
            }
            else
            {
                BindingDataFormView(scoc);
            }
        }
        private void BindingDataFormEdit(Scoc scoc)
        {
            try
            {
                txt_amend_reason.Text = "";
                //I.
                WebHelpers.DataBind(form1, new HtmlInputRadioButton(), "rad_allergy_" + scoc.allergy);
                txt_allergy_note.Value = scoc.allergy_note;
                txt_remarkable.Value = scoc.remarkable;
                txt_past_history.Value = scoc.past_history;
                txt_diagnosis.Value = scoc.diagnosis;
                txt_cur_treatment.Value = scoc.cur_treatment;
                txt_cur_care_plans.Value = scoc.cur_care_plans;
                txt_recommendation.Value = scoc.recommendation;

                DataObj.Value = JsonConvert.SerializeObject(scoc);
                WebHelpers.AddScriptFormEdit(Page, scoc, (string)Session["emp_id"]);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void BindingDataFormView(Scoc scoc)
        {
            try
            {
                lbl_allergy.Text = WebHelpers.FormatString(WebHelpers.GetBool(scoc.allergy, "Có, ghi rõ/ Yes, specify: " + scoc.allergy_note));
                lbl_remarkable.Text = WebHelpers.FormatString(scoc.remarkable);
                lbl_past_history.Text = WebHelpers.FormatString(scoc.past_history);
                lbl_diagnosis.Text = WebHelpers.FormatString(scoc.diagnosis);
                lbl_cur_treatment.Text = WebHelpers.FormatString(scoc.cur_treatment);
                lbl_cur_care_plans.Text = WebHelpers.FormatString(scoc.cur_care_plans);
                lbl_recommendation.Text = WebHelpers.FormatString(scoc.recommendation);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }

        }
        private void BindingDataFormPrint(Scoc scoc)
        {
            try
            {
                Patient patient = Patient.Instance();
                prt_fullname.Text = patient.GetFullName();
                //prt_date_of_discharge.Text = 
                prt_gender.Text = patient.GetGender();
                prt_patient_id.Text = prt_pid.Text = patient.visible_patient_id;
                //prt_date_of_summary_report.Text = scoc.
                prt_allergy.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có, Yes", Value = true }, scoc.allergy, "display: grid;grid-template-columns:150px auto;");
                if(scoc.allergy != null)
                {
                    if (scoc.allergy)
                    {
                        prt_allergy_note_wrapper.Visible = true;
                        prt_allergy_note.Text = scoc.allergy_note;
                    }
                    else
                    {
                        prt_allergy_note_wrapper.Visible = false;
                    }
                }
                
                prt_remarkable.Text = scoc.remarkable;
                past_history.Text = scoc.past_history;
                prt_diagnosis.Text = scoc.diagnosis;
                prt_cur_treatment.Text = scoc.cur_treatment;
                prt_cur_care_plans.Text = scoc.cur_care_plans;
                prt_recommendation.Text = scoc.recommendation;
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion
    }
}