﻿using Newtonsoft.Json;
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
    public static class WebHelpers
    {
        public static string URL = "http://172.16.0.78:8082/";
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
        //public static string FormatNumber(string value, string format)
        //{
        //    if (value == null) return "";
        //    return Decimal.Round( value.ToString("f1"); 
        //}
        public static bool IsPropertyExist(dynamic settings, string name)
        {
            if (settings is ExpandoObject)
                return ((IDictionary<string, object>)settings).ContainsKey(name);

            return settings.GetType().GetProperty(name) != null;
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

        internal static string GetValue(dynamic value, string defaultValue = "—")
        {
            if (string.IsNullOrEmpty(value)) return defaultValue;
            return value;
        }

        public static string GetJSONFromTable(GridView gridView, Dictionary<string, string> cols)
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
                    Control control;
                    for (int i = 0; i < gridView.Rows[r].Cells.Count; i++)
                    {
                        control = gridView.Rows[r].Cells[i].Controls[1];
                        try
                        {
                            if (control is TextField)
                            {
                                TextField text2 = gridView.Rows[r].Cells[i].Controls[1] as TextField;
                                row[text2.DataKey] = text2.Value;
                            }
                            else if (control is RadTimePicker)
                            {
                                RadTimePicker text2 = gridView.Rows[r].Cells[i].Controls[1] as RadTimePicker;
                                row[text2.ID] = DateTime.Parse(text2.SelectedTime.ToString()).ToString("HH:mm");
                            }
                            else if (control is RadDateTimePicker)
                            {
                                RadDateTimePicker text2 = gridView.Rows[r].Cells[i].Controls[1] as RadDateTimePicker;
                                row[text2.ID] = DataHelpers.ConvertSQLDateTime(DateTime.Parse(text2.SelectedDate.ToString()));
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

        //internal static string CreateOptions(params object[] theObjects)
        //{
        //    return JsonConvert.SerializeObject(theObjects);
        //}
        /// <summary>
        /// [0 - (n-2)]: options
        /// [n-1]: isChecked
        /// [n]: styles
        /// </summary>
        /// <param name="options"></param>
        /// <returns></returns>
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

        internal static string FormatDateTime(dynamic dateTime, string format = "dd-MM-yyyy")
        {
            if (dateTime == null) return "";
            return dateTime.ToString(format);
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
            try
            {
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
            }
            catch (WebException e)
            {
                result.Status = System.Net.HttpStatusCode.NotFound;
                result.Data = e.Message;
                //result.Status = e.Status;
                return result;
            }
            catch (Exception e)
            {
                result.Status = System.Net.HttpStatusCode.NotFound;
                result.Data = e.Message;
                return result;
            }
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
                    return result;
                }
            }
            catch (WebException e)
            {
                result.Status = e.Status;
                return result;
            }
            catch (Exception e)
            {
                result.Data = e.Message;
                result.Status = "Error";
                return result;
            }
        }

        /// <summary>
        /// test
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
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
            catch (WebException ex)
            {
                result.Status = System.Net.HttpStatusCode.NotFound;
                //result.Status = ((dynamic)ex.Response).StatusCode;

                result.Data = ex.Message;

                return result;
            }
        }

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
                            var control = gridView.Rows[r].Cells[i].Controls[1];

                            if (control is TextField)
                            {
                                (control as TextField).Disabled = disabled;
                            }
                            else if (control is RadTimePicker)
                            {
                                (control as RadTimePicker).TimePopupButton.Visible = !disabled;
                                (control as RadTimePicker).EnableTyping = !disabled;
                            }
                            else if (control is RadDateTimePicker)
                            {
                                (control as RadDateTimePicker).DatePopupButton.Visible = !disabled;
                                (control as RadDateTimePicker).TimePopupButton.Visible = !disabled;
                                (control as RadDateTimePicker).EnableTyping = !disabled;
                            }
                            else if (control is LinkButton)
                            {
                                (control as LinkButton).Visible = !disabled;
                            }
                        }
                        catch (Exception ex) { }
                    }
                }
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
    }
}