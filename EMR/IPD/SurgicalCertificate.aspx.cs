using Newtonsoft.Json;
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
            if (Request.QueryString["vpid"] != null) DataHelpers.varPVId = Request.QueryString["vpid"];

                surc = new Surc(DataHelpers.varDocId);
            loadDataToControls(surc);
        }

        public void loadDataToControls(Surc surc)
        {
            try
            {
                lbl_admission_date.Text = surc.admission_date;
                lbl_procedure_date.Text = surc.procedure_date;
                WebHelpers.BindDateTimePicker(dpk_discharge_date, surc.discharge_date);
                txt_preo_diagnosis.Value = surc.preo_diagnosis;
                txt_name_of_procedure.Value = surc.name_of_procedure;
                txt_proce_narrative.Value = surc.proce_narrative;
                txt_blood_type.Value = surc.blood_type;
                txt_rh.Value = surc.rh;

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
            WebHelpers.DisabledDateTimePicker(dpk_discharge_date, disabled);
            txt_preo_diagnosis.Disabled = disabled;
            txt_name_of_procedure.Disabled = disabled;
            txt_proce_narrative.Disabled = disabled;
            txt_blood_type.Disabled = disabled;
            txt_rh.Disabled = disabled;

        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                surc = new Surc(Request.QueryString["docId"]);
                surc.status = DocumentStatus.FINAL;
                surc.user_name = (string)Session["UserID"];

                UpdateData(surc);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                surc = new Surc(Request.QueryString["docId"]);
                surc.status = DocumentStatus.DRAFT;
                surc.user_name = (string)Session["UserID"];

                UpdateData(surc);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }

        }

        private string checkValidField()
        {
            string errors = "";
            return errors;
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

            surc.discharge_date = DataHelpers.ConvertSQLDateTime(dpk_discharge_date.SelectedDate);
            surc.preo_diagnosis = txt_preo_diagnosis.Value;
            surc.name_of_procedure = txt_name_of_procedure.Value;
            surc.proce_narrative = txt_proce_narrative.Value;
            surc.blood_type = txt_blood_type.Value;
            surc.rh = txt_rh.Value;

            dynamic result = surc.Update();

            if (result[0].Status == System.Net.HttpStatusCode.OK)
            {
                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, Message.CODE.MS001, Message.TYPE.SUCCESS, 2000);

                Initial();
            }
            else
            {
                Session["PageNotFound"] = result[0];
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            dynamic result = Diss.Delete((string)Session["UserId"], Request.QueryString["docId"]);

            if (result[0].Status == System.Net.HttpStatusCode.OK)
            {
                string pid = Request["pid"];
                string vpid = Request["vpid"];

                Response.Redirect(string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", pid, vpid));
            }
            else
            {
                Session["PageNotFound"] = result[0];
                Response.Redirect("../Other/PageNotFound.aspx", false);
            }
        }
    }
}