using EMR.Data.AIH.Model;
using EMR.Model;
using Newtonsoft.Json;
using System;
using System.Web.UI.HtmlControls;

namespace EMR
{
    public partial class SummaryOfComplexOutpatientCases : EmrPage, IEmrFormModel<ScocModel>
    {
        public override string form_url { get; set; } = $"OPD/SumOfComOutpCase";
        public new string varPVID { get; }
        public ScocModel Model { get; set; }
        public override dynamic InitModel() => Model = new ScocModel(varDocID, Location, varDocIdLog);
        #region Events
        //protected void btnComplete_Click(object sender, EventArgs e)
        //{
        //    if (Page.IsValid)
        //    {
        //        Scoc scoc = new Scoc(varDocID, loc);
        //        scoc.status = DocumentStatus.FINAL;

        //        UpdateData(scoc);
        //        WebHelpers.clearSessionDoc(Page, varDocID, loc);
        //    }
        //}
        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    if (Page.IsValid)
        //    {
        //        Scoc scoc = new Scoc(varDocID, loc);
        //        //scoc.status = DocumentStatus.DRAFT;

        //        UpdateData(scoc);
        //    }
        //}
        //protected void btnDelete_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        dynamic result = Scoc.Delete((string)Session["UserId"], varDocID, loc)[0];

        //        if (result.Status == System.Net.HttpStatusCode.OK)
        //        {
        //            WebHelpers.clearSessionDoc(Page, varDocID, loc);

        //            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        WebHelpers.SendError(Page, ex);
        //    }
        //}
        //protected void btnAmend_Click(object sender, EventArgs e)
        //{
        //    if (WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
        //    {
        //        Scoc scoc = new Scoc(varDocID, loc);

        //        //WebHelpers.VisibleControl(false, btnAmend, btnPrint);
        //        //WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

        //        //load form control
        //        WebHelpers.LoadFormControl(form1, scoc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]);
        //        //binding data
        //        BindingDataFormEdit(scoc);
        //        //get access button
        //    }
        //}
        //protected void btnCancel_Click(object sender, EventArgs e)
        //{
        //    WebHelpers.clearSessionDoc(Page, varDocID, loc);

        //    Initial();
        //}
        //protected void btnPrint_Click(object sender, EventArgs e)
        //{
        //    Scoc scoc = new Scoc(varDocID, loc);
        //    BindingDataFormPrint(scoc);
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
        //}
        #endregion

        //private void Initial()
        //{
        //    try
        //    {
        //        Scoc scoc;
        //        patientInfo = new PatientInfo(varPID);
        //        //patientVisitInfo = new PatientVisitInfo(varPVID, loc);
        //        if (varDocIdLog != null)
        //        {
        //            scoc = new Scoc(varDocIdLog, true, loc);
        //            currentLog.Visible = true;

        //        }
        //        else
        //        {
        //            scoc = new Scoc(varDocID,loc);
        //            currentLog.Visible = false;
        //        }
        //        LoadPatientInfo();

        //        RadLabel1.Text = WebHelpers.loadRadGridHistoryLog(RadGrid1, Scoc.Logs(varDocID, loc), out string _SignatureDate, out string _SignatureName);
        //        SignatureDate = _SignatureDate;
        //        SignatureName = _SignatureName;

        //        WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);

        //        //if (scoc.status == DocumentStatus.FINAL)
        //        //{
        //        //    BindingDataFormPrint(scoc);
        //        //    BindingDataForm(scoc, WebHelpers.LoadFormControl(form1, scoc, ControlState.View, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));

        //        //}
        //        //else if (scoc.status == DocumentStatus.DRAFT)
        //        //{
        //            BindingDataForm(scoc, WebHelpers.LoadFormControl(form1, scoc, ControlState.Edit, varDocIdLog != null, loc == locChanged, (string)Session["access_authorize"]));
        //        //}

        //        btnSave.Visible = true;

        //        WebHelpers.getAccessButtons(form1, scoc.status, (string)Session["access_authorize"], loc == locChanged, varDocIdLog != null);

        //        WebHelpers.VisibleControl(false, btnComplete, btnDeleteModal, btnPrint, btnAmend);


        //    }
        //    catch (Exception ex)
        //    {
        //        WebHelpers.SendError(Page, ex);
        //    }
        //}

