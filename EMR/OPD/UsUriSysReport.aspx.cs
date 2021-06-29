using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class USUrinarySystemReport : System.Web.UI.Page
    {
        #region Variables
        Uusr uusr;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }
            
            if (!IsPostBack)
            {
                Initial();
            }
        }

        #region Binding Data
        private void BindingDataForm(Uusr uusr, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(uusr);
            }
            else
            {
                BindingDataFormView(uusr);
            }
        }
        private void BindingDataFormEdit(Uusr uusr)
        {
            try
            {
                txt_amend_reason.Text = "";
                txt_diagnosis.Value = uusr.diagnosis;
                txt_left_kidney.Value = uusr.left_kidney;
                txt_right_kidney.Value = uusr.right_kidney;
                txt_urinary_bladder.Value = uusr.urinary_bladder;
                txt_prostate.Value = uusr.prostate;
                txt_post_void_resi_volume.Value = uusr.post_void_resi_volume;
                txt_conclusion.Value = uusr.conclusion;
                txt_recommendation.Value = uusr.recommendation;

                WebHelpers.AddScriptFormEdit(Page, uusr);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        private void BindingDataFormView(Uusr uusr)
        {
            try {
                lbl_diagnosis.Text = uusr.diagnosis;
                lbl_left_kidney.Text = uusr.left_kidney;
                lbl_right_kidney.Text = uusr.right_kidney;
                lbl_urinary_bladder.Text = uusr.urinary_bladder;
                lbl_prostate.Text = uusr.prostate;
                lbl_post_void_resi_volume.Text = uusr.post_void_resi_volume;
                lbl_conclusion.Text = uusr.conclusion;
                lbl_recommendation.Text = uusr.recommendation;
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
            
        }
        private void BindingDataFormPrint(Uusr uusr)
        {
            try
            {
                Patient patient = Patient.Instance();
                prt_pid.Text = prt_vpid.Text = prt_barcode.Text = patient.visible_patient_id;

                prt_fullname.Text = patient.GetFullName();

                prt_diagnosis.Text = uusr.diagnosis;
                prt_left_kidney.Text = uusr.left_kidney;
                prt_right_kidney.Text = uusr.right_kidney;
                prt_urinary_bladder.Text = uusr.urinary_bladder;
                prt_prostate.Text = uusr.prostate;
                prt_post_void_resi_volume.Text = uusr.post_void_resi_volume;
                prt_conclusion.Text = uusr.conclusion;
                prt_recommendation.Text = uusr.recommendation;
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                uusr = new Uusr(DataHelpers.varDocId);
                uusr.status = DocumentStatus.FINAL;
                
                UpdateData(uusr);
                WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                uusr = new Uusr(DataHelpers.varDocId);
                uusr.status = DocumentStatus.DRAFT;
                
                UpdateData(uusr);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try { 
                dynamic result = Uusr.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Page, Request.QueryString["docId"]);

                    string pid = Request["pid"];
                    string vpid = Request["vpid"];

                    Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            if (WebHelpers.CanOpenForm(Page, (string)Request.QueryString["docId"], DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
            {
                Uusr uusr = new Uusr(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form2, uusr, ControlState.Edit, (string)Session["location"]);
                //binding data
                BindingDataFormEdit(uusr);
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
            try
            {
                uusr = new Uusr(Request.QueryString["docId"]);
                BindingDataFormPrint(uusr);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
            }
            catch (Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        #endregion

        #region Methods
        private void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            try
            {
                Uusr uusr = new Uusr(Request.QueryString["docId"]);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                prt_barcode.Text = Patient.Instance().visible_patient_id;
                if (uusr.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(uusr, WebHelpers.LoadFormControl(form2, uusr, ControlState.View, (string)Session["location"]));
                }
                else if (uusr.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(uusr, WebHelpers.LoadFormControl(form2, uusr, ControlState.Edit, (string)Session["location"]));
                }

                WebHelpers.getAccessButtons(form2, uusr.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        private void UpdateData(Uusr uusr)
        {
            try
            {
                uusr.amend_reason = txt_amend_reason.Text;
                uusr.diagnosis = txt_diagnosis.Value;
                uusr.left_kidney = txt_left_kidney.Value;
                uusr.right_kidney = txt_right_kidney.Value;
                uusr.urinary_bladder = txt_urinary_bladder.Value;
                uusr.prostate = txt_prostate.Value;
                uusr.post_void_resi_volume = txt_post_void_resi_volume.Value;
                uusr.conclusion = txt_conclusion.Value;
                uusr.recommendation = txt_recommendation.Value;
                uusr.user_name = (string)Session["UserID"];
                dynamic result = uusr.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.Notification(Page, GLOBAL_VAL.MESSAGE_SAVE_SUCCESS);

                    Initial();
                }
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion
    }
}