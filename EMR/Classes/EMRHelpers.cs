using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Classes
{
    public static class EMRHelpers
    {
        public static string DocumentLogInfor(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            return WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
        }
        public static string DocumentLogUrl(string PAGE_URL, object doc_log_id)
        {
            return PAGE_URL + $"&docIdLog={doc_log_id}";
        }

        public static string JSON_STR_SEPARATION(dynamic json)
        {
            if (json == null) return null;
            DataTable dt = WebHelpers.GetJSONToDataTable(json);
            string value = "";
            foreach (DataRow dr in dt.Rows)
            {
                if (Convert.ToString(dr["code"]) == "OTH")
                    value += $"Trường hợp khác/ Other: ";
                value += $"{dr["desc"]}<br>";
            }
            return value;
        }
        /// <summary>
        /// <b>Description</b> <br/>   
        /// - Replace \n to br tag <br/>   
        /// <b>Author: </b>phut.phan <br/>
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static string ConvertToHtml(this string str)
        {
            if (!string.IsNullOrEmpty(str))
            {
                str = str.Replace("\n", "<br>");
                return str;
            }
            return str;
        }
    }
}
