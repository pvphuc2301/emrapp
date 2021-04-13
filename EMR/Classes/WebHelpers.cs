﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Script.Serialization;

namespace EMR 
{
    public static class WebHelpers
    {
        public static string URL = "http://172.16.0.78:8082/";
        public static DataTable GetJSONToDataTable(string JSONData)
        {

            try
            {
                dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(JSONData);
                DataTable dt = JsonConvert.DeserializeObject<DataTable>(Convert.ToString(jsonObject));
                return dt;
            }
            catch (Exception)
            {
                JSONData = "[" + JSONData + "]";
                dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(JSONData);
                DataTable dt = JsonConvert.DeserializeObject<DataTable>(Convert.ToString(jsonObject));
                return dt;
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

                        obj.GetType().GetProperty(col.ToString()).SetValue(obj, Convert.ToString(tbl.Rows[0].Field<dynamic>(col)));
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
        /// 
        /// </summary>
        /// <param name="url"></param>
        /// <param name="jsonContent">
        /// { 
        ///     "parameter1": "value1",
        ///     "parameter2": "value2",
        ///     "...": "value",
        ///     
        /// }
        /// </param>
        /// <returns></returns>
        public static string PostAPI(string url, dynamic obj)
        {
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

                    //var res = response1;
                    reader.Close();
                    dataStream.Close();
                    response.Close();
                    return responseFromServer;

                }
            }
            catch (WebException ex)
            {
                //MessageBox.Show(ex.Message);
                return null;
            }
        }

        public static string PostAPI(string url)
        {
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
                    return responseFromServer;

                }
            }
            catch (WebException ex)
            {
                //MessageBox.Show(ex.Message);
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="url"></param>
        /// <param name="jsonContent">
        /// { 
        ///     "parameter1": "value1",
        ///     "parameter2": "value2",
        ///     "...": "value",
        ///     
        /// }
        /// </param>
        /// <returns></returns>
        //public static string PostAPI(string url, dynamic obj)
        //{
        //    var jsonContent = new JavaScriptSerializer().Serialize(obj);

        //    url = URL + url;
        //    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        //    request.Method = WebRequestMethods.Http.Post;
        //    // request.Headers.Add("Authentication", authToken);
        //    System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
        //    Byte[] byteArray = encoding.GetBytes(jsonContent);
        //    request.ContentLength = byteArray.Length;
        //    request.ContentType = "application/json";
        //    using (Stream dataStream = request.GetRequestStream())
        //    {
        //        dataStream.Write(byteArray, 0, byteArray.Length);
        //    }

        //    long length = 0;
        //    try
        //    {
        //        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        //        {
        //            length = response.ContentLength;
        //            WebResponse response1 = request.GetResponse();
        //            Stream dataStream = response1.GetResponseStream();
        //            StreamReader reader = new StreamReader(dataStream);
        //            var responseFromServer = reader.ReadToEnd();

        //            //var res = response1;
        //            reader.Close();
        //            dataStream.Close();
        //            response.Close();
        //            return responseFromServer;

        //        }
        //    }
        //    catch (WebException ex)
        //    {
        //        //MessageBox.Show(ex.Message);
        //        return null;
        //    }
        //}

        //public static string GetAPI(string url, string content)
        //{
        //    var data = new StringContent(json, Encoding.UTF8, "application/json");

        //}

        /// <summary>
        /// test
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
        public static string GetAPI(string url)
        {
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
                    return responseFromServer;
                }
            }
            catch (WebException ex)
            {
                //MessageBox.Show(ex.Message);
                return null;
            }
        }
    }
}