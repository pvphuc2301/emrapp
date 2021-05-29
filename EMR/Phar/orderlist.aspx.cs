using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Net;

namespace EMR
{
    public partial class orderlist : System.Web.UI.Page
    {
        public string ConnStringHIS = "";        
        public string Job_Type = ""; string varPID = "";string varVisibleID; string DepName = "";
        public string UserID = ""; string UserName = ""; string UGroup = ""; string EmpID = ""; bool ShowAll = false;       
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;

            varPID= Request.QueryString["pid"];
            varVisibleID = Request.QueryString["vbid"];

            UserID = (string)Session["UserID"]; UserName = (string)Session["UserName"];
            UGroup = (string)Session["UserGroup"]; DepName = (string)Session["Dep"];
            EmpID = (string)Session["EmpID"];
            Job_Type = (string)Session["JobType"];

            string redirecturl = "~/Account/login.aspx?ReturnUrl=";
            redirecturl = redirecturl + Request.ServerVariables["script_name"] + "?";
            redirecturl = redirecturl + Server.UrlEncode(Request.QueryString.ToString());
          //  lbUserName.Text = UserName;
            if (string.IsNullOrEmpty(UserID))
            {                
                Response.Redirect(redirecturl);
            }   
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            RadGrid1.MasterTableView.Rebind();
        }        
        public DataTable GetDataTable(string query, string varConStr)
        {
            SqlConnection conn = new SqlConnection(varConStr);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(query, conn);

            DataTable myDataTable = new DataTable();

            conn.Open();
            try
            {
                adapter.Fill(myDataTable);
            }
            finally
            {
                conn.Close();
            }

            return myDataTable;
        }        
        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                foreach (TableCell cell in e.Item.Cells)
                {
                    if (cell.Text == "0" | cell.Text == "0%" | cell.Text == "0.0" | cell.Text == "0.00" | cell.Text == "0.000")
                        cell.Text = String.Empty;
                }
            }
        }
        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {            
            string query = GetQuery();
            if(!string.IsNullOrEmpty(query))
                RadGrid1.DataSource = GetDataTable(query, ConnStringHIS);
        }
        public string GetQuery()
        {
            string Get_Query = ""; Guid varPatientID = Guid.Parse("11223344-5566-7788-99AA-BBCCDDEEFF00");

            if (!string.IsNullOrEmpty(varPID))
            {
                varPatientID = Guid.Parse(varPID);
            }
            string query = "SELECT creation_date_time,visit_code, urlink, visit_date_time, order_owner_name_e,visit_type_rcd,employee_nr ";
            query += "FROM (SELECT   CONVERT(VARCHAR(17), cpog.creation_date_time, 113) AS creation_date_time, cpog.placer_order_group_number,";
            //query += "(SELECT TOP 1 user_name FROM user_account_nl_view WHERE person_id = cpo.order_owner_employee_id) AS user_account,";
            query += "pv.visit_code,ISNULL(pv.actual_visit_date_time, pv.planned_visit_date_time) AS visit_date_time,pv.visit_type_rcd, ";
            query += "ISNULL(cpo.execution_visit_id, cpo.creation_visit_id) AS patient_visit_id,cpo.order_owner_employee_id,";
            query += "efni.display_name_e AS order_owner_name_e,efni.display_name_l AS order_owner_name_l,efni.employee_nr,";
            query += "+'../phar/orderprint.aspx?pid=' + CONVERT(VARCHAR(38), cpog.patient_id)+ '&ordid=' + CONVERT(VARCHAR(38), cpo.cpoe_placer_order_group_id) ";
            query += "+'&vid=" + varVisibleID + "&ordno=' + cpog.placer_order_group_number + '&cdate='+ CONVERT(VARCHAR(18), cpog.creation_date_time, 113) + '&fdate=' ";
            query += "+CONVERT(VARCHAR(18), ISNULL(pv.planned_visit_date_time,cpog.creation_date_time), 113) + '&dr='+ efni.display_name_e AS urlink ";
            query += "FROM    dbo.cpoe_placer_order_group_nl_view AS cpog ";
            query += "INNER JOIN dbo.cpoe_placer_order_nl_view AS cpo ON cpog.cpoe_placer_order_group_id = cpo.cpoe_placer_order_group_id ";
            query += "INNER JOIN dbo.cpoe_orderable_info_view AS coi ON cpo.cpoe_orderable_id = coi.cpoe_orderable_id ";
            query += "LEFT OUTER JOIN dbo.service_category_ref_nl_view AS scat ON coi.service_category_rcd = scat.service_category_rcd ";
            query += "LEFT OUTER JOIN dbo.patient_visit_nl_view AS pv ON ISNULL(cpo.execution_visit_id, cpo.creation_visit_id) = pv.patient_visit_id ";
            query += "LEFT OUTER JOIN dbo.employee_formatted_name_iview_nl_view AS efni ON efni.person_id = cpo.order_owner_employee_id ";
            query += "WHERE(cpog.patient_id = '" + varPatientID + "') AND (scat.healthcare_service_type_rcd IN('LB', 'IM', 'OT')) ";
            query += "AND (cpo.cpoe_placer_order_status_rcd <> 'CANCL') AND pv.facility_id = 'DB7FE460-06C3-4343-9909-57709F9538E3' ";
            //query += "AND (employee_nr = N'" + EmpID + "') ";
            query += ") AS lablist ";
            query += "GROUP BY creation_date_time,visit_code, urlink, visit_date_time, order_owner_name_e,visit_type_rcd,employee_nr ";
            query += "ORDER BY visit_date_time DESC, creation_date_time DESC ";

            Get_Query = query;

            return Get_Query;
        }
        public string ReturnTotal(object varTargetName, object varTargetValue)
        {
            string totalValue = "";
            if (Convert.ToString(varTargetName) == "OPD")
                totalValue = String.Format("{0:#,#0}", varTargetValue);
            return totalValue;
        }        
    }
}