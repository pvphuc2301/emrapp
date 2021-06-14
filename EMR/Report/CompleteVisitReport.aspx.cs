using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using Newtonsoft.Json;
using System.Data.SqlClient;
namespace EMR.Report
{
    public partial class CompleteVisitReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem gridItem = e.Item as GridDataItem;
                gridItem["date_of_birth"].Text = DataHelpers.CalculateAge(DateTime.Parse(gridItem["date_of_birth"].Text)).ToString();
                Label lbCompleteDate = gridItem.FindControl("lbCompleted_Date") as Label;
                if (string.IsNullOrEmpty(Convert.ToString(lbCompleteDate.Text)))
                {
                    gridItem.Display = false;
                }
                else
                {
                    gridItem.Display = true;
                }
            }
        }
        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            string apiURL = "api/Patient/outpatient-today-list?keyword=" + Session["UserID"] + "&pageIndex=1&pageSize=4";
            lbTitle.Text = "My Completed OPD List for Today";

            if (Request.QueryString["view"] == "hc")
            {
                apiURL = "";
                lbTitle.Text = "My Completed Health Check-up List for Today";
            }
            dynamic response = WebHelpers.GetAPI(apiURL);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                JObject json = JObject.Parse(response.Data);
                string strJSON = "";
                strJSON += json["items"];

                (sender as RadGrid).DataSource = WebHelpers.GetJSONToDataTable(strJSON);
            }
        }
    }
}