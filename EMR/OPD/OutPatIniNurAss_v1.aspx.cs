using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.OPD
{
    public partial class OutPatIniNurAss_v1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomValidatorAllergy_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_allergy_note.Value.Length <= 256;
        }

        protected void CustomValidatorMentalStatusNote_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = txt_mental_status_note.Value.Length <= 256;
        }
    }
}