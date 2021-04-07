using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;


    public static class WebHelpers
{
        public static string URL = "http://172.16.0.78:8082/";
        public static DataTable GetJSONToDataTable(string JSONData)
        {
            dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(JSONData);
            DataTable dt = JsonConvert.DeserializeObject<DataTable>(Convert.ToString(jsonObject));
            return dt;
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
    public static object BindingDatafield(DataTable tbl, object obj)
    {
        /* 1. Get API trả về 1 Datatable: tbl
           2.Từ tbl  gán giá trị cho 1 Object: obj thuộc Class Form XYZ 
           3. Lấy toàn bộ dữ liệu trong obj để hiển thị lên các Textbox/Label trên các Form.*/
        foreach (DataColumn col in tbl.Columns)
        {
            if (obj.GetType().GetProperty(col.ToString()) != null)
            {
                if (tbl.Rows[0].Field<dynamic>(col) != null)
                {
                    //string temp2 = obj.GetType().GetProperty(col.ToString()).Name.ToString();
                    //string temp1 =  tbl.Rows[0].Field<dynamic>(col);
                    //obj.GetType().GetProperty(col.ToString()).SetValue(obj, tbl.Rows[0].Field<dynamic>(col));

                    obj.GetType().GetProperty(col.ToString()).SetValue(obj, Convert.ToString(tbl.Rows[0].Field<dynamic>(col)));
                }
            }
        }
        return obj;

    }
        internal static string GetAPI(object p)
    {
        throw new NotImplementedException();
    }
   

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
