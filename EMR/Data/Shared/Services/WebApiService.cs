using EMR.Data.Shared.Models;
using EMR.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.Shared.Services
{
    public class PatientHistory
    {
        public string id { get; set; }
        public string visible_patient_id { get; set; }
        public string user_name { get; set; }
        public string patient_name { get; set; }
        public string gender { get; set; }
        public DateTime date_of_birth { get; set; }
        public DateTime lu_date_time { get; set; }
    }
    public class DemographicSearchModel
    {
        public string patient_id { get; set; }
        public string visible_patient_id { get; set; }
        public string patient_name_e { get; set; }
        public string patient_name_l { get; set; }
        public string date_of_birth { get; set; }
        public string gender_e { get; set; }
        public string gender_l { get; set; }
        public string work_queue_e { get; set; }
        public string work_queue_l { get; set; }
        public string adtending_doctor_e { get; set; }
        public string adtending_doctor_l { get; set; }
        public string start_date_time { get; set; }
        public string wq_status_e { get; set; }
        public string wq_status_l { get; set; }
    }
    public class WebApiService
    {
        private HttpClient http = new HttpClient() { BaseAddress = new Uri(System.Configuration.ConfigurationManager.AppSettings["WebService"]) };
        public DataPaging<OutpatientTodayListModel> get_outpatient_today_list(string keyword, int pageIndex, int pageSize)
        {
            Task<HttpResponseMessage> responseTask = http.GetAsync($"api/Patient/outpatient-today-list?keyword={keyword}&pageIndex={pageIndex}&pageSize={pageSize}");
            responseTask.Wait();
            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<DataPaging<OutpatientTodayListModel>>(result);
        }
        public DataPaging<AppointmentTodayListModel> get_appointment_today_list(string keyword, int pageIndex, int pageSize)
        {
            Task<HttpResponseMessage> responseTask = http.GetAsync($"api/Patient/appoinment-today-list?keyword={keyword}&pageIndex={pageIndex}&pageSize={pageSize}");
            responseTask.Wait();
            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<DataPaging<AppointmentTodayListModel>>(result);
        }
        public IEnumerable<DemographicSearchModel> get_demographic_search(int page_index, int page_size, string keyword)
        {
            Task<HttpResponseMessage> responseTask = http.GetAsync($"api/Patient/demographic-search?pageIndex={page_index}&pageSize={page_size}&keyword={keyword}");
            responseTask.Wait();
            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<IEnumerable<DemographicSearchModel>>(result);
        }
        public IEnumerable<PatientHistory> get_patient_histories(int day,string username)
        {
            Task<HttpResponseMessage> responseTask = http.GetAsync($"api/emr/patient-history-list?day={day}&user_name={username}");
            responseTask.Wait();
            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<IEnumerable<PatientHistory>>(result);
        }

        public HttpResponseMessage emr_clear_session(Guid document_id, string loc)
        {
            StringContent httpContent = new StringContent("", System.Text.Encoding.UTF8, "application/json");
            Task<HttpResponseMessage> responseTask = http.PostAsync($"api/emr/clear-session/{loc}/{document_id}", httpContent);
            responseTask.Wait();
            return responseTask.Result;
        }
    }
}
