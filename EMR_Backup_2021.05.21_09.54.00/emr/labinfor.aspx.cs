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
using System.Drawing;

namespace EMR.emr
{
    public partial class labinfor : System.Web.UI.Page
    {
        public string ConnStringHIS = "";
        public string UserID = ""; string UserName = ""; Guid PersonID; string UGroup = ""; string lng = "vn";
        public Guid PatientID; Guid VisitID; bool Export = false; bool Export_Group = false; string status = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;

            RadGrid1.MasterTableView.HierarchyDefaultExpanded = true;
            PatientID = Guid.Parse(Request.QueryString["pid"]);
            VisitID = Guid.Parse(Request.QueryString["vid"]);
            UserID = (string)Session["UserID"]; UserName = (string)Session["UserName"];
            UGroup = (string)Session["UserGroup"];
            status = Request.QueryString["st"];

            if (!string.IsNullOrEmpty(UserID))
            {
                //PersonID = (Guid)Session["PersonID"];//PersonID = Guid.Parse("15b5b2f0-cf23-466a-9a9a-01f06e858052");
                lng = Request.QueryString["lg"];
                lng = "eng";                
               // Get_Patient_Infor(PatientID);
            }
        }
        public DataTable GetDataTable(string query)
        {
            SqlConnection conn = new SqlConnection(ConnStringHIS);
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
        private void Get_Patient_Infor(Guid varPID)
        {
            SQLAppClass SQL_Class = new SQLAppClass();

            string Get_Cus_Name = "SELECT top 1 cus.customer_id, cus.person_id, pt.visible_patient_id AS visible_customer_id, pt.sex_rcd, ";
            if (lng == "eng")
                Get_Cus_Name +="pt.first_name_e + N' ' + pt.last_name_e AS customer_name, ";
            else
                Get_Cus_Name +="pt.first_name_l + N' ' + pt.last_name_l AS customer_name, ";
            Get_Cus_Name +="CONVERT(VARCHAR(10), pt.date_of_birth, 111) as date_of_birth ";
            Get_Cus_Name +="FROM dbo.customer_nl_view AS cus RIGHT OUTER JOIN ";
            Get_Cus_Name +="dbo.patient_info_view AS pt ON cus.person_id = pt.person_id ";
            Get_Cus_Name +="WHERE (cus.customer_id = '" + varPID + "') OR (pt.person_id = '" + varPID + "') ";
            //Get_Cus_Name +="OR (cus.customer_id = '" + varPID + "')";

            try
            {
                PatientInfor.DataSource = GetDataTable(Get_Cus_Name);
                PatientInfor.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
                //    if (lng == "eng")
                (PatientInfor.FindControl("lbTitle") as Label).Text = "LAB TEST DETAIL";
            //  else
            //    (PatientInfor.FindControl("lbTitle") as Label).Text = "CHI TIẾT LAB TEST";
        }        
        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                foreach (TableCell cell in e.Item.Cells)
                {
                    if (cell.Text == "0" | cell.Text == "0%")// | cell.Text == "0.0" | cell.Text == "0.00" | cell.Text == "0.000")
                        cell.Text = String.Empty;
                }
                GridDataItem dataItem = (GridDataItem)e.Item;
                //GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;
                string Warning = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "OR_rcd"));
                string Observed = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "lab_observation_verify_status_rcd"));
                if ((Warning == "H" | Warning == "L"))
                {
                    dataItem["lab_process_name_e"].BackColor = Color.Red;
                    dataItem["observed_value"].BackColor = Color.Red;
                    dataItem["OR_rcd"].BackColor = Color.Red;
                }
                if (Observed != "VER")
                {
                    dataItem["CheckLab"].BackColor = Color.Yellow;
                    //dataItem["observed_value"].BackColor = Color.Yellow;
                }
            }
        }
        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            Guid PP = VisitID;// Guid.Parse("11111111-2222-3333-4444-d89ef37d444c");
            string query = GetQuery(false, PP, "", "");
       //     if ((status == "Verified" | status == "Pending") && !string.IsNullOrEmpty(Request.QueryString["vid"]))// && (!string.IsNullOrEmpty(UserID)))
            {
                RadGrid1.DataSource = GetDataTable(query);
            }
        }
        protected void RadGrid1_DetailTableDataBind(object source, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {
            Guid ParentID; string Service = ""; string Group = "";
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;

            switch (e.DetailTableView.Name)
            {
                case "F1":
                    {
                        ParentID = (Guid)dataItem.GetDataKeyValue("patient_visit_id");
                        Service = Convert.ToString(dataItem.GetDataKeyValue("lab_orderable_name_e"));
                        Group = Convert.ToString(dataItem.GetDataKeyValue("placer_order_group_number"));
                        string query = GetQuery(true, ParentID, Service, Group);
                        e.DetailTableView.DataSource = GetDataTable(query);
                        break;
                    }
            }
        }

        public string GetQuery(bool showDetail, Guid varID, string varService, string varGroup)
        {
            string query_final = "";

            string query = "SELECT lor.name_e AS lab_orderable_name_e, lor.name_l AS lab_orderable_name_l, ";
            query += "lsr.patient_id,lsr.patient_visit_id,lsr.placer_order_group_number ";
            if (!showDetail)
            {
                query += ", '' as OR_rcd, '' as observed_value, '' as lab_observation_verify_status_rcd,'' as name_e, ";
                query += "ROW_NUMBER() OVER(ORDER BY lor.name_e ASC) AS No ";
            }
            if (showDetail)
            {
                query += ",ROW_NUMBER() OVER(ORDER BY lo.observed_result_date_time ASC) AS No, lo.lab_observation_verify_status_rcd,";
                query += "lsr.lab_service_request_id, lsr.created_date_time, lsro.lab_service_request_observation_id, ";
                query += "lsro.revision_nr, lo.lab_observation_id, scr.healthcare_service_type_rcd, scr.service_category_rcd, ";
                query += "scr.name_e AS service_category_name_e, scr.name_l AS service_category_name_l, ";
                query += "scr.seq_num AS service_category_seq_num, lor.lab_orderable_rid, lor.name_e AS lab_orderable_name_e, ";
                query += "lor.name_l AS lab_orderable_name_l, lor.seq_num AS lab_orderable_seq_num, lo.lab_process_id, ";
                query += "lp.lab_process_code, lp.name_e AS lab_process_name_e, lp.name_l AS lab_process_name_l, ";
                query += "lpc.code AS LOINC, lwoi.seq_num AS lab_work_order_item_seq_num , lpa.lab_process_analytic_group_rcd, ";
                query += "lo.observed_result_date_time, ";
                //query += "DATEDIFF(DAY, COALESCE(lo.observed_result_date_time, GETDATE()), GETDATE()) AS observation_age_in_days, ";
                query += "lo.observation_result_type_rcd, lo.lab_observation_operator_rcd, ";
                query += "observed_value =(CASE lo.observation_result_type_rcd WHEN 'COM' THEN orr.name_e ";
                query += "ELSE lo.observed_value END), uom.uom_rcd, uom.name_e AS uom_name_e, uom.name_l AS uom_name_l, ";
                query += "flags.[OR] AS OR_rcd, OR_lofr.bkground_colour_code AS OR_bkground_colour_code, OR_lofr.icon_image AS OR_icon_image,";
                query += "dbo.fn_NonNumericNormalRanges(lo.lab_observation_id, 'OR', 1, COALESCE(lpa.lab_observation_observed_value_decimal_places, 0)) AS OR_normal_range,";
                query += "flags.[NN] AS NN_rcd, NN_lofr.bkground_colour_code AS NN_bkground_colour_code, NN_lofr.icon_image AS NN_icon_image, ";
                query += "dbo.fn_NonNumericNormalRanges(lo.lab_observation_id, 'NN', 1, 0) AS NN_normal_range, lo.public_notes ";
            }
            query += "FROM lab_service_request_observation_current_view AS lsro ";
            query += "INNER JOIN lab_observation_current_view AS lo ON lo.lab_service_request_observation_id = lsro.lab_service_request_observation_id ";
            query += "INNER JOIN lab_work_order_item_nl_view AS lwoi ON lwoi.lab_work_order_item_id = lo.lab_work_order_item_id ";
            query += "INNER JOIN lab_work_order_nl_view AS lwo ON lwo.lab_work_order_id = lwoi.lab_work_order_id ";
            query += "INNER JOIN lab_orderable_ref_nl_view AS lor ON lor.lab_orderable_rid = lwo.lab_orderable_rid ";
            query += "INNER JOIN service_category_ref_nl_view AS scr ON scr.service_category_rcd = lor.service_category_rcd AND scr.service_category_rcd NOT IN ('MICROB','APGYN','APNGY','APSP') ";
            query += "INNER JOIN lab_service_request_nl_view AS lsr ON lsr.lab_service_request_id = lwo.lab_service_request_id ";
            query += "INNER JOIN lab_process_nl_view AS lp ON lp.lab_process_id = lo.lab_process_id AND lp.lab_process_type_rcd NOT IN ('LOOVR') ";
            query += "LEFT JOIN lab_process_analytic_nl_view AS lpa ON lpa.lab_process_id = lp.lab_process_id ";
            query += "LEFT JOIN lab_process_analytic_uom_nl_view AS lpau ON lpau.lab_process_id = lo.lab_process_id ";
            query += "AND ISNULL(lo.observed_result_date_time, GETDATE()) BETWEEN valid_from_date_time AND ISNULL(lpau.inactivated_date_time, GETDATE()) ";
            query += "LEFT JOIN lab_process_code_element_nl_view AS lpc ON lpc.lab_process_id = lp.lab_process_id AND lpc.coding_system_rcd = 'LOINC' ";
            query += "LEFT JOIN uom_ref_nl_view AS uom ON uom.uom_rcd = lpau.uom_rcd ";
            query += "LEFT JOIN observation_response_ref_nl_view AS orr ON orr.observation_response_rcd = lo.observation_response_rcd ";
            query += "LEFT JOIN (SELECT lof.lab_observation_id, MAX(CASE lof.lab_observation_flagging_type_rcd ";
            query += "WHEN 'OR' THEN lof.lab_observation_flagging_rcd ELSE NULL END) AS[OR], ";
            query += "MAX(CASE lof.lab_observation_flagging_type_rcd WHEN 'NN' THEN lof.lab_observation_flagging_rcd ELSE NULL END) AS[NN] ";
            query += "FROM lab_observation_flagging_nl_view AS lof ";
            query += "GROUP BY lof.lab_observation_id ) AS flags ON Flags.lab_observation_id = lo.lab_observation_id ";
            query += "LEFT JOIN lab_observation_flagging_ref_nl_view AS OR_lofr ON OR_lofr.lab_observation_flagging_rcd = flags.[OR] ";
            query += "LEFT JOIN lab_observation_flagging_ref_nl_view AS NN_lofr ON OR_lofr.lab_observation_flagging_rcd = flags.[NN] ";
            query += "WHERE (lsr.patient_visit_id = '" + varID + "') ";// lsr.patient_id = '0F065186-8676-11E9-B0F7-D89EF37D418E' ";
            query += "AND lwo.cpoe_placer_order_status_rcd <> 'CANCL' ";
            query += "AND (lo.lab_process_id NOT IN ('24f5a2ee-bec6-449c-96bb-00c313b0f776', 'f3d2a1ab-08ad-11e9-9d8c-fc017cb01c40', ";
            query += "'47a59e6c-08ae-11e9-9d8c-fc017cb01c40', 'ab37f6f7-08ad-11e9-9d8c-fc017cb01c40','ea3d1fc6-08ac-11e9-9d8c-fc017cb01c40', ";
            query += "'96830395-08ac-11e9-9d8c-fc017cb01c40', '0f789015-08aa-11e9-9d8c-fc017cb01c40', '343d998c-d034-11e8-9bc9-34de1a146021', ";
            query += "'66267c5a-c883-11e8-9bc7-34de1a146021','7bc3f84d-c885-11e8-9bc7-34de1a146021', '7df8b6fa-100d-11e9-88e4-b4b686db75e6')) ";
            if (status == "Pending")
                query += "AND dbo.fn_IsObservationVerified(lo.lab_verify_requirement_rcd,lo.lab_observation_verify_status_rcd) = 0";

            if (showDetail)
            {
                query += "AND lor.name_e='" + varService + "' ";
            }
            if (!showDetail)
            {
                query += "GROUP BY lor.name_e, lor.name_l, ";
                query += "lsr.patient_id,lsr.patient_visit_id,lsr.placer_order_group_number ";
            }

            query_final = query;

            return query_final;

        }        
        public bool BoolToYesNo(object pBool)
        {
            //  pBool = true;
            if (Convert.ToString(pBool) == "VER")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}