        public override void BindingControlToModel()
        {
            Model.allergy = WebHelpers.GetData(form1, new HtmlInputRadioButton(), "rad_allergy_");
            Model.allergy_note = txt_allergy_note.Value;
            Model.remarkable = txt_remarkable.Value;
            Model.past_history = txt_past_history.Value;
            Model.diagnosis = txt_diagnosis.Value;
            Model.cur_treatment = txt_cur_treatment.Value;
            Model.cur_care_plans = txt_cur_care_plans.Value;
            Model.recommendation = txt_recommendation.Value;
            Model.created_date_time = DataHelpers.ConvertSQLDateTime(Model.created_date_time);

            //if (JsonConvert.SerializeObject(Model) == DataObj.Value)
            //{
            //    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
            //}
            Model.modified_date_time = null;
            Model.signed_date_time = null;
            Model.submited_date_time = null;
            //
            Model.amend_reason = txt_amend_reason.Text;
        }
        #region Binding Data
        
        public override void BindingDataFormEdit()
        {
            try
            {
                txt_amend_reason.Text = "";
                //I.
                BindingInputRadioButton($"{nameof(Model.allergy)}_{Model.allergy}");
                txt_allergy_note.Value = WebHelpers.TextToHtmlTag(Model.allergy_note);
                txt_remarkable.Value = WebHelpers.TextToHtmlTag(Model.remarkable);
                txt_past_history.Value = WebHelpers.TextToHtmlTag(Model.past_history);
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.diagnosis);
                txt_cur_treatment.Value = WebHelpers.TextToHtmlTag(Model.cur_treatment);
                txt_cur_care_plans.Value = WebHelpers.TextToHtmlTag(Model.cur_care_plans);
                txt_recommendation.Value = WebHelpers.TextToHtmlTag(Model.recommendation);

                //DataObj.Value = JsonConvert.SerializeObject(scoc);
                Session["docid"] = Model.document_id;
                //WebHelpers.AddScriptFormEdit(Page, scoc, (string)Session["emp_id"], loc);

            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormView()
        {
            try
            {
                lbl_allergy.Text = WebHelpers.TextToHtmlTag(WebHelpers.GetBool(Model.allergy, "Có, ghi rõ/ Yes, specify: " + Model.allergy_note));
                lbl_remarkable.Text = WebHelpers.TextToHtmlTag(Model.remarkable);
                lbl_past_history.Text = WebHelpers.TextToHtmlTag(Model.past_history);
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.diagnosis);
                lbl_cur_treatment.Text = WebHelpers.TextToHtmlTag(Model.cur_treatment);
                lbl_cur_care_plans.Text = WebHelpers.TextToHtmlTag(Model.cur_care_plans);
                lbl_recommendation.Text = WebHelpers.TextToHtmlTag(Model.recommendation);
            }
            catch (Exception ex) 
            { 
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormPrint()
        {
            try
            {
                //patientInfo = new PatientInfo(varPID);

                prt_fullname.Text = Patient.FullName;
                prt_pid.Text = Patient.visible_patient_id;
                
                prt_patient_id.Text = prt_pid.Text = Patient.visible_patient_id;
                //prt_date_of_summary_report.Text = scoc.
                prt_allergy.Text = WebHelpers.CreateOptions(new Option { Text = "Không/ No", Value = false }, new Option { Text = "Có, Yes", Value = true }, Model.allergy, "display: grid;grid-template-columns:150px auto;");
                if(Model.allergy != null)
                {
                    if (Model.allergy)
                    {
                        prt_allergy_note_wrapper.Visible = true;
                        prt_allergy_note.Text = WebHelpers.TextToHtmlTag(Model.allergy_note);
                    }
                    else
                    {
                        prt_allergy_note_wrapper.Visible = false;
                    }
                }

                prt_remarkable.Text = WebHelpers.TextToHtmlTag(Model.remarkable);
                past_history.Text = WebHelpers.TextToHtmlTag(Model.past_history);
                prt_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.diagnosis);
                prt_cur_treatment.Text = WebHelpers.TextToHtmlTag(Model.cur_treatment);
                prt_cur_care_plans.Text = WebHelpers.TextToHtmlTag(Model.cur_care_plans);
                prt_recommendation.Text = WebHelpers.TextToHtmlTag(Model.recommendation);
            }
            catch (Exception ex) 
            { 
                WebHelpers.SendError(Page, ex);
            }
        }

        public override void PostBackEventHandler()
        {
        }
        #endregion
    }
}