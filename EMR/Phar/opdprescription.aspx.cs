using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json;

namespace EMR.Print
{
    public partial class opdprescription : System.Web.UI.Page
    {
        private string ConnStringHIS = ""; private string visitType = ""; private string varPresType;
        public string varPID = ""; private string varPV_ID = ""; private string varPharID = ""; private string varVbID = ""; private bool oldVisit = false;
        public string loc { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;

            varPID = Request.QueryString["pid"];
            varVbID = Request.QueryString["vibid"];
            varPV_ID = Request.QueryString["vid"];
            varPharID = Request.QueryString["phar"];
            varPresType = Request.QueryString["pres_type"];

            if (!IsPostBack && !string.IsNullOrEmpty(varPID))
            {
                LoadPatientInfomation(varPID);
                load_visit_infor(varPV_ID);
                load_vital_sign(varPV_ID);
                Load_Allergy(varPV_ID);
                Load_Dianosis(varPV_ID);
                Load_Diagnosis_List(varPV_ID, varVbID);
                Get_Doctor_Note(varPharID);

                bool CheckTV = false;
                CheckTV = Check_Pres(varPharID, "TV");
                if (CheckTV)
                {
                    PrintTV.Visible = true;
                    PrintDT.Visible = true;
                }
            }
        }

        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            // if (!IsPostBack)
            {
              // string _jsonData = WebHelpers.GetAPI("api/pharmacy/prescription_normal/" + varPharID);
                dynamic response = WebHelpers.GetAPI("api/pharmacy/prescription_normal/" + varPharID);

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                }
            }
        }

        protected void RadGrid2_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            //    if (!IsPostBack)
            {
                //string _jsonData = WebHelpers.GetAPI("api/pharmacy/prescription_consult/" + varPharID);
                dynamic response = WebHelpers.GetAPI("api/pharmacy/prescription_consult/" + varPharID);

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    RadGrid2.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                }
            }
        }

        public void LoadPatientInfomation(string varPID)//object sender, EventArgs e
        {
            //string _jsonData = WebHelpers.GetAPI("api/emr/demographic/" + varPID);
            dynamic response = WebHelpers.GetAPI("api/emr/demographic/" + varPID);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                string ptAge = "";
                dynamic data = JObject.Parse(response.Data);

                lbFullName.Text = data.first_name_l + " " + data.last_name_l + " (" + data.title_l + ")";
                if (data.gender_e == "Male")
                    lbSex.Text = "Nam/ Man";
                else if (data.gender_e == "Female")
                    lbSex.Text = "Nữ/ Woman";
                //lbSex.Text = data.gender_e;
                lbPID.Text = data.visible_patient_id;
                ptAge = DataHelpers.CalculateAge(DateTime.Parse(data.date_of_birth.ToString())).ToString();

                lbBirthday.Text = data.date_of_birth.ToString("dd-MM-yyyy");
                lbAddress.Text = data.address_line_l + " " + data.address_subregion_l + " " + data.address_region_l;

                if (!string.IsNullOrEmpty(ptAge))
                {
                    lbAge.Text = MISClass.Return_Age(data.date_of_birth, ptAge);

                    if (Convert.ToInt16(ptAge) < 18)
                    {
                        lbGuardianText.Visible = true;
                        lbGuardian.Visible = true;
                        lbGuardian.Text = data.contact_name_l;
                    }
                }
                lbPrintDate.Text = "Printed date: " + string.Format("{0:dd/MMM/yyyy hh:mm tt}", DateTime.Now);
            }
        }

        public void load_vital_sign(string varPV_ID)
        {
            string jsString = "";
            //if (visitType == "OPD")
            //    jsString = "api/emr/vital-sign-opd/" + varPV_ID;
            //else if (visitType == "IPD")
            //    jsString = "api/emr/vital-sign-ipd/" + varPV_ID;
            //    string _jsonData = WebHelpers.GetAPI(jsString);
            loc = (string)Session["company_code"];
            jsString = $"api/emr/vital-sign/{loc}/{varPV_ID}/" + varPresType;
            dynamic response = WebHelpers.GetAPI(jsString);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic data = JObject.Parse(response.Data);
                lbWeight.Text = data.vs_weight + " kg";
                lbHeight.Text = data.vs_height + " cm";
            }
        }

        public void load_specialty(string varPV_ID)
        {
            SQLAppClass SQL_Class = new SQLAppClass();

            string Get_Specialty_Name = "SELECT	TOP 1 ou.name_e, ou.name_l ";
            Get_Specialty_Name += "FROM bed_schedule_entry_nl_view bse ";
            Get_Specialty_Name += "INNER JOIN bed_info_view biv ON bse.bed_id = biv.bed_id ";
            Get_Specialty_Name += "INNER JOIN area_organizational_unit_nl_view aou ON aou.area_id = biv.ward_id ";
            Get_Specialty_Name += "AND effective_from_date <= GETDATE() ";
            Get_Specialty_Name += "AND(effective_until_date IS NULL OR effective_until_date > GETDATE()) ";
            Get_Specialty_Name += "INNER JOIN organizational_unit_nl_view ou ON ou.organizational_unit_id = aou.organizational_unit_id ";
            Get_Specialty_Name += "WHERE bse.cancelled_date_time IS NULL ";
            Get_Specialty_Name += "AND bse.patient_visit_id = '" + varPV_ID + "' ";
            Get_Specialty_Name += "ORDER BY (CASE WHEN actual_end_date_time IS NULL THEN 0 ELSE 1 END) ASC, ";
            Get_Specialty_Name += "start_date_time DESC, ou.key_struct ";

            lbSpecialty.Text = SQL_Class.CheckAndGetItem(Get_Specialty_Name, "name_l", ConnStringHIS);  // Request.QueryString["spec"];
        }

        public void load_visit_infor(string varPV_ID)
        {
            string vsType = "";
            string apiURL = $"api/emr/patient-visit/{loc}/" + varPV_ID;
            dynamic response = WebHelpers.GetAPI(apiURL);//"api/emr/patient-visit/" + varPV_ID

            DataTable mydataTable = new DataTable();

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                mydataTable = WebHelpers.GetJSONToDataTable(response.Data);
                //dynamic data = JObject.Parse(response.Data);
                foreach (DataRow row in mydataTable.Rows)
                {
                    lbVisitDate.Text = row["actual_visit_date_time"].ToString();//.ToString("dd-MM-yyyy");
                    vsType = row["visit_type_group_rcd"].ToString();
                    break;
                }                    

                if (!string.IsNullOrEmpty(lbVisitDate.Text))
                {
                    DateTime vsDate = Convert.ToDateTime(lbVisitDate.Text);
                    if (vsDate.Month < 8 && vsDate.Year <= 2020)
                        oldVisit = true;
                }
                if (vsType == "OPD")
                {
                    lbSpecialty.Text = "Khoa Khám Bệnh/ OPD";
                    visitType = "OPD";
                }
                else
                {
                    load_specialty(varPV_ID);
                    visitType = "IPD";
                }
            }
        }

        public void Load_Dianosis(string varPV_ID)//object sender, EventArgs e
        {
           // string _jsonData = WebHelpers.GetAPI("api/emr/diagnosis/" + varPV_ID);
            dynamic response = WebHelpers.GetAPI("api/emr/diagnosis/" + varPV_ID);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic data = JObject.Parse(response.Data);
                lbDianosis.Text = data.diagnosis;
            }
            if (!string.IsNullOrEmpty(lbDianosis.Text))
            {
                Label1.Visible = false;
                RadGrid1.Visible = true;
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Vui long nhap Chan doan";
                Label1.ForeColor = System.Drawing.Color.Red;
                RadGrid1.Visible = false;
            }
        }

        public void Load_Allergy(string varPV_ID)//object sender, EventArgs e
        {
           // string _jsonData = WebHelpers.GetAPI("api/emr/allergy/" + varPV_ID);
            dynamic response = WebHelpers.GetAPI("api/emr/allergy/" + varPV_ID);
            lbAllergy.Text = "No/ Không có";

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic data = JObject.Parse(response.Data);
                lbAllergy.Text = data.allergy;
            }
            if (string.IsNullOrEmpty(lbAllergy.Text))
                lbAllergy.Text = "No/ Không có";

        }

        protected void Load_Diagnosis_List(string varPV_ID, string varVbID)
        {
            DataTable dt = new DataTable();
        //    string _jsonData = WebHelpers.GetAPI("api/patient/diagnosis-list/" + varPV_ID);
            dynamic response = WebHelpers.GetAPI("api/patient/diagnosis-list/" + varPV_ID);
            
            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dt = WebHelpers.GetJSONToDataTable(response.Data);// GetDataTableJS(_jsonData);
                rcbMyList1.DataTextField = "diagnosis";
                rcbMyList1.DataValueField = "diagnosis";
                rcbMyList1.DataSource = dt;
                rcbMyList1.DataBind();
            }
        }

        public void Get_Doctor_Note(string varPharID)
        {
            string query = "SELECT  (SELECT  TOP (1) notes ";
            query += "FROM ph_prescription AS p ";
            query += "WHERE(ph_prescription_id = '" + varPharID + "')) AS additional_information_for_patient, ";
            query += "MAX(pre.duration)AS duration, pre.created_date_time, DATEADD(DAY, MAX(pre.duration), ";
            query += "pre.created_date_time) AS last_day, em.display_name_l AS created_by_user_name_l, ";
            query += "em.display_name_e AS created_by_user_name_e ";
            query += "FROM ph_prescription_order AS pre INNER JOIN ";
            query += "user_account AS ua ON ua.user_id = pre.created_by_user_id INNER JOIN ";
            query += "employee_formatted_name_iview_nl_view AS em ON em.person_id = ua.person_id ";
            query += "WHERE(pre.ph_prescription_id = '" + varPharID + "') ";
            query += "GROUP BY pre.created_date_time, pre.ph_prescription_id, em.display_name_l, ";
            query += "em.display_name_e ";

            string follow = "";

            SqlConnection conn = new SqlConnection(ConnStringHIS);
            SqlCommand com = new SqlCommand();//(query, conn);
            com.CommandText = query;
            com.Connection = conn;
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        follow = Convert.ToString(reader["last_day"]);
                        lbInstruction.Text = Convert.ToString(reader["additional_information_for_patient"]).Replace("\r\n", "<br />");
                        if (!string.IsNullOrEmpty(follow))
                            lbFollow.Text = String.Format("{0:dd/MMM/yyyy}", reader["last_day"]);
                        lbDoctor.Text = Convert.ToString(reader["created_by_user_name_l"]);
                        break;
                    }
                }
            }
            finally
            {
                conn.Close();
            }
        }

        public bool Check_Pres(string varPharID, string varType)
        {
            SQLAppClass SQL_Class = new SQLAppClass();

            string query = "SELECT TOP 1 php.name_l AS medicine_name ";
            query += "FROM    OrionHIS_PRO.dbo.api_ph_prescription_order_view pro ";
            query += "LEFT JOIN OrionHIS_PRO.dbo.api_ph_prescription_view rx ON rx.ph_prescription_id = pro.ph_prescription_id ";
            query += "LEFT JOIN OrionHIS_PRO.dbo.ph_pharmacy_product_nl_view AS php ON pro.ph_pharmacy_product_id = php.ph_pharmacy_product_id ";
            query += "LEFT JOIN OrionHIS_PRO.dbo.item_nl_view AS it ON php.item_id = it.item_id ";
            query += "LEFT JOIN OrionHIS_PRO.dbo.item_group_nl_view AS ig ON ig.item_group_id = it.item_group_id ";
            query += "LEFT JOIN OrionHIS_PRO.dbo.ph_prescription_order_dosage_instruction_nl_view ";
            query += "AS phdo ON phdo.ph_prescription_order_id = pro.ph_prescription_order_id ";
            query += "AND phdo.localization_supported_culture_rcd = 'vi-VN' ";
            query += "LEFT OUTER JOIN OrionHIS_PRO.dbo.ph_prescription_order_dosage_instruction_nl_view ";
            query += "AS phdoe ON phdoe.ph_prescription_order_id = pro.ph_prescription_order_id ";
            query += "AND phdoe.localization_supported_culture_rcd = 'en-GB' ";
            query += "WHERE ig.item_group_code IN ('PHA.DS', 'PHA.COSM' ) AND pro.ph_prescription_order_type_rcd NOT IN('CAN', 'SAVED','DIS') ";
            query += "AND(pro.ph_prescription_id = '" + varPharID + "') ";
            if (varType == "TV")
                query += "AND (ig.item_group_code IN ( 'PHA.DS', 'PHA.COSM' )) ";
            else
                query += "AND (ig.item_group_code LIKE 'PHA.MED%') AND (ig.item_group_code NOT IN('PHA.MED5.PSY', 'PHA.MED5.NAR')) ";

            if (!string.IsNullOrEmpty(SQL_Class.CheckAndGetItem(query, "medicine_name", ConnStringHIS)))
                return true;
            else
                return false;
        }

        public void ButtonGetValue_Click(object sender, EventArgs e)
        {
            lbDianosis.Text = GetCheckBoxValues(rcbMyList1);
        }

        private string GetCheckBoxValues(Telerik.Web.UI.RadComboBox cbo)
        {
            string sValues = "";
            //foreach (RadComboBoxItem item in cbo)
            for (int x = 0; x < cbo.Items.Count; x++)
            {
                if ((cbo.Items[x].FindControl("CheckBox1") as CheckBox).Checked)
                {
                    sValues += cbo.Items[x].Text + ",";//.Value
                }
            }
            //if (sValues != "")
            //  sValues = sValues.Substring(1);

            return sValues;
        }

        public string ReturnMedicine_Name(object varMedicineName, object varInstruction_l, object varInstruction_e, object varCachdung_l, object varCachdung_e)
        {
            string tmp = "";
            string ins_l = varInstruction_l.ToString().Replace("\r\n", "<br />");
            string ins_e = varInstruction_e.ToString().Replace("\r\n", "<br />");

            tmp = "<b>" + varMedicineName + "</b><br />" + ins_l + "<br />" + ins_e;

            return tmp;
        }

        public string ReturnSL_Name(object varQty, object varDuration, object varRefill)
        {
            string tmp = "";

            tmp = "SL/" + " <i> Qty: </i> " + String.Format("{0:#,#0.0}", varQty) + "<br />"
            + "Thời gian/" + " <i> Duration: </i> " + varDuration + "<br /> " + "Lặp lại/" + " <i> Refill: </i>" + varRefill;

            return tmp;
        }

        protected void cmd_PrintDT_Click(object sender, EventArgs e)
        {
            lbDT.Visible = true;
            lbTV.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.Rebind();

            RadGrid2.Visible = false;
            RadGrid2.Rebind();
            //ClientScript.RegisterStartupScript(typeof(Page), "key", "<script type='text/javascript'>window.print();;</script>");*/

            // Response.Redirect("../phar/opdprescons.aspx?pid=" + PatientID + "&vid=" + VisitID + "&phar=" + PharID + "&vibid=" + Visible_ID);
        }

        protected void cmd_PrintTV_Click(object sender, EventArgs e)
        {
            lbDT.Visible = false;
            lbTV.Visible = true;
            RadGrid1.Visible = false;
            RadGrid1.Rebind();
            //  RadGrid1.MasterTableView.DataBind();
            RadGrid2.Visible = true;
            RadGrid2.Rebind();
        }
    }
}