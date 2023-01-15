using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;

namespace EmrLib.Ris
{
    public class ImagingEncode
    {
        private HttpClient http = new HttpClient();
        public ImagingEncode(string apiUrl) { http.BaseAddress = new Uri(apiUrl); }
        public ImagingEncodeResponse GetImagingEncode(string userid, string accnumber, string patientid)
        {
            var token = Token(new ImagingEncodeRequest() { userid = userid, accnumber = accnumber, patientid = patientid });
            var imagingEncode = Study(token);
            return JsonConvert.DeserializeObject<ImagingEncodeResponse>(imagingEncode);
        }
        public string Token(ImagingEncodeRequest content)
        {
            var responseTask = http.PostAsync($"/api/rad/token", new StringContent(JsonConvert.SerializeObject(content), Encoding.UTF8, "application/json"));
            responseTask.Wait();
            return responseTask.Result.Content?.ReadAsStringAsync().Result;
        }
        public string Study(string token)
        {
            var responseTask = http.PostAsync($"/api/rad/study", new StringContent(token, Encoding.UTF8, "application/json"));
            responseTask.Wait();
            return responseTask.Result.Content?.ReadAsStringAsync().Result;
        }
    }
}
