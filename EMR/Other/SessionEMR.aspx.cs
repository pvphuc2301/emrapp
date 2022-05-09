using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.Other
{
    public partial class SessionEMR : System.Web.UI.Page
    {
        private string ConnStringHIS = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = WebHelpers.IsDEVELOP() ? ConnStr.SQL_EMR_AIH_78ConnString : ConnStr.SQL_AIHConnString;
            
        }

        private DataTable LoadSessionEMR()
        {
            DataTable Sessions = new DataTable();

            string query = "SELECT (SELECT dm.model_name FROM document_model dm WHERE dm.model_id = dd.model_id) as model_name, dd.created_name_l, dd.created_user_id, dd.[document_id] ,DATEDIFF(MINUTE, lu_date_time, GETDATE()) as min ,[employee_id] ,[user_name] ,[full_name_e] ,[full_name_l] ,[session_date] ,[lu_date_time] ";
            query += "FROM [EMR_AIH].[dbo].[document_session] ds ";
            query += "LEFT JOIN document_data dd ON ds.document_id = dd.document_id ";
            query += "WHERE DATEDIFF(MINUTE, lu_date_time, GETDATE()) <= 30 ";
            query += "ORDER BY lu_date_time DESC ";

            SqlConnection conn = new SqlConnection(ConnStringHIS);
            SqlCommand cmd = new SqlCommand(query, conn);//(query, conn);
            conn.Open();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            
            da.Fill(Sessions);
            
            conn.Close();
            da.Dispose();

            return Sessions;
        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            RadGrid1.DataSource = LoadSessionEMR();
        }

        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (e.Item as GridDataItem);
                int min = Convert.ToInt32(item["min"].Text);
                
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            RadGrid1.DataSource = LoadSessionEMR();
            RadGrid1.DataBind();
        }
    }
}