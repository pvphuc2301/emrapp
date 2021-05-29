using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Drawing;

namespace EMR
{
    public partial class patientapp : System.Web.UI.Page
    {
        public string ConnStringHIS = ""; string ConnStringMISPro = "";// ConfigurationManager.ConnectionStrings["AIHUATConnectionString"].ConnectionString;
        public bool Export = false; int varColor = 0; bool ExportAll = false; bool Export_Group = false;
        public string Fr_Date = ""; string To_Date = ""; string Shift_Name = ""; string Shift_ID; string Viewby = "";
        public string UserID = ""; string UserName = ""; Guid PersonID; string UGroup = ""; string Dep = "";
        public string Cr_Fr_Date = ""; string Cr_To_Date = ""; string RemindBody_ToBOD = ""; bool temp = false;
        private const string URLPro = "http://cloudsms.vietguys.biz:8088/api/";
        private string username = "aih"; string password = "4zt6h";bool btGo1 = false; bool btGo2 = false;
        private string from = "BVQT MY"; string phone = "0903718817";bool ExCreated = false;
        private string sms_text = "Test send API"; string Fr_FullDateTime = ""; string To_FullDateTime = "";
        public string[] external_user = new string[5] { "van.le", "tung.tran", "quy.vo", "u3", "u4" };
        public bool external_access = false;
        public MailAddress MailAddressFrom { get; set; }
        public MailAddress MailAddressTo { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {            
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;
            ConnStringMISPro = ConnStr.SQL_MISProConnString;

            Load_Shift(ConnStringHIS);

            Fr_Date = Convert.ToString(FromDate.SelectedDate);
            To_Date = Convert.ToString(ToDate.SelectedDate);
            Shift_Name = ShiftSelection.Text;
            Shift_ID = ShiftSelection.SelectedValue;
            Viewby = Request.QueryString["by"];
            if (string.IsNullOrEmpty(Fr_Date))
            {
                //Fr_Date = Convert.ToString(DateTime.Today.Date);
                Fr_Date = Convert.ToString(DateTime.Today.Date.AddDays(1));
                FromDate.SelectedDate = DateTime.Today.Date.AddDays(1);
            }
            if (!string.IsNullOrEmpty(To_Date))
            {
                To_Date = Convert.ToString(ToDate.SelectedDate.Value.AddDays(1));
                // To_Date = Convert.ToString(DateTime.Today.Date.AddDays(1));
                // ToDate.SelectedDate = DateTime.Today.Date.AddDays(1);
            }
            else
            {
                To_Date = Convert.ToString(DateTime.Today.Date.AddDays(2));
                //To_Date = Convert.ToString(DateTime.Today.Date.AddDays(999));
                ToDate.SelectedDate = DateTime.Today.Date.AddDays(2);
            }
            
            Cr_Fr_Date = Convert.ToString(CreatedFromDate.SelectedDate);
            Cr_To_Date = Convert.ToString(CreatedToDate.SelectedDate);
                        
            if (string.IsNullOrEmpty(Cr_Fr_Date))
            {               
                Cr_Fr_Date = Convert.ToString(DateTime.Today.Date.AddDays(1));
                CreatedFromDate.SelectedDate = DateTime.Today.Date.AddDays(1);
            }
            if (!string.IsNullOrEmpty(Cr_To_Date))
            {
                Cr_To_Date = Convert.ToString(CreatedToDate.SelectedDate.Value.AddDays(1));                
            }
            else
            {
                Cr_To_Date = Convert.ToString(DateTime.Today.Date.AddDays(2));                
                CreatedToDate.SelectedDate = DateTime.Today.Date.AddDays(2);
            }

            string Full_FrDate = CreatedFromDate.SelectedDate.Value.Year + "-" + CreatedFromDate.SelectedDate.Value.Month + "-" + CreatedFromDate.SelectedDate.Value.Day;
            string Full_ToDate = CreatedToDate.SelectedDate.Value.Year + "-" + CreatedToDate.SelectedDate.Value.Month + "-" + CreatedToDate.SelectedDate.Value.Day;
            string Full_FrTime = Fr_Time.SelectedValue + ":00";// + InputMinute.Value;
            string Full_ToTime = To_Time.SelectedValue + ":00";// + InputMinute.Value;
            //DateTime.Now.Hour + ":" + DateTime.Now.Minute + ":" + DateTime.Now.Second;
            Fr_FullDateTime = Full_FrDate + " " + Full_FrTime;
            To_FullDateTime = Full_ToDate + " " + Full_ToTime;

            if (Viewby == "sur")
                lbTitle.Text = " THỐNG KÊ LỊCH HẸN PHẪU THUẬT/ LÀM THỦ THUẬT";
            else
                lbTitle.Text = " THỐNG KÊ LỊCH HẸN KHÁM NGOẠI TRÚ";

            UserID = (string)Session["UserID"]; UserName = (string)Session["UserName"];
            UGroup = (string)Session["UserGroup"]; Dep = (string)Session["Dep"];
            string var_temp = Request.QueryString["tmp"];
            if (var_temp == "1")
                temp = true;

            if (!string.IsNullOrEmpty(UserID))
            {
                PersonID = (Guid)Session["PersonID"];//PersonID = Guid.Parse("15b5b2f0-cf23-466a-9a9a-01f06e858052");
                if ((Dep == "PSO" | Dep == "ICT") && (!temp))
                {
                    if (Viewby == "sur")
                        SurReport.Visible = true;
                    else
                        DailyReport.Visible = true;
                    ButtonSMS.Visible = true;
                }
                else
                {                    
                    SurReport.Visible = false;                    
                    DailyReport.Visible = false;
                    ButtonSMS.Visible = false;
                }
            }
            string query = "SELECT TOP 1 cpr.user_name ";
            query += "FROM AIH_MIS.dbo.customer_phone_role cpr WHERE cpr.user_name = '" + UserID + "' ";

            SQLAppClass SQL_Class = new SQLAppClass();

            string view_flag = SQL_Class.CheckAndGetItem(query, "user_name", ConnStringMISPro);
            
            if (!string.IsNullOrEmpty(view_flag))
                RadGrid1.MasterTableView.GetColumn("patient_phone").Visible = true;
            else
                RadGrid1.MasterTableView.GetColumn("patient_phone").Visible = false;

            external_access = MISClass.In_Array(external_user, UserID);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            btGo1 = true;
            btGo2 = false;
            RadGrid1.MasterTableView.Rebind();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            btGo2 = true;
            btGo1 = false;
            RadGrid1.MasterTableView.Rebind();
        }
        public void Load_Shift(string varConn)
        {
            string query = "SELECT name_l as clinic_name FROM  dbo.area_nl_view  WHERE (area_type_rcd = 'CLI') GROUP BY name_l";
            ShiftDataSource.ConnectionString = varConn;
            ShiftDataSource.SelectCommand = query;
        }
        public DataTable GetDataTable(string query)
        {
            Page.Server.ScriptTimeout = 99999;
            //SqlCommand cmd = new SqlCommand(query);
            //cmd.CommandTimeout = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["SqlCommandTimeOut"]);
            SqlConnection conn = new SqlConnection(ConnStringHIS);
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = new SqlCommand(query, conn);
            adapter.SelectCommand.CommandTimeout = 99999;

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
        protected void RadGrid1_PreRender(object sender, EventArgs e)
        {
            RadGrid grid = (RadGrid)sender;
            GridTableView view = grid.MasterTableView;  //Top-level view   
            this.GridTableHierarchySetEditability(view, Export);
        }
        protected void RadGrid1_DataBound(object sender, EventArgs e)
        {
            if (Export)
            {
                foreach (GridHeaderItem headercha in RadGrid1.MasterTableView.GetItems(GridItemType.Header))
                {
                    headercha.BackColor = System.Drawing.Color.LightBlue;
                }
                LoopHierarchyRecursive(RadGrid1.MasterTableView, 0);
            }
        }
        protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem && Export)
            {
                foreach (TableCell cell in e.Item.Cells)
                    cell.Style["Vertical-align"] = "top";
            }
            if (e.Item is GridHeaderItem && Export)
            {
                GridHeaderItem item = e.Item as GridHeaderItem;
                item.Style["border"] = "solid 0.1pt #000000";
            }
            if (e.Item is GridFooterItem && Export)
            {
                GridFooterItem itemf = e.Item as GridFooterItem;
                itemf.BackColor = System.Drawing.Color.LightBlue;
                itemf.Font.Bold = true;
            }
            if (e.Item is GridFilteringItem && Export)
                e.Item.Visible = false;
        }
        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                foreach (TableCell cell in e.Item.Cells)
                {
                    if (cell.Text == "0" | cell.Text == "0%" | cell.Text == "0.0" | cell.Text == "0.00" | cell.Text == "0.000")
                        cell.Text = String.Empty;
                }
                GridDataItem dataItem = (GridDataItem)e.Item;
                string Specimen_Status = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "visited_dr"));
                string HandPhone = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "patient_phone"));

                string Ngay_Den = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "visit_come"));
                string Ngay_Hen = Convert.ToString(DataBinder.Eval(dataItem.DataItem, "created_come"));
                //int Came = 1;
                //if (!string.IsNullOrEmpty(Ngay_Den))
                //  Came = Convert.to;

                if (Specimen_Status != "")// && !string.IsNullOrEmpty(RoutineDate))
                {
                    dataItem["visited_dr"].BackColor = Color.Red;
                    dataItem["visited_dr"].ForeColor = Color.White;
                }
                else if (Specimen_Status == "")// && !string.IsNullOrEmpty(RoutineDate))
                    dataItem["visit_date"].Text = "";

                if (string.IsNullOrEmpty(HandPhone))
                    dataItem.BackColor= System.Drawing.Color.GreenYellow;
                if (Ngay_Den == "0")
                    dataItem["visit_date"].BackColor = System.Drawing.Color.Yellow;
                if (Ngay_Hen == "0" | Ngay_Hen == "1")
                    dataItem["visit_date"].BackColor = System.Drawing.Color.Blue;

            }
            if (e.Item is GridDataItem && Export)
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                foreach (TableCell cell in e.Item.Cells)
                {
                    cell.Style["Vertical-align"] = "top";
                    //dataItem["OPD"].Font.Strikeout = true;
                    if (Export_Group)
                        cell.Style["font-weight"] = "normal";
                }
            }
            if (e.Item is GridHeaderItem && Export)
            {
                GridHeaderItem item = e.Item as GridHeaderItem;
                item.Style["border"] = "solid 0.1pt #000000";
            }
            if (e.Item is GridFooterItem && Export)
            {
                GridFooterItem itemf = e.Item as GridFooterItem;
                itemf.BackColor = System.Drawing.Color.LightBlue;
                itemf.Font.Bold = true;
            }
            if (e.Item is GridFilteringItem && Export)
                e.Item.Visible = false;
        }
        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string var_temp = Request.QueryString["tmp"];
            Guid ParentID = Guid.Parse("11223344-5566-7788-99AA-BBCCDDEEFF00");
            //string CostID = "";// Guid.Parse("11223344-5566-7788-99AA-BBCCDDEEFF00");
            if (var_temp == "1")
                temp = true;
            string query = GetQuery(temp);//;, ParentID, Shift_ID);

            RadGrid1.DataSource = GetDataTable(query);
        }
        protected void ButtonExport_Click(object sender, System.EventArgs e)
        {
            Export = true;
            GridTableView view = RadGrid1.MasterTableView;  //Top-level view  
            string ExportExcel = ((LinkButton)sender).ID;
            if (ExportExcel == "ExportGroup")
            {
                Export_Group = true;
                RadGrid1.MasterTableView.HierarchyDefaultExpanded = false;
            }
            if (ExportExcel == "ExportDetail")
            {
                //ExportAll = true;
                //ExpandGridTableView(this.RadGrid1.MasterTableView, true);
                RadGrid1.MasterTableView.HierarchyDefaultExpanded = true;
            }
            RadGrid1.MasterTableView.AllowFilteringByColumn = false;
            RadGrid1.ExportSettings.ExportOnlyData = true;
            RadGrid1.ExportSettings.IgnorePaging = true;
            RadGrid1.ExportSettings.OpenInNewWindow = true;
            string gridcaption = "<b style='color: blue; text-align: left; font-size:20'>OPD APPOINTMENT STATISTICS REPORT</b>";
            if (!string.IsNullOrEmpty(To_Date))//String.Format("{0:dd/MMM/yyyy}", FromDate.SelectedDate);String.Format("{0:dd/MMM/yyyy}", ToDate.SelectedDate)
                gridcaption += "<BR/>" + "<b>From date: </b>" + Fr_Date + "<b> to:</b>" + To_Date;
          //  else
            //    gridcaption += "<BR/>" + "<b>From date: </b>" + Fr_Date + "<b> to:</b>" + String.Format("{0:dd/MMM/yyyy}", DateTime.Today.Date);
            //gridcaption += "<BR/>" + "<b> Shit name: " + Shift_Name + " </b>";
            RadGrid1.MasterTableView.Caption = gridcaption;
            RadGrid1.MasterTableView.ExportToExcel();
        }
        protected void ButtonExportCreated_Click(object sender, System.EventArgs e)
        {
            Export = true; ExCreated = true;
            GridTableView view = RadGrid1.MasterTableView;  //Top-level view  
            string ExportExcel = ((LinkButton)sender).ID;
            if (ExportExcel == "ExportGroup")
            {
                Export_Group = true;
                RadGrid1.MasterTableView.HierarchyDefaultExpanded = false;
            }
            if (ExportExcel == "ExportDetail")
            {
                //ExportAll = true;
                //ExpandGridTableView(this.RadGrid1.MasterTableView, true);
                RadGrid1.MasterTableView.HierarchyDefaultExpanded = true;
            }
            RadGrid1.MasterTableView.AllowFilteringByColumn = false;
            RadGrid1.ExportSettings.ExportOnlyData = true;
            RadGrid1.ExportSettings.IgnorePaging = true;
            RadGrid1.ExportSettings.OpenInNewWindow = true;
            string gridcaption = "<b style='color: blue; text-align: left; font-size:20'>OPD CREATED APPOINTMENT STATISTICS REPORT</b>";
            if (!string.IsNullOrEmpty(Cr_To_Date))// String.Format("{0:dd/MMM/yyyy}", CreatedFromDate.SelectedDate)
                gridcaption += "<BR/>" + "<b>From date: </b>" + Fr_FullDateTime + "<b> to:</b>" + To_FullDateTime;
            //else
              //  gridcaption += "<BR/>" + "<b>From date: </b>" + String.Format("{0:dd/MMM/yyyy}", CreatedFromDate.SelectedDate) + "<b> to:</b>" + String.Format("{0:dd/MMM/yyyy}", DateTime.Today.Date);
            //gridcaption += "<BR/>" + "<b> Shit name: " + Shift_Name + " </b>"; String.Format("{0:dd/MMM/yyyy}", CreatedFromDate.SelectedDate)
            RadGrid1.MasterTableView.Caption = gridcaption;
            RadGrid1.MasterTableView.ExportToExcel();
        }
        protected void RadGrid1_ExcelExportCellFormatting(object source, ExcelExportCellFormattingEventArgs e)
        {
            GridDataItem item = e.Cell.Parent as GridDataItem;
            e.Cell.Style["border"] = "solid 0.1pt #000000";
        }
        protected void RadGrid1_GridExporting(object source, GridExportingArgs e)
        {
            if (e.ExportType == ExportType.Excel)
            {
                string css = "<style> td { border:solid 0.1pt #000000; }</style>";
                e.ExportOutput = e.ExportOutput.Replace("</head>", css + "</head>");
            }
        }
        protected void RadGrid1_ExportCellFormatting(object source, ExcelExportCellFormattingEventArgs e)
        {
            switch (e.FormattedColumn.UniqueName)
            {
                case "net_amount":
                    e.Cell.Style["mso-number-format"] = @"0:#.#";
                    break;
                case "unpay_amount":
                    e.Cell.Style["mso-number-format"] = @"0:#.#";
                    break;
                case "discount_amount":
                    e.Cell.Style["mso-number-format"] = @"0:#.#";
                    break;
                case "owing_amount":
                    e.Cell.Style["mso-number-format"] = @"0:#.#";
                    break;
                case "total_visit":
                    e.Cell.Style["mso-number-format"] = @"0:#.#";
                    break;
                case "open_visit":
                    e.Cell.Style["mso-number-format"] = @"0:#.#";
                    break;
                case "NgayHD":
                    e.Cell.Style["mso-number-format"] = @"d\\-mmm\\-yyyy";
                    break;
            }
        }
        protected void LoopHierarchyRecursive(GridTableView gridTableView, int i)
        {
            foreach (GridNestedViewItem nestedViewItem in gridTableView.GetItems(GridItemType.NestedView))
            {
                // you should skip the items if not expanded, or tables not bound
                if (nestedViewItem.NestedTableViews.Length > 0)
                {
                    // now you can access: nestedViewItem.NestedTableViews[0].Items, which will be the DataItems of this nested table
                    // then make recursive call
                    foreach (GridDataItem item in gridTableView.Items)
                    {
                        if (i == 0)
                        {
                            if (!Export_Group)
                                item.BackColor = System.Drawing.Color.LightGray;
                        }
                        else if (i == 1)
                            item.BackColor = System.Drawing.Color.LightBlue;
                        item.Font.Bold = true;
                        if (item.Expanded)
                        {
                            foreach (GridTableView childTable in item.ChildItem.NestedTableViews)
                            {
                                foreach (GridHeaderItem headercon in childTable.GetItems(GridItemType.Header))
                                {
                                    headercon.Visible = false;
                                }
                            }
                        }
                    }
                    varColor = varColor + 1;
                    LoopHierarchyRecursive(nestedViewItem.NestedTableViews[0], varColor);
                    // above [0] stands for the first table in the hierarchy, since Telerik RadGrid supports multiple tables at a level
                }
            }
        }
        protected void GridTableHierarchySetEditability(GridTableView view, bool Export)
        {
            if (view.HasDetailTables)
            {
                foreach (GridDataItem item in view.Items)
                {
                    if (item.HasChildItems)
                    {
                        item.ChildItem.HorizontalAlign = HorizontalAlign.Right;// VerticalAlign.Top;
                        item.ChildItem.Font.Bold = true;
                        item.ChildItem.NestedViewCell.HorizontalAlign = HorizontalAlign.Right;
                        foreach (GridTableView innerView in item.ChildItem.NestedTableViews)
                        {
                            innerView.HorizontalAlign = HorizontalAlign.Right;
                            GridTableHierarchySetEditability(innerView, Export);
                        }
                    }
                    //DisplayColumnTien(item);
                }
            }
        }
        private void ExpandGridTableView(GridTableView gridTableView, bool expand)
        {
            gridTableView.HierarchyDefaultExpanded = expand; int ExportLevel = 0;

            if (!ExportAll)
            {
                foreach (var detailTable in gridTableView.DetailTables)
                {
                    if (ExportLevel == 0)
                        detailTable.HierarchyDefaultExpanded = expand;
                    ExportLevel = 1;
                }
            }
            else
            {
                foreach (var detailTable in gridTableView.DetailTables)
                {
                    ExpandGridTableView(detailTable, expand);
                }
            }
        }
        public string GetQuery(bool showDetail)//, Guid varID, string varSID)
        {
            string Get_query = ""; string query_final = "";

            string Get_Emp_Name = "SELECT top 1 first_name_l + N' ' + last_name_l as employee_name FROM dbo.employee_info_view ";
            Get_Emp_Name +="WHERE (person_id = cd.charged_by_employee_id) ";

            string Get_Patient_Name = "SELECT TOP(1) first_name_l + N' ' + last_name_l AS patient_name ";
            Get_Patient_Name += "FROM dbo.person_name_iview_nl_view WHERE (person_id = aa.patient_id) ";

            //string Get_Patient_Phone = "SELECT TOP(1) phv.phone_number ";
            //Get_Patient_Phone += "FROM dbo.person_phone_nl_view AS pphv INNER JOIN ";
            //Get_Patient_Phone += "dbo.phone_nl_view AS phv ON pphv.phone_id = phv.phone_id ";
            //Get_Patient_Phone += "WHERE (pphv.person_phone_type_rcd = 'MO') AND (pphv.effective_until_date IS NULL) ";
            //Get_Patient_Phone += "AND (pphv.person_id = aa.patient_id) ";

            string Get_Patient_Phone = "SELECT TOP(1) phv.phone_number ";
            Get_Patient_Phone += "FROM AIH_MIS.dbo.person_phone_nl_view AS pphv INNER JOIN ";
            Get_Patient_Phone += "AIH_MIS.dbo.phone_nl_view AS phv ON pphv.phone_id = phv.phone_id ";
            Get_Patient_Phone += "WHERE (pphv.person_phone_type_rcd = 'MO') AND (pphv.effective_until_date IS NULL) ";
            Get_Patient_Phone += "AND (pphv.person_id = aa.patient_id) ";

            string Get_ASC_Baby_Phone = " SELECT TOP (1) phone.phone_number ";
            Get_ASC_Baby_Phone += " FROM OrionHIS_PRO.dbo.patient_hospital_usage_nl_view phu ";
            Get_ASC_Baby_Phone += " INNER JOIN OrionHIS_PRO.dbo.patient_nl_view p ON p.patient_id = phu.patient_id ";
            Get_ASC_Baby_Phone += " LEFT JOIN OrionHIS_PRO.dbo.relationship_nl_view r ON r.person_id = p.patient_id ";
            Get_ASC_Baby_Phone += " LEFT JOIN OrionHIS_PRO.dbo.person_nl_view per ON per.person_id = r.associated_person_id ";
            Get_ASC_Baby_Phone += " LEFT JOIN AIH_MIS.dbo.person_phone_nl_view pp ON pp.person_id = per.person_id ";
            Get_ASC_Baby_Phone += " AND pp.effective_until_date IS NULL ";
            Get_ASC_Baby_Phone += " AND pp.person_phone_type_rcd = 'MO' ";
            Get_ASC_Baby_Phone += " LEFT JOIN AIH_MIS.dbo.phone_nl_view phone ON phone.phone_id = pp.phone_id ";
            Get_ASC_Baby_Phone += " WHERE phu.patient_id = aa.patient_id ";
            Get_ASC_Baby_Phone += " AND p.born_in_this_hospital_flag = 1 ";
            Get_ASC_Baby_Phone += " AND r.relationship_type_rcd = 'MO' ";

            string Get_Patient_Mail = "SELECT TOP(1) email_address FROM dbo.email_nl_view ";
            Get_Patient_Mail += "WHERE (email_type_rcd = 'PE') AND (person_id = aa.patient_id) ";

            string Get_Temp_Patient_Mail = "SELECT TOP(1) email_address FROM dbo.temporary_patient_email_nl_view ";
            Get_Temp_Patient_Mail += "WHERE (email_type_rcd = 'PE') AND (temporary_patient_id = aa.patient_id) ";

            string Get_Patient_Age = " SELECT [dbo].[radt_VisiblePatientAge] (per1.date_of_birth, ser.resource_start_date_time, 'VI') ";
            Get_Patient_Age += " FROM dbo.person_nl_view AS per1 WHERE per1.person_id = aa.patient_id ";

            string Get_Patient_DOB = " SELECT per2.date_of_birth ";
            Get_Patient_DOB += " FROM dbo.person_nl_view AS per2 WHERE per2.person_id = aa.patient_id ";

            string Get_Temp_Patient_Name = "SELECT TOP(1) first_name_l + N' ' + last_name_l AS temp_patient_name ";
            Get_Temp_Patient_Name += "FROM dbo.temporary_patient_nl_view ";
            Get_Temp_Patient_Name += "WHERE (temporary_patient_id = aa.temporary_patient_id) ";

            string Get_Temp_Patient_Age = " SELECT [dbo].[radt_VisiblePatientAge] (tmp1.date_of_birth, ser.resource_start_date_time, 'VI') ";
            Get_Temp_Patient_Age += " FROM dbo.temporary_patient_nl_view AS tmp1 WHERE tmp1.temporary_patient_id = aa.temporary_patient_id ";

            string Get_Temp_Patient_DOB = " SELECT tmp2.date_of_birth ";
            Get_Temp_Patient_DOB += " FROM dbo.temporary_patient_nl_view AS tmp2 WHERE tmp2.temporary_patient_id = aa.temporary_patient_id ";


            string get_national = "SELECT TOP(1) nationality_rcd FROM dbo.person_nl_view ";
            get_national += "WHERE(person_id = aa.patient_id) ";

            string get_national_tmp = "SELECT TOP(1) nationality_rcd FROM dbo.temporary_patient_nl_view ";
            get_national_tmp +="WHERE (temporary_patient_id = aa.temporary_patient_id) ";

            string Get_Temp_Phone = "SELECT top 1 phv.phone_number ";
            Get_Temp_Phone +="FROM dbo.temporary_patient_phone_nl_view AS pphv INNER JOIN ";
            Get_Temp_Phone +="dbo.phone_nl_view AS phv ON pphv.phone_id = phv.phone_id ";
            Get_Temp_Phone +="WHERE(pphv.person_phone_type_rcd = 'MO') AND (temporary_patient_id = aa.temporary_patient_id) ";

            string get_user = "SELECT user_name FROM user_account_nl_view WHERE user_id = ntf.notified_by_user_id ";

            string Get_Emp_Phone = "SELECT per.person_id, p1.phone_number, emai.email_address, p2.person_phone_type_rcd, per.first_name_l, ";
            Get_Emp_Phone +="per.last_name_l, per.first_name_e, per.last_name_e ";
            Get_Emp_Phone +="FROM dbo.email_nl_view AS emai RIGHT OUTER JOIN ";
            Get_Emp_Phone +="dbo.employee_info_view AS per ON emai.person_id = per.person_id LEFT OUTER JOIN ";
            Get_Emp_Phone +="dbo.phone_nl_view AS p1 INNER JOIN ";
            Get_Emp_Phone +="dbo.person_phone_nl_view AS p2 ON p1.phone_id = p2.phone_id ON per.person_id = p2.person_id ";
            Get_Emp_Phone += "GROUP BY per.person_id, p1.phone_number, emai.email_address, p2.person_phone_type_rcd,emai.email_type_rcd, ";
            Get_Emp_Phone +="p2.effective_until_date, per.first_name_l, per.last_name_l, per.first_name_e, per.last_name_e ";
            Get_Emp_Phone +="HAVING(p2.effective_until_date IS NULL) AND(per.person_id = sch.doctor_id) ";
            Get_Emp_Phone += "AND email_type_rcd = 'BU' ";
            //Get_Emp_Phone +="AND (emai.email_address LIKE N'%@aih.com.vn') ";

            string get_visit = "SELECT TOP (1) pv.actual_visit_date_time AS visit_date ";
            get_visit += "FROM dbo.patient_primary_hospital_usage_view AS puv INNER JOIN ";
            get_visit += "dbo.patient_visit_nl_view AS pv ON puv.from_patient_id = pv.patient_id ";
            get_visit += "WHERE (puv.visible_patient_id = pphuv.visible_patient_id) ";
            get_visit += "ORDER BY pv.actual_visit_date_time DESC ";

            string query = "SELECT ser.seq_num, sev.creation_date_time, ser.resource_start_date_time, ser.resource_end_date_time, sev.event_start_date_time, ";
            query += "sev.event_end_date_time, ser.active_flag, ser.non_scheduled_resource_flag, aa.deleted_date_time, ";
            query += "ser.ignore_availability_result_flag, ser.resource_was_autopicked_flag, ser.split_resource_end_date_time, ";
            query += "ser.split_resource_start_date_time, ser.ignore_booking_conflict_flag, ser.primary_resource_flag, ";
            query += "aa.appointment_number, ser.sch_resource_id AS doctor_id, stst.sch_task_id,sr.employee_id,sev.lu_updated,";
            query += "ser.sch_resource_type_rcd, sr.name_e as doctor_name_e, sr.name_l as doctor_name_l, ";
            query += "ser.sch_time_type_rcd, aa.patient_id, aa.app_appointment_type_rcd, sev.sch_event_type_rcd, ";
            query += "stst.name_e AS app_type_e, stst.name_l AS app_type_l, aa.visit_reason_rcd, aa.cancel_date_time, ";
            query += "aa.cancelled_by_user_id, aa.cancel_comment, aa.temporary_patient_id, aa.booking_type_rcd, ";
            query += "aa.deleted_by_user_id, ISNULL(aa.instructions, N'') + N'-' + ISNULL(aa.comment, N'') as comment, ";
            query += "sersr.name_e AS sch_event_resource_status_name_e, ";
            query += "CASE WHEN aa.patient_id IS NULL THEN (" + get_national_tmp + ") ELSE  ";
            query += "(" + get_national + ") END AS patient_national, ";
            query += "CASE WHEN aa.patient_id IS NULL THEN (" + Get_Temp_Patient_Name + ") ELSE  ";
            query += "(" + Get_Patient_Name + ") END AS patient_name, ";
            query += "CASE WHEN aa.patient_id IS NULL THEN (" + Get_Temp_Patient_Age + ") ELSE  ";
            query += "(" + Get_Patient_Age + ") END AS patient_age, ";
            query += "CASE WHEN aa.patient_id IS NULL THEN (" + Get_Temp_Patient_DOB + ") ELSE  ";
            query += "(" + Get_Patient_DOB + ") END AS date_of_birth, ";
            query += "CASE WHEN aa.patient_id IS NULL THEN (" + Get_Temp_Phone + ") ELSE  ";
            query += " ISNULL (  (" + Get_ASC_Baby_Phone + "), (" + Get_Patient_Phone + ") )  END AS patient_phone, pphuv.visible_patient_id,  ";
            query += "CASE WHEN aa.patient_id IS NULL THEN (" + Get_Temp_Patient_Mail + ") ELSE  ";            
            query += "(" + Get_Patient_Mail + ") END AS patient_mail, ";
            query += "ntfs.name_l as notify_method, ntf.notified_by_user_id, (" + get_user + ") AS notify_user, ";            
            query += "(" + get_visit + ") as visit_date ";
            query += "FROM dbo.sch_event_notification_method_ref_nl_view AS ntfs INNER JOIN ";
            query += "dbo.sch_event_notification_nl_view AS ntf ON ntfs.sch_event_notification_method_rcd  = ntf.sch_event_notification_method_rcd ";
            query += "RIGHT OUTER JOIN ";
            query += "dbo.sch_event_resource_nl_view AS ser INNER JOIN ";
            query += "dbo.app_appointment_nl_view AS aa ON ser.sch_event_id = aa.sch_event_id LEFT OUTER JOIN ";
            query += "dbo.sch_resource_nl_view AS sr ON ser.sch_resource_id = sr.sch_resource_id ";
            query += "AND ser.sch_resource_type_rcd = sr.sch_resource_type_rcd INNER JOIN ";
            query += "dbo.sch_event_resource_status_ref_nl_view AS sersr ";
            query += "ON ser.sch_event_resource_status_rcd = sersr.sch_event_resource_status_rcd INNER JOIN ";
            query += "dbo.sch_event_nl_view AS sev ON ser.sch_event_id = sev.sch_event_id INNER JOIN ";
            query += "dbo.sch_task_step_nl_view AS stst ON sev.sch_task_id = stst.sch_task_id ";
            query += "ON ntf.sch_event_id = ser.sch_event_id LEFT OUTER JOIN ";
            query += "dbo.patient_primary_hospital_usage_view AS pphuv ON aa.patient_id = pphuv.patient_id ";

            if (Request.QueryString["by"] == "sur")
            {
                query += "WHERE (stst.name_e LIKE N'Task%') AND (ser.active_flag = 1) ";
                query += "AND (ser.sch_resource_type_rcd <>'PATIENT') ";
            }
            else
                query += "WHERE (ser.sch_resource_type_rcd = 'EMPLOYEE') AND (stst.name_e LIKE N'%Appointment%') AND (ser.active_flag = 1) ";

            if ((!btGo1 && !btGo2 &&!ExCreated) | btGo1)
            {
                if (!string.IsNullOrEmpty(Fr_Date) && string.IsNullOrEmpty(To_Date))
                    query += "AND (ser.resource_start_date_time BETWEEN CONVERT(DATETIME, '" + Fr_Date + "', 102) AND GETDATE()) ";
                else if (!string.IsNullOrEmpty(Fr_Date) && !string.IsNullOrEmpty(To_Date))
                {
                    query += "AND (ser.resource_start_date_time BETWEEN CONVERT(DATETIME, '" + Fr_Date + "', 102) AND ";
                    query += "CONVERT(DATETIME, '" + To_Date + "', 102)) ";//
                }
            }
            else if (btGo2 | ExCreated)
            {
                if (!string.IsNullOrEmpty(Cr_Fr_Date) && string.IsNullOrEmpty(Cr_To_Date))
                    query += "AND (sev.lu_updated BETWEEN CONVERT(DATETIME, '" + Fr_FullDateTime + "', 102) AND GETDATE()) ";//Cr_Fr_Date,sev.creation_date_time
                else if (!string.IsNullOrEmpty(Cr_Fr_Date) && !string.IsNullOrEmpty(Cr_To_Date))
                {
                    query += "AND (sev.lu_updated BETWEEN CONVERT(DATETIME, '" + Fr_FullDateTime + "', 102) AND ";//Cr_Fr_Datesev.creation_date_time
                    query += "CONVERT(DATETIME, '" + To_FullDateTime + "', 102)) ";//Cr_To_Date
                }
            }

            if (UGroup != "Full" && !external_access)
                query += "AND sr.employee_id = '" + PersonID + "' ";            
            //query += "ORDER BY ser.resource_start_date_time DESC ";

            string get_dr = "SELECT TOP (1) ";
            get_dr += "(SELECT        TOP(1) first_name_e + N' ' + last_name_e AS employee_name ";
            get_dr += "FROM            dbo.employee_info_view ";
            get_dr += "WHERE(person_id = pwqe.employee_id)) AS employee_name ";
            get_dr += "FROM dbo.patient_work_queue_entry_nl_view AS pwqe INNER JOIN ";
            get_dr += "dbo.employee_nl_view AS e ON pwqe.employee_id = e.employee_id ";
            get_dr += "WHERE(pwqe.patient_wq_status_rcd <> 'CAN') ";
            get_dr += "GROUP BY pwqe.patient_visit_id, pwqe.employee_id, pwqe.start_date_time, e.employee_id ";
            get_dr += "HAVING(e.employee_id = doctor_id) ";
            get_dr += "ORDER BY pwqe.start_date_time DESC ";

            string query1 = "SELECT seq_num,creation_date_time, resource_start_date_time, resource_end_date_time, active_flag, non_scheduled_resource_flag, ";
            query1 +="deleted_date_time, ignore_availability_result_flag, resource_was_autopicked_flag, split_resource_end_date_time, ";
            query1 +="split_resource_start_date_time, ignore_booking_conflict_flag, primary_resource_flag, appointment_number, ";
            query1 += "doctor_id, sch_resource_type_rcd, doctor_name_e, doctor_name_l, sch_event_resource_status_name_e, patient_mail,";
            query1 +="sch_time_type_rcd, patient_id, app_appointment_type_rcd, sch_event_type_rcd, app_type_e, app_type_l, ";
            query1 +="visit_reason_rcd, cancel_date_time, cancelled_by_user_id, cancel_comment, temporary_patient_id, booking_type_rcd, ";
            query1 += "deleted_by_user_id,comment,MO,HO, HE,email_address,patient_name,sch_task_id,visible_patient_id, lu_updated,";
            query1 += "notify_method, notify_user,patient_phone,patient_national,visit_date, patient_age, date_of_birth, ";
            //query1 += "'../pso/registration.aspx?vid='+CONVERT (varchar(38), temporary_patient_id) as urlink ";
            query1 += "'../opd/trackpatientphone.aspx?vid='+visible_patient_id as urlink ";
            query1 +="FROM (" + query + ") as sch ";
            query1 +="OUTER APPLY ";
            query1 +="(" + Get_Emp_Phone + ") as pm ";
            query1 +="PIVOT (max(phone_number) FOR person_phone_type_rcd IN ([MO], [HO], [HE])) as nn ";
            if (showDetail)
                query1 += "WHERE temporary_patient_id IS NOT NULL ";
            
            //query1 +="ORDER BY appointment_number DESC";

            //query_final = query1;

            string query_fn = "SELECT *, DATEDIFF(mi, visit_date, resource_start_date_time) as visit_truoc, ";
            query_fn += "CASE WHEN DATEDIFF(mi, visit_date, resource_start_date_time) >=-1440 AND ";
            query_fn += "DATEDIFF(mi, visit_date, resource_start_date_time) <= 1440 THEN "; // 1 ELSE '' END as visited_dr ";
            query_fn += "("+ get_dr +") ELSE '' END as visited_dr, smslog.sent_phone, ";
            query_fn += "DATEDIFF(day, visit_date, resource_start_date_time) as visit_come, ";
            query_fn += "DATEDIFF(day, lu_updated, resource_start_date_time) as created_come ";
            query_fn += "FROM (" + query1 + ") as fn ";
            query_fn += "OUTER APPLY (SELECT TOP 1 slog.patient_phone AS sent_phone FROM AIH_MIS.dbo.ext_appointment_log_view AS slog ";
            query_fn += "WHERE slog.patient_phone = fn.patient_phone AND slog.resource_start_date_time = fn.resource_start_date_time) AS smslog ";

            if (Viewby=="sur")
                query_fn += "ORDER BY patient_name";// resource_start_date_time DESC";
            else
                query_fn += "ORDER BY doctor_name_e";// resource_start_date_time DESC";

            query_final = query_fn;

            Get_query = query_final;
            return Get_query;
        }
        public void Get_Infor(string varKhamNhieuCK)
        {
            SQLAppClass SQL_Class = new SQLAppClass();
            int opd_no = 0; int can_no = 0;
            string get_opd_no = "SELECT COUNT(patient_visit_id) AS opdvisit ";
            get_opd_no += "FROM (SELECT patient_visit_id ";
            get_opd_no += "FROM dbo.patient_visit_nl_view AS pv ";
            get_opd_no += "WHERE (YEAR(actual_visit_date_time) IS NOT NULL) AND (visit_type_rcd <> 'IPD') ";
            get_opd_no += "AND (visit_type_rcd <> 'ERO') AND (visit_type_rcd <> 'DC')) AS opdv ";

            opd_no = SQL_Class.CheckAndGetIntItem(get_opd_no, "opdvisit", ConnStringHIS);
            //lbTotalOPD.Text = String.Format("{0:#,#}", opd_no);

            string get_can_no = "SELECT COUNT(patient_visit_id) AS opdcan ";
            get_can_no += "FROM (SELECT patient_visit_id ";
            get_can_no += "FROM dbo.patient_work_queue_entry_nl_view AS wq ";
            get_can_no += "WHERE (patient_wq_status_rcd = 'CAN') ";
            get_can_no += "GROUP BY patient_visit_id) AS opdcan ";

            can_no = SQL_Class.CheckAndGetIntItem(get_can_no, "opdcan", ConnStringHIS);
            //lbCancelOPD.Text = String.Format("{0:#,#}", can_no);

            string get_kham = "SELECT COUNT(visit_code) AS no_ck, visit_code FROM (" + varKhamNhieuCK + ") as ck ";
            get_kham += "GROUP BY visit_code HAVING (COUNT(visit_code) > 1)";

            int getck = 0; int ck = 0;
            SqlConnection conn = new SqlConnection(ConnStringHIS);
            SqlCommand com = new SqlCommand(get_kham, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ck = Convert.ToInt32(reader["no_ck"]);
                        if (ck == 2)
                            getck = getck + 1;
                        else if (ck == 3)
                            getck = getck + 2;
                        else if (ck == 4)
                            getck = getck + 3;
                    }
                }
            }
            finally
            {
                conn.Close();
            }
            //lbNhieuCK.Text = String.Format("{0:#,#}", getck);

            //lbOPDThucte.Text = String.Format("{0:#,#}", (opd_no - can_no));
        }
        protected void ButtonSend_Click(object sender, EventArgs e)
        {
            switch ((sender as Button).ID)
            {
                case "DailyReport":
                    {
                        SendListPatientToDoctor("DailyReport");
                    }
                    break;
            }
        }
        protected void SendListPatientToDoctor(string varReport)
        {
            string DoctorMail = ""; string DoctorName = ""; string F_Doctor = ""; int i = 0; bool FirstRow = true;

            string PID = ""; string P_Name = ""; string Visit_Date = ""; string Visit_Type = ""; string[] To_CC = new string[4];
            string AddDong = ""; string End_Date = ""; string RemindBody = ""; string ToEmail = "tuan.cao@aih.com.vn";
            string F_DrMail = ""; string To_PSO = "hao.thich@aih.com.vn"; var htmlcontent = "";
            
            Guid ParentID = Guid.Parse("11223344-5566-7788-99AA-BBCCDDEEFF00");
            string query = GetQuery_Dr(false);//, ParentID, Shift_ID);

            //To_CC[0] = "tuan.cao@aih.com.vn";

            SqlConnection conn = new SqlConnection(ConnStringHIS);
            SqlCommand com = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        DoctorMail = Convert.ToString(reader["email_address"]);
                        //Doctor_ID = Convert.ToString(reader["employee_id"]);
                        DoctorName = Convert.ToString(reader["doctor_name_l"]);
                        if (i == 0)
                        {
                            F_Doctor = DoctorName;
                            F_DrMail = DoctorMail;
                        }
                        i = i + 1;
                        PID = Convert.ToString(reader["visible_patient_id"]);//actual_visit_date_time
                        P_Name = Convert.ToString(reader["patient_name"]);
                        Visit_Type = Convert.ToString(reader["app_type_e"]);
                        Visit_Date = Convert.ToString(reader["resource_start_date_time"]);
                        End_Date = Convert.ToString(reader["resource_end_date_time"]);
                        //Sex = Convert.ToString(reader["sex_rcd"]);                                                
                        //ToEmail = "hao.thich@aih.com.vn";//"tuan.cao@aih.com.vn";//                        
                        if (DoctorName != F_Doctor)
                        {
                            ToEmail = F_DrMail;// varDoctorEmail; //Convert.ToString(reader["email_adress"]);
                            RemindBody = "<table width=100% border=1 cellpadding=0 cellspacing=0>" +
                                "<tr><td colspan=5 bgcolor=#007196><div align=left><font color=#FFFFFF>" +
                                "<b>APPOINTMENT LIST WITH CAREGIVER: " + F_Doctor.ToUpper() + "</b></font></div></td></tr>" +
                                "<tr><td width=10%><b>PID</b></td>" +
                                "<td width=25%><b>Patient Name</b></td>" +
                                "<td width=15%><b>Visit Type</b></td>" +
                                "<td width=15%><b>From</b></td>" +
                                "<td width=15%><b>To</b></td>" +
                                "</tr>" + AddDong +
                            "</table>";

                            var sh = "Click here";
                            var styleStr = "<html><head><link href = '" + sh + "' rel='stylesheet' type='text/css'></link></head>";
                            htmlcontent = styleStr + "<body>" + RemindBody + "</body></html>";
                            //ToEmail = "tuan.cao@aih.com.vn";
                            if (!string.IsNullOrEmpty(ToEmail))
                                SendMail(htmlcontent, ToEmail, To_CC, "DailyReport");
                            else
                                SendMail(htmlcontent, To_PSO, To_CC, "NoMailReport");

                            RemindBody_ToBOD = AddRemind(AddDong, F_Doctor, FirstRow, false);
                            FirstRow = false;

                            F_Doctor = DoctorName;
                            F_DrMail = DoctorMail;

                            AddDong = ""; RemindBody = "";
                            //    i = 0;
                        }
                        AddDong = AddDong + "<tr><td><div align=left>" + PID + "</div></td>" +
                            "<td><div align=left>" + P_Name + "</div></td>" +
                            "<td><div align=left>" + Visit_Type + "</div></td>" +
                            "<td><div align=right>" + Visit_Date + "</div></td>" +
                            "<td><div align=right>" + End_Date + "</div></td>" +
                            "</tr>";
                    }
                    reader.Close();
                }
            }
            finally
            {
                conn.Close();
                RemindBody = "<table width=100% border=1 cellpadding=0 cellspacing=0>" +
                                "<tr><td colspan=5 bgcolor=#007196><div align=left><font color=#FFFFFF>" +
                                "<b>APPOINTMENT LIST WITH CAREGIVER: " + F_Doctor.ToUpper() + "</b></font></div></td></tr>" +
                                "<tr><td width=10%><b>PID</b></td>" +
                                "<td width=25%><b>Patient Name</b></td>" +
                                "<td width=15%><b>Visit Type</b></td>" +
                                "<td width=15%><b>From</b></td>" +
                                "<td width=15%><b>To</b></td>" +
                                "</tr>" + AddDong +
                            "</table>";

                var sh = "Click here";
                var styleStr = "<html><head><link href = '" + sh + "' rel='stylesheet' type='text/css'></link></head>";
                htmlcontent = styleStr + "<body>" + RemindBody + "</body></html>";
                ToEmail = F_DrMail;
                //ToEmail = "tuan.cao@aih.com.vn";//                        
                if (!string.IsNullOrEmpty(ToEmail))
                    SendMail(htmlcontent, ToEmail, To_CC, "DailyReport");
                else
                    SendMail(htmlcontent, To_PSO, To_CC, "NoMailReport");

                RemindBody_ToBOD = AddRemind(AddDong, F_Doctor, FirstRow, true);
                //  UpDateRemindLog(ListLoai);
            }
        }
        public string GetQuery_Dr(bool showDetail)//, Guid varID, string varSID)
        {
            string Get_query = ""; string query_final = "";

            string query = "SELECT sr.name_l AS doctor_name_l , stst.name_e AS app_type_e ,visible_patient_id,sr.employee_id ,";
            query += "sev.lu_updated ,resource_start_date_time,resource_end_date_time ,";
            query += "CASE WHEN aa.patient_id IS NULL THEN (SELECT TOP(1) first_name_l + N' ' + last_name_l AS temp_patient_name ";
            query += "FROM    dbo.temporary_patient_nl_view WHERE(temporary_patient_id = aa.temporary_patient_id)) ";
            query += "ELSE (SELECT TOP(1) first_name_l + N' ' + last_name_l AS patient_name FROM    dbo.person_name_iview_nl_view ";
            query += "WHERE(person_id = aa.patient_id) ) END AS patient_name , pphuv.visible_patient_id, ";
            query += "(SELECT TOP 1 emai.email_address FROM      dbo.email_nl_view AS emai RIGHT OUTER JOIN ";
            query += "dbo.employee_info_view AS per ON emai.person_id = per.person_id WHERE(per.person_id = ser.sch_resource_id) ";
            query += "AND email_type_rcd = 'BU') AS email_address ";
            query += "FROM dbo.sch_event_notification_method_ref_nl_view AS ntfs INNER JOIN ";
            query += "dbo.sch_event_notification_nl_view AS ntf ";
            query += "ON ntfs.sch_event_notification_method_rcd = ntf.sch_event_notification_method_rcd RIGHT OUTER JOIN ";
            query += "dbo.sch_event_resource_nl_view AS ser INNER JOIN dbo.app_appointment_nl_view AS aa ";
            query += "ON ser.sch_event_id = aa.sch_event_id LEFT OUTER JOIN dbo.sch_resource_nl_view AS sr ";
            query += "ON ser.sch_resource_id = sr.sch_resource_id AND ser.sch_resource_type_rcd = sr.sch_resource_type_rcd INNER JOIN ";
            query += "dbo.sch_event_resource_status_ref_nl_view AS sersr ";
            query += "ON ser.sch_event_resource_status_rcd = sersr.sch_event_resource_status_rcd INNER JOIN ";
            query += "dbo.sch_event_nl_view AS sev ON ser.sch_event_id = sev.sch_event_id INNER JOIN ";
            query += "dbo.sch_task_step_nl_view AS stst ON sev.sch_task_id = stst.sch_task_id ";
            query += "ON ntf.sch_event_id = ser.sch_event_id LEFT OUTER JOIN dbo.patient_primary_hospital_usage_view AS pphuv ";
            query += "ON aa.patient_id = pphuv.patient_id ";
            query += "WHERE(ser.sch_resource_type_rcd = 'EMPLOYEE') AND(stst.name_e LIKE N'%Appointment%') AND(ser.active_flag = 1) ";
            
            if ((!btGo1 && !btGo2 && !ExCreated) | btGo1)
            {
                if (!string.IsNullOrEmpty(Fr_Date) && string.IsNullOrEmpty(To_Date))
                    query += "AND (ser.resource_start_date_time BETWEEN CONVERT(DATETIME, '" + Fr_Date + "', 102) AND GETDATE()) ";
                else if (!string.IsNullOrEmpty(Fr_Date) && !string.IsNullOrEmpty(To_Date))
                {
                    query += "AND (ser.resource_start_date_time BETWEEN CONVERT(DATETIME, '" + Fr_Date + "', 102) AND ";
                    query += "CONVERT(DATETIME, '" + To_Date + "', 102)) ";//
                }
            }
            else if (btGo2 | ExCreated)
            {
                if (!string.IsNullOrEmpty(Cr_Fr_Date) && string.IsNullOrEmpty(Cr_To_Date))
                    query += "AND (sev.lu_updated BETWEEN CONVERT(DATETIME, '" + Fr_FullDateTime + "', 102) AND GETDATE()) ";//Cr_Fr_Date,sev.creation_date_time
                else if (!string.IsNullOrEmpty(Cr_Fr_Date) && !string.IsNullOrEmpty(Cr_To_Date))
                {
                    query += "AND (sev.lu_updated BETWEEN CONVERT(DATETIME, '" + Fr_FullDateTime + "', 102) AND ";//Cr_Fr_Datesev.creation_date_time
                    query += "CONVERT(DATETIME, '" + To_FullDateTime + "', 102)) ";//Cr_To_Date
                }
            }
        
            query += "ORDER BY sr.name_l, ser.resource_start_date_time ASC ";

            
            query_final = query;

            Get_query = query_final;
            return Get_query;
        }
        public void SendMail(string varBody, string varToMail, string[] varToCC, string SendType)
        {
            var objMailForm = new MailAddress("itsystem@aih.com.vn", "itsystem@aih.com.vn");
            MailAddressFrom = objMailForm;

            var objMailTo = new MailAddress(varToMail);
            MailAddressTo = objMailTo;

            MailMessage objMail = new MailMessage(MailAddressFrom, MailAddressTo);

            if (SendType == "DailyReport")
                objMail.Subject = "OPD appointment";
            else if (SendType == "NoMailReport")
                objMail.Subject = "OPD appointment - Don't have mail";
            else if (SendType == "BODReport")
                objMail.Subject = "Summary of OPD appointment";

            if (Viewby=="sur")
                objMail.Subject = "Surgical appointment";

            objMail.Body = varBody;// "Content office 365";
            objMail.IsBodyHtml = true;
            objMail.BodyEncoding = System.Text.Encoding.UTF8;

            try
            {
                // string[] ccaddress = varToCC; // txtcc.Text.ToString().Split(';').ToArray();

                foreach (var item in varToCC)
                {
                    MailAddress copy = new MailAddress(item);
                    objMail.CC.Add(copy);
                }
            }
            catch (Exception)
            {
            }
            #region abc
            #endregion
            SmtpClient smtpMail = new SmtpClient("smtp.office365.com");
            smtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpMail.EnableSsl = true;// chkEnable.Checked;
            smtpMail.Port = 25;// Convert.ToInt32(spinPort.EditValue.ToString());
                               //smtpMail.Credentials = new NetworkCredential(MailAddressFrom.Address, txtPassword.Text);
            smtpMail.Credentials = new NetworkCredential(MailAddressFrom.Address, "AIH2@18!@");
            smtpMail.Send(objMail);
        }
        public string AddRemind(string varAddDong, string varDoctor, bool varFirst, bool Final)
        {
            string[] To_CC = new string[5]; string ReturnRemind = "";string varTitle = "";
            if (Viewby == "sur")
                varTitle = "OT APPOINTMENT FOR CUSTOMER";
            else
                varTitle = "APPOINTMENT LIST WITH CAREGIVER";

            if (varFirst)
            {
                ReturnRemind = ReturnRemind + "<table width=100% border=1 cellpadding=0 cellspacing=0>" +
                                "<tr><td colspan=5 bgcolor=#007196><div align=left><font color=#FFFFFF>" +
                                "<b>"+ varTitle+": " + varDoctor.ToUpper() + "</b></font></div></td></tr>" +
                                "<tr><td width=10%><b>PID</b></td>" +
                                "<td width=25%><b>Patient Name</b></td>" +
                                "<td width=15%><b>Visit Type</b></td>" +
                                "<td width=15%><b>From</b></td>" +
                                "<td width=15%><b>To</b></td>" +
                                "</tr>" + varAddDong;
            }
            else
            {
                ReturnRemind = RemindBody_ToBOD +
                                "<tr><td colspan=5 bgcolor=#007196><div align=left><font color=#FFFFFF>" +
                                "<b>" + varTitle + ": " + varDoctor.ToUpper() + " </b></font></div></td></tr>" +
                                "<tr><td width=10%><b>PID</b></td>" +
                                "<td width=25%><b>Patient Name</b></td>" +
                                "<td width=15%><b>Visit Type</b></td>" +
                                "<td width=15%><b>From</b></td>" +
                                "<td width=15%><b>To</b></td>" +
                                "</tr>" + varAddDong;
            }

            if (Final)
            {                
                //ReturnRemind = RemindBody_ToBOD + "</table>";
                var sh1 = "Click here";
                var styleStr1 = "<html><head><link href = '" + sh1 + "' rel='stylesheet' type='text/css'></link></head>";
                var htmlcontent1 = styleStr1 + "<body>" + ReturnRemind + "</body></html>";
                var msg_Body = "Summary of OPD appointment" + "<br /> ";
                msg_Body += htmlcontent1;
                if (Viewby == "sur")
                {
                    msg_Body = "Summary of Surgical appointment" + "<br /> ";
                    msg_Body += htmlcontent1;
                    To_CC[0] = "linh.nguyen@aih.com.vn";
                    To_CC[1] = "phong.duong@aih.com.vn";                    
                    To_CC[2] = "tuan.cao@aih.com.vn";
                    To_CC[3] = "camchau.vo@aih.com.vn";
                    SendMail(msg_Body, "dat.le@aih.com.vn", To_CC, "BODReport");//"tuan.cao@aih.com.vn"
                }
                else
                {
                    To_CC[0] = "linh.nguyen@aih.com.vn";
                    To_CC[1] = "phong.duong@aih.com.vn";                    
                    To_CC[2] = "tuan.cao@aih.com.vn";                    

                    SendMail(msg_Body, "hao.thich@aih.com.vn", To_CC, "BODReport");
                }
            }

            return ReturnRemind;
        }                
        public void SendSMS(string sms, string varPhone, string varHen)
        {
            //result = Login();
            string body = @"{""u"":""" + username + @""",
                            ""pwd"":""" + password + @""",
                            ""from"":""" + from + @""",
                            ""phone"":""" + phone + @""",
                            ""sms"":""" + sms_text + @"""}";
            string[] To_Phone = new string[10];            
            To_Phone[0] = "0933553478";            
            To_Phone[1] = "0937556388";
            To_Phone[2] = "0913301298";
            To_Phone[3] = "0903718817";
            //To_Phone[3] = "0933319509";
            //To_Phone[4] = "0792585008";
            //To_Phone[6] = "0906992568";
            //To_Phone[7] = "0909094095";
            //To_Phone[8] = "0938111292";

            if (string.IsNullOrEmpty(varPhone))
                varPhone = "0913301298";
            if (Viewby == "sur")
                varPhone = "0913301298";

            //varPhone = "0903718817";
            //foreach (var item in To_Phone)
            {
                //varPhone = "0903718817";
                string urlSend = URLPro + "?u=" + username + "&pwd=" + password + "&from=" + from + "&phone=" + varPhone + "&sms=" + sms;//item
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(urlSend);
                request.Method = "GET";

                try
                {
                    using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                    {
                        // got response
                        using (Stream responseStream = response.GetResponseStream())
                        {
                            StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                            String Responsed = reader.ReadToEnd();
                            if (!string.IsNullOrEmpty(varHen))
                                Insert_Log(varPhone, Convert.ToDateTime(varHen));
                        }
                    }
                }
                catch (WebException ex)
                {
                    WebResponse errorResponse = ex.Response;
                    using (Stream responseStream = errorResponse.GetResponseStream())
                    {
                        StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                        String errorText = reader.ReadToEnd();
                    }
                    throw;
                }
            }
        }
        public void Insert_Log(string varPhone, DateTime varVisitDate)
        {
            SQLAppClass SQL_Class = new SQLAppClass();
            string query = "INSERT INTO AIH_MIS.dbo.ext_appointment_log (patient_phone, resource_start_date_time,CREATED_BY) ";
            query += "VALUES ('" + varPhone + "','" + varVisitDate + "','" + UserID + "') ";

            SQL_Class.RunQuery(query, ConnStringMISPro);
        }
        public bool ConvertNullableBoolToYesNo(object pBool)
        {
            //  pBool = true;
            if (!string.IsNullOrEmpty(Convert.ToString(pBool)))                         
                return true;                         
            else            
                return false;           
        }
        public bool CheckSubmit(object pBool, object pTongHD)
        {
            //  pBool = true;
            if (!string.IsNullOrEmpty(Convert.ToString(pBool)))
            {
                if (Convert.ToInt16(pBool) > 0)
                    return false;
                else if (Convert.ToInt32(pTongHD) <= 0)
                    return false;
                else
                    return true;
                //return (bool)pBool ? false : true;
            }
            else
            {
                return true;
            }
        }
        protected void ButtonSendSur_Click(object sender, EventArgs e)
        {
            switch ((sender as Button).ID)
            {
                case "SurReport":
                    {
                        SendListPatientSurToDoctor("DailyReport");
                    }
                    break;
            }
        }
        protected void SendListPatientSurToDoctor(string varReport)
        {
            string DoctorMail = ""; string DoctorName = ""; string F_Doctor = ""; int i = 0; bool FirstRow = true;

            string PID = ""; string P_Name = ""; string Visit_Date = ""; string Visit_Type = ""; string[] To_CC = new string[4];
            string AddDong = ""; string End_Date = ""; string RemindBody = ""; string ToEmail = "tuan.cao@aih.com.vn";
            string F_DrMail = ""; var htmlcontent = "";// string To_PSO = "hao.thich@aih.com.vn";

            Guid ParentID = Guid.Parse("11223344-5566-7788-99AA-BBCCDDEEFF00");
            string query = GetQuery_Sur(false);//, ParentID, Shift_ID);

            //To_CC[0] = "tuan.cao@aih.com.vn";

            SqlConnection conn = new SqlConnection(ConnStringHIS);
            SqlCommand com = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        DoctorMail = Convert.ToString(reader["doctor_name_e"]);
                        //Doctor_ID = Convert.ToString(reader["employee_id"]);
                        DoctorName = Convert.ToString(reader["patient_name"]);
                        if (i == 0)
                        {
                            F_Doctor = DoctorName;
                            F_DrMail = DoctorMail;
                        }
                        i = i + 1;
                        PID = Convert.ToString(reader["visible_patient_id"]);//actual_visit_date_time
                        P_Name = Convert.ToString(reader["doctor_name_e"]);
                        Visit_Type = Convert.ToString(reader["comment"]);
                        Visit_Date = Convert.ToString(reader["resource_start_date_time"]);
                        End_Date = Convert.ToString(reader["resource_end_date_time"]);
                        //Sex = Convert.ToString(reader["sex_rcd"]);                                                
                       // ToEmail = "tuan.cao@aih.com.vn";//                        
                        if (DoctorName != F_Doctor)
                        {
                            //ToEmail = F_DrMail;// varDoctorEmail; //Convert.ToString(reader["email_adress"]);
                            ToEmail = "tuan.cao@aih.com.vn";//                        
                            RemindBody = "<table width=100% border=1 cellpadding=0 cellspacing=0>" +
                                "<tr><td colspan=5 bgcolor=#007196><div align=left><font color=#FFFFFF>" +
                                "<b>APPOINTMENT LIST WITH CAREGIVER: " + F_Doctor.ToUpper() + "</b></font></div></td></tr>" +
                                "<tr><td width=10%><b>PID</b></td>" +
                                "<td width=25%><b>Patient Name</b></td>" +
                                "<td width=15%><b>Comment</b></td>" +
                                "<td width=15%><b>From</b></td>" +
                                "<td width=15%><b>To</b></td>" +
                                "</tr>" + AddDong +
                            "</table>";

                            var sh = "Click here";
                            var styleStr = "<html><head><link href = '" + sh + "' rel='stylesheet' type='text/css'></link></head>";
                            htmlcontent = styleStr + "<body>" + RemindBody + "</body></html>";
                    //        if (!string.IsNullOrEmpty(ToEmail))
                      //          SendMail(htmlcontent, ToEmail, To_CC, "DailyReport");
                        //    else
                          //      SendMail(htmlcontent, To_PSO, To_CC, "NoMailReport");

                            RemindBody_ToBOD = AddRemind(AddDong, F_Doctor, FirstRow, false);
                            FirstRow = false;

                            F_Doctor = DoctorName;
                            F_DrMail = DoctorMail;

                            AddDong = ""; RemindBody = "";
                            //    i = 0;
                        }
                        AddDong = AddDong + "<tr><td><div align=left>" + PID + "</div></td>" +
                            "<td><div align=left>" + P_Name + "</div></td>" +
                            "<td><div align=left>" + Visit_Type + "</div></td>" +
                            "<td><div align=right>" + Visit_Date + "</div></td>" +
                            "<td><div align=right>" + End_Date + "</div></td>" +
                            "</tr>";
                    }
                    reader.Close();
                }
            }
            finally
            {
                conn.Close();
                RemindBody = "<table width=100% border=1 cellpadding=0 cellspacing=0>" +
                                "<tr><td colspan=5 bgcolor=#007196><div align=left><font color=#FFFFFF>" +
                                "<b>APPOINTMENT LIST WITH CAREGIVER: " + F_Doctor.ToUpper() + "</b></font></div></td></tr>" +
                                "<tr><td width=10%><b>PID</b></td>" +
                                "<td width=25%><b>Patient Name</b></td>" +
                                "<td width=15%><b>Comment</b></td>" +
                                "<td width=15%><b>From</b></td>" +
                                "<td width=15%><b>To</b></td>" +
                                "</tr>" + AddDong +
                            "</table>";

                var sh = "Click here";
                var styleStr = "<html><head><link href = '" + sh + "' rel='stylesheet' type='text/css'></link></head>";
                htmlcontent = styleStr + "<body>" + RemindBody + "</body></html>";
             //   ToEmail = "tuan.cao@aih.com.vn";//                        
           //     if (!string.IsNullOrEmpty(ToEmail))
             //       SendMail(htmlcontent, ToEmail, To_CC, "DailyReport");
               // else
                 //   SendMail(htmlcontent, To_PSO, To_CC, "NoMailReport");

                RemindBody_ToBOD = AddRemind(AddDong, F_Doctor, false, true);
                //  UpDateRemindLog(ListLoai);
            }
        }
        public string GetQuery_Sur(bool showDetail)//, Guid varID, string varSID)
        {
            string Get_query = ""; string query_final = "";

            string Get_Emp_Name = "SELECT top 1 first_name_l + N' ' + last_name_l as employee_name FROM dbo.employee_info_view ";
            Get_Emp_Name += "WHERE (person_id = cd.charged_by_employee_id) ";

            string Get_Patient_Name = "SELECT TOP(1) first_name_l + N' ' + last_name_l AS patient_name ";
            Get_Patient_Name += "FROM dbo.person_name_iview_nl_view WHERE(person_id = aa.patient_id) ";

            //string Get_Patient_Phone = "SELECT TOP(1) phv.phone_number ";
            //Get_Patient_Phone += "FROM dbo.person_phone_nl_view AS pphv INNER JOIN ";
            //Get_Patient_Phone += "dbo.phone_nl_view AS phv ON pphv.phone_id = phv.phone_id ";
            //Get_Patient_Phone += "WHERE (pphv.person_phone_type_rcd = 'MO') AND (pphv.effective_until_date IS NULL) ";
            //Get_Patient_Phone += "AND (pphv.person_id = aa.patient_id) ";

            string Get_Patient_Phone = "SELECT TOP(1) phv.phone_number ";
            Get_Patient_Phone += "FROM AIH_MIS.dbo.person_phone_nl_view AS pphv INNER JOIN ";
            Get_Patient_Phone += "AIH_MIS.dbo.phone_nl_view AS phv ON pphv.phone_id = phv.phone_id ";
            Get_Patient_Phone += "WHERE (pphv.person_phone_type_rcd = 'MO') AND (pphv.effective_until_date IS NULL) ";
            Get_Patient_Phone += "AND (pphv.person_id = aa.patient_id) ";

            string Get_ASC_Baby_Phone = " SELECT TOP (1) phone.phone_number ";
            Get_ASC_Baby_Phone += " FROM OrionHIS_PRO.dbo.patient_hospital_usage_nl_view phu ";
            Get_ASC_Baby_Phone += " INNER JOIN OrionHIS_PRO.dbo.patient_nl_view p ON p.patient_id = phu.patient_id ";
            Get_ASC_Baby_Phone += " LEFT JOIN OrionHIS_PRO.dbo.relationship_nl_view r ON r.person_id = p.patient_id ";
            Get_ASC_Baby_Phone += " LEFT JOIN OrionHIS_PRO.dbo.person_nl_view per ON per.person_id = r.associated_person_id ";
            Get_ASC_Baby_Phone += " LEFT JOIN AIH_MIS.dbo.person_phone_nl_view pp ON pp.person_id = per.person_id ";
            Get_ASC_Baby_Phone += " AND pp.effective_until_date IS NULL ";
            Get_ASC_Baby_Phone += " AND pp.person_phone_type_rcd = 'MO' ";
            Get_ASC_Baby_Phone += " LEFT JOIN AIH_MIS.dbo.phone_nl_view phone ON phone.phone_id = pp.phone_id ";
            Get_ASC_Baby_Phone += " WHERE phu.patient_id = aa.patient_id ";
            Get_ASC_Baby_Phone += " AND p.born_in_this_hospital_flag = 1 ";
            Get_ASC_Baby_Phone += " AND r.relationship_type_rcd = 'MO' ";

            string Get_Temp_Patient_Name = "SELECT TOP(1) first_name_l + N' ' + last_name_l AS temp_patient_name ";
            Get_Temp_Patient_Name += "FROM dbo.temporary_patient_nl_view ";
            Get_Temp_Patient_Name += "WHERE (temporary_patient_id = aa.temporary_patient_id) ";

            string get_national = "SELECT TOP(1) nationality_rcd FROM dbo.person_nl_view ";
            get_national += "WHERE(person_id = aa.patient_id) ";

            string get_national_tmp = "SELECT TOP(1) nationality_rcd FROM dbo.temporary_patient_nl_view ";
            get_national_tmp += "WHERE (temporary_patient_id = aa.temporary_patient_id) ";

            string Get_Temp_Phone = "SELECT top 1 phv.phone_number ";
            Get_Temp_Phone += "FROM dbo.temporary_patient_phone_nl_view AS pphv INNER JOIN ";
            Get_Temp_Phone += "dbo.phone_nl_view AS phv ON pphv.phone_id = phv.phone_id ";
            Get_Temp_Phone += "WHERE(pphv.person_phone_type_rcd = 'MO') AND (temporary_patient_id = aa.temporary_patient_id) ";

            string get_drmail = "SELECT stst.sch_task_id,(SELECT email_address ";
            get_drmail += "FROM  dbo.email_nl_view WHERE(email_address LIKE N'%@aih.com.vn') ";
            get_drmail += "AND(person_id = ser.sch_resource_id)) AS dr_email ";
            get_drmail += "FROM dbo.sch_event_resource_nl_view AS ser INNER JOIN ";
            get_drmail += "dbo.sch_event_nl_view AS sev ON ser.sch_event_id = sev.sch_event_id INNER JOIN ";
            get_drmail += "dbo.sch_task_step_nl_view AS stst ON sev.sch_task_id = stst.sch_task_id ";
            get_drmail += "WHERE(stst.name_e LIKE N'Task%') AND (ser.sch_resource_type_rcd = 'EMPLOYEE') ";

            string query = "SELECT pphuv.visible_patient_id, ser.resource_start_date_time, ser.resource_end_date_time, ser.active_flag, ";
            query += "aa.appointment_number, ser.sch_resource_id AS doctor_id, stst.sch_task_id, sr.employee_id, ";
            query += "ser.sch_resource_type_rcd, sr.name_e AS doctor_name_e, sr.name_l AS doctor_name_l, aa.patient_id, ";
            query += "stst.name_e AS app_type_e, aa.temporary_patient_id, ";
            query += "ISNULL(aa.instructions, N'') + N'-' + ISNULL(aa.comment, N'') AS comment, ";            
            query += "(" + Get_Patient_Name + ") AS patient_name, ";            
            query += " ISNULL( (" + Get_ASC_Baby_Phone + "), (" + Get_Patient_Phone + ") ) AS patient_phone ";
            query += "FROM  dbo.sch_event_resource_nl_view AS ser INNER JOIN ";
            query += "dbo.app_appointment_nl_view AS aa ON ser.sch_event_id = aa.sch_event_id LEFT OUTER JOIN ";
            query += "dbo.sch_resource_nl_view AS sr ON ser.sch_resource_id = sr.sch_resource_id ";
            query += "AND ser.sch_resource_type_rcd = sr.sch_resource_type_rcd INNER JOIN ";
            query += "dbo.sch_event_nl_view AS sev ON ser.sch_event_id = sev.sch_event_id INNER JOIN ";
            query += "dbo.sch_task_step_nl_view AS stst ON sev.sch_task_id = stst.sch_task_id LEFT OUTER JOIN ";
            query += "dbo.patient_primary_hospital_usage_view AS pphuv ON aa.patient_id = pphuv.patient_id ";// INNER JOIN ";
            //query += "(" + get_drmail + ") AS drmail ON drmail.sch_task_id = stst.sch_task_id ";            
            query += "WHERE (stst.name_e LIKE N'Task%') AND (ser.active_flag = 1) ";
            query += "AND (ser.sch_resource_type_rcd <>'PATIENT') ";

            if (!string.IsNullOrEmpty(Fr_Date) && string.IsNullOrEmpty(To_Date))
                query += "AND (ser.resource_start_date_time BETWEEN CONVERT(DATETIME, '" + Fr_Date + "', 102) AND GETDATE()) ";
            else if (!string.IsNullOrEmpty(Fr_Date) && !string.IsNullOrEmpty(To_Date))
            {
                query += "AND (ser.resource_start_date_time BETWEEN CONVERT(DATETIME, '" + Fr_Date + "', 102) AND ";
                query += "CONVERT(DATETIME, '" + To_Date + "', 102)) ";
            }
            query += "ORDER BY pphuv.visible_patient_id ";
            query_final = query;

            Get_query = query_final;
            return Get_query;
        }
        public void GetResult(object sender, EventArgs e)
        {
         //   string result = Login();
            lbInfor.Text= Login();
        }
        string Login()
        {
            string varusername = "2301082948098";string varpassword = "2301082948098";
            string result = "";
            string body = @"{""username"":""" + varusername + @""",""password"":""" + varpassword + @"""}";
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://2301082948098.softdreams.vn/api/business/getInvoiceUsageReport?FromDate=01/01/2020&ToDate=01/02/2020&option=0");
            request.Method = "POST";

            System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
            Byte[] byteArray = encoding.GetBytes(body.Trim());

            request.ContentLength = byteArray.Length;
            request.ContentType = "application/json";

            using (Stream dataStream = request.GetRequestStream())
            {
                dataStream.Write(byteArray, 0, byteArray.Length);
            }
            long length = 0;
            try
            {
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    // got response
                    length = response.ContentLength;
                    using (Stream responseStream = response.GetResponseStream())
                    {
                        //StreamReader reader = new StreamReader(responseStream, Encoding.GetEncoding("utf-8"));
                        StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                        String Responsed = reader.ReadToEnd();
                        result = Responsed.Replace("{\"token\":\"", "").Replace("\"}", "");
                    }
                }
            }
            catch (WebException ex)
            {
                WebResponse errorResponse = ex.Response;
                using (Stream responseStream = errorResponse.GetResponseStream())
                {
                    //StreamReader reader = new StreamReader(responseStream, Encoding.GetEncoding("utf-8"));
                    StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                    String errorText = reader.ReadToEnd();
                    // log errorText
                }
                throw;
            }
            return result;
        }        
        public void SendMail_Link(string varBody, string varToMail, string[] varToCC)
        {
            var objMailForm = new MailAddress("itsystem@aih.com.vn", "itsystem@aih.com.vn");
            MailAddressFrom = objMailForm;
            

            var objMailTo = new MailAddress(varToMail);
            MailAddressTo = objMailTo;

            MailMessage objMail = new MailMessage(MailAddressFrom, MailAddressTo);
            
            objMail.Subject = "Form dang ky";                                    

            objMail.Body = varBody;// "Content office 365";
            objMail.IsBodyHtml = true;
            objMail.BodyEncoding = System.Text.Encoding.UTF8;

            objMail.CC.Add("tuan.cao@aih.com.vn");

            try
            {
                // string[] ccaddress = varToCC; // txtcc.Text.ToString().Split(';').ToArray();

                foreach (var item in varToCC)
                {
                    MailAddress copy = new MailAddress(item);
                    objMail.CC.Add(copy);
                }
            }
            catch (Exception)
            {
            }
            #region abc
            #endregion
            SmtpClient smtpMail = new SmtpClient("smtp.office365.com");
            smtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpMail.EnableSsl = true;// chkEnable.Checked;
            smtpMail.Port = 25;// Convert.ToInt32(spinPort.EditValue.ToString());
                               //smtpMail.Credentials = new NetworkCredential(MailAddressFrom.Address, txtPassword.Text);
            smtpMail.Credentials = new NetworkCredential(MailAddressFrom.Address, "AIH2@18!@");
            smtpMail.Send(objMail);
        }
        protected void ButtonCheck_Click(object sender, EventArgs e)
        {
            int RowCount = 0; CheckBox[] Check_T0 = new CheckBox[1000]; string Dr_Name = ""; string Ngay_Hen = ""; string Gio_Hen = "";
            string pt_national = ""; string pt_phone = ""; string sms = "";string url = "";string vid = "";

            RowCount = RadGrid1.Items.Count;
            for (int i = 0; i < RowCount; i++)
            {
                Check_T0[i] = RadGrid1.Items[i].FindControl("CheckSMS") as CheckBox;
                if (Check_T0[i].Checked)
                {
                    Dr_Name = (RadGrid1.Items[i].FindControl("lbDrName") as Label).Text;
                    pt_national = (RadGrid1.Items[i].FindControl("lbNational") as Label).Text;
                    pt_phone = (RadGrid1.Items[i].FindControl("lbPhone") as Label).Text;
                    vid = (RadGrid1.Items[i].FindControl("lbVisibleID") as Label).Text;

                    //url = "meda.aih.com.vn/reg/"+ pt_phone +"/0";
                    url = "https://kbyt.khambenh.gov.vn/qr/579cc996-898a-464c-99b8-c3b9d25cdbb1";
                    Label nHen = RadGrid1.Items[i].FindControl("lbNgay_Hen") as Label;

                    if (pt_national == "VNM")
                    {                        
                        Ngay_Hen = string.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(nHen.Text));
                        Gio_Hen = String.Format("{0:hh:mm tt}", Convert.ToDateTime(nHen.Text));

                        sms = "Quy khach co lich hen kham voi " + Dr_Name + " ngay " + Ngay_Hen + " luc " + Gio_Hen + ". Vui long den som 15 phut de lam thu tuc dang ky. ";
                        sms += "Quy khach co the khai bao y te truoc tai duong link:" + url + ". LH: 02839109999. Xin cam on!";
                        if (Viewby == "sur")
                        {
                            sms = "Quy khach co lich hen mo voi " + Dr_Name + " ngay " + Ngay_Hen + " luc " + Gio_Hen + ". Vui long den som 15 phut de lam thu tuc dang ky. ";
                            sms += "Quy khach co the khai bao y te truoc tai duong link:" + url + ". LH: 02839109999. Xin cam on!";
                        }
                    }
                    else
                    {
                        Ngay_Hen = String.Format("{0:dd/MMM/yyyy}", Convert.ToDateTime(nHen.Text));
                        Gio_Hen = String.Format("{0:hh:mm tt}", Convert.ToDateTime(nHen.Text));
                        sms = "Good day Sir/Madame, You have an appointment with " + Dr_Name + " on " + Ngay_Hen + " at " + Gio_Hen + ".Please be at AIH 15 minutes earlier for registration.";
                        sms += "You may declare the medical screening questionnaire online at:" + url + ". Contact: 02839109999. Thanh you!";
                        if (Viewby == "sur")
                        {
                            sms = "Good day Sir/Madame, You have an surgical appointment with " + Dr_Name + " on " + Ngay_Hen + " at " + Gio_Hen + ".Please be at AIH 15 minutes earlier for registration. ";
                            sms += "You may declare the medical screening questionnaire online at:" + url + ". Contact: 02839109999. Thank you!";
                        }
                    }
                    //String.Format("{0:dd/MMM/yyyy}"(RadGrid1.Items[i].FindControl("lbNgay_Hen") as Label).Text;

                    SendSMS(sms, pt_phone,nHen.Text);
                }
            }
        }    
        protected void ButtonCheck_Click_BK(object sender, EventArgs e)
        {
            int RowCount = 0; CheckBox[] Check_T0 = new CheckBox[1000]; string Dr_Name = ""; string Ngay_Hen = ""; string Gio_Hen = "";
            string pt_national = ""; string pt_phone = ""; string sms = "";

            RowCount = RadGrid1.Items.Count;
            for (int i = 0; i < RowCount; i++)
            {
                Check_T0[i] = RadGrid1.Items[i].FindControl("CheckSMS") as CheckBox;
                if (Check_T0[i].Checked)
                {
                    Dr_Name = (RadGrid1.Items[i].FindControl("lbDrName") as Label).Text;
                    pt_national = (RadGrid1.Items[i].FindControl("lbNational") as Label).Text;
                    pt_phone = (RadGrid1.Items[i].FindControl("lbPhone") as Label).Text;
                    if (pt_national == "VNM")
                    {
                        Ngay_Hen = string.Format("{0:dd/MM/yyyy}", Convert.ToDateTime((RadGrid1.Items[i].FindControl("lbNgay_Hen") as Label).Text));
                        Gio_Hen = String.Format("{0:hh:mm tt}", Convert.ToDateTime((RadGrid1.Items[i].FindControl("lbNgay_Hen") as Label).Text));

                        sms = "Quy khach co lich hen kham voi " + Dr_Name + " ngay " + Ngay_Hen + " luc " + Gio_Hen + ". Vui long den som 15 phut de lam thu tuc dang ky. LH: 02839109999. Xin cam on!";
                        if (Viewby == "sur")
                            sms = "Quy khach co lich hen mo voi " + Dr_Name + " ngay " + Ngay_Hen + " luc " + Gio_Hen + ". Vui long den som 15 phut de lam thu tuc dang ky. LH: 02839109999. Xin cam on!";
                    }
                    else
                    {
                        Ngay_Hen = String.Format("{0:dd/MMM/yyyy}", Convert.ToDateTime((RadGrid1.Items[i].FindControl("lbNgay_Hen") as Label).Text));
                        Gio_Hen = String.Format("{0:hh:mm tt}", Convert.ToDateTime((RadGrid1.Items[i].FindControl("lbNgay_Hen") as Label).Text));
                        sms = "Good day Sir/Madame, You have an appointment with " + Dr_Name + " on " + Ngay_Hen + " at " + Gio_Hen + ".Please be at AIH 15 minutes earlier for registration.Tel: 02839109999";
                        if (Viewby == "sur")
                            sms = "Good day Sir/Madame, You have an surgical appointment with " + Dr_Name + " on " + Ngay_Hen + " at " + Gio_Hen + ".Please be at AIH 15 minutes earlier for registration.Tel: 02839109999";
                    }
                    //String.Format("{0:dd/MMM/yyyy}"(RadGrid1.Items[i].FindControl("lbNgay_Hen") as Label).Text;

                //    SendSMS(sms, pt_phone);
                }
            }
        }
        protected void ButtonSendLink_Click(object sender, EventArgs e)
        {
            string[] To_CC = new string[5];
            string url1 = "";// "meda.aih.com.vn/reg/900000009/tuan.cao@aih.com.vn";
            //url1 += "no=" + varSTT + "&";
            //url1 += "action=view&fr=ir&lg=1";            
            url1 = "https://kbyt.khambenh.gov.vn/qr/579cc996-898a-464c-99b8-c3b9d25cdbb1";
            var msg_Body = "Kính gửi,<br /> <font color =" + "blue><i>Dear</i></font>,<br /> ";
            msg_Body += "Đây là email tự động, vui lòng không trả lời lại email này. Vui lòng click vào đường dẫn trong email để phản hồi ý kiến của bạn. <br /> ";
            msg_Body += "<font color =" + "blue><i>This is automated email, please do not reply this email.Please click the link in email to feedback your opinion. </i></font><br /> ";
            msg_Body += "<br /> <a href='" + url1 + "'> Link </a><br /> ";
            msg_Body += "<font color =" + "blue><i>Thank you.</i></font><br /> Best regards,  <br /> ";

            SendMail_Link(msg_Body, "tuan.cao@aih.com.vn", To_CC);
        }
    }
}