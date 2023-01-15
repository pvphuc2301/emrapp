using EMR.Classes;
using EMR.Data.AIH.Model;
using EMR.Model;
using Newtonsoft.Json;
using System;

namespace EMR
{
    public partial class USUrinarySystemReport : EmrPage, IEmrFormModel<UusrModel>
    {
        public override string form_url { get; set; } = $"OPD/UsUriSysReport";
        public UusrModel Model { get; set; }
        public override dynamic InitModel() => Model = new UusrModel(varDocID, Location, varDocIdLog);

        #region Binding Data
        public override void BindingDataFormEdit()
        {
            try
            {
                txt_amend_reason.Text = "";
                txt_diagnosis.Value = WebHelpers.TextToHtmlTag(Model.diagnosis);
                txt_left_kidney.Value = WebHelpers.TextToHtmlTag(Model.left_kidney);
                txt_right_kidney.Value = WebHelpers.TextToHtmlTag(Model.right_kidney);
                txt_urinary_bladder.Value = WebHelpers.TextToHtmlTag(Model.urinary_bladder);
                txt_prostate.Value = WebHelpers.TextToHtmlTag(Model.prostate);
                txt_post_void_resi_volume.Value = WebHelpers.TextToHtmlTag(Model.post_void_resi_volume);
                txt_conclusion.Value = WebHelpers.TextToHtmlTag(Model.conclusion);
                txt_recommendation.Value = WebHelpers.TextToHtmlTag(Model.recommendation);

                DataObj.Value = JsonConvert.SerializeObject(Model);
                Session["docid"] = Model.document_id;
                WebHelpers.AddScriptFormEdit(Page, Model, (string)Session["emp_id"], Location);
            }
            catch(Exception ex) { WebHelpers.SendError(Page, ex); }
        }
        public override void BindingDataFormView()
        {
            try 
            {
                LoadBarCode();
                lbl_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.diagnosis);
                lbl_left_kidney.Text = WebHelpers.TextToHtmlTag(Model.left_kidney);
                lbl_right_kidney.Text = WebHelpers.TextToHtmlTag(Model.right_kidney);
                lbl_urinary_bladder.Text = WebHelpers.TextToHtmlTag(Model.urinary_bladder);
                lbl_prostate.Text = WebHelpers.TextToHtmlTag(Model.prostate);
                lbl_post_void_resi_volume.Text = WebHelpers.TextToHtmlTag(Model.post_void_resi_volume);
                lbl_conclusion.Text = WebHelpers.TextToHtmlTag(Model.conclusion);
                lbl_recommendation.Text = WebHelpers.TextToHtmlTag(Model.recommendation);
            }
            catch(Exception ex) 
            { 
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void BindingDataFormPrint()
        {
            try
            {
                prt_pid.Text = prt_vpid.Text = Patient.visible_patient_id;

                LoadBarCode();

                prt_fullname.Text = Patient.FullName;

                prt_diagnosis.Text = WebHelpers.TextToHtmlTag(Model.diagnosis);
                prt_left_kidney.Text = WebHelpers.TextToHtmlTag(Model.left_kidney);
                prt_right_kidney.Text = WebHelpers.TextToHtmlTag(Model.right_kidney);
                prt_urinary_bladder.Text = WebHelpers.TextToHtmlTag(Model.urinary_bladder);
                prt_prostate.Text = WebHelpers.TextToHtmlTag(Model.prostate);
                prt_post_void_resi_volume.Text = WebHelpers.TextToHtmlTag(Model.post_void_resi_volume);
                prt_conclusion.Text = WebHelpers.TextToHtmlTag(Model.conclusion);
                prt_recommendation.Text = WebHelpers.TextToHtmlTag(Model.recommendation);

                prt_signature_date.Text = WebHelpers.FormatDateTime(Model.modified_date_time, "dd-MM-yyyy", "");
                prt_signature_doctor.Text = Model.modified_name_e;

            }
            catch(Exception ex) 
            { 
                WebHelpers.SendError(Page, ex); 
            }
        }
        #endregion

        #region Methods
        public override void BindingControlToModel()
        {
            try
            {
                
                Model.diagnosis = txt_diagnosis.Value;
                Model.left_kidney = txt_left_kidney.Value;
                Model.right_kidney = txt_right_kidney.Value;
                Model.urinary_bladder = txt_urinary_bladder.Value;
                Model.prostate = txt_prostate.Value;
                Model.post_void_resi_volume = txt_post_void_resi_volume.Value;
                Model.conclusion = txt_conclusion.Value;
                Model.recommendation = txt_recommendation.Value;

                if (JsonConvert.SerializeObject(Model) == DataObj.Value)
                {
                    WebHelpers.Notification(Page, CONST_MESSAGE.SAVE_ERROR_NOCHANGES, "error"); return;
                }

                Model.amend_reason = txt_amend_reason.Text;
            }
            catch(Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        public override void PostBackEventHandler()
        {
        }
        private void LoadBarCode()
        {
            IBarcodeGenerator barcodeGenerator = new BarcodeGenerator();
            BarCode.Controls.Clear();
            BarCode.Controls.Add(barcodeGenerator.Generator(Patient.visible_patient_id));
        }
        #endregion

    }
}