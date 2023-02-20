using EMR.Data.AIH.Dictionary;
using EMR.Data.AIH.Model;
using EMR.Data.Shared.Services;
using EmrLib.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public partial class AdmissionRequest : EmrPageV01
    {
        public override string form_url { get; set; } = "OPD/AdmissionRequest";
        public AdreModel Model { get; set; }
        protected override Control DisplayLogHistory => lblLogHistory;
        protected override Control SaveControl => btnSave;
        protected override Control DeleteControl => btnDelete;
        protected override Control AmendControl => btnAmend;
        protected override Control PrintControl => btnPrint;
        protected override Control CancelControl => btnCancel;
        protected override Control CompleteControl => btnComplete;

        public override dynamic InitModel()
            => Model = new AdreModel(varDocID);
        public override dynamic GetModel()
        {
            if (varDocIdLog == null)
            {
                Model = EmrService<AdreModel>.Get(Guid.Parse(varDocID), Location);
            }
            else
            {
                Model = EmrService<AdreModel>.GetLog(Guid.Parse(varDocIdLog), Location);
            }
            return Model;
        }
        public override void LoadPatient()
        {
            if (uc_patientInfo.Patient == null)
            {
                uc_patientInfo.Patient = PatientService.GetPatient(Guid.Parse(varPID));
                IEnumerable<PatientVisitInfo> PatientVisit = PatientService.GetPatientVisit(Guid.Parse(varPVID), Location);
                uc_patientInfo.PatientVisit = PatientVisit.FirstOrDefault();
            }
        }
        public override void SetDefaultModel()
        {
            IEnumerable<AdreModel> Logs = EmrService<AdreModel>.GetLogs(Guid.Parse(varDocID), Location);
            if (Logs.Count() == 1)
            {
                Model.admitting_doctor = Convert.ToString(Session["UserName"]);
                Model.time_of_admission = DateTime.Now;
            }
        }
        public override bool LoadFormControl(ControlState state)
        {
            bool Visible = (AccessAuthorize == "FullAccess" && !IsLocationChanged && state == ControlState.Edit && !IsViewLog) ? true : false;

            txt_admitting_doctor.Visible
                = dtpk_time_of_admission.Visible
                = txt_expected_duration_hospital.Visible
                = txt_diagnosis_on_admission.Visible
                = isolation_request_wrapper.Visible
                = admission_department_wrapper.Visible
                = txt_primary_doctor.Visible
                = for_surgical_cases_wrapper.Visible
                = txt_name_of_expected.Visible
                = other_information_wrapper.Visible
                = special_request_wrapper.Visible
                = Visible;

            lbl_admitting_doctor.Visible
                = lbl_time_of_admission.Visible
                = lbl_expected_duration_hospital.Visible
                = lbl_diagnosis_on_admission.Visible
                = lbl_isolation_request.Visible
                = lbl_admission_department.Visible
                = lbl_primary_doctor.Visible
                = lbl_for_surgical_cases.Visible
                = lbl_name_of_expected.Visible
                = lbl_other_information.Visible
                = lbl_special_request.Visible 
                = !Visible;

            return Visible;
        }
        //public override bool UpdateModel()
        //{
        //    var response = EmrService<AdreModel>.Update(Model, Location);

        //    if (response.IsSuccessStatusCode)
        //    {
        //        var LogResponse = EmrService<AdreModel>.Log(Model, Location);
        //        if (!LogResponse.IsSuccessStatusCode)
        //        {
        //            Alert("Error", "Can not write log", "error");
        //        }
        //    }
        //    else
        //    {
        //        Alert("Error", "Can not update data", "error");
        //        return false;
        //    }
        //    return true;
        //}
        public override void BindingDataFormView()
        {
            //lbl_admitting_doctor.Visible = true;
            //txt_admitting_doctor.Visible = false;
            lbl_admitting_doctor.Text = Model.admitting_doctor;

            //lbl_time_of_admission.Visible = true;
            //dtpk_time_of_admission.Visible = false;
            lbl_time_of_admission.Text = Model.time_of_admission?.ToString("dd/MM/yyyy HH:mm tt");

            //lbl_expected_duration_hospital.Visible = true;
            //txt_expected_duration_hospital.Visible = false;
            lbl_expected_duration_hospital.Text = Model.expected_duration_hospital;

            //lbl_diagnosis_on_admission.Visible = true;
            //txt_diagnosis_on_admission.Visible = false;
            lbl_diagnosis_on_admission.Text = Model.diagnosis_on_admission;

            //lbl_isolation_request.Visible = true;
            //isolation_request_wrapper.Visible = false;
            lbl_isolation_request.Text = string.IsNullOrEmpty(Model.isolation_request) ? "" : AdreDictionary.ISOLATION_REQUEST[Model.isolation_request];

            //lbl_admission_department.Visible = true;
            //admission_department_wrapper.Visible = false;
            lbl_admission_department.Text = Model.admission_department_desc;
            if (Model.admission_department_code == AdreDictionary.ADMISSION_DEPARTMENT_OTH)
            {
                lbl_admission_department.Text += ": " + Model.admission_department_note;
            }

            //lbl_primary_doctor.Visible = true;
            //txt_primary_doctor.Visible = false;
            lbl_primary_doctor.Text = Model.primary_doctor;

            //lbl_for_surgical_cases.Visible = true;
            //for_surgical_cases_wrapper.Visible = false;
            lbl_for_surgical_cases.Text = string.IsNullOrEmpty(Model.for_surgical_cases) ? "" : AdreDictionary.FOR_SURGICAL_CASES[Model.for_surgical_cases];
            name_of_expected_wrapper.Visible = rad_for_surgical_cases_y.Checked;

            //lbl_name_of_expected.Visible = true;
            //txt_name_of_expected.Visible = false;
            lbl_name_of_expected.Text = Model.name_of_expected;
            //D. Thông tin khác/ Other information
            //lbl_other_information.Visible = true;
            //other_information_wrapper.Visible = false;
            lbl_other_information.Text = string.IsNullOrEmpty(Model.other_information_code) ? "" : AdreDictionary.OTHER_INFORMATION[Model.other_information_code];
            if(Model.other_information_code == AdreDictionary.OTHER_INFORMATION_Y)
            {
                lbl_other_information.Text += ": " + Model.other_information_specify;
            }
            //E. Yêu cầu thêm/ Special request
            //lbl_special_request.Visible = true;
            //special_request_wrapper.Visible = false;
            lbl_special_request.Text = string.IsNullOrEmpty(Model.special_request_code) ? "" : AdreDictionary.SPECIAL_REQUEST[Model.special_request_code];
            if (Model.special_request_code == AdreDictionary.SPECIAL_REQUEST_Y)
            {
                lbl_special_request.Text += ": " + Model.special_request_specify;
            }
        }
        public override void BindingDataFormEdit()
        {
            txt_admitting_doctor.Value = Model.admitting_doctor;
            BindingRadDateTimePicker(dtpk_time_of_admission, Model.time_of_admission);
            txt_expected_duration_hospital.Value = Model.expected_duration_hospital;
            txt_diagnosis_on_admission.Value = Model.diagnosis_on_admission;
            BindingInputRadioButton(nameof(Model.isolation_request) + "_" + Model.isolation_request);
            BindingInputRadioButton(nameof(Model.admission_department_code) + "_" + Model.admission_department_code);
            if (rad_admission_department_code_oth.Checked)
            {
                admission_department_other_wrapper.Visible = true;
                txt_admission_department_oth.Value = Model.admission_department_note;
            }
            else
            {
                admission_department_other_wrapper.Visible = false;
            }
            txt_primary_doctor.Value = Model.primary_doctor;
            BindingInputRadioButton(nameof(Model.for_surgical_cases) + "_" + Model.for_surgical_cases);
            name_of_expected_wrapper.Visible = rad_for_surgical_cases_y.Checked;
            txt_name_of_expected.Value = Model.name_of_expected;
            //D. Thông tin khác/ Other information 
            BindingInputRadioButton(nameof(Model.other_information_code) + "_" + Model.other_information_code);
            if(rad_other_information_code_y.Checked)
            {
                other_information_specify_wrapper.Visible = true;
                txt_other_information_specify.Value = Model.other_information_specify;
            }
            else
            {
                other_information_specify_wrapper.Visible = false;
            }
            //E. Yêu cầu thêm/ Special request
            BindingInputRadioButton(nameof(Model.special_request_code) + "_" + Model.special_request_code);
            if(rad_special_request_code_y.Checked)
            {
                special_request_specify_wrapper.Visible = true;
                txt_special_request_specify.Value = Model.special_request_specify;
            }
            else
            {
                special_request_specify_wrapper.Visible = false;
            }
            base.BindingDataFormEdit();
        }
        public override void BindingDataFormPrint()
        {
            prt_admission_department_other.Text
                = prt_other_information_specify.Text
                = prt_special_request_specify.Text
                = "";

            prt_isolation_request_n.Text
                = prt_isolation_request_y.Text
                = prt_admission_department_code_day.Text
                = prt_admission_department_code_med.Text
                = prt_admission_department_code_sur.Text
                = prt_admission_department_code_obg.Text
                = prt_admission_department_code_icu.Text
                = prt_admission_department_code_ped.Text
                = prt_admission_department_code_del.Text
                = prt_admission_department_code_ope.Text
                = prt_admission_department_code_oth.Text
                = prt_for_surgical_cases_n.Text
                = prt_for_surgical_cases_y.Text
                = prt_other_information_code_n.Text
                = prt_other_information_code_y.Text
                = prt_special_request_code_n.Text
                = prt_special_request_code_y.Text
                = "❏";
            //_patientService = new PatientService();
            Patient = PatientService.GetPatient(Guid.Parse(varPID));

            prt_patient_name.Text = Patient.FullName;
            prt_dob.Text = WebHelpers.FormatDateTime(Patient.date_of_birth, "dd/MM/yyyy");
            prt_gender.Text = Patient.Gender;
            prt_pid.Text = Patient.visible_patient_id;

            prt_admitting_doctor.Text = Model.admitting_doctor;
            prt_time_of_admission.Text = Model.time_of_admission?.ToString("HH:mm; dd/MM/yyyy");
            prt_diagnosis_on_admission.Text = Model.diagnosis_on_admission;
            prt_expected_duration_hospital.Text = Model.expected_duration_hospital;
            BindingLabel(nameof(Model.isolation_request) + "_" + Model.isolation_request, "☒");
            BindingLabel(nameof(Model.admission_department_code) + "_" + Model.admission_department_code, "☒");
            if(prt_admission_department_code_oth.Text == "☒")
            {
                prt_admission_department_other.Text = Model.admission_department_note;
            }
            prt_primary_doctor.Text = Model.primary_doctor;
            
            BindingLabel(nameof(Model.for_surgical_cases) + "_" + Model.for_surgical_cases, "☒");
            prt_name_of_expected_wrapper.Visible = prt_for_surgical_cases_y.Text == "☒";

            prt_name_of_expected.Text = Model.name_of_expected;
            BindingLabel(nameof(Model.other_information_code) + "_" + Model.other_information_code, "☒");
            if(prt_other_information_code_y.Text == "☒")
            {
                prt_other_information_specify.Text = Model.other_information_specify;
            }

            BindingLabel(nameof(Model.special_request_code) + "_" + Model.special_request_code, "☒");
            if (prt_special_request_code_y.Text == "☒")
            {
                prt_special_request_specify.Text = Model.special_request_specify;
            }
            prt_time_request.Text = Model.modified_date_time.ToString("HH:mm; dd/MM/yyyy");
        }
        public override void PostBackEventHandler() {
            switch (Request["__EVENTTARGET"])
            {
                case "for_surgical_cases":
                    if (Request["__EVENTARGUMENT"] == "N")
                    {
                        name_of_expected_wrapper.Visible = false;
                    }
                    else if (Request["__EVENTARGUMENT"] == "Y")
                    {
                        name_of_expected_wrapper.Visible = true;
                    }
                    break;
                case "other_information_code":
                    if(Request["__EVENTARGUMENT"] == "N")
                    {
                        other_information_specify_wrapper.Visible = false;
                    }
                    else if(Request["__EVENTARGUMENT"] == "Y")
                    {
                        other_information_specify_wrapper.Visible = true;
                    }
                    break;
                case "special_request_code":
                    if (Request["__EVENTARGUMENT"] == "N")
                    {
                        special_request_specify_wrapper.Visible = false;
                    }
                    else if (Request["__EVENTARGUMENT"] == "Y")
                    {
                        special_request_specify_wrapper.Visible = true;
                    }
                    break;
                case "admission_department_code":
                    if (Request["__EVENTARGUMENT"] == "OTH")
                    {
                        admission_department_other_wrapper.Visible = true;
                    }
                    else
                    {
                        admission_department_other_wrapper.Visible = false;
                    }
                    break;
            }
        }
        public override void BindingControlToModel()
        {
            Model.admitting_doctor = txt_admitting_doctor.Value;
            if(dtpk_time_of_admission.SelectedDate != null)
            {
                Model.time_of_admission = EmrHelper.ConvertSQLDateTime((DateTime)dtpk_time_of_admission.SelectedDate);
            }
            Model.expected_duration_hospital = txt_expected_duration_hospital.Value;
            Model.diagnosis_on_admission = txt_diagnosis_on_admission.Value;

            Model.isolation_request = FindHtmlInputRadioButton(nameof(Model.isolation_request), AdreDictionary.ISOLATION_REQUEST);
            
            Model.admission_department_code = FindHtmlInputRadioButton(nameof(Model.admission_department_code), AdreDictionary.ADMISSION_DEPARTMENT);
            if(Model.admission_department_code != null)
            {
                Model.admission_department_desc = AdreDictionary.ADMISSION_DEPARTMENT[Model.admission_department_code];
                if(Model.admission_department_code == AdreDictionary.ADMISSION_DEPARTMENT_OTH)
                {
                    Model.admission_department_note = txt_admission_department_oth.Value;
                }
            }

            Model.primary_doctor = txt_primary_doctor.Value;
            Model.for_surgical_cases = FindHtmlInputRadioButton(nameof(Model.for_surgical_cases), AdreDictionary.ISOLATION_REQUEST);

            Model.name_of_expected = txt_name_of_expected.Value;
            
            Model.other_information_code = FindHtmlInputRadioButton(nameof(Model.other_information_code), AdreDictionary.OTHER_INFORMATION);
            if(Model.other_information_code == AdreDictionary.OTHER_INFORMATION_Y)
            {
                Model.other_information_specify = txt_other_information_specify.Value;
            }

            Model.special_request_code = FindHtmlInputRadioButton(nameof(Model.special_request_code), AdreDictionary.SPECIAL_REQUEST);
            if (Model.special_request_code == AdreDictionary.SPECIAL_REQUEST_Y)
            {
                Model.special_request_specify = txt_special_request_specify.Value;
            }
        }

        #region ServerValidate
        protected void admitting_doctor_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_admitting_doctor.Text);
        }
        protected void time_of_admission_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = dtpk_time_of_admission.SelectedDate != null;
        }
        protected void diagnosis_on_admission_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_diagnosis_on_admission.Text);
        }
        protected void expected_duration_hospital_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_expected_duration_hospital.Text);
        }
        protected void isolation_request_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_isolation_request_n.Checked || rad_isolation_request_y.Checked;
        }
        protected void admission_department_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_admission_department_code_day.Checked 
                || rad_admission_department_code_med.Checked
                || rad_admission_department_code_sur.Checked
                || rad_admission_department_code_obg.Checked
                || rad_admission_department_code_icu.Checked
                || rad_admission_department_code_ped.Checked
                || rad_admission_department_code_del.Checked
                || rad_admission_department_code_ope.Checked
                || rad_admission_department_code_oth.Checked;
        }
        protected void primary_doctor_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_primary_doctor.Text);
        }
        protected void for_surgical_cases_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_for_surgical_cases_n.Checked || rad_for_surgical_cases_y.Checked;
        }
        protected void name_of_expected_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_name_of_expected.Text);
        }
        protected void other_information_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_other_information_code_n.Checked ||
                rad_other_information_code_y.Checked;
        }
        protected void special_request_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_special_request_code_n.Checked
                || rad_special_request_code_y.Checked;
        }
        #endregion
    }
}