using System;
using System.Net;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Security.Policy;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;
using EMR.UserControls;
using EMR.Model;
using EMR.Data.AIH.Model;
using Newtonsoft.Json;

namespace EMR
{
    public abstract class EmrPage : Page
    {
        /// <summary>
        /// Set ModelRef to the current Model
        /// </summary>
        public dynamic ModelRef { get; set; }
        protected PatientInfo Patient { get; set; }
        protected PatientVisitInfo PatientVisit { get; set; }
        public abstract string form_url { get; set; }
        public string PAGE_URL { get => $"/{form_url}.aspx?loc={Location}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}"; }
        public string PAGE_URL_DEFAULT { get => $"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={Location}"; }
        public string Location { get => (string)Session["company_code"]; }
        public string LocationChanged { get => (string)Session["const_company_code"]; }
        public string varDocID { get => Request.QueryString["docId"] ?? throw new ArgumentNullException("document id cannot be null."); }
        public string varDocIdLog { get => Request.QueryString["docIdLog"]; }
        public string varModelID { get => Request.QueryString["modelId"] ?? throw new ArgumentNullException("Model id cannot be null."); }
        public string varPVID { get => Request.QueryString["pvId"]; } // 
        public string varVPID { get => Request.QueryString["vpId"] ?? throw new ArgumentNullException("Visible patient id cannot be null."); }
        public string varPID { get => Request.QueryString["pId"] ?? throw new ArgumentNullException("Patient id cannot be null."); }
        public string signature_date { get; set; }
        public string signature_name { get; set; }
        public string AccessAuthorize { get => (string)Session["access_authorize"]; }
        public string GroupAccess { get => (string)Session["group_access"]; }
        public bool IsLocationChanged { get => Location != LocationChanged; }
        public string EmpId { get => (string)Session["emp_id"]; }
        public string UserId { get => (string)Session["UserId"]; }
        public bool IsViewLog => varDocIdLog != null;
        public string ErrorMessage { get; set; } = string.Empty;

