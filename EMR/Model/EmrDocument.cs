using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Model
{
    public interface IEmrDocument
    {
        dynamic document_id { get; }
        dynamic user_name { get; }
        dynamic status { get; }
        dynamic amend_reason { get; }
        dynamic created_user_id { get; set; }
        dynamic created_name_e { get; set; }
        dynamic created_name_l { get; set; }
        dynamic created_date_time { get; set; }
        dynamic modified_user_id { get; set; }
        dynamic modified_name_e { get; set; }
        dynamic modified_name_l { get; set; }
        dynamic modified_date_time { get; set; }
        dynamic submited_user_id { get; set; }
        dynamic submited_name_e { get; set; }
        dynamic submited_name_l { get; set; }
        dynamic submited_date_time { get; set; }
        dynamic signed_user_id { get; set; }
        dynamic signed_name_e { get; set; }
        dynamic signed_name_l { get; set; }
        dynamic signed_date_time { get; set; }
        dynamic delete_user_id { get; set; }
        dynamic delete_name_e { get; set; }
        dynamic delete_name_l { get; set; }
        dynamic delete_date_time { get; set; }
        dynamic[] Update(string locParam);
        dynamic[] Delete(string userNameParam, string locParam);
        DataTable Logs(string loc);
    }
    public abstract class EmrDocument : IEmrDocument
    {
        #region properties
        public dynamic document_id { get; set; }
        public dynamic user_name { get; set; }
        public dynamic status { get; set; }
        public dynamic amend_reason { get; set; }
        public abstract string api { get; }
        public dynamic created_user_id  { get; set; }
        public dynamic created_name_e  { get; set; }
        public dynamic created_name_l  { get; set; }
        public dynamic created_date_time  { get; set; }
        public dynamic modified_user_id  { get; set; }
        public dynamic modified_name_e  { get; set; }
        public dynamic modified_name_l  { get; set; }
        public dynamic modified_date_time  { get; set; }
        public dynamic submited_user_id  { get; set; }
        public dynamic submited_name_e  { get; set; }
        public dynamic submited_name_l  { get; set; }
        public dynamic submited_date_time  { get; set; }
        public dynamic signed_user_id  { get; set; }
        public dynamic signed_name_e  { get; set; }
        public dynamic signed_name_l  { get; set; }
        public dynamic signed_date_time  { get; set; }
        public dynamic delete_user_id  { get; set; }
        public dynamic delete_name_e  { get; set; }
        public dynamic delete_name_l  { get; set; }
        public dynamic delete_date_time  { get; set; }
        public dynamic document_log_id { get; set; }
        #endregion
        public EmrDocument()
        {

        }
        public EmrDocument(string document_id, string location)
        {
            _ = document_id ?? throw new NullReferenceException("document id cannot be null");
            _ = location ?? throw new NullReferenceException("location cannot be null");
            dynamic response = WebHelpers.GetAPI($"{api}/get/{location}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                WebHelpers.BindingDatafield(WebHelpers.GetJSONToDataTable(response.Data), this);
                if (Logs(location)?.Rows.Count == 1)
                {
                    DefaultDocument();
                }
            }
        }
        public EmrDocument(string document_id, string location, string document_log_id)
        {
            _ = document_id ?? throw new NullReferenceException("document id cannot be null");
            _ = location ?? throw new NullReferenceException("location cannot be null");

            dynamic res = string.IsNullOrEmpty(document_log_id) ? WebHelpers.GetAPI($"{api}/get/{location}/{document_id}") : WebHelpers.GetAPI($"{api}/get-log/{location}/{document_log_id}");
            this.document_log_id = document_log_id;
            if (res.Status == System.Net.HttpStatusCode.OK)
            {
                WebHelpers.BindingDatafield(WebHelpers.GetJSONToDataTable(res.Data), this);
                if (Logs(location)?.Rows.Count == 1)
                {
                    DefaultDocument();
                }
            }
        }
        protected abstract void DefaultDocument();
        /// <returns>Message: <para>[0] - Form message</para> <para>[1] - Log message</para></returns>
        public dynamic[] Delete(string userNameParam, string locParam)
        {
            dynamic[] message = new dynamic[2];
            try
            {
                _ = userNameParam ?? throw new ArgumentNullException("User Name cannot be null");
                _ = document_id ?? throw new ArgumentNullException("document id cannot be null");
                _ = locParam ?? throw new ArgumentNullException("location cannot be null");

                dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{locParam}/{userNameParam}/{document_id}");

                message[0] = response;

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response1 = WebHelpers.PostAPI($"{api}/log/{locParam}/{document_id}");
                    message[1] = response1;
                }

                return message;
            }
            catch (Exception ex)
            {
                dynamic response = new System.Dynamic.ExpandoObject();
                response.Status = System.Net.HttpStatusCode.NotFound;
                response.Data = ex.Message;

                message[0] = response;
                return message;
            }
        }
        public DataTable Logs(string loc)
        {
            _ = loc ?? throw new NoNullAllowedException("Location cannot be null");
            dynamic res = WebHelpers.GetAPI($"{api}/get-log-list/{loc}/{document_id}");
            DataTable db = new DataTable();
            if (res.Status == System.Net.HttpStatusCode.OK)
            {
                db = WebHelpers.GetJSONToDataTable(res.Data);
            }
            return db;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns>Message: <para>[0] - Form message</para> <para>[1] - Log message</para></returns>
        public dynamic[] Update(string locParam)
        {
            dynamic[] message = new dynamic[2];

            dynamic response1 = WebHelpers.PostAPI($"{api}/edit/{locParam}", this);
            message[0] = response1;

            if (response1.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response2 = WebHelpers.PostAPI($"{api}/log/{locParam}/{document_id}");
                message[1] = response2;
            }

            return message;
        }
    }
}
