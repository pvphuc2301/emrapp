using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Emr_client.emr
{
    public partial class OutpatientMedicalRecord : System.Web.UI.Page
    {
        string docId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(docId == "")
            //{
            //    docId = Request.QueryString["docId"];

            //    string _jsonData = JavascriptHelpers.GetAPI("api/omr/" + docId);
            //    dynamic data = JObject.Parse(_jsonData);

            //    txt_chief_complaint.Text = data.chief_complain;


            //    if(data.status == "FINAL")
            //    {
            //        txt_chief_complaint.Attributes["style"] = "pointer-events:none; border: none";

            //        btn_complete.Visible = false;
            //        btn_delete.Visible = false;
            //        btn_revert.Visible = false;
            //        btn_save.Visible = false;
            //    }else if(data.status == "DRAFT")
            //    {
            //        btn_amend.Visible = false;
            //        btn_print.Visible = false;
            //    }
            //}

        }

    }
}