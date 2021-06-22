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
        Surc surc; string UserID = "";

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
            if (Request.QueryString["vpid"] != null) DataHelpers.varPVId = Request.QueryString["vpid"];

            surc = new Surc(DataHelpers.varDocId);

            amendReasonWraper.Visible = false;
            btnCancel.Visible = false;

            Patient patient = Patient.Instance();
            prt_barcode.Text = patient.visible_patient_id;

            admission_date.Text = WebHelpers.FormatDateTime(surc.admission_date);
            procedure_date.Text = WebHelpers.FormatDateTime(surc.procedure_date);

            if (surc.status == DocumentStatus.FINAL)
            {
                loadFormView(surc);
            }
            else if (surc.status == DocumentStatus.DRAFT)
            {
                LoadFormEdit(surc);
            }
        }
        private void LoadFormEdit(Surc surc)
        {
            WebHelpers.BindDateTimePicker(dpk_discharge_date, surc.discharge_date);
            txt_preo_diagnosis.Value = surc.preo_diagnosis;
            txt_name_of_procedure.Value = surc.name_of_procedure;
            txt_proce_narrative.Value = surc.proce_narrative;
            txt_blood_type.Value = surc.blood_type;
            txt_rh.Value = surc.rh;
            //
            LoadFormControl(false);

            btnAmend.Visible = false;
            btnPrint.Visible = false;
        }
        private void loadFormView(Surc surc)
        {
            lbl_discharge_date.Text = WebHelpers.FormatDateTime(surc.discharge_date);
            lbl_preo_diagnosis.Text = surc.preo_diagnosis;
            lbl_name_of_procedure.Text = surc.name_of_procedure;
            lbl_proce_narrative.Text = surc.proce_narrative;
            lbl_blood_type.Text = surc.blood_type;
            lbl_rh.Text = surc.rh;

            LoadFormControl(true);

            btnComplete.Visible = false;
            btnSave.Visible = false;
            btnDeleteModal.Visible = false;

            btnAmend.Visible = true;
            btnPrint.Visible = true;
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                surc = new Surc(Request.QueryString["docId"]);
                surc.status = DocumentStatus.FINAL;
                surc.user_name = (string)Session["UserID"];

                UpdateData(surc);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                surc = new Surc(Request.QueryString["docId"]);
                surc.status = DocumentStatus.DRAFT;
                surc.user_name = (string)Session["UserID"];

                UpdateData(surc);
            }
        }

        protected void btnAmend_Click(object sender, EventArgs e)
        {
            surc = new Surc(Request.QueryString["docId"]);
            txt_amend_reason.Text = "";
            amendReasonWraper.Visible = true;
            btnComplete.Visible = true;
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            LoadFormEdit(surc);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
        }

        public void UpdateData(Surc surc)
        {
            surc.amend_reason = txt_amend_reason.Text;
            surc.admission_date = DataHelpers.ConvertSQLDateTime(surc.admission_date);
            surc.procedure_date = DataHelpers.ConvertSQLDateTime(surc.procedure_date);
            surc.discharge_date = DataHelpers.ConvertSQLDateTime(dpk_discharge_date.SelectedDate);
            surc.preo_diagnosis = txt_preo_diagnosis.Value;
            surc.name_of_procedure = txt_name_of_procedure.Value;
            surc.proce_narrative = txt_proce_narrative.Value;
            surc.blood_type = txt_blood_type.Value;
            surc.rh = txt_rh.Value;

            dynamic result = surc.Update()[0];

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
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            surc = new Surc(Request.QueryString["docId"]);
            LoadFormPrint(surc);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "window.print();", true);
        }
        protected void LoadFormControl(bool disabled)
        {
            foreach (var prop in surc.GetType().GetProperties())
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
        private void CheckUserID()
        {
            UserID = (string)Session["UserID"];
            string redirecturl = "../login.aspx?ReturnUrl=";
            redirecturl += Request.ServerVariables["script_name"] + "?";
            redirecturl += Server.UrlEncode(Request.QueryString.ToString());
            if (string.IsNullOrEmpty(UserID))
                Response.Redirect(redirecturl);
        }

        private void LoadFormPrint(Surc surc)
        {
            Patient patient = Patient.Instance();

            prt_vpid.Text = prt_vpid1.Text = prt_barcode.Text = patient.visible_patient_id;
            
            prt_fullname.Text = patient.GetFullName();
            prt_dob.Text = WebHelpers.FormatDateTime(patient.date_of_birth);
            
            prt_gender.Text = WebHelpers.CreateOptions(new Option { Text = "Nam <div class='text-primary'>Male</div>", Value = "Male" }, new Option { Text = "Nữ<div class='text-primary'>Female</div>", Value = "Female" }, DataHelpers.patient.gender_e, "display: grid; grid-template-columns: 1fr 1fr; width: 250px");

            prt_address.Text = patient.GetAddress();

            prt_admission_date.Text = WebHelpers.FormatDateTime(surc.admission_date);
            prt_procedure_date.Text = WebHelpers.FormatDateTime(surc.procedure_date);
            prt_discharge_date.Text = WebHelpers.FormatDateTime(surc.discharge_date);
            prt_preo_diagnosis.Text = surc.preo_diagnosis;
            prt_name_of_procedure.Text = surc.name_of_procedure;
            prt_proce_narrative.Text = surc.proce_narrative;
            prt_blood_type.Text = surc.blood_type;
            prt_rh.Text = surc.rh;
        }
    }
}