using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class SurgicalCertificate : System.Web.UI.Page
    {
        Surc surc;
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

            surc = new Surc(DataHelpers.varDocId);
            loadDataToOMRControls(surc);
        }

        public void loadDataToOMRControls(Surc surc)
        {
            try
            {
                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (surc.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                }

                else if (surc.status == DocumentStatus.DRAFT)
                {
                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void DisabledControl(bool disabled)
        {
            txt_preo_diagnosis.Disabled = disabled;
            txt_name_of_procedure.Disabled = disabled;
            txt_proce_narrative.Disabled = disabled;
            txt_blood_type.Disabled = disabled;
            txt_rh.Disabled = disabled;
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            surc = new Surc(DataHelpers.varDocId);
            surc.status = DocumentStatus.FINAL;
            surc.user_name = (string)Session["UserID"];

            UpdateData(surc);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            surc = new Surc(DataHelpers.varDocId);
            surc.status = DocumentStatus.DRAFT;
            surc.user_name = (string)Session["UserID"];

            UpdateData(surc);
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

        public void UpdateData(Surc surc)
        {
            surc.amend_reason = txt_amendReason.Value;
            surc.preo_diagnosis = txt_preo_diagnosis.Value;
            surc.name_of_procedure = txt_name_of_procedure.Value;
            surc.proce_narrative = txt_proce_narrative.Value;
            surc.blood_type = txt_blood_type.Value;
            surc.rh = txt_rh.Value;

            if (surc.Update()[0] == WebHelpers.ResponseStatus.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS);

                Initial();
            }
        }
    }
}