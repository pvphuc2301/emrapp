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
            disc = new Disc(DataHelpers.varDocId);
            disc.status = DocumentStatus.FINAL;
            disc.user_name = (string)Session["UserID"];

            UpdateData(disc);
        }

        public void UpdateData(Disc disc)
        {
            try
            {
                disc.amend_reason = txt_amendReason.Value;

                disc.disc_ward_code = ddbtn_disc_ward.Value;

                disc.disc_ward_desc = Disc.DISC_WARD_CODE[disc.disc_ward_code];
                disc.no_health_insurance = txt_no_health_insurance.Value;
                disc.valid_from = DataHelpers.ConvertSQLDateTime(dpk_valid_from.SelectedDate);
                disc.disc_date_time = DataHelpers.ConvertSQLDateTime(dtpk_disc_date_time.SelectedDate);
                disc.diagnosis = txt_diagnosis.Value;
                disc.disc_medication = txt_disc_medication.Value;
                disc.followup_instruc = txt_followup_instruc.Value;
                disc.notes = txt_notes.Value;
                //?
                disc.no_discharge = Int32.Parse(disc.no_discharge);
                disc.signature_date = DataHelpers.ConvertSQLDateTime(dpk_signature_date.SelectedDate);

                if (disc.Update()[0] == WebHelpers.ResponseStatus.OK)
                {
                    Message message = (Message)Page.LoadControl("~/UserControls/Message.ascx");
                    message.Load(Page, Message.CODE.MS001, Message.TYPE.SUCCESS, 100000);

                    Initial();
                }
            }
            catch (Exception ex) { }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            disc = new Disc(DataHelpers.varDocId);

            disc.user_name = (string)Session["UserID"];
            disc.status = DocumentStatus.DRAFT;

            UpdateData(disc);

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Disc.Delete((string)Session["UserID"]);
        }
    }
}