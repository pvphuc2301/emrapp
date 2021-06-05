using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class DischargeCertificate : System.Web.UI.Page
    {
        public Disc disc;

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

            disc = new Disc(DataHelpers.varDocId);
            loadDataToOMRControls(disc);
        }

        public void loadDataToOMRControls(Disc disc)
        {
            try
            {
                foreach (KeyValuePair<string, string> code in Disc.DISC_WARD_CODE)
                {
                    ListItem item = new ListItem(code.Value, code.Key);

                    if (disc.disc_ward_code == code.Key) { item.Selected = true; }

                    ddbtn_disc_ward.Items.Add(item);
                }

                txt_no_health_insurance.Value = disc.no_health_insurance;
                WebHelpers.BindDateTimePicker(dpk_valid_from, disc.valid_from);
                WebHelpers.BindDateTimePicker(dtpk_disc_date_time, disc.disc_date_time);
                txt_diagnosis.Value = disc.diagnosis;
                txt_disc_medication.Value = disc.disc_medication;
                txt_followup_instruc.Value = disc.followup_instruc;
                txt_notes.Value = disc.notes;
                WebHelpers.BindDateTimePicker(dpk_signature_date, disc.signature_date);

                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (disc.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;
                    btnCancel.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                    loadDataToPrint(disc);
                }
                else if (disc.status == DocumentStatus.DRAFT)
                {

                    btnAmend.Visible = false;
                    btnPrint.Visible = false;
                }
            }
            catch (Exception ex)
            {
                
            }
        }

        private void loadDataToPrint(Disc disc)
        {
            prt_pid.Text = DataHelpers.patient.visible_patient_id;
            prt_patient_name.Text = DataHelpers.patient.first_name_l + " " + DataHelpers.patient.last_name_l;
            prt_dob.Text = WebHelpers.ConvertDateTime(DataHelpers.patient.date_of_birth, "dd-MM-yyyy");
            prt_gender.Text = DataHelpers.patient.gender_l;
            prt_nationality.Text = DataHelpers.patient.nationality_l;
            prt_occupation.Text = DataHelpers.patient.occupation_l;
            prt_valid_from.Text = "?";
            prt_no_health_insurance.Text = "?";
            prt_address.Text = DataHelpers.patient.address_line_l + " " + DataHelpers.patient.address_subregion_l + " " + DataHelpers.patient.religion_l + " " +  DataHelpers.patient.address_country_l;
            prt_disc_date_time.dateTime = Convert.ToString(disc.disc_date_time);
            prt_diagnosis.Text = disc.diagnosis;
            prt_notes.Text = disc.notes;

            prt_signature1.dateTime = System.DateTime.Now.ToString();
            prt_signature2.dateTime = System.DateTime.Now.ToString();
        }

        protected void DisabledControl(bool disabled)
        {
            ddbtn_disc_ward.Disabled = disabled;
            txt_no_health_insurance.Disabled = disabled;
            WebHelpers.DisabledDateTimePicker(dpk_valid_from, disabled);
            WebHelpers.DisabledDateTimePicker(dtpk_disc_date_time, disabled);
            WebHelpers.DisabledDateTimePicker(dpk_signature_date, disabled);
            txt_diagnosis.Disabled = disabled;
            txt_disc_medication.Disabled = disabled;
            txt_followup_instruc.Disabled = disabled;
            txt_notes.Disabled = disabled;
        }
        protected void btnAmend_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = true;
            btnComplete.Attributes["Disabled"] = "Disabled";
            btnCancel.Visible = true;
            btnAmend.Visible = false;
            btnPrint.Visible = false;

            txt_amendReason.Visible = true;
            DisabledControl(false);

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = false;
            btnCancel.Visible = false;
            btnAmend.Visible = true;
            btnPrint.Visible = true;
            txt_amendReason.Visible = false;
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                disc = new Disc(Request.QueryString["docId"]);

                disc.user_name = (string)Session["UserID"];
                disc.status = DocumentStatus.FINAL;

                UpdateData(disc);
            }
            else
            {
                RequiredFieldValidator.Value = JsonConvert.SerializeObject(errors);

                Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                message.Load(messagePlaceHolder, "Please complete the highlighted field(s).", Message.TYPE.DANGER);
            }
        }

        public void UpdateData(Disc disc)
        {
            try
            {
                disc.amend_reason = txt_amendReason.Value;
                disc.no_discharge = disc.no_discharge;
                disc.disc_ward_code = ddbtn_disc_ward.Value;
                if(disc.disc_ward_code != null) disc.disc_ward_desc = Disc.DISC_WARD_CODE[disc.disc_ward_code];
                disc.no_health_insurance = txt_no_health_insurance.Value;
                disc.valid_from = DataHelpers.ConvertSQLDateTime(dpk_valid_from.SelectedDate);
                disc.disc_date_time = DataHelpers.ConvertSQLDateTime(dtpk_disc_date_time.SelectedDate);
                disc.diagnosis = txt_diagnosis.Value;
                disc.disc_medication = txt_disc_medication.Value;
                disc.followup_instruc = txt_followup_instruc.Value;
                disc.notes = txt_notes.Value;
                disc.signature_date = DataHelpers.ConvertSQLDateTime(dpk_signature_date.SelectedDate);
                //?

                dynamic result = disc.Update();

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
            catch (Exception ex) { }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string errors = checkValidField();

            if (string.IsNullOrEmpty(errors))
            {
                disc = new Disc(Request.QueryString["docId"]);

                disc.user_name = (string)Session["UserID"];
                disc.status = DocumentStatus.DRAFT;

                UpdateData(disc);
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
            string error = "";
            return error;
        }

        private bool CheckFieldsValid()
        {
            return true;
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