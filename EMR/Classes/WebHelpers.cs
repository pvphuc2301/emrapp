using EMR.UserControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public enum ControlState { View, Edit }
    public static class WebHelpers
    {
        public static string URL = "http://172.16.0.78:8088/";
        //public static string URL = "http://172.16.0.78:8082/";\

        #region API
        public static dynamic PostAPI(string url, dynamic obj)
        {
            dynamic result = new ExpandoObject();

            var jsonContent = new JavaScriptSerializer().Serialize(obj);

            url = URL + url;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = WebRequestMethods.Http.Post;
            // request.Headers.Add("Authentication", authToken);
            System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
            Byte[] byteArray = encoding.GetBytes(jsonContent);
            request.ContentLength = byteArray.Length;
            request.ContentType = "application/json";
            using (Stream dataStream = request.GetRequestStream())
            {
                dataStream.Write(byteArray, 0, byteArray.Length);
            }

            long length = 0;
            //try
            //{
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    length = response.ContentLength;
                    WebResponse response1 = request.GetResponse();
                    Stream dataStream = response1.GetResponseStream();
                    StreamReader reader = new StreamReader(dataStream);
                    var responseFromServer = reader.ReadToEnd();

                    reader.Close();
                    dataStream.Close();
                    response.Close();

                    result.Status = response.StatusCode;
                    return result;
                }
            //}
            //catch (WebException ex)
            //{
                
            //    result.Status = System.Net.HttpStatusCode.NotFound;
            //    //result.Status = e.Status;
            //    return result;
            //}
            //catch (Exception ex)
            //{
                
            //    result.Status = System.Net.HttpStatusCode.NotFound;
            //    result.Data = ex.Message;
            //    result.Message = message;

            //    return result;
            //}
        }

        internal static void AddScriptFormEdit(Page page, dynamic obj)
        {
            ScriptManager.RegisterStartupScript(page, page.GetType(), "localStorage_setItem", "window.sessionStorage.setItem('\"" + obj.document_id + "\"', '\"" +JsonConvert.SerializeObject(obj) + "\"'); setTimeout(()=> { leaveEditFormEvent(); },0);", true);
        }

        internal static bool CanOpenForm(Page page, string docid, string documentStatus, string emp_id, string location)
        {
            if(documentStatus == DocumentStatus.DRAFT && location == DataHelpers._LOCATION)
            {
                dynamic result = WebHelpers.GetAPI($"api/emr/check-session/{DataHelpers._LOCATION}/{docid}/{emp_id}");

                if (result.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic obj = JObject.Parse(result.Data);
                    dynamic employee = obj["items"];

                    //false - open denied
                    if (!(bool)obj.status)
                    {
                        ScriptManager.RegisterStartupScript(page, page.GetType(), "document_block", @" setTimeout(()=> { alert('this document is blocked by " + employee.full_name_e + "'); },0); ", true);
                        return false;
                    }
                }
            }

            return true;
        }

        public static dynamic PostAPI(string url)
        {
            dynamic result = new System.Dynamic.ExpandoObject();

            url = URL + url;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = WebRequestMethods.Http.Post;
            System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
            Byte[] byteArray = encoding.GetBytes("{}");
            request.ContentLength = byteArray.Length;
            request.ContentType = "application/json";
            using (Stream dataStream = request.GetRequestStream())
            {
                dataStream.Write(byteArray, 0, byteArray.Length);
            }

            long length = 0;
            //try
            //{
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    length = response.ContentLength;
                    WebResponse response1 = request.GetResponse();
                    Stream dataStream = response1.GetResponseStream();
                    StreamReader reader = new StreamReader(dataStream);
                    var responseFromServer = reader.ReadToEnd();

                    //var res = response1;
                    reader.Close();
                    dataStream.Close();
                    response.Close();
                    result.Status = response.StatusCode;
                    return result;
                }
            //}
            //catch (WebException e)
            //{
            //    result.Status = e.Status;
            //    return result;
            //}
            //catch (Exception ex)
            //{
            //    result.Data = ex.Message;
            //    result.Status = "Error";
            //    result.Exception = ex;
            //    return result;
            //}
        }
        
        public static dynamic GetAPI(string url)
        {
            dynamic result = new System.Dynamic.ExpandoObject();

            url = URL + url;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "GET";
            request.ContentType = "application/json";
            long length = 0;
            try
            {
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    length = response.ContentLength;
                    WebResponse response1 = request.GetResponse();
                    Stream dataStream = response1.GetResponseStream();
                    StreamReader reader = new StreamReader(dataStream);
                    var responseFromServer = reader.ReadToEnd();
                    //var res = response1;
                    reader.Close();
                    dataStream.Close();
                    response.Close();

                    result.Status = response.StatusCode;
                    result.Data = responseFromServer;
                    return result;
                }
            }
            catch(Exception ex) {
                result.Status = System.Net.HttpStatusCode.NotFound;
                result.Data = ex.Message;
                return result;
            }
        }
        #endregion

        #region Methods
        public static DataTable GetJSONToDataTable(string JSONData)
        {
            if (JSONData == null) { return null; }
            DataTable dt;
            dynamic jsonObject = null;
            
            if(JSONData.Substring(0,1) == "[")
            {
                jsonObject = JsonConvert.DeserializeObject(JSONData);
            }
            else if(JSONData.Substring(0, 1) == "{")
            {
                JSONData = "[" + JSONData + "]";
                jsonObject = JsonConvert.DeserializeObject(JSONData);
            }

            dt = JsonConvert.DeserializeObject<DataTable>(Convert.ToString(jsonObject));
            return dt;
        }

        public static bool IsPropertyExist(dynamic settings, string name)
        {
            if (settings is ExpandoObject)
                return ((IDictionary<string, object>)settings).ContainsKey(name);

            return settings.GetType().GetProperty(name) != null;
        }
        internal static void DataBind(HtmlForm _form, HtmlInputRadioButton controlType, string controlID)
        {
            dynamic control = _form.FindControl(controlID);
            
            if (control != null)
            {
                ((HtmlInputRadioButton)control).Checked = true;
            }
        }
        internal static void DataBind(HtmlForm _form, HtmlSelect select, Dictionary<string, string> dictionary, string selectedItem)
        {
            select.Items.Clear();
            foreach (KeyValuePair<string, string> code in dictionary)
            {
                try
                {
                    ListItem item = new ListItem();
                    item.Value = code.Key.ToString();
                    item.Text = code.Value;

                    select.Items.Add(item);
                }
                catch (Exception ex) { }
            }

            var item1 = select.Items.FindByValue(selectedItem);
            if (item1 != null)
            {
                item1.Selected = true;
            }
        }

        internal static void clearSessionDoc(string docId)
        {
            WebHelpers.PostAPI($"api/emr/clear-session/{DataHelpers._LOCATION}/{docId}");
        }

        internal static void DataBind(HtmlForm _form, HtmlInputCheckBox controlType, string controlID)
        {
            dynamic control = _form.FindControl(controlID);

            if (control != null)
            {
                ((HtmlInputCheckBox)control).Checked = true;
            }
        }
        internal static void DataBind(HtmlForm _from, HtmlInputCheckBox controlType, string cb_name, DataTable value, string key = "code")
        {
            if (value != null && cb_name != null)
            {
                foreach (DataRow row in value.Rows)
                {
                    try
                    {
                        ((HtmlInputCheckBox)_from.FindControl(cb_name + row.Field<dynamic>(key).ToLower())).Checked = true;
                    }
                    catch (Exception ex)
                    {
                    }

                }
            }
        }
        public static string GetJSONFromTable(GridView gridView, DataTable table)
        {
            DataRow row;
            try
            {
                for (int r = 0; r < gridView.Rows.Count; r++)
                {
                    row = table.NewRow();
                    row["id"] = (r + 1);
                    for (int i = 0; i < gridView.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            if (gridView.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = gridView.Rows[r].Cells[i].Controls[1] as TextField;
                                row[text2.DataKey] = text2.Value;
                            }
                            else if (gridView.Rows[r].Cells[i].Controls[1] is RadTimePicker)
                            {
                                RadTimePicker text2 = gridView.Rows[r].Cells[i].Controls[1] as RadTimePicker;
                                row[text2.ID] = DateTime.Parse(text2.SelectedTime.ToString()).ToString("HH:mm");
                            }
                            else if (gridView.Rows[r].Cells[i].Controls[1] is RadDateTimePicker)
                            {
                                RadDateTimePicker text2 = gridView.Rows[r].Cells[i].Controls[1] as RadDateTimePicker;
                                row[text2.ID] = DataHelpers.ConvertSQLDateTime(DateTime.Parse(text2.SelectedDate.ToString()));
                            }
                        }
                        catch (Exception ex) { }
                    }

                    table.Rows.Add(row);
                }
            } catch (Exception ex) { }

            return GetDataTableToJSON(table);
        }

        internal static string GetValue(dynamic value, string defaultValue = "—")
        {
            if (string.IsNullOrEmpty(value)) return defaultValue;
            return $"<span class='font-bold'>{value}</span>";
        }
        internal static string FormatString(dynamic value, string defaultValue = "—", string CssClass = "font-bold")
        {
            if (value == null || Convert.ToString(value) == "") return defaultValue;
            return $"<span class='{CssClass}'>{Convert.ToString(value)}</span>";
        }

        public static string GetDataGridView(GridView gridView, Dictionary<string, string> cols)
        {
            DataTable table = new DataTable();
            foreach (KeyValuePair<string, string> col in cols)
            {
                table.Columns.Add(col.Key);
            }

            DataRow row;
            try
            {
                for (int r = 0; r < gridView.Rows.Count; r++)
                {
                    row = table.NewRow();
                    row["id"] = (r + 1);
                    dynamic control;
                    for (int i = 0; i < gridView.Rows[r].Cells.Count; i++)
                    {
                        control = gridView.Rows[r].Cells[i].Controls[1];
                        try
                        {
                            if (control is TextField || control is TextBox)
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
                        catch (Exception ex) { }
                    }

                    table.Rows.Add(row);
                }
            }
            catch (Exception ex) { }

            return GetDataTableToJSON(table);

            ////
            //DataTable dataTable = table;
            //dataTable.Clear();
            //DataRow dataRow;
            //try
            //{
            //    for (int r = 0; r < gridView.Rows.Count; r++)
            //    {
            //        dataRow = dataTable.NewRow();

            //        for (int i = 0; i < gridView.Rows[r].Cells.Count; i++)
            //        {
            //            try
            //            {
            //                TextField text2 = gridView.Rows[r].Cells[i].Controls[1] as TextField;
            //                dataRow[text2.DataKey] = text2.Value;
            //            }
            //            catch { }
            //        }
            //        dataTable.Rows.Add(dataRow);
            //    }
            //    return GetDataTableToJSON(dataTable);
            //}
            //catch(Exception ex)
            //{
            //    return null;
            //}
        }

        internal static void SendError(Page page, Exception ex)
        {
            //PopupException popupException = (PopupException)page.LoadControl("~/UserControls/PopupException.ascx");
            //page.Form.Controls.Add(popupException);
            
            string message = string.Format("Message: {0}\\n\\n", ex.Message);
            message += string.Format("StackTrace: {0}\\n\\n", ex.StackTrace.Replace(Environment.NewLine, string.Empty));
            message += string.Format("Source: {0}\\n\\n", ex.Source.Replace(Environment.NewLine, string.Empty));
            message += string.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, string.Empty));
            //popupException.Text = message;
            
            ScriptManager.RegisterStartupScript(page, page.GetType(), "msg_error", "alert(\"" + message + "\");", true);
        }

        internal static void DisabledControl(bool disabled,params dynamic[] options)
        {
            for (int i = 0; i < options.Length; i++)
            {
                options[i].Disabled = disabled;
            }
        }

        internal static void EnableControl(bool enable, params dynamic[] options)
        {
            for (int i = 0; i < options.Length; i++)
            {
                options[i].Enable = enable;
            }
        }

        internal static void VisibleControl(bool visible, params dynamic[] options)
        {
            for (int i = 0; i < options.Length; i++)
            {
                options[i].Visible = visible;
            }
        }
        internal static void VisibleControl(Page _page, string _controlID, bool visible, Dictionary<string, string> _source)
        {
            for (int i = 0; i < _source.Count; i++)
            {
                var control = _controlID.ElementAt(i);
                _page.FindControl($"{_controlID}{control}").Visible = visible;
                //options[i].Visible = visible;
            }
        }
        internal static bool LoadFormControl(HtmlForm form1, dynamic obj, ControlState state)
        {
            bool visible = (state == 0) ? true : false;

            foreach (var prop in obj.GetType().GetProperties())
            {
                var control1 = form1.FindControl(prop.Name + "_wrapper");
                var control2 = form1.FindControl("lbl_" + prop.Name);

                if (control1 != null)
                {
                    control1.Visible = !visible;
                }
                if (control2 != null)
                {
                    control2.Visible = visible;
                }
            }
            return visible;
        }
        internal static bool LoadFormControl(HtmlForm form1, dynamic obj, ControlState state, string session)
        {
            //1 - edit
            bool visible = (state == ControlState.Edit && DataHelpers._LOCATION == session) ? true : false;

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
        internal static string CreateOptions(params dynamic[] options)
        {
            string option = "";
            int lastIndex = options.Length - 1;
            option += string.Format("<div style='{0}'>", options[lastIndex]);
            for (int i = 0; i < lastIndex - 1; i++)
            {
                option += "<div style='display: grid; grid-template-columns: auto 1fr;'> ";
                option += (options[lastIndex - 1] == options[i].Value ? "☒ " : "❏ ");
                option += "<span class='ml-1'>";
                option += options[i].Text;
                option += "</span>";
                option += "</div>";
            }
            option += "</div>";
            return option;
        }
        public static string GenerateBarcode(string Text)
        {
            if (!string.IsNullOrEmpty(Text))
            {
                BarcodeLib.Barcode code128 = new BarcodeLib.Barcode();
                System.Drawing.Image barcode = code128.Encode(BarcodeLib.TYPE.CODE128, Text);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                barcode.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                ms.ToArray();

                return "data:image/jpeg;base64," + Convert.ToBase64String(ms.ToArray());
            }
            return "";
        }

        internal static string CreateOptions(Dictionary<string, string> options, string value, string styles)
        {
            string option = string.Format("<div style='{0}'>", styles);
            for (int i = 0; i < options.Count; i++)
            {
                var item = options.ElementAt(i);

                option += "<div style='display: grid; grid-template-columns: auto 1fr;'> ";
                option += (item.Key == value ? "☒ " : "❏ ");
                option += "<span class='ml-1'>";
                option += item.Value;
                option += "</span>";
                option += "</div>";
            }
            option += "</div>";
            return option;
        }

        internal static string FormatDateTime(DateTime? dateTime, string format = "dd-MM-yyyy")
        {
            if (dateTime == null) return "";
            return ((DateTime)dateTime).ToString(format);
        }

        public static string GetDataTableToJSON(DataTable dataTable)
        {
            try {
                if (dataTable.Rows.Count <= 0) return null;
                return JsonConvert.SerializeObject(dataTable);
            } catch(Exception ex) {
                return ex.Message; 
            }
        }

        public static DataTable GetDataTable(string api_direction, string para)
        {
            DataTable tbl = new DataTable();
            string _jsonData = WebHelpers.GetAPI(api_direction + para);

            if (_jsonData != null)
            {
                _jsonData = "[" + _jsonData + "]";
                tbl = WebHelpers.GetJSONToDataTable(_jsonData);
            }
            return tbl;
        }

        public static DataTable InitialDataTable(Dictionary<string, string> dt)
        {
            DataTable tbl = new DataTable();
            foreach (KeyValuePair<string, string> col in dt)
            {
                tbl.Columns.Add(col.Key);
            }
            tbl.Rows.Add(tbl.NewRow());
            return tbl;
        }

        internal static dynamic getRadioButton(HtmlForm form1, string radioButtonID)
        {
            dynamic control1 = form1.FindControl($"{radioButtonID}true");
            dynamic control2 = form1.FindControl($"{radioButtonID}false");

            if (control1 != null && control2 != null)
            {
                return control1.Checked;
            }
            else return null;
        }

        internal static DataTable DataBind(GridView gridView, DataTable dataSource)
        {
            if (dataSource == null) return dataSource;
            if(dataSource.Rows.Count > 0)
            {
                gridView.DataSource = dataSource;
                gridView.DataBind();
            }
            else
            {

            }
            return dataSource;
        }

        internal static DataTable BindingDataGridView(GridView gridView, DataTable dataSource, Dictionary<string, string> columns, dynamic btnAdd = null)
        {
            DisabledGridView(gridView, false);
            if (btnAdd != null) { WebHelpers.VisibleControl(true, btnAdd); }
            if (dataSource != null)
            {
                gridView.DataSource = dataSource;
                gridView.DataBind();
                return dataSource;
            }
            else
            {
                return AddRow(dataSource, gridView, columns);
            }
        }

        public static Bitmap ConvertBase64ToImage(string ImageStr)
        {
            try
            {
                System.Text.StringBuilder sbText = new System.Text.StringBuilder(ImageStr, ImageStr.Length);
                sbText = sbText.Replace("\r\n", String.Empty); sbText.Replace(" ", String.Empty);

                Byte[] bitmapData = Convert.FromBase64String(sbText.ToString());
                System.IO.MemoryStream streamBitmap = new System.IO.MemoryStream(bitmapData);
                Bitmap bitImage = new Bitmap((Bitmap)System.Drawing.Image.FromStream(streamBitmap));
                return bitImage;
            }catch(Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="form">
        /// form control
        /// </param>
        /// <param name="disabled">
        /// false: allow edit
        /// true: do not allow edit
        /// </param>
        /// <param name="controls">
        /// controls that not affected
        /// </param>
        public static void DisabledControl(HtmlForm form, bool disabled)
        {
            //int i = 0;
            //foreach (Control c in form.Controls)
            //{
            //    i++;
            //    if(i >= 73)
            //    {
            //        string name = c.GetType().Name;
            //    }
            //    if (c.GetType().Name == ControlType.HtmlInputText)
            //    {
            //        if (((HtmlInputText)c).Attributes["class"].Contains("contenteditable"))
            //        {
            //            if (disabled)
            //            {
            //                ((HtmlInputText)c).Attributes["data-status"] = ControlStatus.View;
            //            }
            //            else
            //            {
            //                ((HtmlInputText)c).Attributes["data-status"] = ControlStatus.Edit;
            //            }
            //        }
            //        else
            //        {
            //            ((HtmlInputText)c).Disabled = disabled;
            //        }
            //    }
            //    else if (c.GetType().Name == ControlType.HtmlInputRadioButton)
            //    {
            //        ((HtmlInputRadioButton)c).Disabled = disabled;
            //    }
            //    else if (c.GetType().Name == ControlType.RadDatePicker || c.GetType().Name == ControlType.RadTimePicker)
            //    {
            //        ((RadDatePicker)c).Enabled = !disabled;
            //    }
            //}
        }

        public static void BindingDatafield(DataTable tbl, object obj)
        {
            /* 1. Get API trả về 1 Datatable: tbl
               2.Từ tbl  gán giá trị cho 1 Object: obj thuộc Class Form XYZ 
               3. Lấy toàn bộ dữ liệu trong obj để hiển thị lên các Textbox/Label trên các Form.*/
            foreach (DataColumn col in tbl.Columns)
            {
                if (obj.GetType().GetProperty(col.ToString()) != null)
                {
                    // if (tbl.Rows[0].Field<dynamic>(col) != null)
                    {
                        //string temp2 = obj.GetType().GetProperty(col.ToString()).Name.ToString();
                        //string temp1 =  tbl.Rows[0].Field<dynamic>(col);
                        //obj.GetType().GetProperty(col.ToString()).SetValue(obj, tbl.Rows[0].Field<dynamic>(col));
                        var field = tbl.Rows[0].Field<dynamic>(col);
                        
                        obj.GetType().GetProperty(col.ToString()).SetValue(obj, field);
                    }
                }
            }
            // return obj;

        }

        internal static dynamic GetData(HtmlForm form, HtmlInputRadioButton controlType, string radioButtonID)
        {
            dynamic control1 = form.FindControl($"{radioButtonID}true");
            dynamic control2 = form.FindControl($"{radioButtonID}false");

            if (control1.Checked) { return true; }
            else if (control2.Checked) { return false; }
            else { return null; }
        }
        internal static dynamic GetData(HtmlForm form, HtmlInputRadioButton controlType, string radioButtonID, Dictionary<string, string> source)
        {
            foreach (KeyValuePair<string, string> code in source)
            {
                if (((HtmlInputRadioButton)form.FindControl(radioButtonID + code.Key)).Checked)
                {
                    return code.Key;
                    break;
                }
            }
            return null;
        }
        internal static dynamic GetData(HtmlForm form, HtmlInputCheckBox controlType, string radioButtonID, bool required = false)
        {
            dynamic control1 = form.FindControl($"{radioButtonID}true");
            //dynamic control2 = form.FindControl($"{radioButtonID}false");


            if (control1.Checked) { return true; }
            //else if (control2.Checked) { return false; }
            else {
                if (required) { return false; }
                return null;
            }
        }
        internal static dynamic GetData(HtmlForm form, HtmlInputCheckBox controlType, string radioButtonID, Dictionary<string, string> source, string code_col = "code")
        {
            DataTable table = new DataTable();
            table.Columns.Add(code_col);
            table.Columns.Add("desc");

            foreach (KeyValuePair<string, string> code in source)
            {
                if (((HtmlInputCheckBox)form.FindControl(radioButtonID + code.Key)).Checked)
                {
                    DataRow dtRow = table.NewRow();

                    dtRow = table.NewRow();
                    dtRow[code_col] = code.Key;
                    dtRow["desc"] = code.Value;
                    table.Rows.Add(dtRow);
                }
            }
            if (table.Rows.Count <= 0) return null;
            return JsonConvert.SerializeObject(table);
        }

        public static void CopyProperties(object source, object destination)
        {
            foreach (PropertyInfo prop in destination.GetType().GetProperties())
            {
                if (source.GetType().GetProperty(prop.Name) != null)
                {
                    if (prop.PropertyType.Name == "String")
                    {
                        string value = "";
                        if (source.GetType().GetProperty(prop.Name).GetValue(source, null) != null)
                        {
                            value = source.GetType().GetProperty(prop.Name).GetValue(source, null).ToString();
                        }
                        destination.GetType().GetProperty(prop.Name).SetValue(destination, value);
                    }
                    else if (prop.PropertyType.Name == "Boolean")
                    {
                        Boolean value = false;
                        if (source.GetType().GetProperty(prop.Name).GetValue(source, null) != null)
                        {
                            value = Boolean.Parse(source.GetType().GetProperty(prop.Name).GetValue(source, null).ToString());
                        }
                        destination.GetType().GetProperty(prop.Name).SetValue(destination, value);
                    }
                }
            }
        }

        internal static void getAccessButtons(HtmlForm form, string docStatus, string access_authorize, string location)
        {
            LinkButton btnComplete = (LinkButton)form.FindControl("btnComplete");
            Control btnSave = form.FindControl("btnSave");
            Control btnDelete = form.FindControl("btnDeleteModal");
            Control btnAmend = form.FindControl("btnAmend");
            Control btnPrint = form.FindControl("btnPrint");
            Control btnCancel = form.FindControl("btnCancel");
            
            VisibleControl(false, btnCancel);

            if (DataHelpers._LOCATION != location)
            {
                VisibleControl(false, btnComplete, btnSave, btnDelete, btnAmend, btnPrint);
                return;
            }

            if (docStatus == DocumentStatus.FINAL)
            {
                VisibleControl(true, btnAmend, btnPrint);
                VisibleControl(false, btnComplete, btnSave, btnDelete);
            }
            else
            {
                VisibleControl(false, btnAmend, btnPrint);
                VisibleControl(true, btnComplete, btnSave, btnDelete);
            }

            switch (access_authorize)
            {
                case "TechAccess":
                case "CSOAccess":
                case "MAFullAccess":
                    btnComplete.Enabled = false;
                    break;
            }
        }

        /// <summary>
        /// { 
        ///     "parameter1": "value1",
        ///     "parameter2": "value2",
        ///     "...": "value",
        /// }
        /// </summary>
        /// <param name="url">a</param>
        /// <param name="jsonContent">
        /// </param>
        /// <returns></returns>


        /// <summary>
        /// test
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>

        public static void DisabledDateTimePicker(RadDateTimePicker radDateTimePicker, bool disabled)
        {
            radDateTimePicker.DatePopupButton.Visible = !disabled;
            radDateTimePicker.TimePopupButton.Visible = !disabled;
            radDateTimePicker.EnableTyping = !disabled;
        }
        public static void DisabledDateTimePicker(RadDatePicker radDatePicker, bool disabled)
        {
            radDatePicker.DatePopupButton.Visible = !disabled;
            radDatePicker.EnableTyping = !disabled;
        }
        public static void DisabledGridView(GridView gridView, bool disabled)
        {
            try
            {
                for (int r = 0; r < gridView.Rows.Count; r++)
                {
                    for (int i = 0; i < gridView.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            dynamic control = gridView.Rows[r].Cells[i].Controls[1];

                            if (control is TextField || control is TextBox)
                            {
                                control.Disabled = disabled;
                            }
                            else if (control is RadTimePicker)
                            {
                                control.TimePopupButton.Visible = !disabled;
                                control.EnableTyping = !disabled;
                            }
                            else if (control is RadDateTimePicker)
                            {
                                control.DatePopupButton.Visible = !disabled;
                                control.TimePopupButton.Visible = !disabled;
                                control.EnableTyping = !disabled;
                            }
                        }
                        catch (Exception ex) { }
                    }
                }

                gridView.Columns[gridView.Columns.Count - 1].Visible = !disabled;
            }
            catch (Exception ex) { }

        }
        public static void BindDateTimePicker(RadDateTimePicker radDateTimePicker, dynamic datetime)
        {
            try
            {
                if (datetime != null)
                {
                    radDateTimePicker.SelectedDate = datetime;
                }
            }
            catch (Exception ex) { }
        }
        internal static void DataBind(RadDateTimePicker radDateTimePicker, dynamic datetime)
        {
            if (datetime != null)
            {
                radDateTimePicker.SelectedDate = datetime;
            }
        }
        public static void BindDateTimePicker(RadDatePicker radDatePicker, dynamic datetime)
        {
            try
            {
                radDatePicker.SelectedDate = datetime;
            }
            catch (Exception ex) { }
        }
        public static string GetSignatureTemplate1(string dateTime, string title_l, string title_e, string subTitle_l, string subTitle_e, string fullname)
        {
            string template = "";
             template += dateTime;
            if (!string.IsNullOrEmpty(title_l))
            { template += "<div>" + title_l + "</div>"; }
            if (!string.IsNullOrEmpty(title_e)) { template += "<div class='text-primary'>" + title_e + "</div>"; }
            if (!string.IsNullOrEmpty(subTitle_l)) { template += "<div>" + subTitle_l + "</div>"; }
            if (!string.IsNullOrEmpty(subTitle_e)) { template += "<div class='text-primary'>" + subTitle_e + "</div>"; }
            if (!string.IsNullOrEmpty(fullname)) { template += "<div style='margin-top: 100px'>" + fullname + "</div>"; }

            return template;
        }
        public static string GetBool(bool? value, string returnTrue = "Có/ Yes", string returnFalse = "Không/ No")
        {
            if (value == null) return null; return (bool)value ? returnTrue : returnFalse;
        }
        internal static bool CheckSession(Page _page, string redirecturl = "../login.aspx?ReturnUrl=")
        {
            string UserID = (string)_page.Session["UserID"];
            redirecturl += _page.Request.ServerVariables["script_name"] + "?";
            redirecturl += _page.Server.UrlEncode(_page.Request.QueryString.ToString());
            if (string.IsNullOrEmpty(UserID))
            {
                _page.Response.Redirect(redirecturl, false);
                return false;
            }
            switch (_page.Request["__EVENTTARGET"])
            {
                case "stayLoggedIn":
                    _page.Response.Redirect(redirecturl);
                    _page.Session.Abandon();
                    return false;

                default:
                    ScriptManager.RegisterStartupScript(_page, _page.GetType(), "session_timeout","setTimeout(()=> {popupShowDelay(\"" + EMRClass.Settings["EMR_DOCUMENT_SESSION"].paramater_value + "\");},0);", true);
                    break;
            }
            return true;
        }
        internal static string GetData(HtmlForm _form, HtmlInputCheckBox controlType, string _checkboxID, Dictionary<string, string> _source, out DataTable _table, string _code = "code")
        {
            DataTable table = new DataTable();
            table.Columns.Add(_code);
            table.Columns.Add("desc");

            foreach (KeyValuePair<string, string> code in _source)
            {
                try
                {
                    if (((HtmlInputCheckBox)_form.FindControl(_checkboxID + code.Key)).Checked)
                    {
                        DataRow dtRow = table.NewRow();

                        dtRow = table.NewRow();
                        dtRow[_code] = code.Key;
                        dtRow["desc"] = code.Value;
                        table.Rows.Add(dtRow);
                    }
                }
                catch (Exception ex) { }
            }
            _table = table;
            if (_table.Rows.Count > 0) return JsonConvert.SerializeObject(table);
            return null;
        }
        internal static string GetCheckBox(HtmlForm _form, string _checkboxID, Dictionary<string, string> _source, out DataTable _table, string _code = "code")
        {
            DataTable table = new DataTable();
            table.Columns.Add(_code);
            table.Columns.Add("desc");

            foreach (KeyValuePair<string, string> code in _source)
            {
                try
                {
                    if (((HtmlInputCheckBox)_form.FindControl(_checkboxID + code.Key)).Checked)
                    {
                        DataRow dtRow = table.NewRow();

                        dtRow = table.NewRow();
                        dtRow[_code] = code.Key;
                        dtRow["desc"] = code.Value;
                        table.Rows.Add(dtRow);
                    }
                }
                catch (Exception ex) { }
            }
            _table = table;
            if (_table.Rows.Count > 0) return JsonConvert.SerializeObject(table);
            return null;
        }
        internal static string GetCheckBox(HtmlForm _form, string _checkboxID, Dictionary<string, string> _source, string _code = "code")
        {
            DataTable table = new DataTable();
            table.Columns.Add(_code);
            table.Columns.Add("desc");

            foreach (KeyValuePair<string, string> code in _source)
            {
                try
                {
                    if (((HtmlInputCheckBox)_form.FindControl(_checkboxID + code.Key)).Checked)
                    {
                        DataRow dtRow = table.NewRow();

                        dtRow = table.NewRow();
                        dtRow[_code] = code.Key;
                        dtRow["desc"] = code.Value;
                        table.Rows.Add(dtRow);
                    }
                }
                catch (Exception ex) { }
            }
            if (table.Rows.Count > 0) return JsonConvert.SerializeObject(table);
            return null;
        }
        private static dynamic GetCheckBox(HtmlForm form, string id, bool required = false)
        {
            dynamic contro1 = form.FindControl(id + "true");

            if (contro1 != null)
            {
                return ((HtmlInputCheckBox)contro1).Checked;
            }
            else
            {
                if (required) { return false; }
                return null;
            }
        }
        internal static DataTable DeleteRow(DataTable dataTable, GridView gridView, int rowIndex)
        {
            dataTable = UpdateLastRow(gridView, dataTable);
            dataTable.Rows[rowIndex].Delete();
            return DataBind(gridView, dataTable);
        }
        private static DataTable UpdateLastRow(GridView gridView, DataTable table)
        {
            for (int i = 0; i < gridView.Rows[gridView.Rows.Count - 1].Cells.Count; i++)
            {
                try
                {
                    dynamic control = gridView.Rows[gridView.Rows.Count - 1].Cells[i].Controls[1];
                    if (control is TextField || control is TextBox)
                    {
                        table.Rows[gridView.Rows.Count - 1][control.ID] = control.Text;
                    }
                }
                catch (Exception ex) { }
            }

            return table;
        }
        internal static dynamic GetRadioButton(HtmlForm _form, string _radiobuttonID, Dictionary<string, string> _scource)
        {
            foreach (KeyValuePair<string, string> code in _scource)
            {
                try
                {
                    if (((HtmlInputRadioButton)_form.FindControl(_radiobuttonID + code.Key)).Checked)
                    {
                        return code.Key;
                        break;
                    }
                }
                catch (Exception ex) { }
            }
            return null;
        }
        internal static dynamic GetRadioButton(HtmlForm form1, string radioButtonID)
        {
            try
            {
                if (((HtmlInputRadioButton)form1.FindControl($"{radioButtonID}true")).Checked)
                {
                    return true;
                }
                else if (((HtmlInputRadioButton)form1.FindControl($"{radioButtonID}false")).Checked)
                {
                    return false;
                }
                else return null;
            }
            catch (Exception ex) { return null; }
        }
        internal static string DisplayCheckBox(dynamic _source, string gap = "<br>")
        {
            if (string.IsNullOrEmpty(_source)) return "";
            DataTable dt = WebHelpers.GetJSONToDataTable(_source);
            string result = "";
            foreach (DataRow dr in dt.Rows)
            {
                result += $"{dr["desc"]}{gap}";
            }
            return result;
        }
        internal static DataTable AddRow(DataTable _dataTable, GridView _gridView, Dictionary<string, string> _col)
        {
            try
            {
                //new object
                if (_dataTable == null)
                {
                    _dataTable = new DataTable();

                    //create header
                    for (int i = 0; i < _col.Count; i++)
                    {
                        var col = _col.ElementAt(i);

                        if (!_dataTable.Columns.Contains(col.Key))
                        {

                            _dataTable.Columns.Add(col.Key);
                            if (!string.IsNullOrEmpty(col.Value))
                            {
                                switch (col.Value)
                                {
                                    case "DateTime":
                                        _dataTable.Columns[i].DataType = typeof(DateTime);
                                        break;
                                }
                            }
                        }
                    }
                }

                //get current data
                for (int r = 0; r < _gridView.Rows.Count; r++)
                {
                    for (int i = 0; i < _gridView.Rows[r].Cells.Count; i++)
                    {
                        try
                        {
                            dynamic control = _gridView.Rows[r].Cells[i].Controls[1];

                            if (control is TextField || control is TextBox)
                            {
                                _dataTable.Rows[r][control.ID] = control.Text;
                            }
                            else if (control is RadDateTimePicker)
                            {
                                _dataTable.Rows[r][control.ID] = control.SelectedDate;
                            }
                            else if (control is RadTimePicker)
                            {
                                _dataTable.Rows[r][control.ID] = ((RadTimePicker)control).SelectedTime;
                            }
                        }
                        catch (Exception ex) { }
                    }
                }
                
                _dataTable.Rows.Add(_dataTable.NewRow());

                return DataBind(_gridView, _dataTable);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        internal static dynamic GetDicDesc(dynamic code, Dictionary<string, string> dictionary)
        {
            if (code != null) return dictionary[code];
            return null;
        }
        #endregion
    }
}