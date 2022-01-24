using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;

namespace EMR.Classes
{
    public class Permissions
    {
        internal static void AllowNewVitalSign(HtmlForm form, string status)
        {
            try
            {
                form.FindControl("btnNewVitalSign").Visible = (status == DocumentStatus.DRAFT);
            }
            catch(Exception ex) { }
        }
    }
}