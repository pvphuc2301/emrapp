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
        protected void RadGrid6_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string query = GetQuery("ADM");
            RadGrid6.DataSource = GetDataTable(query, ConnStringEMR);
        }
        protected void RadGrid7_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string query = GetQuery("OTH");
            RadGrid7.DataSource = GetDataTable(query, ConnStringEMR);
        }
        protected void CheckedAccess(object sender, System.EventArgs e)
        {
            CheckBox chkBox = (sender as CheckBox);
            Panel myPanel = chkBox.Parent as Panel;
            GridDataItem item = myPanel.NamingContainer as GridDataItem;

            string user_name = item.GetDataKeyValue("user_name").ToString();

            if (chkBox.ID == "FullAccess")
            {
                if (chkBox.Checked)
                    updateAccess(user_name, "FullAccess");
                else
                    updateAccess(user_name, "NA");
            }                
            else if (chkBox.ID == "View")
            {
                if (chkBox.Checked)
                    updateAccess(user_name, "View");
                else
                    updateAccess(user_name, "NA");
            }          
            else if (chkBox.ID == "CLSAccess")
            {
                if (chkBox.Checked)
                    updateAccess(user_name, "CLSView");
                else
                    updateAccess(user_name, "NA");
            }
            else if (chkBox.ID == "ScanAccess")
            {
                if (chkBox.Checked)
                    updateAccess(user_name, "ScanView");
                else
                    updateAccess(user_name, "NA");
            }
            else if (chkBox.ID == "AllowAccess")
            {
                if (chkBox.Checked)
                    updateAccess(user_name, "true");
                else
                    updateAccess(user_name, "false");
            }

            if (RadMultiPage1.SelectedPageView.ID == "RadPageView1")
                RadGrid1.Rebind();
            else if (RadMultiPage1.SelectedPageView.ID == "RadPageView2")
                RadGrid2.Rebind();
            else if (RadMultiPage1.SelectedPageView.ID == "RadPageView3")
                RadGrid3.Rebind();
            else if (RadMultiPage1.SelectedPageView.ID == "RadPageView4")
                RadGrid4.Rebind();
            else if (RadMultiPage1.SelectedPageView.ID == "RadPageView5")
                RadGrid5.Rebind();
            else if (RadMultiPage1.SelectedPageView.ID == "RadPageView6")
                RadGrid6.Rebind();
            else if (RadMultiPage1.SelectedPageView.ID == "RadPageView7")
                RadGrid7.Rebind();
        }       
        public void updateAccess(string varUserName, string varAccess)
        {
            SQLAppClass SQL_Class = new SQLAppClass();

            DateTime varUpdatedDate = DateTime.Now;
            string updatedUser = Convert.ToString(Session["UserID"]);

            string query = "UPDATE account set access_authorize = '" + varAccess + "', lu_updated = '" + varUpdatedDate + "', lu_user_id = '" + updatedUser + "' ";
            query += "WHERE user_name = '" + varUserName + "' ";

            if (varAccess == "true" | varAccess == "false")
            {
                query = "UPDATE account set active_authorize = '" + varAccess + "', lu_updated = '" + varUpdatedDate + "', lu_user_id = '" + updatedUser + "' ";
                query += "WHERE user_name = '" + varUserName + "' ";
            }

            SQL_Class.RunQuery(query, ConnStringEMR);
        }
        public bool CheckFull(object pBool)
        {
            //  string[] Access_Array = new string[4] { "FullAccess", "View", "CLSView", "ScanView" };
            string varBool = Convert.ToString(pBool);
            if (!string.IsNullOrEmpty(varBool))
            {
                if (varBool == "FullAccess")
                    return true;                
                else
                    return false;
            }
            else
            {
                return false;
            }           
        }
        public bool CheckView(object pBool)
        {
            //  string[] Access_Array = new string[4] { "FullAccess", "View", "CLSView", "ScanView" };
            string varBool = Convert.ToString(pBool);
            if (!string.IsNullOrEmpty(varBool))
            {
                if (varBool == "View")
                    return true;
                else
                    return false;
            }
            else
            {
                return false;
            }
        }
        public bool CheckCLS(object pBool)
        {
            //  string[] Access_Array = new string[4] { "FullAccess", "View", "CLSView", "ScanView" };
            string varBool = Convert.ToString(pBool);
            if (!string.IsNullOrEmpty(varBool))
            {
                if (varBool == "CLSView")
                    return true;
                else
                    return false;
            }
            else
            {
                return false;
            }
        }
        public bool CheckScan(object pBool)
        {
            //  string[] Access_Array = new string[4] { "FullAccess", "View", "CLSView", "ScanView" };
            string varBool = Convert.ToString(pBool);
            if (!string.IsNullOrEmpty(varBool))
            {
                if (varBool == "ScanView")
                    return true;
                else
                    return false;
            }
            else
            {
                return false;
            }
        }
        public bool CheckAllow(object pBool)
        {
            //  pBool = true;
            if (!string.IsNullOrEmpty(Convert.ToString(pBool)))
            {
                return (bool)pBool ? true : false;
            }
            else
            {
                return false;
            }
        }
        public bool ConvertNullableBoolBK(object pBool)
        {
            //  pBool = true;
            if (!string.IsNullOrEmpty(Convert.ToString(pBool)))
            {
                return (bool)pBool ? true : false;
            }
            else
            {
                return false;
            }
        }

    }
}