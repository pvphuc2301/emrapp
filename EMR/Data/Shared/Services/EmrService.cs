using EMR.Data.AIH.Model;
using EMR.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;

using System.Text;
using System.Threading.Tasks;
using System.Web;
using Telerik.Web.UI.Map;
using Telerik.Windows.Documents.Spreadsheet.Expressions.Functions;

namespace EMR.Data.Shared.Services
{
    public class EmrService<T> where T : new()
    {
        public string Location { get; set; }
        private HttpClient http = new HttpClient() { BaseAddress = new Uri(System.Configuration.ConfigurationManager.AppSettings["WebService"]) };
        public T Get(Guid document_id)
        {
            T Model = new T();
            Task<HttpResponseMessage> responseTask = http.GetAsync($"{(Model as EmrDocument).api}/get/{Location}/{document_id}");
            responseTask.Wait();
            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            Model = JsonConvert.DeserializeObject<T>(result);
            return Model;
        }
        public IEnumerable<T> GetLogs(Guid document_id, string location)
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


        public T Get(EmrDocument document, string location)
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
        public HttpResponseMessage Log(EmrDocument document, string location)
        {
            StringContent httpContent = new StringContent("", System.Text.Encoding.UTF8, "application/json");
            Task<HttpResponseMessage> responseTask = http.PostAsync($"{document.api}/log/{location}/{document.document_id}", httpContent);
            responseTask.Wait();
            return responseTask.Result;
        }
        public HttpResponseMessage Update(EmrDocument document, string location)
        {
            string json = JsonConvert.SerializeObject(document);
            StringContent httpContent = new StringContent(json, System.Text.Encoding.UTF8, "application/json");
            Task<HttpResponseMessage> responseTask = http.PostAsync($"{document.api}/edit/{location}", httpContent);
            responseTask.Wait();
            return responseTask.Result;
        }
        async Task<T> GetURI(Uri u)
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
