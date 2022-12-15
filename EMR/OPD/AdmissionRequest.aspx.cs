using Emr.Utility;
using EMR.Data.AIH.Dictionary;
using EMR.Data.AIH.Model;
using EMR.Data.Shared.Services;
using EMR.Model;
using Newtonsoft.Json;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Web.UI.Map;

namespace EMR
{
    public partial class AdmissionRequest : EmrPage
    {
        EmrService<Adre> _emrService;
        public override string form_url { get; set; } = "OPD/AdmissionRequest";
        public Adre Model { get; set; }
        public DateTime associated_visit_admited { get; set; }
        public DateTime associated_visit_closed { get; set; }
        public override dynamic InitModel() {
            _emrService = new EmrService<Adre>();
            Model = _emrService.Get(new Adre(varDocID, Location), Location);
            
            //Set default value
            if (Model.IsFirstCreated(Location))
            {
                Model.admitting_doctor = Convert.ToString(Session["UserName"]);
            }

            return Model;
        }
        #region Binding Data
        public override void BindingDataFormView()
        {
            lbl_admitting_doctor.Visible = true;
            txt_admitting_doctor.Visible = false;
            lbl_admitting_doctor.Text = Model.admitting_doctor;

            lbl_time_of_admission.Visible = true;
            dtpk_time_of_admission.Visible = false;
            lbl_time_of_admission.Text = Model.time_of_admission?.ToString("dd/MM/yyyy HH:mm tt");

            lbl_expected_duration_hospital.Visible = true;
            txt_expected_duration_hospital.Visible = false;
            lbl_expected_duration_hospital.Text = Model.expected_duration_hospital;

            lbl_diagnosis_on_admission.Visible = true;
            txt_diagnosis_on_admission.Visible = false;
            lbl_diagnosis_on_admission.Text = Model.diagnosis_on_admission;

            lbl_isolation_request.Visible = true;
            isolation_request_wrapper.Visible = false;
            lbl_isolation_request.Text = string.IsNullOrEmpty(Model.isolation_request) ? "" : AdreDictionary.ISOLATION_REQUEST[Model.isolation_request];

            lbl_admission_department.Visible = true;
            admission_department_wrapper.Visible = false;
            lbl_admission_department.Text = Model.admission_department_desc;
            if (Model.admission_department_code == AdreDictionary.ADMISSION_DEPARTMENT_OTH)
            {
                lbl_admission_department.Text += ": " + Model.admission_department_note;
            }

            lbl_primary_doctor.Visible = true;
            txt_primary_doctor.Visible = false;
            lbl_primary_doctor.Text = Model.primary_doctor;

            lbl_for_surgical_cases.Visible = true;
            for_surgical_cases_wrapper.Visible = false;
            lbl_for_surgical_cases.Text = AdreDictionary.FOR_SURGICAL_CASES[Model.for_surgical_cases];

            lbl_name_of_expected.Visible = true;
            txt_name_of_expected.Visible = false;
            lbl_name_of_expected.Text = Model.name_of_expected;
            //D. Thông tin khác/ Other information
            lbl_other_information.Visible = true;
            other_information_wrapper.Visible = false;
            lbl_other_information.Text = string.IsNullOrEmpty(Model.other_information_code) ? "" : AdreDictionary.OTHER_INFORMATION[Model.other_information_code];
            if(Model.other_information_code == AdreDictionary.OTHER_INFORMATION_Y)
            {
                lbl_other_information.Text += ": " + Model.other_information_specify;
            }
            //E. Yêu cầu thêm/ Special request
            lbl_special_request.Visible = true;
            special_request_wrapper.Visible = false;
            lbl_special_request.Text = string.IsNullOrEmpty(Model.special_request_code) ? "" : AdreDictionary.SPECIAL_REQUEST[Model.special_request_code];
            if (Model.special_request_code == AdreDictionary.SPECIAL_REQUEST_Y)
            {
                lbl_special_request.Text += ": " + Model.special_request_specify;
            }
        }
        public override void BindingDataFormEdit()
        {
            lbl_admitting_doctor.Visible = false;
            txt_admitting_doctor.Visible = true;
            txt_admitting_doctor.Value = Model.admitting_doctor;

            lbl_time_of_admission.Visible = false;
            dtpk_time_of_admission.Visible = true;
            BindingRadDateTimePicker(dtpk_time_of_admission, Model.time_of_admission);

            lbl_expected_duration_hospital.Visible = false;
            txt_expected_duration_hospital.Visible = true;
            txt_expected_duration_hospital.Value = Model.expected_duration_hospital;

            lbl_diagnosis_on_admission.Visible = false;
            txt_diagnosis_on_admission.Visible = true;
            txt_diagnosis_on_admission.Value = Model.diagnosis_on_admission;

            lbl_isolation_request.Visible = false;
            isolation_request_wrapper.Visible = true;
            BindingInputRadioButton(nameof(Model.isolation_request) + "_" + Model.isolation_request);

            lbl_admission_department.Visible = false;
            admission_department_wrapper.Visible = true;
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

            lbl_primary_doctor.Visible = false;
            txt_primary_doctor.Visible = true;
            txt_primary_doctor.Value = Model.primary_doctor;

            lbl_for_surgical_cases.Visible = false;
            for_surgical_cases_wrapper.Visible = true;
            BindingInputRadioButton(nameof(Model.for_surgical_cases) + "_" + Model.for_surgical_cases);

            lbl_name_of_expected.Visible = false;
            txt_name_of_expected.Visible = true;
            txt_name_of_expected.Value = Model.name_of_expected;
            //D. Thông tin khác/ Other information 
            lbl_other_information.Visible = false;
            other_information_wrapper.Visible = true;
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
            lbl_special_request.Visible = false;
            special_request_wrapper.Visible = true;
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

            
            
        }
        public override void BindingDataFormPrint()
        {
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
        #endregion
        #region Methods
        #endregion
        public override void PostBackEventHandler() {
            switch (Request["__EVENTTARGET"])
            {
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
        protected void CompleteDocument1(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    (sender as LinkButton).CssClass += " cursor-wait";
                    ModelRef = InitModel();
                    ModelRef.status = DocumentStatus.FINAL;
                    ModelRef.user_name = UserId;
                    BindingControlToModel();
                    var response = _emrService.Update(Model, Location);
                    if (response.IsSuccessStatusCode)
                    {
                        WebHelpers.PostAPI($"api/emr/clear-session/{Location}/{varDocID}");
                        string script = string.Format("function f(){{ window.parent.complete_document(\"" + PAGE_URL + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "complete_document", script, true);
                        var responseLog = _emrService.Log(Model, Location);
                        if (responseLog.IsSuccessStatusCode)
                        {

                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    WebHelpers.SendError(Page, ex);
                }
            }
        }
        public override void BindingControlToModel()
        {
            Model.admitting_doctor = txt_admitting_doctor.Value;
            Model.time_of_admission = DateTimeProvider.ConvertSQLDateTime(dtpk_time_of_admission.SelectedDate);
            Model.expected_duration_hospital = txt_expected_duration_hospital.Value;
            Model.diagnosis_on_admission = txt_diagnosis_on_admission.Value;

            Model.isolation_request = FindHtmlInputRadioButton(nameof(Model.isolation_request), AdreDictionary.ISOLATION_REQUEST);
            
            Model.admission_department_code = FindHtmlInputRadioButton(nameof(Model.admission_department_code), AdreDictionary.ADMISSION_DEPARTMENT);
            Model.admission_department_desc = AdreDictionary.ADMISSION_DEPARTMENT[Model.admission_department_code];
            if(Model.admission_department_code == AdreDictionary.ADMISSION_DEPARTMENT_OTH)
            {
                Model.admission_department_note = txt_admission_department_oth.Value;
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
        //public override void PrintDocument(object sender, EventArgs e)
        //{
        //    //dynamic rwndPrint = FindControl("rwndPrint");
        //    //PrintSetup();
        //    //ModelRef = InitModel();
        //    //LoadPatient();
        //    //BindingDataFormPrint();
        //    //if (rwndPrint != null)
        //    //{
        //    //    string script = string.Format("function f(){{ window.select_print_language();Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
        //    //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print_document", script, true);
        //    //}
        //    //else
        //    //{
        //    //    string script = string.Format("function f(){{ window.print_document();Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
        //    //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print_document", script, true);
        //    //}

        //    //ModelRef = InitModel();
        //    //Patient = new PatientInfo(varPID);
        //    //PatientVisit = new PatientVisitInfo(varPVID, Location);
        //    //BindingDataFormPrint();
        //    string script = string.Format("function f(){{ window.print_document();Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print_document", script, true);
        //}
    }
}