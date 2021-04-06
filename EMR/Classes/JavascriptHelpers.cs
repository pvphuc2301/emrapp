using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;


    public static class JavascriptHelpers
    {
        public static string URL = "http://172.16.0.78:8082/";
        public static DataTable GetJSONToDataTable(string JSONData)
        {
            dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(JSONData);
            DataTable dt = JsonConvert.DeserializeObject<DataTable>(Convert.ToString(jsonObject));
            return dt;
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
