using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Drawing;


namespace EMR.Report
{
    public partial class LabReport : System.Web.UI.UserControl
    {
        public string varPVID = ""; string varPID = "";string varTabValue = "";string varFrDate = ""; string frDate = ""; string toDate = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            RadGrid1.MasterTableView.HierarchyDefaultExpanded = true;
            //  varPVID = (string)Session["pvid"]; 
            varPVID = Request.QueryString["vid"];
            varPID = Request.QueryString["pid"];
            varTabValue = (string)Session["cat"];
            varFrDate = Request.QueryString["frd"];                       
            {                
                if (varTabValue == "All")
                {
                //    if (!IsPostBack)
                    {
                        if (string.IsNullOrEmpty(varFrDate))
                        {
                            from_date.SelectedDate = DateTime.Today;
                            to_date.SelectedDate = DateTime.Today;
                        }
                        else if (string.IsNullOrEmpty(Convert.ToString(from_date.SelectedDate)))
                        {
                            from_date.SelectedDate = Convert.ToDateTime(varFrDate);
                            to_date.SelectedDate = Convert.ToDateTime(varFrDate);
                        }                        
                    }
                    SelectDate.Visible = true;
                    //if (string.IsNullOrEmpty(Convert.ToString(from_date.SelectedDate)))
                    
                }
            }
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
                if (e.Item is GridDataItem && e.Item.OwnerTableView.Name == "F1")
                {
                    string Warning = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "oR_rcd"));
                    string Observed = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "lab_observation_verify_status_rcd"));
                    if ((Warning == "H" | Warning == "L"))
                    {
                        dataItem["lab_process_name_e"].BackColor = Color.Red;
                        dataItem["observed_value"].BackColor = Color.Red;
                        dataItem["oR_rcd"].BackColor = Color.Red;
                    }
                    if (Observed != "VER")
                    {
                        dataItem["CheckLab"].BackColor = Color.Yellow;
                        //dataItem["observed_value"].BackColor = Color.Yellow;
                    }
                }
            }
        }
        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (!string.IsNullOrEmpty(varTabValue))
            {                
                string api_url = "api/patient/menu-lab-orderable/" + varPID + "/" + varPVID + "/" + varTabValue;
                if (varTabValue == "All")
                {
                    frDate = from_date.SelectedDate.Value.Year.ToString() + "-" + from_date.SelectedDate.Value.Month.ToString() + "-" + from_date.SelectedDate.Value.Day.ToString();
                    toDate = to_date.SelectedDate.Value.Year.ToString() + "-" + to_date.SelectedDate.Value.Month.ToString() + "-" + to_date.SelectedDate.Value.Day.ToString();
                    api_url = "api/patient/menu-lab-orderable_date/" + varPID + "/" + frDate + "/" + toDate;
                }
                dynamic response = WebHelpers.GetAPI(api_url);//f076907a-ecf6-475a-4315-0000219f339b
                //dynamic jsonObject;
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                }
                if (varTabValue != "All")
                    Session["cat"] = "";
            }
        }
        protected void RadGrid1_DetailTableDataBind(object source, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {
            string sID; string oID;
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;

            switch (e.DetailTableView.Name)
            {
                case "F1":
                    {
                        sID = Convert.ToString(dataItem.GetDataKeyValue("specimen_id"));
                        oID = Convert.ToString(dataItem.GetDataKeyValue("lab_orderable_rid"));
                        dynamic response = WebHelpers.GetAPI("api/patient/menu-lab-result/" + sID + "/" + oID);
                        if (response.Status == System.Net.HttpStatusCode.OK)
                        {
                            e.DetailTableView.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                        }                    
                        break;
                    }
            }
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
        protected void btnComplete_Click(object sender, EventArgs e)
        {            
            RadGrid1.Rebind();
        }
        public string ReturnService_Name(object varOrderName, object varSpecNum)
        {
            string tmp = Convert.ToString(varOrderName) + " (" + Convert.ToString(varSpecNum) +")";            
            return tmp;
        }
    }
}