﻿using EMR.UserControls;
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

    #region GLOBAL VARIABLES
    public static class GLOBAL_VAL
    {
        public static string MESSAGE_SAVE_SUCCESS = "Your changes have been saved";
    }
    #endregion

    public enum ControlState { View, Edit }
    public static class WebHelpers
    {
        public static string URL = "http://172.16.0.78:8088/";
        //public static string URL = "http://172.16.0.78:8082/";

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
            page.Session["docId"] = obj.document_id;
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
                        ScriptManager.RegisterStartupScript(page, page.GetType(), "document_block", "setTimeout(()=>{ sweetAlert(\"Denied!\", \"This document is blocked by " + employee.full_name_e + "\", \"error\");},0);", true);
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

        internal static void clearSessionDoc(Page page, string docId)
        {
            if (!string.IsNullOrEmpty(docId))
            {
                ScriptManager.RegisterStartupScript(page, page.GetType(), "localStorage_removeItem", "window.sessionStorage.removeItem('\"" + docId + "\"');", true);

                WebHelpers.PostAPI($"api/emr/clear-session/{DataHelpers._LOCATION}/{docId}");
            }
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

        internal static void SendError(Page page, Exception ex)
        {
            //PopupException popupException = (PopupException)page.LoadControl("~/UserControls/PopupException.ascx");
            //page.Form.Controls.Add(popupException);
            
            string message = string.Format("Message: {0}\\n\\n", ex.Message);
            message += string.Format("StackTrace: {0}\\n\\n", ex.StackTrace.Replace(Environment.NewLine, string.Empty));
            message += string.Format("Source: {0}\\n\\n", ex.Source.Replace(Environment.NewLine, string.Empty));
            message += string.Format("TargetSite: {0}", ex.TargetSite.ToString().Replace(Environment.NewLine, string.Empty));
            //popupException.Text = message;
            
            ScriptManager.RegisterStartupScript(page, page.GetType(), "msg_error", "setTimeout(()=>{ sweetAlert(\"Error!\", \"" + message + "\", \"error\");},0);", true);
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

        internal static void Notification(Page page, string message)
        {
            ScriptManager.RegisterStartupScript(page, page.GetType(), "msg_error", "setTimeout(()=>{ alertify.set({ delay: 1700 });  alertify.success(\"" + message + "\");},0);", true);
        }

        #region GridView
        public static DataTable DataBind(GridView _gridView, DataTable _dataSource)
        {
            _gridView.DataSource = _dataSource;
            _gridView.DataBind();
            return _dataSource;
        }
        internal static DataTable BindingDataGridView(GridView gridView, DataTable dataSource, Dictionary<string, string> columns, dynamic btnAdd = null)
        {
            DisabledGridView(gridView, false);
            if (btnAdd != null) { WebHelpers.VisibleControl(true, btnAdd); }
            if (dataSource != null) { return DataBind(gridView, dataSource); }
            else { return AddRow(dataSource, gridView, columns); }
        }

        internal static void LoadDataGridView(GridView gridView, DataTable dataSource, Dictionary<string, string> columns, dynamic btnAdd = null)
        {
            if (btnAdd != null) { WebHelpers.VisibleControl(false, btnAdd); }

            if (dataSource == null) { dataSource = new DataTable(); }

            if (dataSource.Rows.Count <= 0)
             {
                for (int i = 0; i < columns.Count; i++)
                {
                    var col = columns.ElementAt(i);

                    if (!dataSource.Columns.Contains(col.Key))
                    {

                        dataSource.Columns.Add(col.Key);
                        if (!string.IsNullOrEmpty(col.Value))
                        {
                            switch (col.Value)
                            {
                                case "DateTime":
                                    dataSource.Columns[i].DataType = typeof(DateTime);
                                    break;
                            }
                        }
                    }
                }
            }

            gridView.DataSource = dataSource;
            gridView.DataBind();

            DisabledGridView(gridView, true);
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
        internal static DataTable DeleteRow(DataTable dataTable, GridView gridView, int rowIndex)
        {
            dataTable = UpdateLastRow(gridView, dataTable);
            dataTable.Rows[rowIndex].Delete();
            return DataBind(gridView, dataTable);
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
                        catch (Exception ex) { }
                    }

                    table.Rows.Add(row);
                }
            }
            catch (Exception ex) { }

            return GetDataTableToJSON(table);
        }

        internal static string getImageDefault(string value)
        {
            if (string.IsNullOrEmpty(value))
            {
                return "{\"dataURI\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAfQAAAH0CAYAAADL1t+KAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAP+6SURBVHhe7N0H/HRVeSfwSbK72TXZGpOYYhI1alRQFEFUkF4FpHeRlyodKSIIKF2qSBGQ/oqCL11EUaSjoqCiWGKwJCab3nazm7Ips/M9zPN632Fm/jN37p16fp/P/cz/P3PrOc95fk875/5Us4VGRkZGRkZGxkzjp9ufGRkZGRkZGTOMTOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgEzoGRkZGRkZc4BM6BkZGRkZGXOATOgZGRkZGRlzgJ9qttD+OyOj8fd///eNv/u7v2v8r//1v9Lf//Iv/9L4t3/7t8ZP/dRPNZ73vOc1/st/+S+N//pf/2vjP//n/5y+K+L3f//3G3/+53/e+Omf/unGr//6rzf++3//742f/dmfbf/aaPzjP/5j42/+5m8af/qnf9r453/+58bP/MzPNP7Tf/pPjRe+8IWNn/u5n2v8wz/8Q+N73/teuqZr/Oqv/mr63vncj9/AOf3uOOco4g//8A8bf/Inf5L+9rt7+I//8T+m/5fCn/3ZnzX+4A/+IP39ghe8oPH85z8/3Z92cM9/9Vd/lX5zbb/9wi/8Qvo/8K//+q/pHv/P//k/qzyXZ9Y2g8Lzautf+ZVfSW38e7/3e+1flob9X/7yl6d+KuKf/umfUr/Gpi8C//7f//vURu5Ve0WbB/SHNvijP/qj9Gy94Jj/8B/+Q5KNX/zFX0zPUDyPdnjmmWfS39rPBv/zf/7PdE+DIuTQM7iv//f//l967t/8zd9s/Lf/9t/SPQRC5vSt/RxLrtyj586oFjGGtXUVeOlLX5pkMmMwZELPWAXf+ta3Go899ljjwQcfbHzzm99s/PVf/3UanIjz1a9+dWP99ddvbLTRRo03vvGNjX/37/5d+6hnceyxxzauueaapFDf9773NbbccsvGi170ovavjURMn/70pxuXX355In5K+WUve1na9/Wvf33jd3/3dxs77rhjuqZrOJ9rIpj777+/sdNOO6XzIMpNNtkkHYdcizjllFMal1xySfrb79tss03jJS95Sfp/KVxxxRWNE044If196KGHNvbYY490f9rBb7fcckv6zb35zb0Wgex895WvfKXxO7/zOyuf6+67724cffTR7b2WBoPlNa95TeOII45Ibbzbbru1f1kaCPS2225rbLDBBu1vngVD54tf/GLavvSlL60kVkC+nlNbb7311o011lgjEV/gb//2bxvf+MY3GmeccUbjySefbH/7XDAKfu3Xfq3xpje9qbHnnnum8zFsAtph7733Tn97pl133TX9fe6556Z7GhSrrbZa4y1veUvjBz/4QePb3/52MjS003nnndfYfPPNkyEU+P73v59kTv8x9BxLrtyj586oFsbwDjvssNKoHhU33nhj461vfWv7v4ylkEPuGQn/+3//78aXv/zlxmWXXda48sorG48++mjyVv/yL/8yKXQkS6nffPPNaZ/Pfe5ziZSLYJ3blzfNI+TZB55++ulENNdee23jxz/+8UoD4fDDD2/89m//dvKWeLiOdY7/+3//b/IMAzx639t++MMfpntFtP4vgkcW+/nbOQeFe45jPUscGx5q/IYUXZ/HXjw/2xip20d7umdtUDzvIJs24LE6vvjcg27FdgOkt2LFisYHP/jBxqc+9amkdIv7I3tGiP750Ic+lPb1vNF/nss549l6bX/xF3+RjDbXuOGGG5JhWETxWaJ/Bzlv56ZtYZ111klevu944YyCzmiGyMhdd92VSJ9xwbhbc801k4eeMTo4ALvvvnsyzmxH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\"}";
               
            }
            return value;
        }
        #endregion

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
        internal static bool CheckSession(Page _page, string redirecturl = "../login.aspx?ReturnUrl=", bool showDelay = true)
        {
            string UserID = (string)_page.Session["UserID"];
            redirecturl += _page.Request.ServerVariables["script_name"] + "?";
            redirecturl += _page.Server.UrlEncode(_page.Request.QueryString.ToString());

            if (string.IsNullOrEmpty(UserID))
            {
                _page.Response.Redirect(redirecturl, false);
                return false;
            }

            if (showDelay)
            {
                switch (_page.Request["__EVENTTARGET"])
                {
                    case "stayLoggedIn":
                        _page.Response.Redirect(redirecturl);
                        _page.Session.Abandon();
                        return false;

                    default:
                        ScriptManager.RegisterStartupScript(_page, _page.GetType(), "session_timeout", "setTimeout(()=> {popupShowDelay(\"" + EMRClass.Settings["EMR_DOCUMENT_SESSION"].paramater_value + "\");},0);", true);
                        break;
                }
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
        

        internal static dynamic GetDicDesc(dynamic code, Dictionary<string, string> dictionary)
        {
            if (code != null) return dictionary[code];
            return null;
        }
        #endregion
    }
}