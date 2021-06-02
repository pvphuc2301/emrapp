using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Newtonsoft.Json.Linq;
using System.Data;

namespace EMR
{
    public partial class ImagingTab : System.Web.UI.Page
    {
        public string[] rad_report_id = new string[20];// { "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1", "ID1" };
        public string[] rad_report_name = new string[20];//{ "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1", "N1" };
        public int count_report = 0;
        protected void Page_Init(object sender, System.EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                for (int i = 0; i < 20; i++)
                {
                    rad_report_id[i] = "ID1";
                    rad_report_id[i] = "N1";
                }
                get_report_id();

                for (int i = 0; i < count_report; i++)
                {
                    AddTab(rad_report_name[i], rad_report_id[i]);
                    if (i == 0)
                    {
                        AddPageView(RadTabStrip1.FindTabByValue(rad_report_id[i]));// FindTabByText(rad_report_name[i])
                    }
                }
            }
        }
        public void get_report_id()
        {
            string apiURL = "api/patient/menu-rad-list/" + Request.QueryString["vid"];
            dynamic response = WebHelpers.GetAPI(apiURL);string tmp = "";int i = 0; string varTabName = "";

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
                        rad_report_id[i] = row.Field<string>("radiology_report_id");
                        rad_report_name[i] = varTabName;                        
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
           // tab.Width = Unit.Pixel(200);
            RadTabStrip1.Tabs.Add(tab);
        }

        protected void RadMultiPage1_PageViewCreated(object sender, RadMultiPageEventArgs e)
        {
            ////  string userControlName = e.PageView.ID + "CS.ascx";
            string userControlName = "ImagingReport.ascx";

            Control userControl = Page.LoadControl(userControlName);
            userControl.ID = e.PageView.ID + "_userControl";

            e.PageView.Controls.Add(userControl);         

          //  e.PageView.ContentUrl = "radreport.aspx?radid=" + rad_report_id[0];
        }

        private void AddPageView(RadTab tab)
        {
            RadPageView pageView = new RadPageView();
            pageView.ID = tab.Value;
            //  pageView.CssClass = "contentWrapper" + tab.Index;
            Session["radid"] = tab.Value;
            RadMultiPage1.PageViews.Add(pageView);
            tab.PageViewID = pageView.ID;
         //   pageView.CssClass = "recipeImage qsf-ib";
          //  tab.PageView.ContentUrl = "radreport.aspx?radid=" + tab.Value;// rad_report_id[0];
        }

        protected void RadTabStrip1_TabClick(object sender, RadTabStripEventArgs e)
        {
            AddPageView(e.Tab);
            e.Tab.PageView.Selected = true;
        }
    }
}