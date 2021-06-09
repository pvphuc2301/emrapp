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
                    LoadDataToPrint(surc);
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

        private void LoadDataToPrint(Surc surc)
        {
            Patient patient = Patient.Instance();

            prt_patient_label.PID = patient.visible_patient_id;

            prt_fullname.Value = patient.GetFullName();
            prt_dob.Value = WebHelpers.FormatDateTime(patient.date_of_birth);
            prt_gender.SelectedIndex = patient.gender_l == "nam" ? 1 : 2;
            prt_patient_id.Value = patient.visible_patient_id;
            prt_address.Value = patient.GetAddress();

            prt_admission_date.Value = WebHelpers.FormatDateTime(surc.admission_date);
            prt_procedure_date.Value = WebHelpers.FormatDateTime(surc.procedure_date);
            prt_discharge_date.Value = WebHelpers.FormatDateTime(surc.discharge_date);
            prt_preo_diagnosis.Value = surc.preo_diagnosis;
            prt_name_of_procedure.Value = surc.name_of_procedure;
            prt_proce_narrative.Value = surc.proce_narrative;
            prt_blood_type.Value = surc.blood_type;
            prt_rh.Value = surc.rh;

            prt_signature1.Content = WebHelpers.GetSignatureTemplate1("","TRƯỞNG KHOA", "HEAD OF DEPARTMEN", "(Họ tên, chữ ký & MSNV)", "(Full name, Signature & ID)", "");

            prt_signature2.Content = WebHelpers.GetSignatureTemplate1("","BAN GIÁM ĐỐC Y KHOA", "BOARD OF MEDICAL DIRECTOR", "(Họ tên, chữ ký & MSNV)", "(Full name, Signature & ID)", "");
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