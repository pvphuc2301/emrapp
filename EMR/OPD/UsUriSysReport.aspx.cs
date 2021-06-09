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
        Uusr uusr;

        protected void Page_Load(object sender, EventArgs e)
        {
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

            uusr = new Uusr(DataHelpers.varDocId);
            loadDataToOMRControls(uusr);
        }

        public void loadDataToOMRControls(Uusr uusr)
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

                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (uusr.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                }

                else if (uusr.status == DocumentStatus.DRAFT)
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }
            } catch(Exception ex)
            {

            }
        }

        protected void DisabledControl(bool disabled)
        {
            txt_diagnosis.Disabled = disabled;
            txt_left_kidney.Disabled = disabled;
            txt_right_kidney.Disabled = disabled;
            txt_urinary_bladder.Disabled = disabled;
            txt_prostate.Disabled = disabled;
            txt_post_void_resi_volume.Disabled = disabled;
            txt_conclusion.Disabled = disabled;
            txt_recommendation.Disabled = disabled;
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            uusr = new Uusr(DataHelpers.varDocId);
            uusr.status = DocumentStatus.FINAL;
            uusr.user_name = (string)Session["UserID"];

            UpdateData(uusr);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            uusr = new Uusr(DataHelpers.varDocId);
            uusr.status = DocumentStatus.DRAFT;
            uusr.user_name = (string)Session["UserID"];

            UpdateData(uusr);
        }

        public void UpdateData(Uusr uusr)
        {
            uusr.amend_reason = txt_amendReason.Value;
            uusr.diagnosis = txt_diagnosis.Value;
            uusr.left_kidney = txt_left_kidney.Value;
            uusr.right_kidney = txt_right_kidney.Value;
            uusr.urinary_bladder = txt_urinary_bladder.Value;
            uusr.prostate = txt_prostate.Value;
            uusr.post_void_resi_volume = txt_post_void_resi_volume.Value;
            uusr.conclusion = txt_conclusion.Value;
            uusr.recommendation = txt_recommendation.Value;

            if (uusr.Update()[0] == "OK")
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS);

                Initial();
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            txt_amendReason.Visible = true;

            btnComplete.Visible = true;
            btnComplete.Attributes["Disabled"] = "disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            DisabledControl(false);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }
    }
}