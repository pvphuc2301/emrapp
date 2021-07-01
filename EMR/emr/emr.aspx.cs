using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.emr
{
    public partial class emr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OrderList.ContentUrl = $"~/Phar/orderlist.aspx?pid={Request.QueryString["pid"]}&vbid={Request.QueryString["vbid"]}";
                OpdPrescription.ContentUrl = $"~/Phar/opdpreslist.aspx?pid={Request.QueryString["pid"]}";
                EmrInfo.ContentUrl = $"emrinfor.aspx?pid={Request.QueryString["pid"]}&vbid={Request.QueryString["vbid"]}";
                
            }
        }
    }
}