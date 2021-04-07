using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR
{
    public partial class OutpatientMedicalRecord : System.Web.UI.Page
    {
        
        public string varModelId = ""; string varDocId = "";
        public string varPVId = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            varModelId = Request.QueryString["modelId"];
            varDocId = Request.QueryString["docId"];
            varPVId = Request.QueryString["pvid"];


                OutpatientMedicalRecord omr1 = new OutpatientMedicalRecord();
               //DataTable  tbl = WebHelpers.GetJSONToDataTable()
            // Fill data to object omr1:
              //  WebHelpers.BindingDatafield(getda, omr1);
            
                // Mapping omg1 to WebForm_controls
                lblPatientName.Text = omr1.created_name_l;
            }
        }
   

    }

  
}