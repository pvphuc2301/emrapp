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
            query += "AND (employee_nr = N'" + EmpID + "')) AS lablist ";
            query += "GROUP BY creation_date_time,visit_code, urlink, visit_date_time, order_owner_name_e,visit_type_rcd,employee_nr ";
            query += "ORDER BY visit_date_time DESC, creation_date_time DESC ";

            Get_Query = query;

            return Get_Query;
        }
        public string GetQuery_Old()
        {
            SQLAppClass SQL_Class = new SQLAppClass(); 
            string query = "";string Get_query = ""; 
            Guid varPatientID = Guid.Parse("11223344-5566-7788-99AA-BBCCDDEEFF00");

            string varPID = Request.QueryString["pid"];
            string varVisibleID = Request.QueryString["vbid"];

            if (!string.IsNullOrEmpty(varPID))
            {
                varPatientID = Guid.Parse(varPID);

                query = "SELECT cpog.creation_date_time, cpo.cpoe_placer_order_group_id, cpog.placer_order_group_number, ";
                query += "cpo.placer_order_number, hstr.name_e AS service_type_e, hstr.name_l AS service_type_l, ";
                query += "scat.name_e AS category_name_e, scat.name_l AS category_name_l, coi.name_e AS orderable_e, ";
                query += "coi.name_l AS orderable_l, cposr.name_e AS order_status_e, cposr.name_l AS order_status_l, cpo.status_date_time,";
                query += "sch_event.event_start_date_time AS schedule_date_time, pv.visit_code, vtr.name_e AS visit_type_e, ";
                query += "vtr.name_l AS visit_type_l, ISNULL(pv.actual_visit_date_time, pv.planned_visit_date_time) AS visit_date_time,";
                query += "cpogtr.name_e AS order_group_type_e, cpogtr.name_l AS order_group_type_l, item.name_e AS package_name_e, ";
                query += "item.name_l AS package_name_l, ISNULL(cpo.execution_visit_id, cpo.creation_visit_id) AS patient_visit_id,";
                query += "cpo.cpoe_placer_order_id, coi.service_category_rcd, scat.healthcare_service_type_rcd, ";
                query += "cpo.order_owner_employee_id, efni.display_name_e AS order_owner_name_e, efni.display_name_l AS order_owner_name_l, ";
                query += "cpo.comments, cpo.instructions AS relevant_clinical_information, cpo.cpoe_placer_order_status_rcd, ";
                query += "cpog.cpoe_placer_order_group_type_rcd, ";
                query += "'../emr/orderprint.aspx?pid='+CONVERT (varchar(38), cpog.patient_id)+'&ordid='+CONVERT (varchar(38), ";
                query += "cpo.cpoe_placer_order_group_id)+'&vid=" + varVisibleID + "&ordno='+cpog.placer_order_group_number+";
                query += "'&cdate='+CONVERT(varchar(18), cpog.creation_date_time, 113)+";
                query += "'&fdate='+CONVERT(varchar(18), ISNULL(pv.planned_visit_date_time,cpog.creation_date_time), 113)+";
                query += "'&dr=' +efni.display_name_e as urlink ";
                //query += "'' as urlink ";
                query += "FROM dbo.cpoe_placer_order_group_nl_view AS cpog INNER JOIN ";
                query += "dbo.patient_mapping_nl_view AS pm ON pm.to_patient_id = cpog.patient_id INNER JOIN ";
                query += "dbo.cpoe_placer_order_nl_view AS cpo ON cpog.cpoe_placer_order_group_id = cpo.cpoe_placer_order_group_id INNER JOIN ";
                query += "dbo.cpoe_orderable_info_view AS coi ON cpo.cpoe_orderable_id = coi.cpoe_orderable_id LEFT OUTER JOIN ";
                query += "dbo.service_category_ref_nl_view AS scat ON coi.service_category_rcd = scat.service_category_rcd LEFT OUTER JOIN ";
                query += "dbo.healthcare_service_type_ref_nl_view AS hstr ON scat.healthcare_service_type_rcd = hstr.healthcare_service_type_rcd INNER JOIN ";
                query += "dbo.cpoe_placer_order_status_ref_nl_view AS cposr ON cpo.cpoe_placer_order_status_rcd = cposr.cpoe_placer_order_status_rcd INNER JOIN ";
                query += "dbo.cpoe_placer_order_group_type_ref_nl_view AS cpogtr ON cpog.cpoe_placer_order_group_type_rcd = cpogtr.cpoe_placer_order_group_type_rcd LEFT OUTER JOIN ";
                query += "dbo.patient_visit_package_nl_view AS pvp ON cpo.patient_visit_package_id = pvp.patient_visit_package_id LEFT OUTER JOIN ";
                query += "dbo.item_nl_view AS item ON pvp.package_item_id = item.item_id LEFT OUTER JOIN ";
                query += "dbo.sch_event_nl_view AS sch_event ON cpo.sch_event_id = sch_event.sch_event_id LEFT OUTER JOIN ";
                query += "dbo.patient_visit_nl_view AS pv ON ISNULL(cpo.execution_visit_id, cpo.creation_visit_id) = pv.patient_visit_id LEFT OUTER JOIN ";
                query += "dbo.visit_type_ref_nl_view AS vtr ON pv.visit_type_rcd = vtr.visit_type_rcd LEFT OUTER JOIN ";
                query += "dbo.employee_formatted_name_iview_nl_view AS efni ON efni.person_id = cpo.order_owner_employee_id ";
                query += "WHERE (pm.from_patient_id = '" + varPatientID + "') AND (scat.healthcare_service_type_rcd IN('LB', 'IM', 'OT')) ";
                if (!ShowAll)
                    query += "AND (cpo.cpoe_placer_order_status_rcd <> 'CANCL') ";

                query += "ORDER BY cpog.creation_date_time DESC, cpog.placer_order_group_number DESC, hstr.healthcare_service_type_rcd DESC, ";
                query += "cpo.placer_order_number DESC ";
            }
            Get_query = query;
            return Get_query;
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