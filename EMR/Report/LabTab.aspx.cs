using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Newtonsoft.Json.Linq;
using System.Data;

namespace EMR.Report
{
    public partial class LabTab : System.Web.UI.Page
    {
        public string[] lab_report_id = new string[50];
        public string[] lab_report_name = new string[50];
        public int count_report = 0; string varPVID ="";string varPID = "";string varFrDate = "";
        protected void Page_Init(object sender, System.EventArgs e)
        {
            varPVID = Request.QueryString["vid"];
            varPID = Request.QueryString["pid"];
            varFrDate = Request.QueryString["frd"];
            if (!Page.IsPostBack)
            {
                AddPageView(RadTabStrip1.FindTabByValue("BIOCHEMISTRY"));
                //get_report_id();
                //for (int i = 0; i < count_report; i++)
                //{
                //    AddTab(lab_report_name[i], lab_report_id[i]);
                //    if (i == 0)
                //    {
                //        AddPageView(RadTabStrip1.FindTabByValue(lab_report_id[i]));// FindTabByText(lab_report_name[i])
                //    }
                //}
            }
        }
        //public void get_report_id()
        //{
        //    string apiURL = "api/patient/menu-lab-list-sid/" + Request.QueryString["vid"] +"/" + Request.QueryString["eid"];
        //    dynamic response = WebHelpers.GetAPI(apiURL); string tmp = ""; int i = 0; string varTabName = "";

        //    DataTable mydataTable = new DataTable();

        //    if (response.Status == System.Net.HttpStatusCode.OK)
        //    {
        //        mydataTable = WebHelpers.GetJSONToDataTable(response.Data);
        //        //  dynamic data = JObject.Parse(response.Data);
        //        foreach (DataRow row in mydataTable.Rows)
        //        {
        //            tmp = row.Field<string>("specimen_number"); 
        //            if (!string.IsNullOrEmpty(tmp))
        //            {
        //                varTabName = tmp + "<br />" + string.Format("{0:dd/MMM/yyyy h:m}", row["result_date_time"]);
        //                lab_report_id[i] = tmp;
        //                lab_report_name[i] = varTabName;
        //                count_report = i + 1;
        //                i = count_report;
        //            }
        //            else
        //                break;
        //        }
        //    }
        //}
        private void AddTab(string tabName, string tabID)
        {
            RadTab tab = new RadTab();
            tab.Text = tabName;
            tab.Value = tabID;
          //  tab.Width = Unit.Pixel(200);
            RadTabStrip1.Tabs.Add(tab);
        }
        protected void RadMultiPage1_PageViewCreated(object sender, RadMultiPageEventArgs e)
        {
            //string userControlName = e.PageView.ID + "CS.ascx";
            string userControlName = "LabReport.ascx";

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
            Session["cat"] = tab.Value;
           // Session["pvid"] = varPVID;
          //  Session["pid"] = varPID;
            RadMultiPage1.PageViews.Add(pageView);
            tab.PageViewID = pageView.ID;
            //pageView.CssClass = "recipeImage qsf-ib";
            //  tab.PageView.ContentUrl = "radreport.aspx?radid=" + tab.Value;// lab_report_id[0];
        }
        protected void RadTabStrip1_TabClick(object sender, RadTabStripEventArgs e)
        {
            AddPageView(e.Tab);
            e.Tab.PageView.Selected = true;
        }
    }
}