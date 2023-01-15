using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

namespace EmrLib.Utility
{
    public static class WebControlHelper
    {
        public static void BindingHtmlInputCheckBox(this HtmlForm _from, string cb_name, DataTable value, Action<string, string> callback, string key = "code")
        {
            string code, desc;
            if (value != null && cb_name != null)
            {
                foreach (DataRow row in value.Rows)
                {
                    code = row.Field<string>(key).ToLower();
                    desc = row.Field<string>("desc").ToLower();
                    ((HtmlInputCheckBox)_from.FindControl(cb_name + code)).Checked = true;
                    callback(code, desc);
                }
            }
        }
        public static void BindingHtmlInputCheckBox(this HtmlForm _from, string cb_name, DataTable value, string key = "code")
        {
            string code, desc;
            if (value != null && cb_name != null)
            {
                foreach (DataRow row in value.Rows)
                {
                    code = row.Field<string>(key).ToLower();
                    desc = row.Field<string>("desc").ToLower();
                    ((HtmlInputCheckBox)_from.FindControl(cb_name + code)).Checked = true;
                }
            }
        }
        public static void BindingHtmlInputCheckBox(this HtmlForm _form, string checkboxId)
        {
            var control = _form.FindControl(checkboxId);
            if (control != null)
            {
                ((HtmlInputCheckBox)control).Checked = true;
            }
        }
        public static void Binding(this RadDateTimePicker radDateTimePicker, string datetime)
        {
            if(DateTime.TryParse(datetime, out DateTime result))
            {
                radDateTimePicker.SelectedDate = result;
            }
        }
    }
}
