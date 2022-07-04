﻿using System;
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
        dynamic[] Update(string locParam);
        dynamic[] Delete(string userNameParam, string locParam);
        DataTable Logs(string loc);
    }
    public abstract class EmrDocument : IEmrDocument
    {
        public dynamic document_id { get; set; }

        public dynamic user_name { get; set; }

        public dynamic status { get; set; }

        public dynamic amend_reason { get; set; }

        public abstract string api { get; }
        public EmrDocument(string document_id, string location)
        {
            _ = document_id ?? throw new NullReferenceException("document id cannot be null");
            _ = location ?? throw new NullReferenceException("location cannot be null");
            dynamic response = WebHelpers.GetAPI($"{api}/get/{location}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                WebHelpers.BindingDatafield(WebHelpers.GetJSONToDataTable(response.Data), this);
            }
        }
        public EmrDocument(string document_id, string location, string document_log_id)
        {
            _ = document_id ?? throw new NullReferenceException("document id cannot be null");
            _ = location ?? throw new NullReferenceException("location cannot be null");

            dynamic res = string.IsNullOrEmpty(document_log_id) ? WebHelpers.GetAPI($"{api}/get/{location}/{document_id}") : WebHelpers.GetAPI($"{api}/get-log/{location}/{document_log_id}");

            if (res.Status == System.Net.HttpStatusCode.OK)
            {
                WebHelpers.BindingDatafield(WebHelpers.GetJSONToDataTable(res.Data), this);
            }
        }
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