using EmrLib.Session;
using EMR.Data.AIH.Dictionary;
using EMR.Data.AIH.Model;
using EMR.Data.Shared.Services;
using EMR.Model;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using EmrLib.Utility;

namespace EMR
{
    public partial class BookForSurPro : EmrPageV01
    {
        public override string form_url { get; set; } = "IPD/BookForSurPro";
        public BfspModel Model { get; set; }
        public override dynamic InitModel()
            => Model = new BfspModel(varDocID);
        public override dynamic GetModel()
        {
            if(varDocIdLog == null)
            {
                Model = EmrService<BfspModel>.Get(Guid.Parse(varDocID), Location);
            }
            else
            {
                Model = EmrService<BfspModel>.GetLog(Guid.Parse(varDocIdLog), Location);
            }
            return Model;
        }
        public override void LoadPatient()
        {
            if(uc_patientInfo.Patient == null)
            {
                uc_patientInfo.Patient = PatientService.GetPatient(Guid.Parse(varPID));
                IEnumerable<PatientVisitInfo> PatientVisit = PatientService.GetPatientVisit(Guid.Parse(varPVID), Location);
                uc_patientInfo.PatientVisit = PatientVisit.FirstOrDefault();
            }
        }
        public override void SetDefaultModel()
        {
            IEnumerable<BfspModel> Logs = EmrService<BfspModel>.GetLogs(Guid.Parse(varDocID), Location);
            if (Logs.Count() == 1)
            {
                Model.hair_removal_diagram = BfspDictionary.HAIR_REMOVAL_DIAGRAM;
            }
        }
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!CheckSession())
        //    {
        //        return;
        //    }
        //    if (!IsPostBack)
        //    {
        //        InitModel();

        //        IEnumerable<Bfsp> Logs = _emrService.GetLogs(Guid.Parse(varDocID), Location);
        //        if (Logs.Count() == 1)
        //        {
        //            Model.hair_removal_diagram = BfspDictionary.HAIR_REMOVAL_DIAGRAM;
        //        }

        //        InitPage();

        //        LastestVersion.Visible = varDocIdLog != null;
        //        LoadLogHistoryText();

        //        _patientService = new PatientService();
        //        uc_patientInfo.Patient = _patientService.GetPatient(Guid.Parse(varPID));
        //        IEnumerable<PatientVisitInfo> PatientVisit = _patientService.GetPatientVisit(Guid.Parse(varPVID), Location);
        //        uc_patientInfo.PatientVisit = PatientVisit.FirstOrDefault();
        //    }
        //    else
        //    {
        //        PostBackEventHandler();
        //    }
        //}
        //private void InitPage()
        //{
        //    LoadPermissions();
            
