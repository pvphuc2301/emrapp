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
        protected void Page_Load(object sender, EventArgs e)
        {
            WebHelpers.CheckSession(this);
            if (!IsPostBack) { Initial(); }
        }

        #region Binding Data
        private void BindingDataForm(Surc surc, bool state)
        {
            if (state)
            {
                BindingDataFormEdit(surc);
            }
            else
            {
                BindingDataFormView(surc);
            }
        }
        private void BindingDataFormEdit(Surc surc)
        {
            WebHelpers.BindDateTimePicker(dpk_discharge_date, surc.discharge_date);
            txt_preo_diagnosis.Value = surc.preo_diagnosis;
            txt_name_of_procedure.Value = surc.name_of_procedure;
            txt_proce_narrative.Value = surc.proce_narrative;
            txt_blood_type.Value = surc.blood_type;
            txt_rh.Value = surc.rh;
        }
        private void BindingDataFormView(Surc surc)
        {
            lbl_discharge_date.Text = WebHelpers.FormatString(WebHelpers.FormatDateTime(surc.discharge_date));
            lbl_preo_diagnosis.Text = WebHelpers.FormatString(surc.preo_diagnosis);
            lbl_name_of_procedure.Text = WebHelpers.FormatString(surc.name_of_procedure);
            lbl_proce_narrative.Text = WebHelpers.FormatString(surc.proce_narrative);
            lbl_blood_type.Text = WebHelpers.FormatString(surc.blood_type);
            lbl_rh.Text = WebHelpers.FormatString(surc.rh);
        }
        private void BindingDataFormPrint(Surc surc)
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
        #endregion

        #region Events
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Surc surc = new Surc(Request.QueryString["docId"]);
                surc.status = DocumentStatus.FINAL;
                surc.user_name = (string)Session["UserID"];

                UpdateData(surc);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Surc surc = new Surc(Request.QueryString["docId"]);
                surc.status = DocumentStatus.DRAFT;
                surc.user_name = (string)Session["UserID"];

                UpdateData(surc);
            }
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            Surc surc = new Surc(Request.QueryString["docId"]);
            string emp_id = (string)Session["emp_id"];

            if (WebHelpers.CanOpenForm(Page, surc.document_id, surc.status, emp_id, (string)Session["location"]))
            {

                txt_amend_reason.Text = "";
                WebHelpers.VisibleControl(false, btnAmend, btnPrint);
                WebHelpers.VisibleControl(true, btnComplete, btnCancel, amendReasonWraper);

                //load form control
                WebHelpers.LoadFormControl(form1, surc, ControlState.Edit, (string)Session["location"]);
                //binding data
                BindingDataFormEdit(surc);
                //get access button
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Initial();
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
            Surc surc = new Surc(Request.QueryString["docId"]);
            BindingDataFormPrint(surc);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "print_document", "window.print();", true);
        }
        #endregion

        #region Functions
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
        public void Initial()
        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["vpid"] != null) DataHelpers.varPVId = Request.QueryString["vpid"];

            try
            {
                Surc surc = new Surc(DataHelpers.varDocId);

                WebHelpers.VisibleControl(false, btnCancel, amendReasonWraper);
                prt_barcode.Text = Patient.Instance().visible_patient_id;
                if (surc.status == DocumentStatus.FINAL)
                {
                    BindingDataForm(surc, WebHelpers.LoadFormControl(form1, surc, ControlState.View, (string)Session["location"]));

                }
                else if (surc.status == DocumentStatus.DRAFT)
                {
                    BindingDataForm(surc, WebHelpers.LoadFormControl(form1, surc, ControlState.Edit, (string)Session["location"]));
                }

                WebHelpers.getAccessButtons(form1, surc.status, (string)Session["access_authorize"], (string)Session["location"]);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        #endregion


    }
}