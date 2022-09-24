using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

//namespace System.Web.UI.HtmlControls
//{ 
//    public partial class HtmlInputRadioButton
//    {
//        public static string Value(string ControlID) {

//            return String.Empty;
//        }
//    }
//}
namespace EMR.Classes
{
    
    public static class EMRHelpers
    {
        #region DataTable

        #endregion
        /// <summary>
        /// <b>Description</b> <br/>   
        /// - value is null or can not convert to bool -> resultFalse <br/>   
        /// - value is true -> resultTrue <br/>   
        /// - value is false -> resultFalse <br/>   
        /// <b>Author: </b>phut.phan <br/>
        /// </summary>
        /// <param name="value"></param>
        /// <param name="resultTrue"></param>
        /// <param name="resultFalse"></param>
        /// <returns></returns>
        public static string ConvertBooleanToString(bool? value, string resultTrue, string resultFalse)
        {
            string result = string.Empty;
            if (value == null)
            {
                return result;
            }
            if (bool.TryParse(value.ToString(), out bool parseResult))
            {
                result = parseResult ? resultTrue : resultFalse;
            }
            return result;
        }
        /// <summary>
        /// <b>Description</b> <br/>   
        /// - Convert string to Object <br/>   
        /// <b>Author: </b>phut.phan <br/>
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static object ConvertToObject(this string value) => JsonConvert.DeserializeObject(value);
        /// <summary>
        /// <b>Description</b> <br/>   
        /// - Convert string to DataTable <br/>   
        /// <b>Author: </b>phut.phan <br/>
        /// </summary>
        /// <param name="JSONData"></param>
        /// <returns></returns>
        public static DataTable ConvertToDataTable(this string JSONData)
        {
            if (JSONData == null) { return null; }
            DataTable dt;
            dynamic jsonObject = null;

            if (JSONData.Substring(0, 1) == "[")
            {
                jsonObject = JsonConvert.DeserializeObject(JSONData);
            }
            else if (JSONData.Substring(0, 1) == "{")
            {
                JSONData = "[" + JSONData + "]";
                jsonObject = JsonConvert.DeserializeObject(JSONData);
            }

            dt = JsonConvert.DeserializeObject<DataTable>(Convert.ToString(jsonObject));
            return dt;
        }
        #region HtmlForm
        /// <summary>
        /// <b>Description</b> <br/>   
        /// - Find Checkbox in HtmlForm <br/>
        /// <b>Author: </b>phut.phan <br/>
        /// </summary>
        /// <param name="HtmlForm"></param>
        /// <param name="CheckboxId"></param>
        /// <param name="DataTable"></param>
        /// <param name="key"></param>
        /// <param name="Prefix"></param>
        public static void BindingInputCheckBox(this HtmlForm HtmlForm, string CheckboxId, DataTable DataTable, string key = "code", string Prefix = "cb")
        {
            if (DataTable != null && CheckboxId != null)
            {
                foreach (DataRow row in DataTable.Rows)
                {
                    try
                    {
                        ((HtmlInputCheckBox)HtmlForm.FindControl(Prefix + "_" + CheckboxId + "_" + row.Field<dynamic>(key).ToLower())).Checked = true;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }
        public static void BindingInputCheckBox(this HtmlForm HtmlForm, string CheckboxId, DataTable DataTable, Func<KeyValuePair<string, object>, int> callback, string key = "code", string Prefix = "cb")
        {
            if (DataTable != null && CheckboxId != null)
            {
                foreach (DataRow row in DataTable.Rows)
                {
                    try
                    {
                        string code = row.Field<dynamic>(key).ToLower();
                        var control = HtmlForm.FindControl(Prefix + "_" + CheckboxId + "_" + code);
                        ((HtmlInputCheckBox)control).Checked = true;
                        callback(new KeyValuePair<string, object>(row.Field<dynamic>(key).ToLower(), row.Field<string>("desc").ToString()));
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }
        public static void BindingInputRadioButton(this HtmlForm HtmlForm, string ControlID, string Prefix = "rad")
        {
            dynamic control = HtmlForm.FindControl(Prefix + "_" + ControlID);
            if (control != null)
            {
                ((HtmlInputRadioButton)control).Checked = true;
            }
            //if (defaultValue != null)
            //{
            //    control = HtmlForm.FindControl(ControlID + defaultValue);
            //    if (control != null)
            //    {
            //        ((HtmlInputRadioButton)control).Checked = true;
            //    }
            //}
        }
        public static string HtmlInputRadioButton(this HtmlForm HtmlForm, string ControlID, Dictionary<string, string> DataSource, string Prefix = "rad")
        {
            foreach (KeyValuePair<string, string> code in DataSource)
            {
                if (((HtmlInputRadioButton)HtmlForm.FindControl(Prefix + "_" + ControlID + "_" + code.Key)).Checked)
                {
                    return code.Key;
                }
            }

            return null;
        }
        #endregion
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
