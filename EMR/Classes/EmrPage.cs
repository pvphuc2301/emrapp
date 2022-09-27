using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public abstract class EmrPage : Page
    {
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
        public string varPVID { get => Request.QueryString["pvId"] ?? throw new ArgumentNullException("Patient visit id cannot be null."); }
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) 
            { 
                return; 
            }
            if (!IsPostBack)
            {
                Init_Page();
            }
            PostBackEventHandler();
        }
        public void BindingDataForm(HtmlForm form, object Model, ControlState state)
        {
            if (LoadFormControl(form, Model, state))
            {
                BindingDataFormEdit();
            }
            else
            {
                BindingDataFormView();
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
        public abstract void Init_Page();
        public abstract void PostBackEventHandler();
        public abstract void UpdateModel(string status);
        protected void CompleteForm(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                UpdateModel(DocumentStatus.FINAL);
            }
        }
        protected void SaveForm(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                UpdateModel(DocumentStatus.DRAFT);
            }
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
        protected DataTable FindHtmlInputCheckBox(string CheckBoxId, Dictionary<string, string> DataSource, string prefix = "cb", string code = "code")
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
        /// <param name="HtmlForm"></param>
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
        protected bool LoadFormControl(HtmlForm form1, dynamic obj, ControlState state)
        {
            //1 - edit
            bool visible = (AccessAuthorize == "FullAccess" && !IsLocationChanged && state == ControlState.Edit && !IsViewLog) ? true : false;

            foreach (var prop in obj.GetType().GetProperties())
            {
                var control1 = form1.FindControl(prop.Name + "_wrapper");
                var control2 = form1.FindControl("lbl_" + prop.Name);

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

        #region Telerik

        #region DateTimePicker
        protected void BindingDateTimePicker(RadDateTimePicker RadDateTimePicker, dynamic datetime)
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

        #endregion
    }
}