        //    amendReasonWraper.Visible = false;
        //    if (Model.status == DocumentStatus.FINAL)
        //    {
        //        BindingDataForm(ControlState.View);
        //        BindingDataFormPrint();
        //    }
        //    else
        //    {
        //        BindingDataForm(ControlState.Edit);
        //    }
        //}
        #region Binding Data
        public override bool LoadFormControl(ControlState state)
        {
            //1 - edit
            bool Visible = (AccessAuthorize == "FullAccess" && !IsLocationChanged && state == ControlState.Edit && !IsViewLog) ? true : false;

            imgage_editer_tool.Visible = Visible;
            txt_preoperative_diagnosis.Visible
                = txt_surgeon.Visible
                = txt_assistant_surgeon.Visible
                = txt_performance_method.Visible
                //= txt_package_name.Visible
                //= txt_package_code.Visible
                = admitted_wrapper.Visible
                = dtpk_performance_date_time.Visible
                = txt_surgical_time.Visible
                = infected_case_wrapper.Visible
                = equipment_wrapper.Visible
                = special_equipment_wrapper.Visible
                = implant_wrapper.Visible
                = special_consumable_wrapper.Visible
                = frozen_section_wrapper.Visible
                = anatomical_pathology_wrapper.Visible
                = other_please_specify_wrapper.Visible
                = surgical_equipment_wrapper.Visible
                = position_patient_wrapper.Visible
                = type_anaesthesia_wrapper.Visible
                = preoperative_preparation_wrapper.Visible
                = hair_removal_wrapper.Visible
                = Visible;

            lbl_preoperative_diagnosis.Visible
                = lbl_surgeon.Visible
                = lbl_assistant_surgeon.Visible
                = lbl_performance_method.Visible
                //= lbl_package_name.Visible
                //= lbl_package_code.Visible
                = lbl_admitted_code.Visible
                = lbl_performance_date_time.Visible
                = lbl_surgical_time.Visible
                = lbl_equipment.Visible
                = lbl_infected_case_code.Visible
                = lbl_special_equipment.Visible
                = lbl_implant.Visible
                = lbl_special_consumable.Visible
                = lbl_frozen_section.Visible
                = lbl_anatomical_pathology.Visible
                = lbl_other_please_specify.Visible
                = lbl_surgical_equipment_code.Visible
                = lbl_position_patient_code.Visible
                = lbl_type_anaesthesia_code.Visible
                = lbl_preoperative_preparation_code.Visible
                = lbl_hair_removal.Visible
                = !Visible;
            
            return Visible;
        }
        public override bool UpdateModel()
        {
            //_emrService = new EmrService<Bfsp>();
            var response = EmrService<BfspModel>.Update(Model, Location);

            if (response.IsSuccessStatusCode)
            {
                var LogResponse = EmrService<BfspModel>.Log(Model, Location);
                if (!LogResponse.IsSuccessStatusCode)
                {
                    Alert("Error", "Can not write log", "error");
                }
            }
            else
            {
                Alert("Error", "Can not update data", "error");
                return false;
            }
            return true;
        }
        //public override void PrintDocument(object sender, EventArgs e)
        //{
        //    //dynamic rwndPrint = FindControl("rwndPrint");
        //    //PrintSetup();
        //    InitModel();
        //    _patientService = new PatientService();
        //    Patient = _patientService.GetPatient(Guid.Parse(varPID));
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
        //    //PatientVisit = new PatientVisitInfo(patient_visit_id, Location);
        //    //BindingDataFormPrint();
        //    string script = string.Format("function f(){{ window.print_document();Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print_document", script, true);
        //}
        //public override void CancelAmendDocument(object sender, EventArgs e)
        //{
        //    var response = SessionChecker.ClearSession(Location, Guid.Parse(varDocID));

        //    if (response.IsSuccessStatusCode)
        //    {
        //        btnCancel.Visible
        //            = btnComplete.Visible
        //            = false;
        //        btnAmend.Visible
        //            = btnPrint.Visible
        //            = true;

        //        InitModel();
        //        InitPage();
        //    }
        //    else
        //    {
        //        string script = string.Format("function f(){{ window.parent.ShowBlock('Cannot clear session');Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
        //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "error", script, true);
        //    }
        //}
        //public override void AmendDocument(object sender, EventArgs e)
        //{
        //    var item = SessionChecker.FindBlockedSession(Location, Guid.Parse(varDocID), Guid.Parse(EmpId));
        //    if(item != null)
        //    {
        //        string script = string.Format("function f(){{ window.parent.ShowBlock('This document is blocked by " + item.full_name_l + "');Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
        //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "block_document", script, true);
        //    }
        //    else
        //    {
        //        InitModel();
        //        btnAmend.Visible
        //            = btnPrint.Visible
        //            = false;
        //        btnComplete.Visible
        //            = btnCancel.Visible
        //            = amendReasonWraper.Visible
        //            = true;