        #region log history
        protected dynamic LastestVersion { get; set; }
        protected dynamic rlblLogHistory { get; set; }
        protected dynamic rgdLogHistory { get; set; }
        protected dynamic uplLogHistory { get; set; }
        protected dynamic rwndLogHistory { get; set; }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this))
            { 
                return;
            }
            if (!IsPostBack)
            {
                Init_Page();
                
                GrantPermissions();

                #region lastest version
                LastestVersion = FindControl(nameof(LastestVersion)) ?? throw new NoNullAllowedException("cannot find control with ID " + nameof(LastestVersion));
                LastestVersion.Visible = varDocIdLog != null;
                #endregion

                #region last updated info
                rlblLogHistory = FindControl(nameof(rlblLogHistory)) ?? throw new NoNullAllowedException("cannot find control with ID " + nameof(rlblLogHistory));
                DataRow dr = ModelRef.Logs(Location).Rows[0];
                string created_date_time = Convert.ToString(dr["created_date_time"]);
                string modified_date_time = Convert.ToString(dr["modified_date_time"]);
                string created_name_e = Convert.ToString(dr["created_name_e"]);
                string modified_name_e = Convert.ToString(dr["modified_name_e"]);
                string last_updated_date_time = WebHelpers.GetLogLastDateTime(created_date_time, modified_date_time);
                string last_updated_doctor = WebHelpers.GetLogLastName(created_name_e, modified_name_e);
                last_updated_date_time = WebHelpers.FormatDateTime(last_updated_date_time, "dd-MMM-yyyy HH:mm tt", "");
                rlblLogHistory.Text = $"Last updated by <i>{last_updated_doctor}</i> on <b><i>{last_updated_date_time}</i></b>";
                #endregion

            }
            PostBackEventHandler();
        }
        protected void rgdLogHistory_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ModelRef = InitModel();
                WebHelpers.loadRadGridHistoryLog((sender as RadGrid), ModelRef.Logs(Location), out string signature_date, out string signature_name);
            }
        }
        protected void rbtnViewHistory_Click(object sender, EventArgs e)
        {
            string script = string.Format("function f(){{ show_window(\"" + nameof(rwndLogHistory) + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "show_log_history", script, true);
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();
                string url = PAGE_URL + $"&docIdLog={doc_log_id}";
                Response.Redirect(url);
            }
        }
        protected void ViewHistory(object sender, EventArgs e)
        {
            ModelRef = InitModel();
            string page_url = PAGE_URL + "&api=" + ModelRef.api;
            string script = string.Format("function f(){{ parent.log_history(\"" + page_url + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "show_log_history", script, true);
        }
        protected void rgdLogHistory_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                string document_log_id;
                string document_id;

                document_log_id = (e.Item.DataItem as DataRowView)[nameof(document_log_id)].ToString();
                document_id = (e.Item.DataItem as DataRowView)[nameof(document_id)].ToString();

                if (varDocIdLog == document_log_id)
                {
                    item.Selected = true;
                }
            }
        }
        protected void GoToLastestVersion(object sender, EventArgs e)
        {
            Response.Redirect(PAGE_URL);
        }

        protected virtual void PrintSetup()
        {
            try
            {
                var print_page = FindControl("print_page");
                if(print_page != null)
                {
                    var print_content = FindControl("print_content") ?? throw new NoNullAllowedException("cannot find control with ID print_content");
                    var print_header = FindControl("print_header") ?? throw new NoNullAllowedException("cannot find control with ID print_header");
                    var print_footer = FindControl("print_footer") ?? throw new NoNullAllowedException("cannot find control with ID print_footer");
                    PageSetup PageSetup = null;

                    dynamic response = WebHelpers.GetAPI("api/settings/get/EMR_PAGE_SETUP");
                    if (response.Status == System.Net.HttpStatusCode.OK)
                    {
                        string data = response.Data;
                        JavaScriptSerializer JSserializer = new JavaScriptSerializer();
                        dynamic obj = JObject.Parse(data);
                        string paramater_value = obj.paramater_value;
                        PageSetup = JSserializer.Deserialize<PageSetup>(paramater_value);
                    }

                    if (PageSetup != null)
                    {
                        if (print_page != null)
                        {
                            ((HtmlGenericControl)print_page).Attributes.Add("style", $"font-family: '{PageSetup.font_family}' !important;width: {PageSetup.pager_width}; overflow: hidden;");
                        }
                        if (print_content != null)
                        {
                            ((HtmlGenericControl)print_content).Attributes.Add("style", $"font-size: {PageSetup.font_size} !important;position: relative; margin-left: {PageSetup.margin_left}; margin-right: {PageSetup.margin_right}; line-height: {PageSetup.line_spacing}");
                        }
                        if (print_header != null)
                        {
                            ((HtmlGenericControl)print_header).Attributes.Add("style", $"width: {PageSetup.pager_width}; height: {PageSetup.header_height}");
                        }
                        if (print_footer != null)
                        {
                            var print_footer_space = FindControl("print_footer_space");
                            ((HtmlTableCell)print_footer_space).Attributes.Add("style", $"width: {PageSetup.pager_width}; height: {PageSetup.footer_height}");
                            ((HtmlTableCell)print_footer).Attributes.Add("style", $"width: {PageSetup.pager_width}; height: {PageSetup.footer_height}");
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void LoadPatient()
        {
            if(Patient == null)
            {
                Patient = new PatientInfo(varPID);
                PatientVisit = new PatientVisitInfo(varPVID, Location);
            }
        }
        public abstract dynamic InitModel();
        public void Init_Page()
        {
            LoadPatient();
            ModelRef = InitModel();


            var PatientUserControl = FindControl("uc_patientInfo");
            if (PatientUserControl != null)
            {
                ((UserControlPatientInfo)PatientUserControl).Patient = Patient;
                ((UserControlPatientInfo)PatientUserControl).PatientVisit = PatientVisit;
            }
            var amendReasonWraper = FindControl("amendReasonWraper");
            if (amendReasonWraper != null)
            {
                HideControl(amendReasonWraper);
            }
            //currentLog.Visible = !string.IsNullOrEmpty(varDocIdLog);
            //uc_patientInfo.Patient = Patient;
            //uc_patientInfo.PatientVisit = PatientVisit;
            //RadLabel1.Text = BindingRadGridHistoryLog(RadGrid1, Model.Logs(Location), out string signature_date, out string signature_name);
            //var lblHistory = FindControl("lblHistory");
            //string history = BindingRadGridHistoryLog(RadGrid1, ModelRef.Logs(Location), out string signature_date, out string signature_name);
            //if (lblHistory != null)
            //{
            //    ((RadLabel)lblHistory).Text = 
            //}
            //HideControl(amendReasonWraper);
            if (ModelRef.status == DocumentStatus.FINAL)
            {
                BindingDataForm(ControlState.View);
            }
            else if (ModelRef.status == DocumentStatus.DRAFT)
            {
                BindingDataForm(ControlState.Edit);
            }
        }
        protected void GrantPermissions()
        {
            bool IsSameCompanyCode = !IsLocationChanged;

            LinkButton btnComplete = (LinkButton)FindControl("btnComplete");
            Control btnSave = FindControl("btnSave");
            Control btnDelete = FindControl("btnDelete");
            Control btnAmend = FindControl("btnAmend");
            Control btnPrint = FindControl("btnPrint");
            Control btnCancel = FindControl("btnCancel");

            HideControl(btnCancel);

            if (!IsSameCompanyCode || IsViewLog)
            {
                HideControl(btnComplete, btnSave, btnDelete, btnAmend, btnPrint);
                return;
            }

            if (ModelRef.status == DocumentStatus.FINAL)
            {
                ShowControl(btnAmend, btnPrint);
                HideControl(btnComplete, btnSave, btnDelete);
            }
            else
            {
                HideControl(btnAmend, btnPrint);
                ShowControl(btnComplete, btnSave, btnDelete);
            }

            switch (AccessAuthorize)
            {
                case "View":
                    //Edit: quy?n view có th? print
                    HideControl(btnAmend, btnComplete, btnSave, btnDelete);
                    break;
            }

            if (GroupAccess == "ADM")
            {
                ShowControl(btnDelete);
            }
        }
        public void BindingDataForm(ControlState state)
        {
            if (LoadFormControl(state))
            {
                BindingDataFormEdit();
            }
            else
            {
                BindingDataFormView();
                //BindingDataFormPrint();
            }
        }
        public void AddJS(string script)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), DateTime.Now.ToString(), "setTimeout(()=> { " + script + " },100);", true);
        }
        protected void LogErrors()
        {
            AddJS("openRadWindowError(\"\")");
        }
        public abstract void BindingDataFormEdit();
        public abstract void BindingDataFormPrint();
        public abstract void BindingDataFormView();
        public abstract void PostBackEventHandler();
        public abstract void BindingControlToModel();
        protected void PrintDocument(object sender, EventArgs e)
        {
            dynamic rwndPrint = FindControl("rwndPrint");
            PrintSetup();
            ModelRef = InitModel();
            signature_name = ModelRef.modified_name_e;
            LoadPatient();
            BindingDataFormPrint();
            if (rwndPrint != null)
            {
                string script = string.Format("function f(){{ window.select_print_language();Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print_document", script, true);
            }
            else
            {
                string script = string.Format("function f(){{ window.print_document();Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print_document", script, true);
            }

            //ModelRef = InitModel();
            //Patient = new PatientInfo(varPID);
            //PatientVisit = new PatientVisitInfo(varPVID, Location);
            //BindingDataFormPrint();
        }
        protected void AmendDocument(object sender, EventArgs e)
        {
            if (AllowDocumentModifer(DocumentStatus.DRAFT))
            {

                ModelRef = InitModel();
                //Model = new OinaRv03(varDocID, Location);

                LinkButton btnComplete = (LinkButton)FindControl("btnComplete");
                Control btnAmend = FindControl("btnAmend");
                Control btnPrint = FindControl("btnPrint");
                Control btnCancel = FindControl("btnCancel");
                var amendReasonWraper = FindControl("amendReasonWraper");
                
                HideControl(btnAmend, btnPrint);
                ShowControl(btnComplete, btnCancel, amendReasonWraper);
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
            ModelRef = InitModel();
            var args = JsonConvert.SerializeObject(new { document_id = varDocID, api = ModelRef.api, patient_visit_id = varPVID });
            string script = string.Format("function f(){{ window.parent.ConfirmDeleteDocument('{0}');Sys.Application.remove_load(f);}}Sys.Application.add_load(f);", args);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "confirm_delete_document", script, true);
        }
        protected void DeleteDocument1(object sender, EventArgs e)
        {
            try
            {
                ModelRef = InitModel();

                dynamic result = ModelRef.Delete(UserId, Location)[0];

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    ClearSessionDoc();
                    Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={Location}");
                }
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void CompleteDocument(object sender, EventArgs e)
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
                    dynamic result = ModelRef.Update(Location)[0];
                    if (result.Status == System.Net.HttpStatusCode.OK)
                    {
                        WebHelpers.PostAPI($"api/emr/clear-session/{Location}/{varDocID}");
                        string script = string.Format("function f(){{ window.parent.complete_document(\"" + PAGE_URL + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "complete_document", script, true);
                    }
                }
                catch(Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    WebHelpers.SendError(Page, ex);
                }
            }
        }
        protected void CallJSFunction(params string[] funcs)
        {
            string functions = "";

            foreach (string func in funcs){
                functions += func + ";";
            }

            string script = string.Format("function f(){{ {0};Sys.Application.remove_load(f);}}Sys.Application.add_load(f);", functions);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "show_message", script, true);
        }
        protected void Notification(string value)
        {
            string script = string.Format("function f(){{ window.parent.Notification('" + value + "');Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "show_message", script, true);
        }
        protected void CancelAmendDocument(object sender, EventArgs e)
        {
            ClearSessionDoc();
            LinkButton btnComplete = (LinkButton)FindControl("btnComplete");
            //Control btnSave = FindControl("btnSave");
            //Control btnDelete = FindControl("btnDeleteModal");
            Control btnAmend = FindControl("btnAmend");
            Control btnPrint = FindControl("btnPrint");
            Control btnCancel = FindControl("btnCancel");
            HideControl(btnCancel, btnComplete);
            ShowControl(btnAmend, btnPrint);
            Init_Page();
        }
        protected void SaveDocument(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                ModelRef = InitModel();
                ModelRef.status = DocumentStatus.DRAFT;
                ModelRef.user_name = UserId;
                BindingControlToModel();
                dynamic result = ModelRef.Update(Location)[0];
                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    //RefreshFormDocument();
                    Notification("Update Success");
                }
            }
        }
        //protected void rbtnViewHistory_Click(object sender, EventArgs e)
        //{
        //    ModelRef = InitModel();
        //    var rlblLogHistory = FindControl("rlblLogHistory");
        //    var rgdLogHistory = FindControl("rgdLogHistory");
        //    var uplLogHistory = FindControl("uplLogHistory");
        //    var rwndLogHistory = FindControl("rwndLogHistory");
        //    ((RadLabel)rlblLogHistory).Text = WebHelpers.loadRadGridHistoryLog((RadGrid)rgdLogHistory, ModelRef.Logs(Location), out string signature_date, out string signature_name);
        //    string script = string.Format("function f(){{ show_window(\"" + nameof(rwndLogHistory) + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "show_log_history", script, true);
        //    ((UpdatePanel)uplLogHistory).Update();
        //}
        private void ClearSessionDoc()
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "localStorage_removeItem", "window.sessionStorage.removeItem('\"" + varDocID + "\"'); window.removeEventListener('beforeunload', comfirm_leave_page, true);", true);
            WebHelpers.PostAPI($"api/emr/clear-session/{Location}/{varDocID}");
        }
        protected void RefreshFormDocument()
        {
            string script = string.Format("function f(){{ window.parent.reload_treeview(\"" + PAGE_URL + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "reload_treeview", script, true);
        }
        protected void RedirectToPatientSummary(object sender, EventArgs e)
        {
            Response.Redirect($"../other/index.aspx?pid={varPID}&vpid={varVPID}&loc={Location}");
        }
        protected void ShowControl(params dynamic[] controls)
        {
            VisibleControl(true, controls);
        }
        protected void HideControl(params dynamic[] controls)
        {
            VisibleControl(false, controls);
        }
        protected void Disabled(params dynamic[] controls)
        {
            for (int i = 0; i < controls.Length; i++) controls[i].Disabled = false;
        }
        private void VisibleControl(bool visible, params dynamic[] controls)
        {
            for (int i = 0; i < controls.Length; i++) controls[i].Visible = visible;
        }
        protected void BindingLabel(string LabelId, string value, string prefix = "prt")
        {
            var lable = FindControl($"{prefix}_{LabelId}");
            if (lable != null)
                ((Label)lable).Text = value;
        }
        protected void BindingLabel(string LabelId, DataTable data, string value, string code = "code", string prefix = "prt")
        {
            if (data != null)
            {
                foreach (DataRow row in data.Rows)
                {
                    string id = Convert.ToString(row[code]);
                    BindingLabel($"{LabelId}_{id}", value, prefix);
                }
            }
        }
        protected DataTable FindHtmlInputCheckBox(HtmlForm HtmlForm, string CheckBoxId, Dictionary<string, string> DataSource, Func<KeyValuePair<string, object>, object> callback, string prefix = "cb", string code = "code")
        {
            DataTable table = new DataTable();
            table.Columns.Add(code);
            table.Columns.Add("desc");
            foreach (KeyValuePair<string, string> dictionary in DataSource)
            {
                try
                {
                    if (((HtmlInputCheckBox)HtmlForm.FindControl(prefix + "_" + CheckBoxId + "_" + dictionary.Key)).Checked)
                    {
                        DataRow dtRow = table.NewRow();
                        dtRow = table.NewRow();
                        dtRow[code] = dictionary.Key;
                        object OtherDesc = callback(new KeyValuePair<string, object>(dictionary.Key, dictionary.Value));
                        if (OtherDesc != null)
                        {
                            dtRow["desc"] = OtherDesc;
                        }
                        else
                        {
                            dtRow["desc"] = dictionary.Value;
                        }
                        table.Rows.Add(dtRow);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            if (table.Rows.Count > 0)
            {
                return table;
            }
            return null;
        }
        protected DataTable FindHtmlInputCheckBox(string CheckBoxId, Dictionary<string, string> DataSource, Func<KeyValuePair<string, object>, object> callback, string code = "code", string prefix = "cb")
        {
            DataTable table = new DataTable();
            table.Columns.Add(code);
            table.Columns.Add("desc");
            foreach (KeyValuePair<string, string> dictionary in DataSource)
            {
                try
                {
                    if (((HtmlInputCheckBox)FindControl(prefix + "_" + CheckBoxId + "_" + dictionary.Key)).Checked)
                    {
                        DataRow dtRow = table.NewRow();
                        dtRow = table.NewRow();
                        dtRow[code] = dictionary.Key;
                        object OtherDesc = callback(new KeyValuePair<string, object>(dictionary.Key, dictionary.Value));
                        if (OtherDesc != null)
                        {
                            dtRow["desc"] = OtherDesc;
                        }
                        else
                        {
                            dtRow["desc"] = dictionary.Value;
                        }
                        table.Rows.Add(dtRow);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            if (table.Rows.Count > 0)
            {
                return table;
            }
            return null;
        }
        protected string ConcatCheckBoxAsString(DataTable data, Func<KeyValuePair<string, object>, object> callback, string code = "code", string gap = "<br>")
        {
            string result = "";
            foreach (DataRow dr in data.Rows)
            {
                object item = callback(new KeyValuePair<string, object>(Convert.ToString(dr[code]), dr["desc"]));
                result += $"{item}{gap}";
            }
            return result;
        }
        protected string FindHtmlInputCheckBoxAsString(string CheckBoxId, Dictionary<string, string> DataSource, Func<KeyValuePair<string, object>, object> callback, string code = "code", string prefix = "cb")
        {
            DataTable dataTable = FindHtmlInputCheckBox(CheckBoxId, DataSource, callback, code, prefix);
            string dataTable_str = null;
            if (dataTable != null)
            {
                dataTable_str = JsonConvert.SerializeObject(dataTable);
            }
            return dataTable_str;
        }
        protected string FindHtmlInputCheckBoxAsString(string CheckBoxId, Dictionary<string, string> DataSource, string code = "code", string prefix = "cb")
        {
            DataTable dataTable = FindHtmlInputCheckBox(CheckBoxId, DataSource, code, prefix);
            string dataTable_str = null;
            if (dataTable != null)
            {
                dataTable_str = JsonConvert.SerializeObject(dataTable);
            }
            return dataTable_str;
        }
        protected DataTable FindHtmlInputCheckBox(string CheckBoxId, Dictionary<string, string> DataSource, string code = "code", string prefix = "cb")
        {
            DataTable table = new DataTable();
            table.Columns.Add(code);
            table.Columns.Add("desc");
            foreach (KeyValuePair<string, string> dictionary in DataSource)
            {
                try
                {
                    if (((HtmlInputCheckBox)FindControl(prefix + "_" + CheckBoxId + "_" + dictionary.Key)).Checked)
                    {
                        DataRow dtRow = table.NewRow();
                        dtRow = table.NewRow();
                        dtRow[code] = dictionary.Key;
                        dtRow["desc"] = dictionary.Value;
                        table.Rows.Add(dtRow);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
            if (table.Rows.Count > 0)
            {
                return table;
            }
            return null;
        }
        /// <summary>
        /// <b>Description</b> <br/>   
        /// - Find Checkbox in HtmlForm <br/>
        /// - rad_ControlID_true <br/>
        /// - rad_ControlID_false <br/>
        /// <b>Author: </b>phut.phan <br/>
        /// </summary>
        /// <param name="ControlID"></param>
        /// <param name="Prefix"></param>
        /// <returns></returns>
        protected bool? FindHtmlInputRadioButton(string ControlID, string Prefix = "rad")
        {
            dynamic returnTrue = FindControl(Prefix + "_" + ControlID + "_true");
            dynamic returnFalse = FindControl(Prefix + "_" + ControlID + "_false");

            if (returnTrue != null)
            {
                if (returnTrue.Checked)
                {
                    return true;
                }
            }
            if (returnFalse != null)
            {
                if (returnFalse.Checked)
                {
                    return false;
                }
            }

            return null;
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
        [Obsolete("this method will remove soon", true)]
        protected string FindHtmlInputRadioButton(HtmlForm HtmlForm, string ControlID, Dictionary<string, string> DataSource, string Prefix = "rad")
        {
            foreach (KeyValuePair<string, string> code in DataSource)
            {
                if (((HtmlInputRadioButton)HtmlForm.FindControl(Prefix + "_" + ControlID + "_" + code.Key)).Checked)
                {
                    return code.Key;
                }
            }
            return null;
        }
        public void BindingInputRadioButton(string ControlID, string Prefix = "rad")
        {
            var control = FindControl(Prefix + "_" + ControlID);
            if (control != null)
            {
                ((HtmlInputRadioButton)control).Checked = true;
            }
        }

        #region HtmlInputCheckBox
        protected void BindingInputCheckBox(string CheckboxId, string key = "code", string Prefix = "cb")
        {
            var control = FindControl(Prefix + "_" + CheckboxId);

            if (control != null)
            {
                ((HtmlInputCheckBox)control).Checked = true;
            }
        }
        protected void BindingInputCheckBox(string CheckboxId, DataTable DataTable, Func<KeyValuePair<string, object>, int> callback, string key = "code", string Prefix = "cb")
        {
            if (DataTable != null && CheckboxId != null)
            {
                foreach (DataRow row in DataTable.Rows)
                {
                    try
                    {
                        string code = row.Field<dynamic>(key).ToLower();
                        BindingInputCheckBox(CheckboxId + "_" + code, key, Prefix);
                        callback(new KeyValuePair<string, object>(row.Field<dynamic>(key).ToLower(), row.Field<string>("desc").ToString()));
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }
        /// <summary>
        /// <b>Description</b> <br/>   
        /// - Find Checkbox in HtmlForm <br/>
        /// <b>Author: </b>phut.phan <br/>
        /// </summary>
        /// <param name="HtmlForm"></param>
        /// <param name="CheckboxId"></param>
        /// <param name="DataTable"></param>
        /// <param name="key"></param>
        /// <param name="Prefix"></param>
        protected void BindingInputCheckBox(string CheckboxId, DataTable DataTable, string key = "code", string Prefix = "cb")
        {
            if (DataTable != null && CheckboxId != null)
            {
                foreach (DataRow row in DataTable.Rows)
                {
                    try
                    {
                        string code = row.Field<dynamic>(key).ToLower();
                        BindingInputCheckBox(CheckboxId + "_" + code, key, Prefix);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }
        #endregion

        /// <summary>
        /// <para>Description: Display control whether edit or view</para>
        /// <para>User can edit form if:</para>
        /// <para>- State is edit</para>
        /// <para>- View Log is false</para>
        /// <para>- Location is not changed</para>
        /// <para>- Access Authorize is FullAccess</para>
        /// </summary>
        /// <param name="form1"></param>
        /// <param name="obj">Model</param>
        /// <param name="state">View, Edit</param>
        /// <param name="viewLog">Is View Log</param>
        /// <param name="company_code">True - Not changed, False - Changed</param>
        /// <param name="access_authorize">FullAccess</param>
        /// <returns></returns>
        protected bool LoadFormControl(ControlState state)
        {
            //1 - edit
            bool visible = (AccessAuthorize == "FullAccess" && !IsLocationChanged && state == ControlState.Edit && !IsViewLog) ? true : false;

            foreach (var prop in ModelRef.GetType().GetProperties())
            {
                var control1 = FindControl(prop.Name + "_wrapper");
                var control2 = FindControl("lbl_" + prop.Name);

                if (control1 != null)
                {
                    control1.Visible = visible;
                }
                if (control2 != null)
                {
                    control2.Visible = !visible;
                }
            }

            return visible;
        }
        protected string DisplayCheckBox(DataTable data, string gap = "<br>")
        {
            string result = "";
            foreach (DataRow dr in data.Rows)
            {
                result += $"{dr["desc"]}{gap}";
            }
            return result;
        }
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

                    AddJS("window.parent.ShowBlock(\"This document is blocked by " + employee.full_name_e + "\");");

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
        protected bool CheckOpenForm { get => WebHelpers.CanOpenForm(Page, varDocID, DocumentStatus.DRAFT, EmpId, Location, LocationChanged, AccessAuthorize); }
        protected string LogInfor(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = "Amended by";
            if (Convert.ToString(status) == DocumentStatus.FINAL && string.IsNullOrEmpty(Convert.ToString(amend_reason)))
            {
                result = "Submitted by";
            }

            if (Convert.ToString(status) == DocumentStatus.DRAFT) result = "Saved by";

            result += $" {LogName(created_name, modified_name)} on {LogDateTime(created_date_time, modified_date_time)}";

            return result;
        }
        protected string LogUrl(object document_log_id) => PAGE_URL + $"&docIdLog={document_log_id}";
        private string LogName(object v1, object v2)
        {
            return !string.IsNullOrEmpty(Convert.ToString(v2)) ? Convert.ToString(v2) : Convert.ToString(v1);
        }
        public string LogDateTime(object v1, object v2)
        {
            string created_date_time = Convert.ToString(v1);
            string modified_date_time = Convert.ToString(v2);

            return string.IsNullOrEmpty(modified_date_time) ? WebHelpers.FormatDateTime(created_date_time, "dd-MMM-yyyy HH:mm tt") : WebHelpers.FormatDateTime(modified_date_time, "dd-MMM-yyyy HH:mm tt");
        }
        protected string GetDataTableToJSON(DataTable dataTable)
        {
            try
            {
                if (dataTable.Rows.Count <= 0) return null;
                return JsonConvert.SerializeObject(dataTable);
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        #region Telerik

        #region DateTimePicker
        protected DateTime? BindingRadDateTimePicker(object datetime)
        {
            try
            {
                if (datetime == null) return null;
                if (datetime is DateTime)
                {
                    return (DateTime)datetime;
                }
                if (datetime is string)
                {
                    if (DateTime.TryParse((string)datetime, out DateTime parsed))
                    {
                        return parsed;
                    }
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return  null;
        }
        protected void BindingRadDateTimePicker(RadDateTimePicker RadDateTimePicker, dynamic datetime)
        {
            try
            {
                if (datetime == null) return;
                if(datetime is DateTime)
                {
                    RadDateTimePicker.SelectedDate = datetime;
                    return;
                }
                if(datetime is string)
                {
                    if(DateTime.TryParse(datetime, out DateTime result))
                    {
                        RadDateTimePicker.SelectedDate = result;
                    }
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        #endregion
        protected DataTable RetrieveGridViewData(GridView GridView, Dictionary<string, string> cols)
        {
            DataTable table = new DataTable();
            foreach (KeyValuePair<string, string> col in cols)
            {
                table.Columns.Add(col.Key);
            }

            DataRow row;
            try
            {
                for (int r = 0; r < GridView.Rows.Count; r++)
                {
                    row = table.NewRow();
                    row["id"] = (r + 1);
                    dynamic control;
                    for (int i = 0; i < GridView.Rows[r].Cells.Count; i++)
                    {
                        control = GridView.Rows[r].Cells[i].Controls[1];
                        try
                        {
                            if (control is TextField || control is TextBox || control is Label)
                            {
                                row[control.ID] = control.Text;
                            }
                            else if (control is RadTimePicker)
                            {
                                row[control.ID] = WebHelpers.FormatDateTime(control.SelectedTime, "HH:mm");
                            }
                            else if (control is RadDateTimePicker)
                            {
                                row[control.ID] = DataHelpers.ConvertSQLDateTime(control.SelectedDate);
                            }
                        }
                        catch (Exception ex) { Console.WriteLine(ex.Message); }
                    }

                    table.Rows.Add(row);
                }
            }
            catch (Exception ex) 
            { 
                Console.WriteLine(ex.Message); 
            }
            return table;
        }
        #endregion
    }
}
