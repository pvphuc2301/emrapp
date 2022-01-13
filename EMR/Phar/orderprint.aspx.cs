using Newtonsoft.Json.Linq;
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
using System.IO;
using System.Text;
using System.Web.SessionState;
using System.Security.Permissions;
using Microsoft.Win32;
using System.Drawing;
using System.Drawing.Imaging;
using ZXing;
using ZXing.Common;
//using OnBarcode.Barcode.BarcodeScanner;
using BarcodeLib;
using System.Drawing.Printing;

namespace EMR
{
    public partial class orderprint : System.Web.UI.Page
    {                
        public string ConnStringHIS = ""; string ConnStringMISPro = "";
        public string PID = "";string orderGroupID = ""; string orderNo = ""; string visibleID = ""; string UserID = "";
        public bool ShowAll = false; bool ShowLAB = false; bool ShowRAD = false; bool ShowOther = false;
        public string loc { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;
            ConnStringMISPro = ConnStr.SQL_MISProConnString;
            //Load_Doctor(ConnStringHIS);
            UserID = Convert.ToString(Session["UserID"]); 

            PID = Request.QueryString["pid"];
            visibleID = Request.QueryString["vid"];
            orderGroupID = Request.QueryString["ordid"];// "111534";         
            orderNo = Request.QueryString["ordno"];// "111534";         

            gen_BarCode(visibleID, "PID");
            gen_BarCode(orderNo, "LAB");
            LoadPatientInfomation(PID);

            loc = (string)Session["company_code"];
            string address = "";
            
            switch (loc)
            {
                case "AIH":
                    address += "<div><div style=\"float: left;width: 28%;text-align:center;border: 1pt;font-style: italic;\">"+
                        "<img src=\"../images/AIH_Logo.jpg\" style=\"height: 80px; width: auto;\" /></div>" +
                        "<div style=\"float: left;width: 72%;\"><label style=\"font-size:large; text-align:left\">BỆNH VIỆN QUỐC TẾ MỸ<br />AMERICAN INTERNATIONAL HOSPITAL</label>" +
                        "<br /><label style=\"font-weight:normal; font-size:smaller; text-align:left\">Địa chỉ/ Add: Số 06 đường Bắc Nam 3, Phường An Phú, Quận 2, Tp.HCM, Việt Nam" +
                        "<br />Điện thoại/ Tel: (028) 3910 9999 Fax: (028) 3910 9999 Hotline: (028) 3910 9999 Emergency: (028) 3910 9999</label><br /><br /></div></div>";
                    break;
                case "CLI":
                    address = "<div><div style=\"float: left;width: 28%;text-align:center;border: 1pt;font-style: italic;\">" +
                        "<img src=\"../images/DBP/AIH_CLINIC_logo_final_02.png\" style=\"height: 70px; width: auto;\" /></div>" +
                        "<div style=\"float: left;width: 72%;\"><label style=\"font-size:large; text-align:left\">PHÒNG KHÁM QUỐC TẾ MỸ<br />AMERICAN INTERNATIONAL CLINIC</label>" +
                        "<br /><label style=\"font-weight:normal; font-size:smaller; text-align:left\">Địa chỉ/ Add: 79, Dien Bien Phu St., Da Kao Ward, Dist.1, HCMC" +
                        "<br />Điện thoại/ Tel: (028) 3910 9888</label><br /><br /></div></div>";
                    break;
            }

            header_wrapper.InnerHtml = address;

            //Get_Patient_Infor(Guid.Parse(PID));//, Guid varVisitID);               
        }
        public DataTable GetDataTable(string query, string varConstr)
        {
            SqlConnection conn = new SqlConnection(varConstr);
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
        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {            
            if (e.Item is GridDataItem)
            {
                foreach (TableCell cell in e.Item.Cells)
                {
                    if (cell.Text == "0" | cell.Text == "0%" | cell.Text == "0.0" | cell.Text == "0.00" | cell.Text == "0.000")
                        cell.Text = String.Empty;
                }
            }
            if (e.Item is GridDataItem)
            {
                int i = 0;
                GridDataItem dataItem = (GridDataItem)e.Item;
                Label lbinit_Diag = dataItem.FindControl("lbinitDiag") as Label;
                if (i == 0)
                {
                    initDiag.Text = lbInitDiag.Text = Convert.ToString(lbinit_Diag.Text);
                    Load_Problem(visibleID);
                }
                i = i + 1;
                foreach (TableCell cell in e.Item.Cells)
                {
                    cell.Style["Vertical-align"] = "top";
                    //dataItem["OPD"].Font.Strikeout = true;                    
                }
            }
            if (e.Item is GridHeaderItem)
            {
                GridHeaderItem item = e.Item as GridHeaderItem;
                item.Style["border"] = "solid 0.1pt #000000";
            }
            if (e.Item is GridFooterItem)
            {
                GridFooterItem itemf = e.Item as GridFooterItem;
                itemf.BackColor = System.Drawing.Color.LightBlue;
                itemf.Font.Bold = true;
            }
            if (e.Item is GridFilteringItem)
                e.Item.Visible = false;
        }
        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {                  
            string query = GetQuery(Guid.Parse(orderGroupID));
            if (!string.IsNullOrEmpty(query))
                RadGrid1.DataSource = GetDataTable(query, ConnStringHIS);
        }
        public string GetQuery (Guid varOrderID)
        {
            string Get_query = ""; 
            {
                string query = "SELECT cpo.cpoe_placer_order_group_id,cpo.cpoe_placer_order_id,cpo.placer_order_number,coi.name_e AS orderable_e,";
                query += "coi.name_l AS orderable_l,coi.category_name_l AS category_name_l,coi.category_name_e AS category_name_e,";
                query += "copr.name_e AS priority_e,copr.name_l AS priority_l,asr.name_e AS ambulatory_status_e,asr.name_l AS ambulatory_status_l,";
                query += "tmr.name_e AS transportation_mode_e,tmr.name_l AS transportation_mode_l,";
                query += "COALESCE (cpo.sch_event_id, lwo.sch_event_id, se_rad.sch_event_id) AS sch_event_id,cpo.comments,cpo.instructions,";
                query += "cpo.additional_information,cpo.porter_required_flag,rri.display_name_e AS requested_results_interpreter_e,";
                query += "rri.display_name_l AS requested_results_interpreter_l,coi.service_category_rcd,scat.healthcare_service_type_rcd,";
                query += "coi.cpoe_orderable_type_rcd,cpo.cpoe_placer_order_status_rcd,pv.patient_visit_id,pv.actual_visit_date_time,";
                query += "package_e = CASE WHEN cpo.patient_visit_package_id IS NULL THEN '-' ELSE N'Package' END,";
                query += "package_l = CASE WHEN cpo.patient_visit_package_id IS NULL THEN '-' ELSE N'Package' END,";
                query += "item.name_e AS package_name_e,item.name_l AS package_name_l,cos.name_e AS order_set_name_e,";
                query += "cos.name_l AS order_set_name_l,i_diagnosis ";
                query += "FROM cpoe_placer_order_nl_view AS cpo INNER JOIN ";
                query += "cpoe_orderable_info_view As coi ON cpo.cpoe_orderable_id = coi.cpoe_orderable_id INNER JOIN ";
                query += "cpoe_order_priority_ref_nl_view AS copr ON cpo.cpoe_order_priority_rcd = copr.cpoe_order_priority_rcd LEFT JOIN ";
                query += "ambulatory_status_ref_nl_view AS asr ON cpo.ambulatory_status_rcd = asr.ambulatory_status_rcd LEFT JOIN ";
                query += "transportation_mode_ref_nl_view AS tmr ON cpo.transportation_mode_rcd = tmr.transportation_mode_rcd LEFT JOIN ";
                query += "person_formatted_name_iview_nl_view AS rri ON cpo.requested_results_interpreting_employee_id = rri.person_id LEFT JOIN ";
                query += "lab_work_order_nl_view AS lwo ON cpo.cpoe_placer_order_id = lwo.cpoe_placer_order_id LEFT JOIN ";
                query += "radiology_requested_procedure_plan_nl_view AS rrpp ON cpo.cpoe_placer_order_id = rrpp.cpoe_placer_order_id LEFT JOIN ";
                query += "sch_event_nl_view AS se_rad ON rrpp.sch_event_group_id = se_rad.sch_event_group_id LEFT JOIN ";
                query += "service_category_ref_nl_view AS scat ON coi.service_category_rcd = scat.service_category_rcd LEFT JOIN ";
                query += "patient_visit_nl_view AS pv ON ISNULL(cpo.execution_visit_id, cpo.creation_visit_id) = pv.patient_visit_id LEFT JOIN ";
                query += "patient_visit_package_nl_view AS pvp ON cpo.patient_visit_package_id = pvp.patient_visit_package_id LEFT JOIN ";
                query += "item_nl_view AS item ON pvp.package_item_id = item.item_id LEFT JOIN ";
                query += "cpoe_placer_order_group_order_set_nl_view AS cpogos ON ";
                query += "cpo.cpoe_placer_order_group_order_set_id = cpogos.cpoe_placer_order_group_order_set_id LEFT JOIN ";
                query += "cpoe_order_set_nl_view AS cos ON cpogos.cpoe_order_set_id = cos.cpoe_order_set_id ";

                query += " OUTER APPLY ( ";
                query += " SELECT TOP 1 ISNULL(cpo1.instructions, cpoc.comment) AS i_diagnosis ";
                query += " FROM cpoe_placer_order_nl_view cpo1 LEFT JOIN ";
                query += " dbo.cpoe_placer_order_contact_nl_view cpoc ";
                query += " ON cpoc.cpoe_placer_order_id = cpo1.cpoe_placer_order_id ";
                query += " WHERE cpo1.cpoe_placer_order_group_id = cpo.cpoe_placer_order_group_id ";
                query += " ) i_diag ";

                query += "WHERE cpo.cpoe_placer_order_group_id = '" + varOrderID + "' AND ";
                query += "cpo.cpoe_placer_order_status_rcd <> 'CANCL' ";

                string query_final = "SELECT cpo2.*,se.event_start_date_time, se.event_end_date_time ";
                query_final += "FROM (" + query + ") as cpo2 LEFT JOIN sch_event_nl_view AS se ON cpo2.sch_event_id = se.sch_event_id ";

                if (CheckLAB.Checked && CheckRAD.Checked & CheckOther.Checked)
                    query_final += "WHERE 1 = 1 ";
                else if (CheckLAB.Checked && CheckRAD.Checked)                
                    query_final += "WHERE (cpo2.healthcare_service_type_rcd IN ('LB','IM')) ";                                    
                else if (CheckLAB.Checked && CheckOther.Checked)                
                    query_final += "WHERE (cpo2.healthcare_service_type_rcd <> 'IM') ";                    
                else if (CheckRAD.Checked && CheckOther.Checked)                
                    query_final += "WHERE (cpo2.healthcare_service_type_rcd <> 'LB') ";                    
                else if (CheckLAB.Checked)                
                    query_final += "WHERE (cpo2.healthcare_service_type_rcd = 'LB') ";                    
                else if (CheckRAD.Checked)                
                    query_final += "WHERE (cpo2.healthcare_service_type_rcd = 'IM') ";
                else if (CheckOther.Checked)
                    query_final += "WHERE (cpo2.healthcare_service_type_rcd NOT IN ('LB','IM')) ";

                query_final += "ORDER BY cpo2.healthcare_service_type_rcd DESC, cpo2.orderable_e ";//cpo2.category_name_e,

                Get_query = query_final;
            }

            return Get_query;
        }        
        public string ReturnOrder_Name(object varMedicineName)
        {
            string tmp = ""; //string tmpCachDung = Convert.ToString(varCachDung);
            //string ins_l = tmpCachDung.Replace("\r\n", "<br />");
            
            tmp = "<b>" + varMedicineName + "</b>";            
            return tmp;
        }
        public string ReturnType_Name(object varMedicineName)
        {
            string tmp = Convert.ToString(varMedicineName);
            if (tmp == "LB")
                tmp = "Laboratory";
            else if (tmp == "IM")
                tmp = "Radiology";
            else if (tmp == "OT")
                tmp = "Other Service";

            tmp = "<b>" + tmp + "</b>";
            return tmp;
        }
        public string ReturnText_Name(object varColumn, object varHi)
        {
            string tmp = "";string varCol = Convert.ToString(varColumn);string varHide = Convert.ToString(varHi);

            if (varCol == "1")
            {                
                if (varHide == "0")
                    tmp = "Thứ tự ưu tiên/ Priority:" + "<br />" + "Clinical information:" + "<br />" + "Ghi chú/ Doctor’s Note:";
                else
                    tmp = "Thứ tự ưu tiên/ Priority:" + "<br />" + "Ghi chú/ Doctor’s Note:";
            }
            else
            {                
                if (varHide == "0")
                    tmp += "Order Number:" + "<br />" + "Addition information:" + "<br /> <br />";
                else
                    tmp += "Order Number:" + "<br /> <br />";
            }
            return tmp;
        }
        public string ReturnPriority_Name(object varRoutineName, object varCliInfor, object varCachDung, object varHi)
        {
            string tmp = ""; string varClinicInfor = Convert.ToString(varCliInfor); string varHide = Convert.ToString(varHi);
            string tmpCachDung = Convert.ToString(varCachDung);
            string ins_l = tmpCachDung.Replace("\r\n", "<br />");

            if (string.IsNullOrEmpty(varClinicInfor))
                varClinicInfor = "-";
            if (string.IsNullOrEmpty(ins_l))
                ins_l = "-";
            
            if (varHide == "0")
                tmp = varRoutineName + "<br /> " + varClinicInfor + "<br /> " + ins_l;
            else
                tmp = varRoutineName + "<br /> " + ins_l;

            return tmp;
        }
        public string ReturnGroup_Name(object varOrderName, object varAInfor, object varHi)
        {
            string tmp = ""; string varAddInfor = Convert.ToString(varAInfor); string varHide = Convert.ToString(varHi);            

            if (string.IsNullOrEmpty(varAddInfor))
                varAddInfor = "-";
            if (varHide == "0")
                tmp = varOrderName + "<br /> " + varAddInfor + "<br /> <br />";
            else
                tmp = varOrderName + "<br /> <br />";

            return tmp;
        }
        public void LoadPatientInfomation(string varPID)//object sender, EventArgs e
        {
           // string _jsonData = WebHelpers.GetAPI("api/emr/demographic/" + varPID);
            dynamic response = WebHelpers.GetAPI("api/emr/demographic/" + varPID);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic data = JObject.Parse(response.Data);

                lbFullName.Text = data.first_name_l + " " + data.last_name_l + " (" + data.title_l + ")";
                if (data.gender_e == "Male")
                    lbSex.Text = "Nam/ Man";
                else if (data.gender_e == "Female")
                    lbSex.Text = "Nữ/ Woman";                
                //data.visible_patient_id;
              //  ptAge = DataHelpers.CalculateAge(DateTime.Parse(data.date_of_birth.ToString())).ToString();

                lbBirthday.Text = data.date_of_birth.ToString("dd-MM-yyyy");

                lbDoctor.Text = Request.QueryString["dr"];
                string cDate = Request.QueryString["cdate"]; string fDate = Request.QueryString["fdate"];
                if (cDate == fDate)
                {
                    lbRefDate.Text = cDate;
                    lbFutureDate.Text = "";
                }
                else
                {
                    lbRefDate.Text = cDate;
                    lbFutureDate.Text = fDate;
                }
            }
        }        
        public void gen_BarCode(string varTextCode, string varType)
        {            
            var barcodeWriter = new BarcodeWriter();
            try
            {

                barcodeWriter.Format = BarcodeFormat.CODE_39;// BarcodeFormat.CODE_128;
                if (varType == "PID")
                {
                    barcodeWriter.Options = new EncodingOptions                    
                    {
                        Height = 40,
                        Width = 200,
                        Margin = 0
                    };
                }
                else
                {
                    barcodeWriter.Options = new EncodingOptions
                    {
                        Height = 40,
                        Width = 200,
                        Margin = 0
                    };
                }
    
              //  string content = varTextCode;// txtInput.Text;
                System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image();

                using (var bitmap = barcodeWriter.Write(varTextCode))
                {
                    using (var stream = new MemoryStream())
                    {
                        bitmap.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                        //var gimage = imgBarCode.f Image.FromStream(stream);
                        byte[] byteImage = stream.ToArray();

                        //imgBarCode.ImageUrl = Convert.ToBase64String(byteImage);

                        imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);                        
                    }
                    if (varType == "PID")
                        PID_BarCode.Controls.Add(imgBarCode);
                    else
                        LAB_BarCode.Controls.Add(imgBarCode);
                }
            }
            catch
            {
        //        DialogBox.Error("Kiểu định dạng không đúng, vui lòng kiểm tra lại");
            }
        }
        protected void Load_Problem(string varPID)//, string varPresID)
        {
            SQLAppClass SQL_Class = new SQLAppClass();
            string query = "SELECT TOP 1 init_diagnosis FROM AIH_MIS.dbo.ext_order_init_diagnosis ";
            query += "WHERE order_group_number = '" + orderNo + "' AND visible_patient_id = '" + visibleID + "' ";

            string getDiag = SQL_Class.CheckAndGetItem(query, "init_diagnosis", ConnStringHIS);
            if (!string.IsNullOrEmpty(initDiag.Text))
            {
                lbInitDiag.Text = initDiag.Text;
                RequiredField.Enabled = false;
                pageHost.Attributes.Add("class", "");
                //pageHeader.Attributes.Add("class", "");
                lbError.Visible = false;
            }
            else  if (!string.IsNullOrEmpty(getDiag))
            {
                lbInitDiag.Text = getDiag;
                initDiag.Visible = false;
                RequiredField.Enabled = false;
                pageHost.Attributes.Add("class", "");
                //pageHeader.Attributes.Add("class", "");
                lbError.Visible = false;
            }
            else
            {
                initDiag.Visible = true;
                RequiredField.Enabled = true;
                pageHost.Attributes.Add("class", "cssclsNoPrint");
                //pageHeader.Attributes.Add("class", "cssclsNoPrint");
                lbError.Visible = true;                

            }
        }        
        public string getProblem(string varPID)
        {
            string get_Problem = "";

            string query = "SELECT  DISTINCT pp.problem_name_code + ': ' + ISNULL(pp.diagnosis_display_text,  ";
            query += "CAST((CAST(pp.problem_xml AS xml)). ";
            query += "query('//diagnosisNameCode/userLocaleTranslatedDescription/text()') AS nvarchar(512))) AS problem ";
            query += "FROM Consult_ProblemList.problemlist.patient_problem pp ";
            query += "INNER JOIN(SELECT  MAX(business_version) AS max_version, problem_id ";
            query += "FROM    Consult_ProblemList.problemlist.patient_problem ";
            query += "WHERE   patient_id = '" + varPID + "' ";
            query += "GROUP BY problem_id) AS curr ON pp.problem_id = curr.problem_id ";
            query += "AND pp.business_version = curr.max_version ";
            query += "WHERE pp.problem_name_coding_system = 'ICD-10' AND pp.patient_id = '" + varPID + "' ";
            query += "AND(pp.expiry_datetime IS NULL OR pp.expiry_datetime > GETDATE()) ";

            get_Problem = query;
            return get_Problem;
        }
        public void ButtonGetValue_Click(object sender, EventArgs e)
        {
            lbProblem.Text = GetCheckBoxValues(rcbMyList1);
        }
        private string GetCheckBoxValues(Telerik.Web.UI.RadComboBox cbo)
        {
            string sValues = "";  
            for (int x = 0; x < cbo.Items.Count; x++)
            {
                if ((cbo.Items[x].FindControl("CheckBox1") as CheckBox).Checked)
                {
                    sValues += cbo.Items[x].Text + ",";//.Value
                }
            }          
            return sValues;
        }
        public void PrintButton_Click(object sender, EventArgs e)
        {
            SQLAppClass SQL_Class = new SQLAppClass();
            string textInit = initDiag.Text.Replace("'", "");

            string query = "INSERT INTO AIH_MIS.dbo.ext_order_init_diagnosis (visible_patient_id,order_group_number,init_diagnosis,CREATED_BY) ";
            query += "Values ('" + visibleID + "', '" + orderNo + "', N'" + textInit + "','" + UserID + "') ";
            
            if (string.IsNullOrEmpty(lbInitDiag.Text))
            {
                SQL_Class.RunQuery(query, ConnStringMISPro);
                lbInitDiag.Text = initDiag.Text;
                lbInitDiag.DataBind();
                initDiag.Visible = false;
                //lbError.Visible = false;                       
            }
            Load_Problem(visibleID);
            ClientScript.RegisterStartupScript(typeof(Page), "key", "<script type='text/javascript'>window.print();;</script>");
        }
        protected void ShowAllChecked(object sender, System.EventArgs e)
        {
            if (CheckAll.Checked)
            {
                ShowAll = true;
                CheckLAB.Checked = false;
                CheckRAD.Checked = false;
                CheckOther.Checked = false;
            }
            else
                ShowAll = false;
            RadGrid1.MasterTableView.Rebind();
        }
        protected void LABChecked(object sender, System.EventArgs e)
        {
            if (CheckLAB.Checked)
            {
                ShowAll = false;
                CheckAll.Checked = false;
                ShowLAB = true;
            }
            else
                ShowLAB = false;
            RadGrid1.MasterTableView.Rebind();
        }
        protected void RADChecked(object sender, System.EventArgs e)
        {
            if (CheckRAD.Checked)
            {
                ShowAll = false;
                CheckAll.Checked = false;
                ShowRAD = true;
            }
            else
                ShowRAD = false;
            RadGrid1.MasterTableView.Rebind();
        }
        protected void OtherChecked(object sender, System.EventArgs e)
        {
            if (CheckOther.Checked)
            {
                ShowAll = false;
                CheckAll.Checked = false;
                ShowOther = true;
            }
            else
                ShowOther = false;
            RadGrid1.MasterTableView.Rebind();
        }                
    }
}