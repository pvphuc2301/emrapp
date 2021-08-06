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

namespace EMR.Report
{
    public partial class rxHistory : System.Web.UI.Page
    {
        public string varPID = ""; string varPvID = ""; 
        public bool ShowAll = false; string pharType = ""; 
        protected void Page_Load(object sender, EventArgs e)
        {

            //varPID = "777f08f6-a0a1-4201-6de8-0000002f2446";
            varPID = Request.QueryString["pid"];
            varPvID = "00000000-0000-0000-0000-000000000000";

            if (!string.IsNullOrEmpty(Request.QueryString["pvid"]))
            {
                varPvID = Request.QueryString["pvid"];
            }

            CheckedSelect();
        }
        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        { }
        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

            string api_url = "api/pharmacy/rx-history-group?patient_id=" + varPID + "&patient_visit_id=" + varPvID + pharType;

            dynamic response = WebHelpers.GetAPI(api_url);//f076907a-ecf6-475a-4315-0000219f339b
                                                          //dynamic jsonObject;
            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
            }
        }
        protected void RadGrid1_DetailTableDataBind(object source, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {
            string pID; string vsID;
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;

            switch (e.DetailTableView.Name)
            {
                case "F1":
                    {                       
                        pID = Convert.ToString(dataItem.GetDataKeyValue("patient_id"));
                        vsID = Convert.ToString(dataItem.GetDataKeyValue("patient_visit_id"));
                        string api_url = "api/pharmacy/rx-history-detail?patient_id=" + varPID + "&patient_visit_id=" + vsID + pharType;
                        dynamic response = WebHelpers.GetAPI(api_url);
                        if (response.Status == System.Net.HttpStatusCode.OK)
                        {
                            e.DetailTableView.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                        }
                        break;
                    }
            }
        }

        protected void SelectRadio(object sender, System.EventArgs e)
        {
            RadGrid1.MasterTableView.Rebind();
        }
        protected void SelectChecked(object sender, System.EventArgs e)
        {          
            RadGrid1.MasterTableView.Rebind();
        }
        protected void CheckedSelect()
        {
            if (OPD.Checked)
            {
                pharType = "&ph_med_type_rcd0=OPD";
            }
            else if (IPD.Checked)
            {
                pharType = "&ph_med_type_rcd1=IPD";
            }
            else if (Discharge.Checked)
            {
                pharType = "&ph_med_type_rcd2=DIS";
            }
            else if (External_Medication.Checked)
            {
                pharType = "&ph_med_type_rcd3=OUT";
            }
           // RadGrid1.MasterTableView.Rebind();
        }
    }
}
