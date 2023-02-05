using System;
using System.IO;
using System.Net;
using System.Web.Script.Serialization;

namespace EMR.Classes
{
    public class WebServiceResponse
    {
        public HttpStatusCode StatusCode { get; set; }
        public string Content { get; set; }
    }
    public class WebService
    {
        private static string JSON_ERROR = "error";
        private static string BaseAddress = System.Configuration.ConfigurationManager.AppSettings["WebService"];
        public static WebServiceResponse Post(string url, dynamic obj)
        {
            HttpWebResponse response = null;
            var jsonContent = new JavaScriptSerializer().Serialize(obj);
            url = BaseAddress + url;

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = WebRequestMethods.Http.Post;
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
                    return new WebServiceResponse()
                    {
                        StatusCode = response.StatusCode,
                        Content = responseFromServer
                    };
                }
            }
            catch (WebException ex)
            {
                if (ex.Response == null)
                    return new WebServiceResponse()
                    {
                        StatusCode = HttpStatusCode.BadRequest,
                        Content = JSON_ERROR
                    };

                using (var errorResponse = (HttpWebResponse)ex.Response)
                {
                    using (var reader = new StreamReader(errorResponse.GetResponseStream()))
                    {
                        return new WebServiceResponse()
                        {
                            StatusCode = errorResponse.StatusCode,
                            Content = reader.ReadToEnd() //expected error from JSON
                        };
                    }
                }
            }
        }
        public static WebServiceResponse Get(string url, string token = null)
        {
            HttpWebResponse response = null;
            url = BaseAddress + url;

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            if (token != null)
            {
                request.Headers.Add("Authorization", "Bearer " + token);
            }

            request.Method = WebRequestMethods.Http.Get;
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
                    return new WebServiceResponse()
                    {
                        StatusCode = response.StatusCode,
                        Content = responseFromServer
                    };
                }
            }
            catch (WebException ex)
            {
                if (ex.Response == null)
                    return new WebServiceResponse()
                    {
                        StatusCode = HttpStatusCode.BadRequest,
                        Content = JSON_ERROR
                    };

                using (var errorResponse = (HttpWebResponse)ex.Response)
                {
                    using (var reader = new StreamReader(errorResponse.GetResponseStream()))
                    {
                        return new WebServiceResponse()
                        {
                            StatusCode = errorResponse.StatusCode,
                            Content = reader.ReadToEnd() //expected error from JSON
                        };
                    }
                }
            }
        }
        //public static List<PastMedicalHistoryModel> get_past_medical_histories(string location, string patientId)
        //{
        //    string result = SendRequest("GET", $"/api/omr/get-medical-history/{location}/{patientId}");
        //    return JsonConvert.DeserializeObject<List<PastMedicalHistoryModel>>(result);
        //}
    }
}