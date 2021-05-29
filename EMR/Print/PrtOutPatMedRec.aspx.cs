using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Telerik.Web.UI;

namespace EMR.Print
{
    public partial class PrtOutPatMedRec : System.Web.UI.Page
    {
        public string ConnStringHIS = "";
        public Guid PatientID;
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;
            PatientID = Guid.Parse(Request.QueryString["pid"]);
           
            if (!IsPostBack)
            {
                LoadData(ConnStringHIS);
                PatientInfor.ChangeMode(FormViewMode.Edit);
                Get_Patient_Infor(PatientID);
                //PatientInfor.DataSource = "DataSource";
            }
        }
        public void LoadData(string varConn)
        {
            string Get_Cus_Name = "SELECT top 1 cus.customer_id, cus.person_id, pt.visible_patient_id AS visible_customer_id, pt.sex_rcd, ";
            Get_Cus_Name += "pt.first_name_l + N' ' + pt.last_name_l AS customer_name, ";
            Get_Cus_Name += "CONVERT(VARCHAR(10), pt.date_of_birth, 111) as date_of_birth ";
            Get_Cus_Name += "FROM dbo.customer_nl_view AS cus RIGHT OUTER JOIN ";
            Get_Cus_Name += "dbo.patient_info_view AS pt ON cus.person_id = pt.person_id ";
            Get_Cus_Name += "WHERE (cus.customer_id = '" + PatientID + "') OR (pt.person_id = '" + PatientID + "') ";

            DataSource.ConnectionString = varConn;
            DataSource.SelectCommand = Get_Cus_Name;
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
            Get_Cus_Name += "pt.first_name_l + N' ' + pt.last_name_l AS customer_name, ";
            Get_Cus_Name += "CONVERT(VARCHAR(10), pt.date_of_birth, 111) as date_of_birth ";
            Get_Cus_Name += "FROM dbo.customer_nl_view AS cus RIGHT OUTER JOIN ";
            Get_Cus_Name += "dbo.patient_info_view AS pt ON cus.person_id = pt.person_id ";
            Get_Cus_Name += "WHERE (cus.customer_id = '" + varPID + "') OR (pt.person_id = '" + varPID + "') ";
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
             //   (PatientInfor.FindControl("lbTitle") as Label).Text = "LAB TEST DETAIL";
        }

        protected void ButtonPreview_Click(object sender, EventArgs e)
        {
            PatientInfor.ChangeMode(FormViewMode.ReadOnly);
            Get_Patient_Infor(PatientID);
        }
    }
}