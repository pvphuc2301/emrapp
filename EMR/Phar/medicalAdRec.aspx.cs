using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.Phar
{
    public partial class medicalAdRec : System.Web.UI.Page
    {
        string ConnStringHIS = ""; string ConnStringEMR = "";
        public string varVbID = ""; string varFr_Date = ""; string varTo_Date = ""; string visitID = ""; string lb_ID = "";
        public string[] allow_user = new string[5] { "tuan.cao", "chung.nguyen", "long.do", "", "" };
        public bool admin_print = false; string UserID = "";
        public string loc = "AIH"; public string varPresType = "ERO";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;
            ConnStringEMR = ConnStr.SQL_EMRConnString;
            //Load_Doctor(ConnStringHIS);            
            if (!string.IsNullOrEmpty(lbNoReviewed.Text))
                listMedicine.Attributes.Add("class", "cssclsNoPrint");

            varFr_Date = Convert.ToString(FromDate.SelectedDate);
            //varTo_Date = Convert.ToString(ToDate.SelectedDate);
            if (string.IsNullOrEmpty(varFr_Date))
            {
                if (DateTime.Now.Hour <= 8)
                    varFr_Date = Convert.ToString(DateTime.Today.Date);
                else
                    varFr_Date = Convert.ToString(DateTime.Today.Date.AddHours(8));
                if (DateTime.Now.Hour <= 8)
                    FromDate.SelectedDate = DateTime.Today.Date.AddDays(-1);
                else
                    FromDate.SelectedDate = DateTime.Today.Date;
            }
            varVbID = PatientID.Text = lbPID.Text = Request.QueryString["vbid"];
            // PatientID.Text = varVbID;
            if (!string.IsNullOrEmpty(PatientID.Text))
            {
                varVbID = PatientID.Text;
                Load_List_Diagnosis(varVbID);
            }

            UserID = (string)Session["UserID"];
            admin_print = MISClass.In_Array(allow_user, UserID);
            admin_print = true;

            RadGrid1.MasterTableView.GetColumn("drug_name_l").Display = false;
            RadGrid1.MasterTableView.GetColumn("dosage_instruction").Display = false;
            RadGrid1.MasterTableView.GetColumn("note").Display = false;

            RadGrid2.MasterTableView.GetColumn("drug_name_l").Display = false;
            RadGrid2.MasterTableView.GetColumn("dosage_instruction").Display = false;
            RadGrid2.MasterTableView.GetColumn("note").Display = false;
        }
        public void GetPatientInfor()
        {
            int i = 0; string frD = ""; string tD = "";
            frD = string.Format("{0:ddd, dd MMM, yyyy}", FromDate.SelectedDate);// Convert.ToString(FromDate.SelectedDate)
            tD = string.Format("{0:ddd, dd MMM, yyyy}", FromDate.SelectedDate.Value.AddDays(1));
            //            lbDoctor.Text = DoctorSeclection.Text;
            lbMASFromTo.Text = frD + " 08:01 - " + tD + " 08:00";
            foreach (GridDataItem item in RadGrid1.Items)
            {
                i = i + 1;
                Label lb_patient_name = (Label)item["PatientInfor"].FindControl("lbpatient_name");
                Label lb_PID = (Label)item["PatientInfor"].FindControl("lbPID");
                Label lb_gender = (Label)item["PatientInfor"].FindControl("lbgender");
                Label lb_date_of_birth = (Label)item["PatientInfor"].FindControl("lbdate_of_birth");
                Label lb_patient_age = (Label)item["PatientInfor"].FindControl("lbpatient_age");
                Label lb_PatientAreaID = (Label)item["PatientInfor"].FindControl("lbPatientAreaID");
                Label lb_Diag = (Label)item["PatientInfor"].FindControl("lbDiag");
                Label lb_VisitID = (Label)item["PatientInfor"].FindControl("lbVisitID");
                Label lb_Reviewed = (Label)item["PatientInfor"].FindControl("lbReviewed");
                visitID = Convert.ToString(lb_VisitID.Text);
                lb_ID = lb_PID.Text;
                Load_Problem(visitID);
                load_vital_sign(visitID);
                loadAllergy(visitID);
                //if (lb_Reviewed.Text != "[Not been reviewed by Pharmacist]")
                {
                    lbFullName.Text = lb_patient_name.Text;
                    lbPID.Text = lb_PID.Text;
                    lbBirthday.Text = lb_date_of_birth.Text;
                    lbRoom.Text = lb_PatientAreaID.Text;
                    lbAge.Text = lb_patient_age.Text;
                    lbSex.Text = lb_gender.Text;
                    lbProblem.Text = lb_Diag.Text;
                    //lbPrintDate.Text = "Printed date: " + string.Format("{0:dd/MMM/yyyy hh:mm tt}", DateTime.Now);// DateTime.Now.ToString("dd-MMM-YYYY-HH-mm");
                                                                                                                  //string.Format("{0:dd/MMM/yyyy}", DateTime.Today.Date) + " " + Convert.ToString(DateTime.Today.Date.Hour) + ":" + Convert.ToString(DateTime.Today.Date.Minute);
                }
                if (string.IsNullOrEmpty(lbProblem.Text))
                {
                    Label1.Visible = true;
                    Label1.Text = "Vui long nhap Chan doan";
                    Label1.ForeColor = System.Drawing.Color.Red;
                    listMedicine.Attributes.Add("class", "cssclsNoPrint");
                }
                if (i == 1)
                    break;
            }
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

        public void Load_List_Diagnosis(string varVbID)
        {
            string orderID = ""; string drID = ""; string drName = "";

            if (varVbID == lbPID.Text)
                orderID = DrOrderCombobox.SelectedValue; // Get1Values(DrOrderCombobox);
                                                         //else

            if (string.IsNullOrEmpty(orderID))
                Load_RX(varVbID, orderID);

            drName = DrOrderCombobox.Text;
            drID = MISClass.Right(drName, 4);
            if (!string.IsNullOrEmpty(drName))
                lbDoctor.Text = DrOrderCombobox.Text.Substring(8);
        }
        protected void Load_Problem(string varVisitID)
        {
            /*      SqlConnection connection = new SqlConnection(ConnStringHIS);
                  SqlDataAdapter adapter = new SqlDataAdapter(getDiagnosis(varVisitID), connection);            

                  DataTable dt = new DataTable();
                  adapter.Fill(dt);*/

            string query = "SELECT diagnosis_name AS patientDianosis ";
            query += "FROM AIH_MIS.dbo.fn_get_diagnosis_by_patient_visit_id ( '" + varVisitID + "' )";

            rcbMyList1.DataTextField = "patientDianosis";
            rcbMyList1.DataValueField = "patientDianosis";
            rcbMyList1.DataSource = GetDataTable(query, ConnStringHIS);//  dt;
            rcbMyList1.DataBind();
        }
        public string getDiagnosis(string varVisitID)
        {
            string query = "SELECT diagnosis_name AS patientDianosis ";
            query += "FROM AIH_MIS.dbo.fn_get_diagnosis_by_patient_visit_id ( '" + varVisitID + "' )";

            return query;
        }

        protected void RadGrid1_PreRender(object sender, EventArgs e)
        {
            List<int> temp = new List<int>();

            for (int i = RadGrid1.Items.Count - 1; i > 0; i--)
            {
                if (RadGrid1.Items[i][RadGrid1.Columns[0]].Text == RadGrid1.Items[i - 1][RadGrid1.Columns[0]].Text
                    && RadGrid1.Items[i][RadGrid1.Columns[8]].Text == RadGrid1.Items[i - 1][RadGrid1.Columns[8]].Text
                    && RadGrid1.Items[i][RadGrid1.Columns[9]].Text == RadGrid1.Items[i - 1][RadGrid1.Columns[9]].Text)
                {
                    temp.Add(i);

                    RadGrid1.Items[i - 1][RadGrid1.Columns[1]].RowSpan = RadGrid1.Items[i][RadGrid1.Columns[1]].RowSpan < 2 ? 2 : RadGrid1.Items[i][RadGrid1.Columns[1]].RowSpan + 1;
                    RadGrid1.Items[i][RadGrid1.Columns[1]].Visible = false;
                    RadGrid1.Items[i - 1][RadGrid1.Columns[2]].RowSpan = RadGrid1.Items[i][RadGrid1.Columns[2]].RowSpan < 2 ? 2 : RadGrid1.Items[i][RadGrid1.Columns[2]].RowSpan + 1;
                    RadGrid1.Items[i][RadGrid1.Columns[2]].Visible = false;
                }
            }

            //To mau lai cho Radgird 
            foreach (GridDataItem dataItem in RadGrid1.Items)
            {
                foreach (GridColumn col in RadGrid1.MasterTableView.RenderColumns)
                {
                    //if (dataItem[col.UniqueName].Text == string.Empty) 
                    dataItem[col.UniqueName].Style.Add("border-left", "solid 1px #ededed");
                }
            }
            lbl_lst.Value = JsonConvert.SerializeObject(temp);
            WebHelpers.AddJS(Page, "FormatGrid()");
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
                GridDataItem dataItem = (GridDataItem)e.Item;
                Label lb_Reviewed = (Label)dataItem["PatientInfor"].FindControl("lbReviewed");
                if (lb_Reviewed.Text.ToLower() == "[not been reviewed by pharmacist]")
                {
                    listMedicine.Attributes.Add("class", "cssclsNoPrint");
                    //headerView.Visible = false;
                    lbNoReviewed.Text = "Có ít nhất 1 thuốc chưa được Reviewed by pharmacist";
                    dataItem["Medication"].ForeColor = Color.Red;
                    dataItem["start_stop_date_time"].ForeColor = Color.Red;
                }
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
        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string query = GetQuery(varVbID);
            if (!string.IsNullOrEmpty(query))
                (sender as RadGrid).DataSource = GetDataTable(query, ConnStringHIS);
        }

        public string GetQuery(string varVbID)
        {
            string query_final = "";
            if (string.IsNullOrEmpty(varFr_Date) && string.IsNullOrEmpty(varVbID))
            {
                lbError.Text = "Vui lòng nhập đầy đủ các thông tin trên/ Please input the above empty values";
            }
            else
            {
                string orderID = "";
                string drName = DrOrderCombobox.Text;
                string drID = MISClass.Right(drName, 4);
                if (varVbID == lbPID.Text)
                    orderID = DrOrderCombobox.SelectedValue;

                varTo_Date = Convert.ToString(FromDate.SelectedDate.Value.AddDays(1));
                if (!string.IsNullOrEmpty(varVbID))//&& !string.IsNullOrEmpty(orderID)
                {
                    query_final = "EXEC AIH_MIS.dbo.aih_api_MAR_preview @fromDate='" + varFr_Date + "',@toDate='" + varTo_Date + "',";
                    query_final += "@visible_patient_id = '" + varVbID + "',@adminPrint = '" + admin_print + "',@allDr = '" + AllDoctor.Checked + "',";
                    query_final += "@drID = '" + drID + "',@all01Dr = '" + PrintAll.Checked + "',@orderID = '" + orderID + "'";
                }
            }

            return query_final;
        }

        public string ReturnMedicine_Name(object varMedicineName, object varCachDung, object varNote)
        {
            string tmp = ""; string tmpCachDung = Convert.ToString(varCachDung);
            string ins_l = tmpCachDung.Replace("\r\n", "<br />");

            tmp = "<b>" + varMedicineName + "</b><br />" + ins_l;
            if (!string.IsNullOrEmpty(Convert.ToString(varNote)))
                tmp += "<br /> " + varNote;

            return tmp;
        }
        protected void Load_RX(string varVbID, string varOrderID)
        {
            SqlConnection connection = new SqlConnection(ConnStringHIS);
            SqlDataAdapter adapter = new SqlDataAdapter(getRX(varVbID), connection);

            DataTable dt = new DataTable();
            adapter.Fill(dt);
            DrOrderCombobox.DataTextField = "combo_code";
            DrOrderCombobox.DataValueField = "order_code";
            DrOrderCombobox.DataSource = dt;
            DrOrderCombobox.DataBind();
        }
        public string getRX(string varVbID)
        {
            string get_RX = "";
            string query = "SELECT pre.patient_id, pre.patient_visit_id, pre.ph_prescription_id, pre.prescriber_employee_id, ";
            query += "pre.reference_number AS order_code, phu.visible_patient_id, pre.created_date_time, ";
            query += "pre.reference_number + ' | ' + efni.display_name_l + '-' + CAST(efni.employee_nr AS VARCHAR) AS combo_code ";
            query += "FROM dbo.ph_prescription_nl_view AS pre INNER JOIN ";
            query += "(SELECT ph_prescription_id ";
            query += "FROM dbo.ph_prescription_order_nl_view AS a ";
            query += "WHERE(ph_medication_profile_type_rcd = 'IPD') AND(ph_prescription_order_status_rcd <> 'CANC') ";
            query += "GROUP BY ph_prescription_id) AS preo ON preo.ph_prescription_id = pre.ph_prescription_id INNER JOIN ";
            query += "dbo.patient_hospital_usage_nl_view AS phu ON phu.patient_id = pre.patient_id INNER JOIN ";
            //query += "dbo.user_account_nl_view AS uac ON uac.person_id = pre.prescriber_employee_id INNER JOIN ";
            query += "dbo.employee_formatted_name_iview_nl_view AS efni ON efni.person_id = pre.prescriber_employee_id ";
            query += "WHERE phu.visible_patient_id = '" + varVbID + "' ";
            query += "ORDER BY pre.created_date_time DESC ";

            get_RX = query;
            return get_RX;
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
        public void ButtonText_Click(object sender, EventArgs e)
        {
            RadGrid1.MasterTableView.Rebind();
            GetPatientInfor();

            string OrderID = DrOrderCombobox.SelectedValue; // Get1Values(DrOrderCombobox);  
                                                            //     if (string.IsNullOrEmpty(OrderID))
            Load_RX(varVbID, OrderID);
        }
        protected void ButtonPreview_Click(object sender, EventArgs e)
        {
            RadGrid1.Rebind();
            RadGrid2.Rebind();
            GetPatientInfor();
        }

        public void load_vital_sign(string visitID)
        {
            try
            {
                string jsString = "";
                //if (visitType == "OPD")
                //    jsString = "api/emr/vital-sign-opd/" + varPV_ID;
                //else if (visitType == "IPD")
                //    jsString = "api/emr/vital-sign-ipd/" + varPV_ID;
                //    string _jsonData = WebHelpers.GetAPI(jsString);

                dynamic response = WebHelpers.GetAPI($"api/emr/patient-visit/{loc}/{visitID}");

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    string PatientVisit = WebHelpers.GetJSONToDataTable(response.Data).Rows[0]["visit_type_group_rcd"];

                    response = WebHelpers.GetAPI($"api/emr/vital-sign/{loc}/{visitID}/{PatientVisit}");
                    if (response.Status == System.Net.HttpStatusCode.OK)
                    {
                        dynamic data = JObject.Parse(response.Data);
                        lblWeight.Text = data.vs_weight;
                        lblHeight.Text = data.vs_height;
                    }
                }
            } 
            catch(Exception ex) 
            { 

            }
        }

        private void loadAllergy(string visitID)
        {
            dynamic response = WebHelpers.GetAPI("api/emr/allergy/" + visitID);
            lbAllergy.Text = "No/ Không có";

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic data = JObject.Parse(response.Data);
                lbAllergy.Text = data.allergy;
            }
            if (string.IsNullOrEmpty(lbAllergy.Text))
                lbAllergy.Text = "No/ Không có";
        }
        
    }
}