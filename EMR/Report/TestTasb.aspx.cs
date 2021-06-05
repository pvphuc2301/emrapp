using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Newtonsoft.Json.Linq;
using System.Data;
using System.Data.SqlClient;

namespace EMR.Report
{
    public partial class TestTasb : System.Web.UI.Page
    {
        public string[] lab_report_id = new string[20];// { "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1" };
        public string[] lab_report_name = new string[20];//{ "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1" };
        public int count_report = 0; public string ConnStringHIS = "";
        protected void Page_Init(object sender, System.EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();           
            ConnStringHIS = ConnStr.SQL_HISConnString;
            FetchImage();

        //if (!Page.IsPostBack)
        //{
        //    for (int i = 0; i < 20; i++)
        //    {
        //        lab_report_id[i] = "ID1";
        //        lab_report_id[i] = "N1";
        //    }
        //    get_report_id();

            //    for (int i = 0; i < count_report; i++)
            //    {
            //        AddTab(lab_report_name[i], lab_report_id[i]);
            //        if (i == 0)
            //        {
            //            AddPageView(RadTabStrip1.FindTabByValue(lab_report_id[i]));// FindTabByText(lab_report_name[i])
            //        }
            //    }
            //}
        }
        public DataTable GetDataTable(string query, string varConn)
        {
            //if (Convert.ToString(Session["company_code"]) == "AIH")
            {
                SqlConnection conn = new SqlConnection(varConn);
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
        }
        protected void FetchImage()
        {
            string query = "SELECT  phu.visible_patient_id,pif.name_e,pif.icon_image ";
            query += "FROM person_indicator_nl_view AS pin ";
            query += "INNER JOIN person_indicator_ref_nl_view AS pif ON pif.person_indicator_rcd = pin.person_indicator_rcd ";
            query += "INNER JOIN dbo.patient_hospital_usage_nl_view phu ON phu.patient_id = pin.person_id ";
            query += "WHERE phu.visible_patient_id = '900000011' AND pin.active_flag <> 0 ";
            query += "ORDER BY pif.seq_num ";

            DataTable mydataTable = new DataTable();int i = 0;
            mydataTable = GetDataTable(query, ConnStringHIS);

            foreach (DataRow row in mydataTable.Rows)
            {
                byte[] bytes = (byte[])row["icon_image"]; //GetDataTable(query, ConnStringHIS).Rows[1]["icon_image"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                if (i == 0)
                {
                    Image1.ImageUrl = "data:image/png;base64," + base64String;
                    Image1.ToolTip = row.Field<string>("name_e");
                }
                else if (i == 1)
                {
                    Image2.ImageUrl = "data:image/png;base64," + base64String;
                    Image2.ToolTip = row.Field<string>("name_e");
                    //       mydataTable.Columns.Add(new DataColumn("ID" + i, typeof(string)));
                }
                i += 1;
            }

        }
        public void get_report_id()
        {
            string apiURL = "api/patient/menu-rad-list/" + Request.QueryString["vid"];
            dynamic response = WebHelpers.GetAPI(apiURL); string tmp = ""; int i = 0; string varTabName = "";

            DataTable mydataTable = new DataTable();

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                mydataTable = WebHelpers.GetJSONToDataTable(response.Data);
                //  dynamic data = JObject.Parse(response.Data);
                foreach (DataRow row in mydataTable.Rows)
                {
                    tmp = Convert.ToString(row["procedure_name_e"]);
                    varTabName = tmp + "<br />" + string.Format("{0:dd/MMM/yyyy h:m}", row["completed_date_time"]) + "<br />" + row.Field<string>("created_name_e");
                    if (!string.IsNullOrEmpty(tmp))
                    {
                        lab_report_id[i] = row.Field<string>("radiology_report_id");
                        lab_report_name[i] = varTabName;
                        count_report = i + 1;
                        i = count_report;
                    }
                    else
                        break;
                }
            }
        }
        private void AddTab(string tabName, string tabID)
        {
            RadTab tab = new RadTab();
            tab.Text = tabName;
            tab.Value = tabID;
            tab.Width = Unit.Pixel(200);
            RadTabStrip1.Tabs.Add(tab);
        }

        protected void RadMultiPage1_PageViewCreated(object sender, RadMultiPageEventArgs e)
        {
            ////  string userControlName = e.PageView.ID + "CS.ascx";
            string userControlName = "ImagingReport.ascx";

            Control userControl = Page.LoadControl(userControlName);
            userControl.ID = e.PageView.ID + "_userControl";

            e.PageView.Controls.Add(userControl);

            //  e.PageView.ContentUrl = "radreport.aspx?radid=" + lab_report_id[0];
        }

        private void AddPageView(RadTab tab)
        {
            RadPageView pageView = new RadPageView();
            pageView.ID = tab.Value;
            //  pageView.CssClass = "contentWrapper" + tab.Index;
            Session["radid"] = tab.Value;
            RadMultiPage1.PageViews.Add(pageView);
            tab.PageViewID = pageView.ID;
            pageView.CssClass = "recipeImage qsf-ib";
            //  tab.PageView.ContentUrl = "radreport.aspx?radid=" + tab.Value;// lab_report_id[0];
        }

        protected void RadTabStrip1_TabClick(object sender, RadTabStripEventArgs e)
        {
            AddPageView(e.Tab);
            e.Tab.PageView.Selected = true;
        }
    }
}