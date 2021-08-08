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

namespace EMR.Phar
{
    public partial class opdpreslist : System.Web.UI.Page
    {
        public string ConnStringHIS = "";
        public string Fr_Date = ""; string To_Date = ""; string DepName = ""; string Job_Type = "";
        public string UserID = ""; string UserName = ""; string UGroup = ""; string presby = "";string EmpNo = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;
            
            UserID = (string)Session["UserID"]; UserName = (string)Session["UserName"];
            UGroup = (string)Session["UserGroup"]; DepName = (string)Session["Dep"];
            EmpNo = (string)Session["emp_nr"];//1509
            Job_Type = (string)Session["JobType"];

            string redirecturl = "~/login.aspx?ReturnUrl=";
            redirecturl = redirecturl + Request.ServerVariables["script_name"] + "?";
            redirecturl = redirecturl + Server.UrlEncode(Request.QueryString.ToString());
           // lbUserName.Text = UserName;
            if (string.IsNullOrEmpty(UserID))
            {           
                Response.Redirect(redirecturl);
            }           
        }        
        protected void Button1_Click(object sender, EventArgs e)
        {
            RadGrid1.MasterTableView.Rebind();
        }
        protected void ButtonS_Click(object sender, EventArgs e)
        {
           // Patient_ID = PatientID.Text;
            RadGrid1.MasterTableView.Rebind();
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
            string get_access = Convert.ToString(Session["access_authorize"]);
            //string query = GetQuery();
            if (Convert.ToString(Session["group_access"]) == "DOC" | get_access == "FullAccess" | get_access == "View")
            {
                string urlink = "api/pharmacy/prescription_list?keyword=" + Request.QueryString["vbid"];

                if (!ShowAll.Checked)
                {
                    urlink += "&username=" + UserID;
                }
                dynamic response = WebHelpers.GetAPI(urlink);
              
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                    //RadGrid1.DataBind();
                }
            }
            //RadGrid1.DataSource = GetDataTable(query, ConnStringHIS);
        }        
        public string ReturnUrlink(object varPID, object varPvID, object varPharID)
        {
            string tmp = "../phar/opdprescription.aspx?pid=" + Convert.ToString(varPID) + "&vid=" + Convert.ToString(varPvID);
            tmp += "&phar=" + Convert.ToString(varPharID) + "&vibid=" + Request.QueryString["vbid"] + "&loc=" + Request.QueryString["loc"];
            
            return tmp;
        }
        public string ReturnTotal(object varTargetName, object varTargetValue)
        {
            string totalValue = "";
            if (Convert.ToString(varTargetName) == "OPD")
                totalValue = String.Format("{0:#,#0}", varTargetValue);
            return totalValue;
        }
        protected void CheckedRequest(object sender, System.EventArgs e)
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
        public string GetQuery()
        {
            string Get_query = "";
            string varPID = Request.QueryString["pid"];
            string varVbID = Request.QueryString["vbid"];

            string Patient_Name = "SELECT TOP(1) first_name_l + N' ' + last_name_l AS patient_name ";//visible_patient_id + '-' + 
            Patient_Name += "FROM dbo.patient_info_view WHERE (person_id = pre.patient_id) ";

            string query = "SELECT pre.patient_id, pre.patient_visit_id, pre.ph_prescription_id, pre.prescriber_employee_id, ";
            query += "pre.reference_number, pre.reference_number + ' | ' + efni.display_name_l AS combo_code, ";
            query += "phu.visible_patient_id, pre.created_date_time,efni.employee_nr, ";
            query += "(" + Patient_Name + ") AS patient_name,efni.display_name_l as created_by_user_name, ";
            query += "'../phar/opdprescription.aspx?pid='+CONVERT (varchar(38), pre.patient_id)+'&vid='+CONVERT (varchar(38), ";
            query += "pre.patient_visit_id)+'&phar='+CONVERT (varchar(38), pre.ph_prescription_id)+'&vibid='+phu.visible_patient_id as urlink ";
            query += "FROM dbo.ph_prescription_nl_view AS pre INNER JOIN ";
            query += "(SELECT ph_prescription_id ";
            query += "FROM dbo.ph_prescription_order_nl_view AS a ";
            query += "WHERE (ph_medication_profile_type_rcd IN('OPD','DIS')) AND (ph_prescription_order_status_rcd NOT IN ('CANC','SAVED','DISC')) ";
            query += "GROUP BY ph_prescription_id) AS preo ON preo.ph_prescription_id = pre.ph_prescription_id INNER JOIN ";
            query += "dbo.patient_hospital_usage_nl_view AS phu ON phu.patient_id = pre.patient_id INNER JOIN ";
            query += "dbo.user_account_nl_view AS uac ON uac.person_id = pre.prescriber_employee_id INNER JOIN ";
            query += "dbo.employee_formatted_name_iview_nl_view AS efni ON efni.person_id = uac.person_id ";
            query += "WHERE (pre.patient_id = '" + Guid.Parse(varPID) + "') ";
            if (!ShowAll.Checked)
                query += "AND (employee_nr = N'" + EmpNo + "') ";

            // query += "WHERE (phu.visible_patient_id = '" + varVbID + "') ";

            //if (UGroup != "Full" | Job_Type == "Dr.")
            /*   {
                   if (string.IsNullOrEmpty(Patient_ID))
                   {
                       query += "WHERE (efni.employee_nr = '" + EmpID + "') AND (phu.visible_patient_id = '" + varVisibleID + "') ";                    
                   }
                   else if (!string.IsNullOrEmpty(Patient_ID))
                       query += "WHERE (phu.visible_patient_id = '" + varVisibleID + "') ";           
               }*/
            query += "ORDER BY pre.created_date_time DESC ";

            Get_query = query;
            return Get_query;
        }
    }
}