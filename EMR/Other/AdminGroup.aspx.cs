using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.Data;

namespace EMR.Other
{
    public partial class AdminGroup : System.Web.UI.Page
    {
        public string ConnStringEMR = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringEMR = ConnStr.SQL_EMRConnString;
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
        public string GetQuery(string varType)
        {
            string query = "SELECT * FROM account WITH (NOLOCK) WHERE account_group_rcd = '" + varType + "' ";

            return query;
        }
        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string query = GetQuery("DOC");
            RadGrid1.DataSource = GetDataTable(query, ConnStringEMR);
        }
        protected void RadGrid2_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string query = GetQuery("NURSE");
            RadGrid2.DataSource = GetDataTable(query, ConnStringEMR);
        }
        protected void RadGrid3_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string query = GetQuery("MA");
            RadGrid3.DataSource = GetDataTable(query, ConnStringEMR);
        }
        protected void RadGrid4_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string query = GetQuery("TECH");
            RadGrid4.DataSource = GetDataTable(query, ConnStringEMR);
        }
        protected void RadGrid5_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string query = GetQuery("CSO");
            RadGrid5.DataSource = GetDataTable(query, ConnStringEMR);
        }
    }
}