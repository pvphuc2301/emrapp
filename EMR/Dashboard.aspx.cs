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

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!string.IsNullOrEmpty(txt_pid.Text))
            //{
            //    string _jsonData = WebHelpers.GetAPI("api/Patient/demographic-search?pageIndex=1&pageSize=4&keyword=" + txt_pid.Text);

            //    if (_jsonData != null)
            //    {
            //        RadGrid5.DataSource = WebHelpers.GetJSONToDataTable(_jsonData);
            //        RadGrid5.DataBind();
            //    }
            //}
        }        
        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridDataItem item = (GridDataItem)(sender as RadGrid).SelectedItems[0];

            string patientID = item.GetDataKeyValue("patient_id").ToString();

            string _jsonData = WebHelpers.GetAPI("api/Patient/check-primary/" + patientID);
            dynamic data = JObject.Parse(_jsonData);

            string script;

            if (data.primary_visible_patient_id != null)
            {
                _jsonData = WebHelpers.GetAPI("api/Patient/select-patient-linked/" + patientID);

                JavaScriptSerializer js = new JavaScriptSerializer();
            }
            else
            {
                script = "openPID('" + patientID + "');";
                ScriptManager.RegisterClientScriptBlock((sender as Control), GetType(), "alert", script, true);
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
            string _jsonData = WebHelpers.GetAPI("api/Patient/outpatient-today-list?keyword=my.nguyen&pageIndex=1&pageSize=4");

            if (_jsonData != null)
            {
                JObject json = JObject.Parse(_jsonData);
                string strJSON = "";
                strJSON += json["items"];

                (sender as RadGrid).DataSource = WebHelpers.GetJSONToDataTable(strJSON);
            }
        }

        protected void RadGrid2_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            string _jsonData = WebHelpers.GetAPI("api/Patient/appoinment-today-list?keyword=my.nguyen&pageIndex=1&pageSize=4");

            if (_jsonData != null)
            {
                JObject json = JObject.Parse(_jsonData);
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

            string _jsonData = WebHelpers.GetAPI("api/Patient/demographic-search?pageIndex=1&pageSize=4&keyword=" + txt_pid.Text);

            if (_jsonData != null)
            {
                RadGrid5.DataSource = WebHelpers.GetJSONToDataTable(_jsonData);
                RadGrid5.DataBind();
            }

            //string pid = txt_pid.Text;

            //string _jsonData = WebHelpers.GetAPI("api/Patient/demographic-search?keyword=" + pid + "&pageIndex=1&pageSize=4");

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
        #endregion

        protected void RadGrid5_SelectedIndexChanged1(object sender, EventArgs e)
        {
            
            GridDataItem item = (GridDataItem)(sender as RadGrid).SelectedItems[0];
            string PID = item.GetDataKeyValue("patient_id").ToString();
            string PVID = item.GetDataKeyValue("visible_patient_id").ToString();

            string url = string.Format("/emr/emrinfor.aspx?pid={0}&vbid={1}", PID, PVID);

            Response.Redirect(url);
        }
    }
}