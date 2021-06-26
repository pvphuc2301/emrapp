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
            WebHelpers.CheckSession(this);
            
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
                txt_diagnosis.Value = uusr.diagnosis;
                txt_left_kidney.Value = uusr.left_kidney;
                txt_right_kidney.Value = uusr.right_kidney;
                txt_urinary_bladder.Value = uusr.urinary_bladder;
                txt_prostate.Value = uusr.prostate;
                txt_post_void_resi_volume.Value = uusr.post_void_resi_volume;
                txt_conclusion.Value = uusr.conclusion;
                txt_recommendation.Value = uusr.recommendation;

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "localStorage_setItem", $"window.sessionStorage.setItem('{uusr}', '{JsonConvert.SerializeObject(uusr)}');leaveEditFormEvent();", true);
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

        #region Actions
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                uusr = new Uusr(DataHelpers.varDocId);
                uusr.status = DocumentStatus.FINAL;
                uusr.user_name = (string)Session["UserID"];

                UpdateData(uusr);
                WebHelpers.clearSessionDoc(Request.QueryString["docId"]);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                uusr = new Uusr(DataHelpers.varDocId);
                uusr.status = DocumentStatus.DRAFT;
                uusr.user_name = (string)Session["UserID"];

                UpdateData(uusr);
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try { 
                dynamic result = Uusr.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    WebHelpers.clearSessionDoc(Request.QueryString["docId"]);

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

                txt_amend_reason.Text = "";
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
            Initial();
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            uusr = new Uusr(Request.QueryString["docId"]);
            BindingDataFormPrint(uusr);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
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

                dynamic result = uusr.Update()[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

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