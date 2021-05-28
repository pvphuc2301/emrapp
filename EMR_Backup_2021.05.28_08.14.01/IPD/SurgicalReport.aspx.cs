﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class SurgicalReport : System.Web.UI.Page
    {
        public Surr surr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Initial();
            }
            LoadDataToPrint();
        }

        public void Initial()

        {
            if (Request.QueryString["modelId"] != null) DataHelpers.varModelId = Request.QueryString["modelId"];
            if (Request.QueryString["docId"] != null) DataHelpers.varDocId = Request.QueryString["docId"];
            if (Request.QueryString["pvId"] != null) DataHelpers.varPVId = Request.QueryString["pvId"];

            surr = new Surr(DataHelpers.varDocId);

            loadDataToSurrControls(surr);
        }

        public void loadDataToSurrControls(Surr surr)
        {
            try
            {
                WebHelpers.BindDateTimePicker(rad_procedure_date, surr.procedure_date);
                WebHelpers.BindDateTimePicker(rad_start_time, surr.start_time);
                WebHelpers.BindDateTimePicker(rad_finish_time, surr.finish_time);
                lblChanDoanTruocPhauThuat.InnerText = txt_preo_diagnosis.Value = surr.preo_diagnosis;
                txt_post_diagnosis.Value = surr.post_diagnosis;
                txt_name_procedure.Value = surr.name_procedure;
                txt_anesthesia.Value = surr.anesthesia;
                txt_surgeon.Value = surr.surgeon;
                txt_assistant_surgeon.Value = surr.assistant_surgeon;
                txt_anesthesiologist.Value = surr.anesthesiologist;
                txt_anesthetic_nurse.Value = surr.anesthetic_nurse;
                txt_scrub_nurse.Value = surr.scrub_nurse;
                txt_circulating_nurse.Value = surr.circulating_nurse;
                txt_estimated_bloodloss.Value = surr.estimated_bloodloss;
                txt_biopsy_pathology.Value = surr.biopsy_pathology;
                txt_complications.Value = surr.complications;
                txt_procedure_chart.Value = surr.procedure_chart;
                txt_procedure_narrative.Value = surr.procedure_narrative;
                btnCancel.Visible = false;
                txt_amendReason.Visible = false;

                if (surr.status == DocumentStatus.FINAL)
                {
                    btnComplete.Visible = false;
                    btnSave.Visible = false;
                    btnDeleteModal.Visible = false;
                    btnCancel.Visible = false;

                    btnAmend.Visible = true;
                    btnPrint.Visible = true;

                    DisabledControl(true);
                }
                else if (surr.status == DocumentStatus.DRAFT)
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

            WebHelpers.DisabledDateTimePicker(rad_procedure_date, disabled);
            WebHelpers.DisabledDateTimePicker(rad_start_time, disabled);
            WebHelpers.DisabledDateTimePicker(rad_finish_time, disabled);
            txt_preo_diagnosis.Disabled = disabled;
            txt_post_diagnosis.Disabled = disabled;
            txt_name_procedure.Disabled = disabled;
            txt_anesthesia.Disabled = disabled;
            txt_surgeon.Disabled = disabled;
            txt_assistant_surgeon.Disabled = disabled;
            txt_anesthesiologist.Disabled = disabled;
            txt_anesthetic_nurse.Disabled = disabled;
            txt_scrub_nurse.Disabled = disabled;
            txt_circulating_nurse.Disabled = disabled;
            txt_estimated_bloodloss.Disabled = disabled;
            txt_biopsy_pathology.Disabled = disabled;
            txt_complications.Disabled = disabled;
            txt_procedure_chart.Disabled = disabled;
            txt_procedure_narrative.Disabled = disabled;

        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            surr = new Surr(DataHelpers.varDocId);
            surr.status = DocumentStatus.FINAL;
            surr.user_name = (string)Session["UserID"];

            UpdateData(surr);
        }

        public void UpdateData(Surr surr)
        {
            try
            {
                surr.procedure_date = DataHelpers.ConvertSQLDateTime(rad_procedure_date.SelectedDate);
                surr.start_time = DataHelpers.ConvertSQLDateTime(rad_start_time.SelectedDate);
                surr.finish_time = DataHelpers.ConvertSQLDateTime(rad_finish_time.SelectedDate);
                surr.preo_diagnosis=txt_preo_diagnosis.Value;
                surr.post_diagnosis = txt_post_diagnosis.Value;
                surr.name_procedure = txt_name_procedure.Value;
                surr.anesthesia = txt_anesthesia.Value;
                surr.surgeon = txt_surgeon.Value;
                surr.assistant_surgeon = txt_assistant_surgeon.Value;
                surr.anesthesiologist = txt_anesthesiologist.Value;
                surr.anesthetic_nurse = txt_anesthetic_nurse.Value;
                surr.scrub_nurse = txt_scrub_nurse.Value;
                surr.circulating_nurse = txt_circulating_nurse.Value;
                surr.estimated_bloodloss = txt_estimated_bloodloss.Value;
                surr.biopsy_pathology = txt_biopsy_pathology.Value;
                surr.complications = txt_complications.Value;
                surr.procedure_chart = txt_procedure_chart.Value;
                surr.procedure_narrative = txt_procedure_narrative.Value;

                if (surr.Update()[0] == WebHelpers.ResponseStatus.OK)
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
            surr = new Surr(DataHelpers.varDocId);

            surr.user_name = (string)Session["UserID"];
            surr.status = DocumentStatus.DRAFT;

            UpdateData(surr);
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

        protected void btnPrint_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnComplete.Visible = false;
            btnCancel.Visible = false;
            btnAmend.Visible = true;
            btnPrint.Visible = true;
            txt_amendReason.Visible = false;

            DisabledControl(true);
        }


        public void LoadDataToPrint()
        {
            Initial();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Surr.Delete((string)Session["UserID"])[0] == WebHelpers.ResponseStatus.OK)
            {

            }
        }
    }
}