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
        Uusr uusr; string UserID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckUserID();

            if (!IsPostBack)
            {
                Initial();
            }
        }

        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            uusr = new Uusr(Request.QueryString["docId"]);

            amendReasonWraper.Visible = false;
            btnCancel.Visible = false;
            prt_barcode.Text = Patient.Instance().visible_patient_id;

            prt_barcode.Text = Patient.Instance().visible_patient_id;
            if (uusr.status == DocumentStatus.FINAL)
            {
                loadFormView(uusr);
            }
            else if (uusr.status == DocumentStatus.DRAFT)
            {
                LoadFormEdit(uusr);
            }
        }

        #region Load Form
        private void LoadFormEdit(Uusr uusr)
        {
            txt_diagnosis.Value = uusr.diagnosis;
            txt_left_kidney.Value = uusr.left_kidney;
            txt_right_kidney.Value = uusr.right_kidney;
            txt_urinary_bladder.Value = uusr.urinary_bladder;
            txt_prostate.Value = uusr.prostate;
            txt_post_void_resi_volume.Value = uusr.post_void_resi_volume;
            txt_conclusion.Value = uusr.conclusion;
            txt_recommendation.Value = uusr.recommendation;

            LoadFormControl(false);

            btnAmend.Visible = false;
            btnPrint.Visible = false;
        }
        private void loadFormView(Uusr uusr)
        {
            lbl_diagnosis.Text = uusr.diagnosis;
            lbl_left_kidney.Text = uusr.left_kidney;
            lbl_right_kidney.Text = uusr.right_kidney;
            lbl_urinary_bladder.Text = uusr.urinary_bladder;
            lbl_prostate.Text = uusr.prostate;
            lbl_post_void_resi_volume.Text = uusr.post_void_resi_volume;
            lbl_conclusion.Text = uusr.conclusion;
            lbl_recommendation.Text = uusr.recommendation;
            //
            LoadFormControl(true);

            btnComplete.Visible = false;
            btnSave.Visible = false;
            btnDeleteModal.Visible = false;

            btnAmend.Visible = true;
            btnPrint.Visible = true;
        }
        private void LoadFormPrint(Uusr uusr)
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

        #endregion
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                uusr = new Uusr(DataHelpers.varDocId);
                uusr.status = DocumentStatus.FINAL;
                uusr.user_name = (string)Session["UserID"];

                UpdateData(uusr);
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

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            uusr = new Uusr(Request.QueryString["docId"]);

            amendReasonWraper.Visible = true;
            btnComplete.Visible = true;
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            LoadFormEdit(uusr);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Uusr.Delete((string)Session["UserID"], Request.QueryString["docid"])[0];
            if (result.Status == System.Net.HttpStatusCode.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
            else
            {
                Session["PageNotFound"] = result;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            uusr = new Uusr(Request.QueryString["docId"]);
            LoadFormPrint(uusr);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }
        public void UpdateData(Uusr uusr)
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
            else
            {
                Session["PageNotFound"] = result;
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
        
        #region Session

        private void CheckUserID()
        {
            UserID = (string)Session["UserID"];
            string redirecturl = "../login.aspx?ReturnUrl=";
            redirecturl += Request.ServerVariables["script_name"] + "?";
            redirecturl += Server.UrlEncode(Request.QueryString.ToString());
            if (string.IsNullOrEmpty(UserID))
                Response.Redirect(redirecturl);
        }
        #endregion

        #region

        protected void LoadFormControl(bool disabled)
        {
            foreach (var prop in uusr.GetType().GetProperties())
            {
                var control1 = FindControl(prop.Name + "_wrapper");
                var control2 = FindControl("lbl_" + prop.Name);

                if (control1 != null)
                {
                    control1.Visible = !disabled;
                }
                if (control2 != null)
                {
                    control2.Visible = disabled;
                }
            }
        }
        #endregion
    }
}