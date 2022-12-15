using Emr.Utility;
using EMR.Data.AIH.Dictionary;
using EMR.Data.AIH.Model;
using EMR.Data.Shared.Services;
using EMR.Model;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Web.UI.Chat;

namespace EMR
{
    public partial class BookForSurPro : Page
    {
        EmrService<Bfsp> _emrService;
        PatientService _patientService;
        public PatientInfo Patient;
        public string model_id { get => Request.QueryString["modelId"] ?? throw new ArgumentNullException("Model id cannot be null."); }
        public string visible_patient_id { get => Request.QueryString["vpId"] ?? throw new ArgumentNullException("Visible patient id cannot be null."); }
        public string PAGE_URL { get => $"/{form_url}.aspx?loc={Location}&pId={varPID}&vpId={visible_patient_id}&pvid={patient_visit_id}&modelId={model_id}&docId={varDocID}"; }
        public string UserId { get => (string)Session["UserId"]; }
        public string GroupAccess { get => (string)Session["group_access"]; }
        public string Location { get => (string)Session["company_code"]; }
        public string varDocID { get => Request.QueryString["docId"] ?? throw new ArgumentNullException("document id cannot be null."); }
        public string varPID { get => Request.QueryString["pId"] ?? throw new ArgumentNullException("Patient id cannot be null."); }
        public string patient_visit_id { get => Request.QueryString["pvId"]; }
        public string form_url { get; set; } = "IPD/BookForSurPro";
        public Bfsp Model { get; set; }
        public DateTime associated_visit_admited { get; set; }
        public DateTime associated_visit_closed { get; set; }
        public void InitModel() { 
            _emrService = new EmrService<Bfsp>() { Location = Location };
            Model = _emrService.Get(Guid.Parse(varDocID));
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this))
            {
                return;
            }
            if (!IsPostBack)
            {
                InitModel();

                IEnumerable<Bfsp> Logs = _emrService.GetLogs(Guid.Parse(varDocID), Location);
                if (Logs.Count() == 1)
                {
                    Model.hair_removal_diagram = BfspDictionary.HAIR_REMOVAL_DIAGRAM;
                }

                InitPage();

                LastestVersion.Visible = varDocIdLog != null;

                string last_updated_date_time = WebHelpers.GetLogLastDateTime(Model.created_date_time, Model.modified_date_time);
                string last_updated_doctor = WebHelpers.GetLogLastName(Model.created_name_e, Model.modified_name_e);
                last_updated_date_time = WebHelpers.FormatDateTime(last_updated_date_time, "dd-MMM-yyyy HH:mm tt", "");
                rlblLogHistory.Text = $"Last updated by <i>{last_updated_doctor}</i> on <b><i>{last_updated_date_time}</i></b>";

                _patientService = new PatientService();
                uc_patientInfo.Patient = _patientService.GetPatient(Guid.Parse(varPID));
                IEnumerable<PatientVisitInfo> PatientVisit = _patientService.GetPatientVisit(Guid.Parse(patient_visit_id), Location);
                uc_patientInfo.PatientVisit = PatientVisit.FirstOrDefault();
            }
            else
            {
                PostBackEventHandler();
            }
        }
        protected void GoToLastestVersion(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_URL);
        }
        private void InitPage()
        {
            LoadPermissions();
            
            amendReasonWraper.Visible = false;
            if (Model.status == DocumentStatus.FINAL)
            {
                BindingDataForm(ControlState.View);
                _patientService = new PatientService();
                Patient = _patientService.GetPatient(Guid.Parse(varPID));
                BindingDataFormPrint();
            }
            else
            {
                BindingDataForm(ControlState.Edit);
            }
        }

        protected void ViewHistory(object sender, EventArgs e)
        {
            string page_url = PAGE_URL + "&api=" + Bfsp._api;
            string script = string.Format("function f(){{ parent.log_history(\"" + page_url + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "show_log_history", script, true);
        }
        protected void LoadPermissions()
        {
            bool IsSameCompanyCode = !IsLocationChanged;

            btnCancel.Visible = false;

            if (!IsSameCompanyCode || IsViewLog)
            {
                btnComplete.Visible
                    = btnSave.Visible
                    = btnDelete.Visible
                    = btnAmend.Visible
                    = btnPrint.Visible
                    = false;
                return;
            }

            if (Model.status == DocumentStatus.FINAL)
            {
                btnAmend.Visible
                    = btnPrint.Visible
                    = true;
                btnComplete.Visible
                    = btnSave.Visible
                    = btnDelete.Visible
                    = false;
            }
            else
            {
                btnAmend.Visible
                    = btnPrint.Visible
                    = false;
                btnComplete.Visible
                    = btnSave.Visible
                    = btnDelete.Visible
                    = true;
            }

            switch (AccessAuthorize)
            {
                case "View":
                    btnAmend.Visible
                        = btnComplete.Visible
                        = btnSave.Visible
                        = btnDelete.Visible
                        = false;
                    break;
            }

            if (GroupAccess == "ADM")
            {
                btnDelete.Visible = true;
            }
        }
        #region Binding Data
        public void BindingDataForm(ControlState state)
        {
            if (LoadFormControl(state))
            {
                BindingDataFormEdit();
            }
            else
            {
                BindingDataFormView();
            }
        }
        public string AccessAuthorize { get => (string)Session["access_authorize"]; }
        public string LocationChanged { get => (string)Session["const_company_code"]; }
        public string varDocIdLog { get => Request.QueryString["docIdLog"]; }
        public bool IsViewLog => varDocIdLog != null;
        public bool IsLocationChanged { get => Location != LocationChanged; }
        protected bool LoadFormControl(ControlState state)
        {
            //1 - edit
            bool Visible = (AccessAuthorize == "FullAccess" && !IsLocationChanged && state == ControlState.Edit && !IsViewLog) ? true : false;

            imgage_editer_tool.Visible = Visible;
            txt_preoperative_diagnosis.Visible
                = txt_surgeon.Visible
                = txt_assistant_surgeon.Visible
                = txt_performance_method.Visible
                = txt_package_name.Visible
                = txt_package_code.Visible
                = admitted_wrapper.Visible
                = dtpk_performance_date_time.Visible
                = txt_surgical_time.Visible
                = infected_case_wrapper.Visible
                = txt_special_equipment.Visible
                = txt_implant.Visible
                = txt_special_consumable.Visible
                = txt_frozen_section.Visible
                = txt_anatomical_pathology.Visible
                = txt_other_please_specify.Visible
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
                = lbl_package_name.Visible
                = lbl_package_code.Visible
                = lbl_admitted_code.Visible
                = lbl_performance_date_time.Visible
                = lbl_surgical_time.Visible
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
            //foreach (var prop in ModelRef.GetType().GetProperties())
            //{
            //    var control1 = FindControl(prop.Name + "_wrapper");
            //    var control2 = FindControl("lbl_" + prop.Name);

            //    if (control1 != null)
            //    {
            //        control1.Visible = visible;
            //    }
            //    if (control2 != null)
            //    {
            //        control2.Visible = !visible;
            //    }
            //}

            return Visible;
        }
        protected void BindingLabel(string LabelId, string value, string prefix = "prt")
        {
            var lable = FindControl($"{prefix}_{LabelId}");
            if (lable != null)
                ((Label)lable).Text = value;
        }
        public void BindingInputRadioButton(string ControlID, string Prefix = "rad")
        {
            var control = FindControl(Prefix + "_" + ControlID);
            if (control != null)
            {
                ((HtmlInputRadioButton)control).Checked = true;
            }
        }
        protected void UpdateModel()
        {
            _emrService = new EmrService<Bfsp>();
            var response = _emrService.Update(Model, Location);

            if (response.IsSuccessStatusCode)
            {
                var LogResponse = _emrService.Log(Model, Location);
                if (!LogResponse.IsSuccessStatusCode)
                {
                    //Thông báo lỗi ghi log
                }
                InitModel();
                string last_updated_date_time = WebHelpers.GetLogLastDateTime(Model.created_date_time, Model.modified_date_time);
                string last_updated_doctor = WebHelpers.GetLogLastName(Model.created_name_e, Model.modified_name_e);
                last_updated_date_time = WebHelpers.FormatDateTime(last_updated_date_time, "dd-MMM-yyyy HH:mm tt", "");
                rlblLogHistory.Text = $"Last updated by <i>{last_updated_doctor}</i> on <b><i>{last_updated_date_time}</i></b>";

                if (Model.status == DocumentStatus.FINAL)
                {
                    WebHelpers.PostAPI($"api/emr/clear-session/{Location}/{varDocID}");
                }
                string script = string.Format("function f(){{ window.parent.Notification('" + response.Content + "');Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "show_message", script, true);

                
            }
            else
            {
                //Thông báo lỗi
                string script = string.Format("function f(){{ window.parent.Error('" + response.StatusCode + "', '" + response.ReasonPhrase + "');Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "show_message", script, true);
            }
        }
        public string EmpId { get => (string)Session["emp_id"]; }
        protected bool AllowDocumentModifer(string docStatus)
        {
            //    CanOpenForm(Page page, string docid, string docStatus, string emp_id, string company_code, string const_company_code, string access_authorize = "")
            //{
            if (Location == LocationChanged && docStatus == DocumentStatus.FINAL)
            {
                return true;
            }
            if (docStatus == DocumentStatus.DRAFT && AccessAuthorize == "FullAccess")
            {
                dynamic result = WebHelpers.GetAPI($"api/emr/check-session/{Location}/{varDocID}/{EmpId}");

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic obj = JObject.Parse(result.Data);
                    dynamic employee = obj["items"];

                    //false - open denied
                    if (Convert.ToBoolean(obj.status))
                    {
                        return true;
                    }

                    //string pid = page.Request["pid"];
                    //string vpid = page.Request["vpid"];
                    //page.Response.Redirect($"../other/patientsummary.aspx?pid={pid}&vpid={vpid}&blocked={employee.full_name_l}", false);
                    string content = "window.parent.ShowBlock(\"This document is blocked by " + employee.full_name_e + "\");";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString(), "setTimeout(()=> { " + content + " },100);", true);

                    //ScriptManager.RegisterStartupScript(page, page.GetType(), "document_block", "setTimeout(()=>{ sweetAlert(\"Denied!\", \"This document is blocked by " + employee.full_name_e + "\", \"error\");},0);", true);
                    return false;
                }
                else
                {
                    return false;
                }
            }
            return true;
            //    }

        }
        protected void CancelAmendDocument(object sender, EventArgs e)
        {
            WebHelpers.PostAPI($"api/emr/clear-session/{Location}/{varDocID}");
            
            btnCancel.Visible
                = btnComplete.Visible
                 = false;
            btnAmend.Visible
                = btnPrint.Visible
                = true;

            InitModel();
            InitPage();
        }
        protected void AmendDocument(object sender, EventArgs e)
        {
            if (AllowDocumentModifer(DocumentStatus.DRAFT))
            {
                InitModel();
                btnAmend.Visible
                    = btnPrint.Visible
                    = false;
                btnComplete.Visible
                    = btnCancel.Visible
                    = amendReasonWraper.Visible
                    = true;

                LoadFormControl(ControlState.Edit);
                BindingDataFormEdit();

            }
            //else
            //{
            //    string script = string.Format("function f(){{ window.parent.ShowBlock();Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
            //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "block_document", script, true);
            //}
        }
        protected void DeleteDocument(object sender, EventArgs e)
        {
            var args = JsonConvert.SerializeObject(new { document_id = varDocID, api = Bfsp._api, patient_visit_id = patient_visit_id });
            string script = string.Format("function f(){{ window.parent.ConfirmDeleteDocument('{0}');Sys.Application.remove_load(f);}}Sys.Application.add_load(f);", args);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "confirm_delete_document", script, true);
        }
        protected void CompleteDocument(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    (sender as LinkButton).CssClass += "cursor-wait";
                    Model = new Bfsp(varDocID);
                    Model.status = DocumentStatus.FINAL;
                    Model.user_name = UserId;
                    BindingControlToModel();
                    UpdateModel();
                    InitPage();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    WebHelpers.SendError(Page, ex);
                }
            }
        }
        protected void SaveDocument(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Model = new Bfsp(varDocID);
                Model.status = DocumentStatus.DRAFT;
                Model.user_name = UserId;
                BindingControlToModel();
                UpdateModel();
            }
        }
        protected void BindingRadDateTimePicker(RadDateTimePicker RadDateTimePicker, dynamic datetime)
        {
            try
            {
                if (datetime == null) return;
                if (datetime is DateTime)
                {
                    RadDateTimePicker.SelectedDate = datetime;
                    return;
                }
                if (datetime is string)
                {
                    if (DateTime.TryParse(datetime, out DateTime result))
                    {
                        RadDateTimePicker.SelectedDate = result;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        public void BindingDataFormPrint()
        {
            prt_patient_name.Text = Patient.FullName;
            prt_dob.Text = WebHelpers.FormatDateTime(Patient.date_of_birth, "dd/MM/yyyy");
            prt_gender.Text = Patient.Gender;
            prt_pid.Text = Patient.visible_patient_id;

            prt_preoperative_diagnosis.Text = Model.preoperative_diagnosis;
            prt_surgeon.Text = Model.surgeon;
            prt_assistant_surgeon.Text = Model.assistant_surgeon;
            prt_performance_method.Text = Model.performance_method;
            prt_package_name.Text = Model.package_name;
            prt_package_code.Text = Model.package_code;
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
            } else if(Model.position_patient_code == BfspDictionary.POSITION_PATIENT_CODE_LAT)
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
                prt_booking_time.Text = booking_time.ToString("HH:mm; dd/MM/yyyy");
            }
        }
        public void BindingDataFormView()
        {
            lbl_preoperative_diagnosis.Text = Model.preoperative_diagnosis;
            lbl_surgeon.Text = Model.surgeon;
            lbl_assistant_surgeon.Text = Model.assistant_surgeon;
            lbl_performance_method.Text = Model.performance_method;
            lbl_package_name.Text = Model.package_name;
            lbl_package_code.Text = Model.package_code;
           
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


        }
        public void BindingDataFormEdit()
        {
            amendReasonWraper.Visible = Model.status == DocumentStatus.FINAL;

            txt_preoperative_diagnosis.Value = Model.preoperative_diagnosis;
            txt_surgeon.Value = Model.surgeon;
            txt_assistant_surgeon.Value = Model.assistant_surgeon;
            txt_performance_method.Value = Model.performance_method;
            txt_package_name.Value = Model.package_name;
            txt_package_code.Value = Model.package_code;
            
            BindingInputRadioButton(nameof(Model.admitted_code) + "_" + Model.admitted_code);
            if (rad_admitted_code_ipd.Checked)
            {
                txt_admitted_specify.Visible = true;
                txt_admitted_specify.Value = Model.admitted_specify;
            }
            else
            {
                txt_admitted_specify.Visible = false;
            }

            BindingRadDateTimePicker(dtpk_performance_date_time, Model.performance_date_time);
            
            txt_surgical_time.Text = Model.surgical_time;
            lbl_duration_using_room.Text = Model.duration_using_room;

            BindingInputRadioButton(nameof(Model.infected_case_code) + "_" + Model.infected_case_code);

            txt_special_equipment.Value = Model.special_equipment;
            txt_implant.Value = Model.implant;
            txt_special_consumable.Value = Model.special_consumable;
            txt_frozen_section.Value = Model.frozen_section;
            txt_anatomical_pathology.Value = Model.anatomical_pathology;
            txt_other_please_specify.Value = Model.other_please_specify;

            BindingInputRadioButton(nameof(Model.surgical_equipment_code) + "_" + Model.surgical_equipment_code);
            txt_surgical_equipment_note.Visible = rad_surgical_equipment_code_oth.Checked;
            if (rad_surgical_equipment_code_oth.Checked)
            {
                txt_surgical_equipment_note.Value = Model.surgical_equipment_note;
            }
            
            BindingInputRadioButton(nameof(Model.position_patient_code) + "_" + Model.position_patient_code);
            txt_position_patient_specify.Visible = rad_position_patient_code_oth.Checked;
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
            txt_type_anaesthesia_note.Visible = rad_type_anaesthesia_code_oth.Checked;
            if (rad_type_anaesthesia_code_oth.Checked)
            {
                txt_type_anaesthesia_note.Value = Model.type_anaesthesia_note;
            }

            BindingInputRadioButton(nameof(Model.preoperative_preparation_code) + "_" + Model.preoperative_preparation_code);
            txt_preoperative_preparation_note.Visible = rad_preoperative_preparation_code_oth.Checked;
            if (rad_preoperative_preparation_code_oth.Checked)
            {
                txt_preoperative_preparation_note.Value = Model.preoperative_preparation_note;
            }

            BindingInputRadioButton(nameof(Model.hair_removal_code) + "_" + Model.hair_removal_code);

            hair_removal_diagram_data_base64.Value = Model.hair_removal_diagram;

        }
        
        #endregion
        public void PostBackEventHandler() 
        {
            switch (Request["__EVENTTARGET"])
            {
                case "admitted_code":
                    if (Request["__EVENTARGUMENT"] == BfspDictionary.ADMITTED_CODE_IPD)
                    {
                        txt_admitted_specify.Visible = true;
                    }
                    else
                    {
                        txt_admitted_specify.Visible = false;
                    }
                    break;
                case "surgical_equipment_code":
                    if (Request["__EVENTARGUMENT"] == BfspDictionary.SURGICAL_EQUIPMENT_CODE_OTH)
                    {
                        txt_surgical_equipment_note.Visible = true;
                    }
                    else
                    {
                        txt_surgical_equipment_note.Visible = false;
                    }
                    break;
                case "position_patient_code":
                    switch (Request["__EVENTARGUMENT"])
                    {
                        case BfspDictionary.POSITION_PATIENT_CODE_LAT:
                            lateral_specify_wrapper.Visible = true;
                            txt_position_patient_specify.Visible = false;
                            break;
                        case BfspDictionary.POSITION_PATIENT_CODE_OTH:
                            txt_position_patient_specify.Visible = true;
                            lateral_specify_wrapper.Visible = false;
                            break;
                        default:
                            lateral_specify_wrapper.Visible = false;
                            txt_position_patient_specify.Visible = false;
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
                        txt_type_anaesthesia_note.Visible = true;
                    }
                    else
                    {
                        txt_type_anaesthesia_note.Visible = false;
                    }
                    break;
                case "preoperative_preparation_code":
                    if (Request["__EVENTARGUMENT"] == BfspDictionary.PREOPERATIVE_PREPARATION_CODE_OTH)
                    {
                        txt_preoperative_preparation_note.Visible = true;
                    }
                    else
                    {
                        txt_preoperative_preparation_note.Visible = false;
                    }
                    break;
            }
            
        }
        protected string FindHtmlInputRadioButton(string ControlID, Dictionary<string, string> DataSource, string Prefix = "rad")
        {
            foreach (KeyValuePair<string, string> code in DataSource)
            {
                if (((HtmlInputRadioButton)FindControl(Prefix + "_" + ControlID + "_" + code.Key)).Checked)
                {
                    return code.Key;
                }
            }
            return null;
        }
        public void BindingControlToModel()
        {
            
            Model.preoperative_diagnosis = txt_preoperative_diagnosis.Value;
            Model.surgeon = txt_surgeon.Value;
            Model.assistant_surgeon = txt_assistant_surgeon.Value;
            Model.performance_method = txt_performance_method.Value;
            Model.package_name = txt_package_name.Value;
            Model.package_code = txt_package_code.Value;
            
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

            Model.performance_date_time = DateTimeProvider.ConvertSQLDateTime(dtpk_performance_date_time.SelectedDate);
            //Model.duration_using_room
            Model.surgical_time = txt_surgical_time.Text;
            
            string infected_case_code = FindHtmlInputRadioButton(nameof(Model.infected_case_code), BfspDictionary.INFECTED_CASE);
            if (!string.IsNullOrEmpty(infected_case_code))
            {
                Model.infected_case_code = infected_case_code;
                Model.infected_case_desc = BfspDictionary.INFECTED_CASE[Model.infected_case_code];
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
            Model.booking_time = DateTimeProvider.ConvertSQLDateTime(DateTime.Now);
        }
        public void PrintDocument(object sender, EventArgs e)
        {

            //dynamic rwndPrint = FindControl("rwndPrint");
            //PrintSetup();
            InitModel();
            _patientService = new PatientService();
            Patient = _patientService.GetPatient(Guid.Parse(varPID));
            
            //if (rwndPrint != null)
            //{
            //    string script = string.Format("function f(){{ window.select_print_language();Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
            //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print_document", script, true);
            //}
            //else
            //{
            //    string script = string.Format("function f(){{ window.print_document();Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
            //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print_document", script, true);
            //}

            //ModelRef = InitModel();
            //Patient = new PatientInfo(varPID);
            //PatientVisit = new PatientVisitInfo(patient_visit_id, Location);
            //BindingDataFormPrint();
            string script = string.Format("function f(){{ window.print_document();Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print_document", script, true);
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