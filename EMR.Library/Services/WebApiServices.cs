using EMR.Library.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Library.Services
{
    public class WebApiServices
    {
        private static string JSON_ERROR = "error";
        private static string BaseAddress { get; set; } = "http://172.16.0.78:8088";
        private static string SendRequest(string Method, string url, string token = null)
        {
            HttpWebResponse response = null;
            url = BaseAddress + url;
            
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            if (token != null)
            {
                request.Headers.Add("Authorization", "Bearer " + token);
            }

            request.Method = Method;
            request.ContentType = "application/json";
            long length = 0;
            try
            {
                using (response = (HttpWebResponse)request.GetResponse())
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
                if (ex.Response == null)
                    return JSON_ERROR;

                using (var errorResponse = (HttpWebResponse)ex.Response)
                {
                    using (var reader = new StreamReader(errorResponse.GetResponseStream()))
                    {
                        return reader.ReadToEnd(); //expected error from JSON
                    }
                }
            }
        }
        public static List<PastMedicalHistoryModel> get_past_medical_histories(string location, string patientId)
        {
            string result = SendRequest("GET", $"/api/omr/get-medical-history/{location}/{patientId}");
            return JsonConvert.DeserializeObject<List<PastMedicalHistoryModel>>(result);
        }
    }
}
