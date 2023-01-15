using EMR.Data.AIH.Model;
using EMR.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace EMR.Data.Shared.Services
{
    public static class EmrService<T> where T : new()
    {
        private static HttpClient http = new HttpClient() { BaseAddress = new Uri(System.Configuration.ConfigurationManager.AppSettings["WebService"]) };
        public static T Get(Guid document_id, string location)
        {
            T Model = new T();
            Task<HttpResponseMessage> responseTask = http.GetAsync($"{(Model as EmrDocument).api}/get/{location}/{document_id}");
            responseTask.Wait();
            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            Model = JsonConvert.DeserializeObject<T>(result);
            return Model;
        }
        public static T GetLog(Guid document_id, string location)
        {
            T Model = new T();
            Task<HttpResponseMessage> responseTask = http.GetAsync($"{(Model as EmrDocument).api}/get-log/{location}/{document_id}");
            responseTask.Wait();
            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            Model = JsonConvert.DeserializeObject<T>(result);
            return Model;
        }
        public static IEnumerable<T> GetLogs(Guid document_id, string location)
        {
            T Model = new T();
            Task<HttpResponseMessage> responseTask = http.GetAsync($"{(Model as EmrDocument).api}/get-log-list/{location}/{document_id}");
            responseTask.Wait();
            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<IEnumerable<T>>(result);
        }
        //public HttpResponseMessage Update(EmrDocument document, string location)
        //{

        //    string json = JsonConvert.SerializeObject(document);
        //    StringContent httpContent = new StringContent(json, System.Text.Encoding.UTF8, "application/json");
        //    Task<HttpResponseMessage> responseTask = http.PostAsync($"{document.api}/edit/{location}", httpContent);
        //    responseTask.Wait();
        //    return responseTask.Result;
        //}
        public static T Get(EmrDocument document, string location)
        {
            Task<HttpResponseMessage> responseTask = http.GetAsync($"{document.api}/get/{location}/{document.document_id}");
            responseTask.Wait();

            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<T>(result);

            //var t = Task.Run(() => GetURI(new Uri($"{document.api}/get/{location}/{document.document_id}")));
            //t.Wait();
            //var result = t.Result;

            //return result;
        }
        public static HttpResponseMessage Log(EmrDocument document, string location)
        {
            StringContent httpContent = new StringContent("", System.Text.Encoding.UTF8, "application/json");
            Task<HttpResponseMessage> responseTask = http.PostAsync($"{document.api}/log/{location}/{document.document_id}", httpContent);
            responseTask.Wait();
            return responseTask.Result;
        }
        public static HttpResponseMessage Update(EmrDocument document, string location)
        {
            string json = JsonConvert.SerializeObject(document);
            StringContent httpContent = new StringContent(json, System.Text.Encoding.UTF8, "application/json");
            Task<HttpResponseMessage> responseTask = http.PostAsync($"{document.api}/edit/{location}", httpContent);
            responseTask.Wait();
            return responseTask.Result;
        }
        async static Task<T> GetURI(Uri u)
        {
            var response = string.Empty;
            using (var client = new HttpClient())
            {
                HttpResponseMessage result = await client.GetAsync(u);
                if (result.IsSuccessStatusCode)
                {
                    response = await result.Content.ReadAsStringAsync();
                }
            }
            return JsonConvert.DeserializeObject<T>(response);
        }
    }
}
