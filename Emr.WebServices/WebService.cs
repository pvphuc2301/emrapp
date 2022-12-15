using System;
using System.IO;
using System.Net;
using Newtonsoft.Json;

namespace Emr.WebServices
{
    public class WebService
    {
        public string BaseAddress { get; set; }
        public WebServiceResponse Get(string url)
        {
            url = BaseAddress + url;
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

                    return new WebServiceResponse()
                    {
                        IsSuccessStatusCode = response.StatusCode == HttpStatusCode.OK,
                        Content = responseFromServer
                    };
                }
            }
            catch (Exception ex)
            {
                return new WebServiceResponse()
                {
                    IsSuccessStatusCode = false,
                    Content = ex.Message
                };
            }
        }
        public WebServiceResponse Post(string url, object ContentBody)
        {
            var jsonContent = JsonConvert.SerializeObject(ContentBody);
            url = BaseAddress + url;
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

                    return new WebServiceResponse()
                    {
                        IsSuccessStatusCode = response.StatusCode == HttpStatusCode.OK,
                        Content = responseFromServer
                    };
                }
            }
            catch (WebException ex)
            {
                return new WebServiceResponse()
                {
                    IsSuccessStatusCode = false,
                    Content = ex.Message
                };
            }
        }
    }
}
