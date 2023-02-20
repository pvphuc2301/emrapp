using EMR.Classes;
using EMR.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using Telerik.Web.UI.Map;

namespace EMR.Services
{
    public class EmrLogItemModel
    {
        public string document_log_id { get; set; }
        public DateTime? lu_date_time { get; set; }
        public string document_id { get; set; }
        public string model_id { get; set; }
        public string patient_visit_id { get; set; }
        public string status { get; set; }
        public string amend_reason { get; set; }
        public string created_user_id { get; set; }
        public string created_name_e { get; set; }
        public string created_name_l { get; set; }
        public DateTime? created_date_time { get; set; }
        public string modified_user_id { get; set; }
        public string modified_name_e { get; set; }
        public string modified_name_l { get; set; }
        public DateTime? modified_date_time { get; set; }
        public string submited_user_id { get; set; }
        public string submited_name_e { get; set; }
        public string submited_name_l { get; set; }
        public DateTime? submited_date_time { get; set; }
        public string signed_user_id { get; set; }
        public string signed_name_e { get; set; }
        public string signed_name_l { get; set; }
        public DateTime? signed_date_time { get; set; }
        public string delete_user_id { get; set; }
        public string delete_name_e { get; set; }
        public string delete_name_l { get; set; }
        public DateTime? delete_date_time { get; set; }
        public string document_type_rcd { get; set; }
        public int? documentid { get; set; }
    }
    public class EmrLogModel
    {
        public IEnumerable<EmrLogItemModel> Items { get; set; }
        public string LastUpdatedUser { get; set; }
        public DateTime? LastUpdatedDateTime { get; set; }
        public EmrLogModel(IEnumerable<EmrLogItemModel> items)
        {
            Items = items;
            if (items.Count() > 0)
            {
                EmrLogItemModel emrLogItemModel = items.ElementAt(0);
                if (emrLogItemModel.modified_user_id != null)
                {
                    LastUpdatedUser = emrLogItemModel.modified_name_e;
                    LastUpdatedDateTime = emrLogItemModel.modified_date_time;
                }
                LastUpdatedUser = emrLogItemModel.created_name_e;
                LastUpdatedDateTime = emrLogItemModel.created_date_time;
            }
        }
    }
    public static class EmrService
    {
        public static EmrApiModel GetEmrApi(string location, string modelId)
        {
            try
            {
                var result = WebService.Get($"api/emr/get-api/{location}/{modelId}");
                if (result.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    return JsonConvert.DeserializeObject<EmrApiModel>(result.Content);
                }
                return null;
            }
            catch(Exception)
            {
                throw;
            }
        }
        public static EmrLogModel GetLogList(string model, string location, string documentId)
        {
            var result = WebService.Get($"{model}/get-log-list/{location}/{documentId}");
            if(result.StatusCode == System.Net.HttpStatusCode.OK)
            {
                var items = JsonConvert.DeserializeObject<List<EmrLogItemModel>>(result.Content);
                return new EmrLogModel(items);
            }
            return null;
        }
        public static void GetMedicalHistory(string location, string patientId)
        {
            WebServiceResponse response = WebService.Get($"api/omr/get-medical-history/{location}/{patientId}");
            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                //return JsonConvert.DeserializeObject(response.Content);
            }
        }
    }
}
