using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Telerik.Web.UI.Map;
using Telerik.Windows.Documents.Spreadsheet.Expressions.Functions;

namespace EMR.Data.Shared.Services
{
    public class Patient
    {
        #region Properties
        public dynamic patient_id { get; set; }
        public dynamic hospital_code { get; set; }
        public dynamic visible_patient_id { get; set; }
        public dynamic primary_patient_id { get; set; }
        public dynamic primary_hospital_code { get; set; }
        public dynamic primary_visible_patient_id { get; set; }
        public dynamic title_e { get; set; }
        public dynamic title_l { get; set; }
        public dynamic first_name_e { get; set; }
        public dynamic first_name_l { get; set; }
        public dynamic last_name_e { get; set; }
        public dynamic last_name_l { get; set; }
        public dynamic date_of_birth { get; set; }
        public dynamic gender_e { get; set; }
        public dynamic gender_l { get; set; }
        public dynamic national_id { get; set; }
        public dynamic passport { get; set; }
        public dynamic home_email { get; set; }
        public dynamic business_email { get; set; }
        public dynamic occupation_e { get; set; }
        public dynamic occupation_l { get; set; }
        public dynamic nationality_e { get; set; }
        public dynamic nationality_l { get; set; }
        public dynamic religion_e { get; set; }
        public dynamic religion_l { get; set; }
        public dynamic address_line_e { get; set; }
        public dynamic address_line_l { get; set; }
        public dynamic address_subregion_e { get; set; }
        public dynamic address_subregion_l { get; set; }
        public dynamic address_region_e { get; set; }
        public dynamic address_region_l { get; set; }
        public dynamic address_country_e { get; set; }
        public dynamic address_country_l { get; set; }
        public dynamic contact_name_e { get; set; }
        public dynamic contact_name_l { get; set; }
        public dynamic relationship_type_rcd { get; set; }
        public dynamic contact_phone_number { get; set; }
        public dynamic lu_updated { get; set; }
        #endregion
    }
    public static class PatientService
    {
        private static HttpClient http = new HttpClient() { BaseAddress = new Uri(System.Configuration.ConfigurationManager.AppSettings["WebService"]) };
        public static PatientInfo GetPatient(Guid patient_id)
        {
            Task<HttpResponseMessage> responseTask = http.GetAsync($"api/emr/demographic/{patient_id}");
            responseTask.Wait();

            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<PatientInfo>(result);
        }
        public static IEnumerable<PatientVisitInfo> GetPatientVisit(Guid patient_visit_id, string Location)
        {
            Task<HttpResponseMessage> responseTask = http.GetAsync($"api/emr/patient-visit/{Location}/{patient_visit_id}");
            responseTask.Wait();

            var result = responseTask.Result.Content.ReadAsStringAsync().Result;
            return JsonConvert.DeserializeObject<IEnumerable<PatientVisitInfo>>(result);
        }
    }
}
