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
        public string ConnStringHIS = "";
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
            {
                //        if (Session["PageOpened"] != null)
                //      {
                //         HttpContext current_ss = HttpContext.Current;
                //          HttpContext.Current.Response.Redirect("InvalidAccess.aspx");
                //     }
                //       else { Session["PageOpened"] = true; }
            }
        }

        public void TheSessionId()
        {
            HttpContext current_ss = HttpContext.Current;
            current_session = current_ss.Session.SessionID;
            if (!string.IsNullOrEmpty(current_ss.Session.SessionID))
                HttpContext.Current.Response.Redirect("InvalidAccess.aspx");
            /* current_ss.Session["UserID"] = firstName;
             firstName = (string)(context.Session["FirstName"]);

             HttpContext ss = HttpContext.Current.Session;
             if (!HttpContext.Current.Session("id") == null)
                 HttpContext.Current.Response.Redirect("InvalidAccess.aspx");
             else
                 HttpContext.Current.Session("id") = ss.SessionID;*/
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

        protected void RadGrid5_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void RadGrid2_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            dynamic response = WebHelpers.GetAPI("api/Patient/outpatient-today-list?keyword=my.nguyen&pageIndex=1&pageSize=4");

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
            dynamic response = WebHelpers.GetAPI("api/Patient/appoinment-today-list?keyword=my.nguyen&pageIndex=1&pageSize=4");

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

            //string pid = txt_pid.Text;

            //dynamic response = WebHelpers.GetAPI("api/Patient/demographic-search?keyword=" + pid + "&pageIndex=1&pageSize=4");

            //if (!String.IsNullOrEmpty(_jsonData))
            //{
            //    JObject json = JObject.Parse(_jsonData);
            //    string strJSON = "";
            //    strJSON += json["items"];
            //    RadGrid5.DataSource = WebHelpers.GetJSONToDataTable(strJSON);
            //    RadGrid5.DataBind();
            //}
        }

        protected void RadGrid4_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem gridItem = e.Item as GridDataItem;

                gridItem["date_of_birth"].Text = DataHelpers.CalculateAge(DateTime.Parse(gridItem["date_of_birth"].Text)).ToString();
            }
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

        #region ...

        //public DataTable GetDataTable(string query)
        //{
        //    SqlConnection conn = new SqlConnection(ConnStringHIS);
        //    SqlDataAdapter adapter = new SqlDataAdapter();
        //    adapter.SelectCommand = new SqlCommand(query, conn);

        //    DataTable myDataTable = new DataTable();

        //    conn.Open();
        //    try
        //    {
        //        adapter.Fill(myDataTable);
        //        Console.WriteLine(myDataTable);
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }

        //    return myDataTable;
        //}
        public string GetQuery1(string userName)
        {
            string query = ""; //string query_final = "";
            //queyry += "USE[AIH_MIS];
            //DECLARE @user_name VARCHAR(50);
            //SET @user_name = 'my.nguyen';

            query += "SELECT phu.visible_patient_id";
            query += " ,pfn.list_name_l patient_name";
            query += " ,DATEDIFF(YEAR, pfn.date_of_birth, GETDATE()) age";
            query += " ,gen.name_e gender";
            query += " ,wq.name_l work_queue";
            query += " ,em.list_name_l adtending_doctor";
            query += " ,pwqe.start_date_time";
            query += " ,pwsr.name_l wq_status";
            query += " FROM OrionHIS_PRO.dbo.patient_work_queue_entry_nl_view AS pwqe";
            query += " LEFT JOIN OrionHIS_PRO.dbo.work_queue_nl_view AS wq ON pwqe.work_queue_id = wq.work_queue_id";
            query += " LEFT JOIN OrionHIS_PRO.dbo.employee_nl_view AS e ON pwqe.employee_id = e.employee_id";
            query += " LEFT JOIN OrionHIS_PRO.dbo.employee_formatted_name_iview_nl_view em ON e.employee_id = em.person_id";
            query += " LEFT JOIN OrionHIS_PRO.dbo.user_account_nl_view uac ON uac.person_id = em.person_id";
            query += " LEFT JOIN OrionHIS_PRO.dbo.patient_visit_nl_view pv ON pv.patient_visit_id = pwqe.patient_visit_id";
            query += " LEFT JOIN OrionHIS_PRO.dbo.patient_hospital_usage_nl_view phu ON phu.patient_id = pv.patient_id";
            query += " LEFT JOIN OrionHIS_PRO.dbo.person_formatted_name_iview_nl_view pfn ON pfn.person_id = phu.patient_id";
            query += " LEFT JOIN OrionHIS_PRO.dbo.patient_wq_status_ref_nl_view pwsr ON pwsr.patient_wq_status_rcd = pwqe.patient_wq_status_rcd";
            query += " LEFT JOIN OrionHIS_PRO.dbo.sex_ref_nl_view gen ON gen.sex_rcd = pfn.sex_rcd";
            query += " WHERE pwqe.patient_wq_status_rcd <> 'CAN'";
            query += " AND DATEDIFF(DAY, pwqe.start_date_time, GETDATE()) = 0";
            query += " AND pv.closure_date_time IS NULL";
            query += " AND uac.user_name = '" + userName + "'";
            query += " GROUP BY phu.visible_patient_id";
            query += " ,pfn.list_name_l";
            query += " ,wq.name_l";
            query += " ,em.list_name_l";
            query += " ,DATEDIFF(YEAR, pfn.date_of_birth, GETDATE())";
            query += " ,gen.name_e";
            query += " ,pwqe.start_date_time";
            query += " ,pwsr.name_l";
            query += " ORDER BY pwqe.start_date_time DESC;";

            return query;
        }

        #endregion ...

        protected void RadGrid5_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridDataItem item = (GridDataItem)(sender as RadGrid).SelectedItems[0];
            string PID = item.GetDataKeyValue("patient_id").ToString();
            string PVID = item.GetDataKeyValue("visible_patient_id").ToString();

            string url = string.Format("/emr/emrinfor.aspx?pid={0}&vbid={1}", PID, PVID);

            Response.Redirect(url);
        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session["UserID"] = "";
            Response.Redirect("./login.aspx");
        }
    }
}