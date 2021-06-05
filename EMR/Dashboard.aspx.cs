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

namespace EMR
{
    public partial class Dashboard : System.Web.UI.Page
    {
        public string ConnStringHIS = ""; public string ConnStringEMR = "";
        public string UserID;
        public string current_session = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            UserID = (string)Session["UserID"];
            string redirecturl = "./login.aspx?ReturnUrl=";
            redirecturl += Request.ServerVariables["script_name"] + "?";
            redirecturl += Server.UrlEncode(Request.QueryString.ToString());
            if (string.IsNullOrEmpty(UserID))
                Response.Redirect(redirecturl);

            lblUserName.InnerText = UserID;
            if (!IsPostBack)
                RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.Top;
            ConnClass ConnStr = new ConnClass();
            ConnStringEMR = ConnStr.SQL_EMRConnString;
        }
        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridDataItem item = (GridDataItem)(sender as RadGrid).SelectedItems[0];

            string patientID = item.GetDataKeyValue("patient_id").ToString();

            dynamic response = WebHelpers.GetAPI("api/Patient/check-primary/" + patientID);
            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic data = JObject.Parse(response.Data);

                string script;

                if (data.primary_visible_patient_id != null)
                {
                    //response = WebHelpers.GetAPI("api/Patient/select-patient-linked/" + patientID);
                    JavaScriptSerializer js = new JavaScriptSerializer();
                }
                else
                {
                    script = "openPID('" + patientID + "');";
                    ScriptManager.RegisterClientScriptBlock((sender as Control), GetType(), "alert", script, true);
                }
            }
        }
        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem gridItem = e.Item as GridDataItem;
                gridItem["date_of_birth"].Text = DataHelpers.CalculateAge(DateTime.Parse(gridItem["date_of_birth"].Text)).ToString();
                Label lbCompleteDate = gridItem.FindControl("lbCompleted_Date") as Label;
                Button btnComplete = gridItem.FindControl("btnAction") as Button;
                if (string.IsNullOrEmpty(Convert.ToString(lbCompleteDate.Text)))
                {
                    lbCompleteDate.Visible = false;
                    btnComplete.Visible = true;
                }
                else
                {
                    lbCompleteDate.Visible = true;
                    btnComplete.Visible = false;
                }
            }
        }
        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            dynamic response = WebHelpers.GetAPI("api/Patient/outpatient-today-list?keyword="+ Session["UserID"] +"&pageIndex=1&pageSize=4");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                JObject json = JObject.Parse(response.Data);
                string strJSON = "";
                strJSON += json["items"];

                (sender as RadGrid).DataSource = WebHelpers.GetJSONToDataTable(strJSON);
            }
        }
        protected void RadGrid2_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            dynamic response = WebHelpers.GetAPI("api/Patient/appoinment-today-list?keyword="+ Session["UserID"] +" & pageIndex=1&pageSize=4");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                JObject json = JObject.Parse(response.Data);
                string strJSON = "";
                strJSON += json["items"];

                (sender as RadGrid).DataSource = WebHelpers.GetJSONToDataTable(strJSON);
            }
        }
        protected void RadGrid3_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            dynamic response = WebHelpers.GetAPI("api/Patient/demographic-search?pageIndex=1&pageSize=4&keyword=" + txt_pid.Value);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                RadGrid5.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                RadGrid5.DataBind();
            }
        }
        protected void RadGrid4_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
        }        
        public void RaisePostBackEvent(string eventArgument)
        {
        }
        protected void RadGrid2_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem gridItem = e.Item as GridDataItem;

                gridItem["date_of_birth"].Text = DataHelpers.CalculateAge(DateTime.Parse(gridItem["date_of_birth"].Text)).ToString();
            }
        }
        protected void RadGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridDataItem item = (GridDataItem)(sender as RadGrid).SelectedItems[0];
            string PID = item.GetDataKeyValue("patient_id").ToString();
            string PVID = item.GetDataKeyValue("visible_patient_id").ToString();

            string url = string.Format("/emr/emrinfor.aspx?pid={0}&vbid={1}", PID, PVID);

            Response.Redirect(url);
        }
        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();// Session["UserID"] = "";
            Response.Redirect("./login.aspx");
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Panel myPanel = btn.Parent as Panel;
            GridDataItem dataItem = myPanel.NamingContainer as GridDataItem;
            string vid = dataItem.GetDataKeyValue("visible_patient_id").ToString();
            Guid pvid = Guid.Parse(Convert.ToString(dataItem.GetDataKeyValue("patient_visit_id")));

            SQLAppClass SQL_Class = new SQLAppClass();

            string queryInsert = "INSERT INTO consult_complete_date (account_name, visible_patient_id, patient_visit_id ) ";
            queryInsert += "VALUEs ('" + UserID + "','" + vid + "','" + pvid + "') ";
            SQL_Class.RunQuery(queryInsert, ConnStringEMR);

            RadGrid1.MasterTableView.Rebind();
        }
    }
}