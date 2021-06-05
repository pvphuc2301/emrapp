using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
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

        internal static string ConvertDateTime(dynamic date_of_discharge, string dateTime)
        {
            if (date_of_discharge == null) return "";
            return date_of_discharge.ToString(dateTime);
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
            dynamic result = new System.Dynamic.ExpandoObject();

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
                result.Details = e.Response.ResponseUri;
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

        public static class ResponseStatus
        {
            public static string OK = "OK";
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
                            if (gridView.Rows[r].Cells[i].Controls[1] is TextField)
                            {
                                TextField text2 = gridView.Rows[r].Cells[i].Controls[1] as TextField;
                                text2.Disabled = disabled;
                            }
                            else if (gridView.Rows[r].Cells[i].Controls[1] is RadTimePicker)
                            {
                                RadTimePicker text2 = gridView.Rows[r].Cells[i].Controls[1] as RadTimePicker;
                                text2.TimePopupButton.Visible = !disabled;
                                text2.EnableTyping = !disabled;
                            }
                            else if (gridView.Rows[r].Cells[i].Controls[1] is RadDateTimePicker)
                            {
                                RadDateTimePicker text2 = gridView.Rows[r].Cells[i].Controls[1] as RadDateTimePicker;
                                text2.DatePopupButton.Visible = !disabled;
                                text2.TimePopupButton.Visible = !disabled;
                                text2.EnableTyping = !disabled;
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
                if (datetime != null)
                {
                    radDatePicker.SelectedDate = datetime;
                }
            }
            catch (Exception ex) { }
        }
    }
}