        //        LoadFormControl(ControlState.Edit);
        //        BindingDataFormEdit();
        //    }
        //}
        //public override void DeleteDocument(object sender, EventArgs e)
        //{
        //    var args = JsonConvert.SerializeObject(new { document_id = varDocID, api = Bfsp._api, patient_visit_id = patient_visit_id });
        //    string script = string.Format("function f(){{ window.parent.ConfirmDeleteDocument('{0}');Sys.Application.remove_load(f);}}Sys.Application.add_load(f);", args);
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "confirm_delete_document", script, true);
        //}
        //public override void CompleteDocument(object sender, EventArgs e)
        //{
        //    if (Page.IsValid)
        //    {
        //        try
        //        {
        //            (sender as LinkButton).CssClass += "cursor-wait";
        //            Model = new Bfsp(varDocID);
        //            Model.status = DocumentStatus.FINAL;
        //            Model.user_name = UserId;
        //            BindingControlToModel();
        //            UpdateModel();
        //            InitPage();
        //        }
        //        catch (Exception ex)
        //        {
        //            Console.WriteLine(ex.Message);
        //            WebHelpers.SendError(Page, ex);
        //        }
        //    }
        //}
        //public override void SaveDocument(object sender, EventArgs e)
        //{
        //    if (Page.IsValid)
        //    {
        //        Model = new Bfsp(varDocID);
        //        Model.status = DocumentStatus.DRAFT;
        //        Model.user_name = UserId;
        //        BindingControlToModel();
        //        UpdateModel();
        //    }
        //}
        public override void BindingDataFormPrint()
        {
            Patient = PatientService.GetPatient(Guid.Parse(varPID));

            prt_patient_name.Text = Patient.FullName;
            prt_dob.Text = WebHelpers.FormatDateTime(Patient.date_of_birth, "dd/MM/yyyy");
            prt_gender.Text = Patient.Gender;
            prt_pid.Text = Patient.visible_patient_id;

            prt_preoperative_diagnosis.Text = Model.preoperative_diagnosis;
            prt_surgeon.Text = Model.surgeon;
            prt_assistant_surgeon.Text = Model.assistant_surgeon;
            prt_performance_method.Text = Model.performance_method;
            //prt_package_name.Text = Model.package_name;
            //prt_package_code.Text = Model.package_code;
            BindingLabel(nameof(Model.admitted_code) + "_" + Model.admitted_code, "☒");
            if(Model.admitted_code == BfspDictionary.ADMITTED_CODE_IPD)
            {
                prt_admitted_specify.Text = Model.admitted_specify;
            }
            if (DateTime.TryParse(Model.performance_date_time, out DateTime performance_date_time))
            {
                prt_performance_date_time.Text = performance_date_time.ToString("HH:mm; dd/MM/yyyy");
            }
            prt_surgical_time.Text = Model.surgical_time;
            prt_duration_using_room.Text = Model.duration_using_room;

            BindingLabel(nameof(Model.infected_case_code) + "_" + Model.infected_case_code, "☒");
            BindingLabel(nameof(Model.equipment) + "_" + Model.equipment, "☒");

            prt_special_equipment.Text = Model.special_equipment;
            prt_implant.Text = Model.implant;
            prt_special_consumable.Text = Model.special_consumable;
            prt_frozen_section.Text = Model.frozen_section;
            prt_anatomical_pathology.Text = Model.anatomical_pathology;
            prt_other_please_specify.Text = Model.other_please_specify;

            BindingLabel(nameof(Model.surgical_equipment_code) + "_" + Model.surgical_equipment_code, "☒");
            if(Model.surgical_equipment_code == BfspDictionary.SURGICAL_EQUIPMENT_CODE_OTH)
            {
                prt_surgical_equipment_note.Text = Model.surgical_equipment_note;
            }

            BindingLabel(nameof(Model.position_patient_code) + "_" + Model.position_patient_code, "☒");
            if(Model.position_patient_code == BfspDictionary.POSITION_PATIENT_CODE_OTH)
            {
                prt_position_patient_specify.Text = Model.position_patient_specify;
            } 
            else if(Model.position_patient_code == BfspDictionary.POSITION_PATIENT_CODE_LAT)
            {
                BindingLabel(nameof(Model.lateral_specify) + "_" + Model.lateral_specify, "☒");
            }

            BindingLabel(nameof(Model.type_anaesthesia_code) + "_" + Model.type_anaesthesia_code, "☒");
            if (Model.type_anaesthesia_code == BfspDictionary.TYPE_ANAESTHESIA_CODE_OTH)
            {
                prt_type_anaesthesia_note.Text = Model.type_anaesthesia_note;
            }

            BindingLabel(nameof(Model.preoperative_preparation_code) + "_" + Model.preoperative_preparation_code, "☒");
            if (Model.preoperative_preparation_code == BfspDictionary.PREOPERATIVE_PREPARATION_CODE_OTH)
            {
                prt_preoperative_preparation_note.Text = Model.preoperative_preparation_note;
            }

            BindingLabel(nameof(Model.hair_removal_code) + "_" + Model.hair_removal_code, "☒");
            prt_hair_removal_diagram.Src = Model.hair_removal_diagram;

            if (DateTime.TryParse(Model.booking_time, out DateTime booking_time))
            {
                prt_booking_date.Text = booking_time.ToString("dd/MM/yyyy");
                prt_booking_time.Text = booking_time.ToString("HH:mm");
            }
        }
        public override void BindingDataFormView()
        {
            lbl_preoperative_diagnosis.Text = Model.preoperative_diagnosis;
            lbl_surgeon.Text = Model.surgeon;
            lbl_assistant_surgeon.Text = Model.assistant_surgeon;
            lbl_performance_method.Text = Model.performance_method;
            //lbl_package_name.Text = Model.package_name;
            //lbl_package_code.Text = Model.package_code;
           
            lbl_admitted_code.Text = Model.admitted_desc;
            if(Model.admitted_code == BfspDictionary.ADMITTED_CODE_IPD)
            {
                lbl_admitted_code.Text += ": " + Model.admitted_specify;
            }
            if(DateTime.TryParse(Model.performance_date_time, out DateTime performance_date_time))
            {
                lbl_performance_date_time.Text = performance_date_time.ToString("dd/MM/yyyy HH:mm tt");
            }
            lbl_surgical_time.Text = Model.surgical_time;
            lbl_duration_using_room.Text = Model.duration_using_room;
            
            lbl_infected_case_code.Text = Model.infected_case_desc;
            if (!string.IsNullOrEmpty(Model.equipment))
            {
                lbl_equipment.Text = BfspDictionary.EQUIPMENT_CASE[Model.equipment];
            }
            lbl_special_equipment.Text = Model.special_equipment;
            lbl_implant.Text = Model.implant;
            lbl_special_consumable.Text = Model.special_consumable;
            lbl_frozen_section.Text = Model.frozen_section;
            lbl_anatomical_pathology.Text = Model.anatomical_pathology;
            lbl_other_please_specify.Text = Model.other_please_specify;
            
            lbl_surgical_equipment_code.Text = Model.surgical_equipment_desc;
            if(Model.surgical_equipment_code != BfspDictionary.SURGICAL_EQUIPMENT_CODE_OTH)
            {
                lbl_surgical_equipment_code.Text += ": " + Model.surgical_equipment_note;
            }

            lbl_position_patient_code.Text = Model.position_patient_desc;
            if(Model.position_patient_code == BfspDictionary.POSITION_PATIENT_CODE_LAT)
            {
                lbl_position_patient_code.Text += ": " + Model.lateral_specify;
            }
            else if (Model.position_patient_code == BfspDictionary.POSITION_PATIENT_CODE_OTH)
            {
                lbl_position_patient_code.Text += ": " + Model.position_patient_specify;
            }

            lbl_type_anaesthesia_code.Text = Model.type_anaesthesia_desc;
            if(Model.type_anaesthesia_code == BfspDictionary.TYPE_ANAESTHESIA_CODE_OTH)
            {
                lbl_type_anaesthesia_code.Text += ": " + Model.type_anaesthesia_note;
            }

            lbl_preoperative_preparation_code.Text = Model.preoperative_preparation_desc;
            if(Model.preoperative_preparation_code == BfspDictionary.PREOPERATIVE_PREPARATION_CODE_OTH)
            {
                lbl_preoperative_preparation_code.Text += ": " + Model.preoperative_preparation_note;
            }
            lbl_hair_removal.Text = Model.hair_removal_desc;
            hair_removal_diagram_data_base64.Value = Model.hair_removal_diagram;
            prt_hair_removal_diagram.Src = Model.hair_removal_diagram; //print form

        }
        public override void BindingDataFormEdit()
        {
            txt_preoperative_diagnosis.Value = Model.preoperative_diagnosis;
            txt_surgeon.Value = Model.surgeon;
            txt_assistant_surgeon.Value = Model.assistant_surgeon;
            txt_performance_method.Value = Model.performance_method;
            //txt_package_name.Value = Model.package_name;
            //txt_package_code.Value = Model.package_code;
            
            BindingInputRadioButton(nameof(Model.admitted_code) + "_" + Model.admitted_code);
            if (rad_admitted_code_ipd.Checked)
            {
                admitted_specify_wrapper.Visible = true;
                txt_admitted_specify.Value = Model.admitted_specify;
            }
            else
            {
                admitted_specify_wrapper.Visible = false;
            }

            BindingRadDateTimePicker(dtpk_performance_date_time, Model.performance_date_time);
            
            txt_surgical_time.Text = Model.surgical_time;
            lbl_duration_using_room.Text = Model.duration_using_room;

            BindingInputRadioButton(nameof(Model.equipment) + "_" + Model.equipment);

            BindingInputRadioButton(nameof(Model.infected_case_code) + "_" + Model.infected_case_code);

            txt_special_equipment.Value = Model.special_equipment;
            txt_implant.Value = Model.implant;
            txt_special_consumable.Value = Model.special_consumable;
            txt_frozen_section.Value = Model.frozen_section;
            txt_anatomical_pathology.Value = Model.anatomical_pathology;
            txt_other_please_specify.Value = Model.other_please_specify;

            BindingInputRadioButton(nameof(Model.surgical_equipment_code) + "_" + Model.surgical_equipment_code);
            surgical_equipment_note_wrapper.Visible = rad_surgical_equipment_code_oth.Checked;
            if (rad_surgical_equipment_code_oth.Checked)
            {
                txt_surgical_equipment_note.Value = Model.surgical_equipment_note;
            }
            
            BindingInputRadioButton(nameof(Model.position_patient_code) + "_" + Model.position_patient_code);
            position_patient_specify_wrapper.Visible = rad_position_patient_code_oth.Checked;
            lateral_specify_wrapper.Visible = rad_position_patient_code_lat.Checked;
            if (rad_position_patient_code_lat.Checked)
            {
                BindingInputRadioButton(nameof(Model.lateral_specify) + "_" + Model.lateral_specify);
            }
            else if (rad_position_patient_code_oth.Checked)
            {
                txt_position_patient_specify.Value = Model.position_patient_specify;
            }

            BindingInputRadioButton(nameof(Model.type_anaesthesia_code) + "_" + Model.type_anaesthesia_code);
            type_anaesthesia_note_wrapper.Visible = rad_type_anaesthesia_code_oth.Checked;
            if (rad_type_anaesthesia_code_oth.Checked)
            {
                txt_type_anaesthesia_note.Value = Model.type_anaesthesia_note;
            }

            BindingInputRadioButton(nameof(Model.preoperative_preparation_code) + "_" + Model.preoperative_preparation_code);
            preoperative_preparation_note_wrapper.Visible = rad_preoperative_preparation_code_oth.Checked;
            if (rad_preoperative_preparation_code_oth.Checked)
            {
                txt_preoperative_preparation_note.Value = Model.preoperative_preparation_note;
            }

            BindingInputRadioButton(nameof(Model.hair_removal_code) + "_" + Model.hair_removal_code);

            hair_removal_diagram_data_base64.Value = Model.hair_removal_diagram;
            base.BindingDataFormEdit();
        }
        #endregion
        public override void PostBackEventHandler()
        {
            switch (Request["__EVENTTARGET"])
            {
                case "admitted_code":
                    if (Request["__EVENTARGUMENT"] == BfspDictionary.ADMITTED_CODE_IPD)
                    {
                        admitted_specify_wrapper.Visible = true;
                    }
                    else
                    {
                        admitted_specify_wrapper.Visible = false;
                    }
                    break;
                case "surgical_equipment_code":
                    if (Request["__EVENTARGUMENT"] == BfspDictionary.SURGICAL_EQUIPMENT_CODE_OTH)
                    {
                        surgical_equipment_note_wrapper.Visible = true;
                    }
                    else
                    {
                        surgical_equipment_note_wrapper.Visible = false;
                    }
                    break;
                case "position_patient_code":
                    switch (Request["__EVENTARGUMENT"])
                    {
                        case BfspDictionary.POSITION_PATIENT_CODE_LAT:
                            lateral_specify_wrapper.Visible = true;
                            position_patient_specify_wrapper.Visible = false;
                            break;
                        case BfspDictionary.POSITION_PATIENT_CODE_OTH:
                            position_patient_specify_wrapper.Visible = true;
                            lateral_specify_wrapper.Visible = false;
                            break;
                        default:
                            lateral_specify_wrapper.Visible = false;
                            position_patient_specify_wrapper.Visible = false;
                            break;
                    }

                    //if (Request["__EVENTARGUMENT"] == BfspDictionary.POSITION_PATIENT_CODE_LAT)
                    //{
                    //    lateral_specify_wrapper.Visible = true;
                    //}
                    //else
                    //{
                    //    lateral_specify_wrapper.Visible = false;
                    //}

                    //if (Request["__EVENTARGUMENT"] == BfspDictionary.POSITION_PATIENT_CODE_OTH)
                    //{
                    //    txt_position_patient_specify.Visible = true;
                    //}
                    //else
                    //{
                    //    txt_position_patient_specify.Visible = false;
                    //}
                    break;
                case "type_anaesthesia_code":
                    if (Request["__EVENTARGUMENT"] == BfspDictionary.TYPE_ANAESTHESIA_CODE_OTH)
                    {
                        type_anaesthesia_note_wrapper.Visible = true;
                    }
                    else
                    {
                        type_anaesthesia_note_wrapper.Visible = false;
                    }
                    break;
                case "preoperative_preparation_code":
                    if (Request["__EVENTARGUMENT"] == BfspDictionary.PREOPERATIVE_PREPARATION_CODE_OTH)
                    {
                        preoperative_preparation_note_wrapper.Visible = true;
                    }
                    else
                    {
                        preoperative_preparation_note_wrapper.Visible = false;
                    }
                    break;
            }

            Model = InitModel();
            Model.status = DocumentStatus.FINAL;
            Model.user_name = UserId;
            BindingControlToModel();
            string model = JsonConvert.SerializeObject(Model);
            string script = string.Format("function f(){{ console.log({0});Sys.Application.remove_load(f);}}Sys.Application.add_load(f);", model);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "console_log_model", script, true);

        }
        #region Validate
        protected void preoperative_diagnosis_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_preoperative_diagnosis.Text);
        }
        protected void surgeon_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_surgeon.Text);
        }
        protected void assistant_surgeon_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_assistant_surgeon.Text);
        }
        protected void performance_method_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_performance_method.Text);
        }
        protected void admitted_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_admitted_code_day.Checked || rad_admitted_code_ipd.Checked;
        }
        protected void admitted_specify_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_admitted_specify.Text);
        }
        protected void performance_date_time_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = dtpk_performance_date_time.SelectedDate != null;
        }
        protected void surgical_time_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_surgical_time.Text);
        }
        protected void infected_case_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_infected_case_code_y.Checked || rad_infected_case_code_n.Checked;
        }
        protected void special_equipment_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_special_equipment.Text);
        }
        protected void implant_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_implant.Text);
        }
        protected void special_consumable_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_special_consumable.Text);
        }
        protected void frozen_section_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_frozen_section.Text);
        }
        protected void anatomical_pathology_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_anatomical_pathology.Text);
        }
        protected void other_please_specify_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_other_please_specify.Text);
        }
        protected void surgical_equipment_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_surgical_equipment_code_no.Checked || rad_surgical_equipment_code_car.Checked || rad_surgical_equipment_code_end.Checked || rad_surgical_equipment_code_oth.Checked;
        }
        protected void surgical_equipment_note_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_surgical_equipment_note.Text);
        }
        protected void position_patient_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_position_patient_code_sup.Checked || rad_position_patient_code_pro.Checked || rad_position_patient_code_lat.Checked || rad_position_patient_code_lit.Checked || rad_position_patient_code_oth.Checked;
        }
        protected void lateral_specify_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_lateral_specify_left.Checked || rad_lateral_specify_right.Checked;
        }
        protected void position_patient_specify_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_position_patient_specify.Text);
        }
        protected void type_anaesthesia_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_type_anaesthesia_code_gen.Checked || rad_type_anaesthesia_code_reg.Checked || rad_type_anaesthesia_code_oth.Checked;
        }
        protected void type_anaesthesia_note_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_type_anaesthesia_note.Text);
        }
        protected void preoperative_preparation_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_preoperative_preparation_code_no.Checked || rad_preoperative_preparation_code_gic.Checked || rad_preoperative_preparation_code_cat.Checked || rad_preoperative_preparation_code_oth.Checked;
        }
        protected void preoperative_preparation_note_wrapper_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = !string.IsNullOrEmpty(txt_preoperative_preparation_note.Text);
        }
        protected void hair_removal_code_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_hair_removal_code_n.Checked || rad_hair_removal_code_y.Checked;
        }
        protected void equipment_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = rad_equipment_n.Checked || rad_equipment_n.Checked;
        }
        #endregion
        public override void BindingControlToModel()
        {
            Model.preoperative_diagnosis = txt_preoperative_diagnosis.Value;
            Model.surgeon = txt_surgeon.Value;
            Model.assistant_surgeon = txt_assistant_surgeon.Value;
            Model.performance_method = txt_performance_method.Value;
            //Model.package_name = txt_package_name.Value;
            //Model.package_code = txt_package_code.Value;
            
            string admitted_code = FindHtmlInputRadioButton(nameof(Model.admitted_code), BfspDictionary.ADMITTED_CODE);
            if(!string.IsNullOrEmpty(admitted_code))
            {
                Model.admitted_code = admitted_code;
                Model.admitted_desc = BfspDictionary.ADMITTED_CODE[Model.admitted_code];
                
                if(Model.admitted_code == BfspDictionary.ADMITTED_CODE_IPD)
                {
                    Model.admitted_specify = txt_admitted_specify.Value;
                }
            }

            if(dtpk_performance_date_time.SelectedDate != null)
            {
                Model.performance_date_time = EmrHelper.ConvertSQLDateTime((DateTime)dtpk_performance_date_time.SelectedDate);
            }

            //Model.duration_using_room
            Model.surgical_time = txt_surgical_time.Text;
            
            string infected_case_code = FindHtmlInputRadioButton(nameof(Model.infected_case_code), BfspDictionary.INFECTED_CASE);
            if (!string.IsNullOrEmpty(infected_case_code))
            {
                Model.infected_case_code = infected_case_code;
                Model.infected_case_desc = BfspDictionary.INFECTED_CASE[Model.infected_case_code];
            }

            string equipment = FindHtmlInputRadioButton(nameof(Model.equipment), BfspDictionary.EQUIPMENT_CASE);
            if (!string.IsNullOrEmpty(equipment))
            {
                Model.equipment = equipment;
            }

            Model.special_equipment = txt_special_equipment.Value;
            Model.implant = txt_implant.Value;
            Model.special_consumable = txt_special_consumable.Value;
            Model.frozen_section = txt_frozen_section.Value;
            Model.anatomical_pathology = txt_anatomical_pathology.Value;
            Model.other_please_specify = txt_other_please_specify.Value;
            
            string surgical_equipment_code = FindHtmlInputRadioButton(nameof(Model.surgical_equipment_code), BfspDictionary.SURGICAL_EQUIPMENT_CODE);
            if (!string.IsNullOrEmpty(surgical_equipment_code))
            {
                Model.surgical_equipment_code = surgical_equipment_code;
                Model.surgical_equipment_desc = BfspDictionary.SURGICAL_EQUIPMENT_CODE[Model.surgical_equipment_code];
                if(Model.surgical_equipment_code == BfspDictionary.SURGICAL_EQUIPMENT_CODE_OTH)
                {
                    Model.surgical_equipment_note = txt_surgical_equipment_note.Value;
                }
            }
            
            string position_patient_code = FindHtmlInputRadioButton(nameof(Model.position_patient_code), BfspDictionary.POSITION_PATIENT_CODE);
            if (!string.IsNullOrEmpty(position_patient_code))
            {
                Model.position_patient_code = position_patient_code;
                Model.position_patient_desc = BfspDictionary.POSITION_PATIENT_CODE[Model.position_patient_code];
                if(Model.position_patient_code == BfspDictionary.POSITION_PATIENT_CODE_OTH)
                {
                    Model.position_patient_specify = txt_position_patient_specify.Value;
                }
                else if(Model.position_patient_code == BfspDictionary.POSITION_PATIENT_CODE_LAT)
                {
                    Model.lateral_specify = FindHtmlInputRadioButton(nameof(Model.lateral_specify), BfspDictionary.LATERAL);
                }
            }
            
            string type_anaesthesia_code = FindHtmlInputRadioButton(nameof(Model.type_anaesthesia_code), BfspDictionary.TYPE_ANAESTHESIA);
            if (!string.IsNullOrEmpty(type_anaesthesia_code))
            {
                Model.type_anaesthesia_code = type_anaesthesia_code;
                Model.type_anaesthesia_desc = BfspDictionary.TYPE_ANAESTHESIA[Model.type_anaesthesia_code];
                if(Model.type_anaesthesia_code == BfspDictionary.TYPE_ANAESTHESIA_CODE_OTH)
                {
                    Model.type_anaesthesia_note = txt_type_anaesthesia_note.Value;
                }
            }

            string preoperative_preparation_code = FindHtmlInputRadioButton(nameof(Model.preoperative_preparation_code), BfspDictionary.PREOPERATIVE_PREPARATION);
            if (!string.IsNullOrEmpty(preoperative_preparation_code))
            {
                Model.preoperative_preparation_code = preoperative_preparation_code;
                Model.preoperative_preparation_desc = BfspDictionary.PREOPERATIVE_PREPARATION[Model.preoperative_preparation_code];
                if(Model.preoperative_preparation_code == BfspDictionary.PREOPERATIVE_PREPARATION_CODE_OTH)
                {
                    Model.preoperative_preparation_note = txt_preoperative_preparation_note.Value;
                }
            }

            string hair_removal_code = FindHtmlInputRadioButton(nameof(Model.hair_removal_code), BfspDictionary.HAIR_REMOVAL);
            if (!string.IsNullOrEmpty(hair_removal_code))
            {
                Model.hair_removal_code = hair_removal_code;
                Model.hair_removal_desc = BfspDictionary.HAIR_REMOVAL[Model.hair_removal_code];
            }

            Model.hair_removal_diagram = hair_removal_diagram_data_base64.Value;
            Model.booking_time = EmrHelper.ConvertSQLDateTime(DateTime.Now);
        }
        protected void txt_surgical_time_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty((sender as TextBox).Text))
            {
                int surgical_time = int.Parse((sender as TextBox).Text);
                lbl_duration_using_room.Text = Convert.ToString(30 + surgical_time);
            }
        }
    }
}