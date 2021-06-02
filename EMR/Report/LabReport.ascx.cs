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
        public string varReportID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            RadGrid1.MasterTableView.HierarchyDefaultExpanded = true;
            varReportID = (string)Session["labid"]; //Request.QueryString["radid"];
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
            if (!string.IsNullOrEmpty(varReportID))
            {
                dynamic response = WebHelpers.GetAPI("api/patient/menu-lab-orderable/" + varReportID);//f076907a-ecf6-475a-4315-0000219f339b
                //dynamic jsonObject;
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                }
                Session["labid"] = "";
            }
        }
        protected void RadGrid1_DetailTableDataBind(object source, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {
            string ParentID; 
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;

            switch (e.DetailTableView.Name)
            {
                case "F1":
                    {
                        ParentID = Convert.ToString(dataItem.GetDataKeyValue("lab_orderable_rid"));
                        dynamic response = WebHelpers.GetAPI("api/patient/menu-lab-result-sid/" + varReportID + "/" + ParentID);
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
    }
}