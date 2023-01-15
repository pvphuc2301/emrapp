using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace EmrLib.Session
{
    public class SessionChecker
    {
        private static HttpClient http = new HttpClient(); //{ BaseAddress = new Uri(System.Configuration.ConfigurationManager.AppSettings["WebService"]) };
        public static HttpResponseMessage ClearSession(string location, Guid document_id)
        {
            StringContent httpContent = new StringContent("", System.Text.Encoding.UTF8, "application/json");
            Task<HttpResponseMessage> responseTask = http.PostAsync($"http://172.16.0.78:8088/api/emr/clear-session/{location}/{document_id}", httpContent);
            responseTask.Wait();
            return responseTask.Result;
        }
        public static BlockedSession FindBlockedSession(string location, Guid document_id, Guid employee_id)
        {
            //if (Location == LocationChanged && docStatus == DocumentStatus.FINAL)
            //{
            //    return true;
            //}
            //if (document_status == DocumentStatus.DRAFT && AccessAuthorize == AccessAuthorize.FullAccess)
            //{
            Task<HttpResponseMessage> responseTask = http.GetAsync($"http://172.16.0.78:8088/api/emr/check-session/{location}/{document_id}/{employee_id}");
            responseTask.Wait();
            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            var emrSession = JsonConvert.DeserializeObject<EmrSession>(result);
            if (emrSession.Status)
            {
                return null;
            }
            else // currently blocked by other user
            {
                return emrSession.Items;
            }

            //if (result.Status == System.Net.HttpStatusCode.OK)
            //{
            //    dynamic obj = JObject.Parse(result.Data);
            //    dynamic employee = obj["items"];

            //    //false - open denied
            //    if (Convert.ToBoolean(obj.status))
            //    {
            //        return true;
            //    }

            //    string content = "window.parent.ShowBlock(\"This document is blocked by " + employee.full_name_e + "\");";

            //    return false;
            //}
            //else
            //{
            //    return false;
            //}
            //}
            //return true;
            //    }

        }
    }
}
