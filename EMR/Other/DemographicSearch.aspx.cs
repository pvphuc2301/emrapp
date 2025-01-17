﻿using EMR.Data.Shared.Models;
using EMR.Data.Shared.Services;
using EMR.Model;
using EmrLib.Utility;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.Other
{
    public partial class DemographicSearch : System.Web.UI.Page
    {
        public string ConnStringHIS = ""; public string ConnStringEMR = ""; string ConnStringHC = "";
        public string UserID; string specialty_id = ""; string Fr_Date = ""; string To_Date = "";
        public string current_session = "";
        public string loc { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this, "../login.aspx?ReturnUrl=", false)) return;
            
            loc = (string)Session["company_code"];

            if (!IsPostBack)
            {
                //  RadGrid1.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None;// GridCommandItemDisplay.Top;
                // RadGridHC.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None;
                txt_pid.Attributes.Add("onkeydown", "funfordefautenterkey1(" + btnSearch.ClientID + ",event)");
            }

            //if (txt_pid.Value.Length >= 9)
            //{
            //    btnSearch_Click(sender, e);
            //}
            
            specialty_id = Convert.ToString(Session["specialty_code"]);

            ConnClass ConnStr = new ConnClass();
            ConnStringEMR = ConnStr.SQL_EMRConnString;
            ConnStringHC = ConnStr.SQL_HCConnString;

            heathcheck_wrapper.Visible = (loc == "AIH");
            heathcheck_wrapper.Visible = false;
        }

        private void PostBackEvent(object sender, EventArgs e)
        {

            switch (Request["__EVENTTARGET"])
            {
                case "location_Change":
                    //DataHelpers._LOCATION = Request["__EVENTARGUMENT"];
                    Response.Redirect(Request.RawUrl);
                    break;
            }
        }

        //protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    GridDataItem item = (GridDataItem)(sender as RadGrid).SelectedItems[0];

        //    string patientID = item.GetDataKeyValue("patient_id").ToString();

        //    dynamic response = WebHelpers.GetAPI("api/Patient/check-primary/" + patientID);
        //    if (response.Status == System.Net.HttpStatusCode.OK)
        //    {
        //        dynamic data = JObject.Parse(response.Data);

        //        string script;

        //        if (data.primary_visible_patient_id != null)
        //        {
        //            //response = WebHelpers.GetAPI("api/Patient/select-patient-linked/" + patientID);
        //            JavaScriptSerializer js = new JavaScriptSerializer();
        //        }
        //        else
        //        {
        //            script = "openPID('" + patientID + "');";
        //            ScriptManager.RegisterClientScriptBlock((sender as Control), GetType(), "alert", script, true);
        //        }
        //    }
        //}
        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem gridItem = e.Item as GridDataItem;
                
                Label lbCompleteDate = gridItem.FindControl("lbCompleted_Date") as Label;
                Button btnComplete = gridItem.FindControl("btnAction") as Button;
                if (string.IsNullOrEmpty(Convert.ToString(lbCompleteDate.Text)))
                {
                    gridItem.Display = true;
                    lbCompleteDate.Visible = false;
                    btnComplete.Visible = true;
                }
                else
                {
                    gridItem.Display = false;
                    lbCompleteDate.Visible = true;
                    btnComplete.Visible = false;
                }
            }
        }

        #region RadGrid1
        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            WebApiService webApiService = new WebApiService();
            string userid = Convert.ToString(Session["UserID"]);
            DataPaging<OutpatientTodayListModel> AppointmentTodayList = webApiService.get_outpatient_today_list(userid, 1, 100);
            RadGrid1.DataSource = AppointmentTodayList.Items;

            //dynamic response = WebHelpers.GetAPI("api/Patient/outpatient-today-list?keyword=" + Session["UserID"] + "&pageIndex=1&pageSize=100");

            //if (response.Status == System.Net.HttpStatusCode.OK)
            //{
            //    JObject json = JObject.Parse(response.Data);
            //    string strJSON = "";
            //    strJSON += json["items"];

            //    RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(strJSON);
            //}
        }
        #endregion

        #region RadGrid2
        protected void RadGrid2_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            WebApiService webApiService = new WebApiService();
            string userid = Convert.ToString(Session["UserID"]);
            DataPaging<AppointmentTodayListModel> AppointmentTodayList = webApiService.get_appointment_today_list(userid, 1, 100);
            RadGrid2.DataSource = AppointmentTodayList.Items;
            //dynamic response = WebHelpers.GetAPI("api/Patient/appoinment-today-list?keyword=" + Session["UserID"] + "&pageIndex=1&pageSize=4");

            //if (response.Status == System.Net.HttpStatusCode.OK)
            //{
            //    JObject json = JObject.Parse(response.Data);
            //    string strJSON = "";
            //    strJSON += json["items"];
            //    RadGrid2.DataSource = WebHelpers.GetJSONToDataTable(strJSON);
            //}
        }

        #endregion

        protected string GetAge(object value)
        {
            if(DateTime.TryParse(value.ToString(),out DateTime date_of_birth))
            {
                return EmrHelper.CalculateAge(date_of_birth).ToString();
            }
            return String.Empty;
            //return DataHelpers.CalculateAge(DateTime.Parse(Convert.ToString(value))).ToString();
        }

        #region RadGrid5
        protected void RadGrid5_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridDataItem item = (GridDataItem)(sender as RadGrid).SelectedItems[0];
            string PID = item.GetDataKeyValue("patient_id").ToString();
            string PVID = item.GetDataKeyValue("visible_patient_id").ToString();

            string url = $"/emr/emrinfor.aspx?pid={PID}&vbid={PVID}";
            //string url = string.Format("/emr/emr.aspx?pid={0}&vbid={1}", PID, PVID);

            Response.Redirect(url);
        }
        #endregion

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string pid = EmrHelper.FormatPID(txt_pid.Value);
            WebApiService webApiService = new WebApiService();
            IEnumerable<DemographicSearchModel> DemographicSearchModel = webApiService.get_demographic_search(1, 4, pid);
            RadGrid5.DataSource = DemographicSearchModel;
            RadGrid5.Rebind();

            //string pid = "000000000" + txt_pid.Value;

            //pid = "9" + pid.Substring(pid.Length - 8, 8);

            //txt_pid.Value = pid;

            //dynamic response = WebHelpers.GetAPI("api/Patient/demographic-search?pageIndex=1&pageSize=4&keyword=" + pid);
            ////dynamic response = WebHelpers.GetAPI($"api/Patient/demographic-search-facility?f_code={loc}&pageIndex=1&pageSize=4&keyword=" + pid);

            //if (response.Status == System.Net.HttpStatusCode.OK)
            //{
            //    RadGrid5.DataSource = WebHelpers.GetJSONToDataTable(response.Data);

            //    RadGrid5.Rebind();
            //    //RadGrid5.DataBind();
            //}
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Panel myPanel = btn.Parent as Panel;
            GridDataItem dataItem = myPanel.NamingContainer as GridDataItem;
            string vid = dataItem.GetDataKeyValue("visible_patient_id").ToString();
            Guid pvid = Guid.Parse(Convert.ToString(dataItem.GetDataKeyValue("patient_visit_id")));

            SQLAppClass SQL_Class = new SQLAppClass();

            string queryInsert = "INSERT INTO consult_complete_date (account_name, visible_patient_id, patient_visit_id ) ";
            queryInsert += "VALUEs ('" + Session["UserID"] + "','" + vid + "','" + pvid + "') ";
            SQL_Class.RunQuery(queryInsert, ConnStringEMR);

            RadGrid1.MasterTableView.Rebind();
        }
        protected void cmd_refresh_opd(object sender, EventArgs e)
        {
            RadGrid1.MasterTableView.Rebind();
        }
        protected void cmd_refresh_hc(object sender, EventArgs e)
        {
            RadGridHC.MasterTableView.Rebind();
        }

        #region RadGridHC
        //Health check queue----------------------------------------------------------------------------------------------------------------------------
        public DataTable GetDataTable(string query)
        {
            SqlConnection conn = new SqlConnection(ConnStringHC);
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

        protected void RadGridHC_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            //dynamic response = WebHelpers.GetAPI("api/hck/queue/" + specialty_id);
            //if (response.Status == System.Net.HttpStatusCode.OK)
            //{
            //    RadGridHC.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
            //}

            //string TableName = RadGridHC.MasterTableView.Name;
            // string query = GetQueryHC(specialty_id);

            //if (!string.IsNullOrEmpty(query))
            //{
            //    RadGridHC.DataSource = GetDataTable(query);
            //}
        }
        public string GetQueryHC(string varType)
        {
            Fr_Date = Convert.ToString(DateTime.Today.Date);
            To_Date = Convert.ToString(DateTime.Today.Date.AddDays(1));

            string Get_query = ""; string query = "";

            string query_time = "SELECT MIN(modified_date_time) AS submit_date_time ";
            query_time += "FROM t_DocumentLog WHERE document_id = d.document_id  ";

            string query_time_vts = query_time;
            query_time_vts += "AND (cle_pulse IS NOT NULL OR cle_respiratory_rate IS NOT NULL OR cle_blood_pressure IS NOT NULL ";
            query_time_vts += "OR cle_temperature IS NOT NULL OR gen_weight IS NOT NULL OR gen_height IS NOT NULL OR gen_bmi IS NOT NULL) ";

            string query_time_ent = query_time;
            query_time_ent += "AND (ent_ear IS NOT NULL OR ent_nose IS NOT NULL OR ent_throat IS NOT NULL) ";

            string query_time_eye = query_time;
            query_time_eye += "AND (eyes_without_glass_left IS NOT NULL OR eyes_without_glass_right IS NOT NULL ";
            query_time_eye += "OR eyes_with_glass_left IS NOT NULL OR eyes_with_glass_right IS NOT NULL ";
            query_time_eye += "OR eyes_color_vision_left IS NOT NULL OR eyes_color_vision_right IS NOT NULL OR eyes_disease IS NOT NULL) ";

            string query_time_dentis = query_time;
            query_time_dentis += "AND (dentistry_upper_jaw IS NOT NULL OR dentistry_lower_jaw IS NOT NULL) ";

            string query_time_obg = query_time;
            query_time_obg += "AND (obg_breast_exam IS NOT NULL OR obg_axillary_lymph_nodes IS NOT NULL ";
            query_time_obg += "OR obg_perineum_perineal IS NOT NULL OR obg_vagina IS NOT NULL OR obg_uterus IS NOT NULL ";
            query_time_obg += "OR obg_cervix IS NOT NULL OR obg_fallepian_tubes IS NOT NULL OR obg_conclusion IS NOT NULL ";
            query_time_obg += "OR obg_recommendation IS NOT NULL) ";

            string query_time_cli = query_time;
            query_time_cli += "AND (general_appearance IS NOT NULL OR general_thyroid_glands IS NOT NULL OR respiratory_system_chest ";
            query_time_cli += "IS NOT NULL OR respiratory_system_auscultation IS NOT NULL OR cardiovascular_system IS NOT NULL ";
            query_time_cli += "OR gis_system IS NOT NULL OR urogenital_system IS NOT NULL OR nervous_system IS NOT NULL ";
            query_time_cli += "OR musculoskeletal_muscle IS NOT NULL OR musculoskeletal_joint IS NOT NULL ";
            query_time_cli += "OR musculoskeletal_spinal_cord IS NOT NULL OR dermatology IS NOT NULL) ";

            string query_time_conclusion = query_time;
            query_time_conclusion += "AND (doctor_conclusion IS NOT NULL OR doctor_recommendation IS NOT NULL) ";

            query = "SELECT cl.gender,";
            query += "cl.visible_patient_id ,d.status_document ,cl.checkin_date ,cl.patient_name ,cl.flag_completed_obsterstrics , ";
            query += "cl.Vital_Signs ,cl.Eye ,cl.ENT ,cl.Dentistry ,cl.OBG ,cl.Clinical_Exam ";
            if (varType == "VTS")
                query += ",(" + query_time_vts + ") AS vts_date_time ";
            else if (varType == "ENT")
                query += ",(" + query_time_ent + ") AS ent_date_time ";
            else if (varType == "EYE")
                query += ",(" + query_time_eye + ") AS eye_date_time ";
            else if (varType == "DEN")
                query += ",(" + query_time_dentis + ") AS dentis_date_time ";
            else if (varType == "OBG")
                query += ",(" + query_time_obg + ") AS obg_date_time ";
            //else if (varType == "CLI")
            //    query += ",(" + query_time_cli + ") AS cli_date_time ";
            else if (varType == "CON")
                query += ",(" + query_time_conclusion + ") AS conclusion_date_time ";

            query += "FROM    dbo.t_CheckLackInformation_nl_view cl WITH ( NOLOCK ) ";
            query += "LEFT JOIN dbo.t_VisitDetail vd WITH(NOLOCK) ON vd.patient_visit_id = cl.patient_visit_id ";
            query += "LEFT JOIN dbo.t_Document d WITH(NOLOCK) ON d.patient_visit_id = cl.patient_visit_id ";
            query += "WHERE (cl.flag_completed = 0) AND (d.status_document <> 'deleted') AND (vd.closed_date_time IS NULL) ";// AND d.document_id='10099'

            if (!string.IsNullOrEmpty(Fr_Date) && string.IsNullOrEmpty(To_Date))
            {
                query += "AND (cl.checkin_date >= CONVERT(DATETIME, '" + Fr_Date + "', 102) ";
                query += "AND cl.checkin_date <= GETDATE()) ";
            }
            else if (!string.IsNullOrEmpty(Fr_Date) && !string.IsNullOrEmpty(To_Date))
            {
                query += "AND (cl.checkin_date >= CONVERT(DATETIME, '" + Fr_Date + "', 102) ";
                query += "AND cl.checkin_date < CONVERT(DATETIME, '" + To_Date + "', 102)) ";
            }

            string query_final = "SELECT * ";
            query_final += "FROM (" + query + ") as hc WHERE 1=1 ";// + " ORDER BY cl.checkin_date  ASC";//,start_date_time            
            if (varType == "VTS")
                query_final += "AND Vital_Signs = 0 AND vts_date_time IS NULL ";
            else if (varType == "ENT")
                query_final += "AND ENT = 0 AND ent_date_time IS NULL ";
            else if (varType == "OPH")
                query_final += "AND Eye = 0 AND eye_date_time IS NULL ";
            else if (varType == "DMF")
                query_final += "AND Dentistry = 0 AND dentis_date_time IS NULL ";
            else if (varType == "OBG")
                query_final += "AND OBG = 0 AND gender = 'F' AND obg_date_time IS NULL";
            else if (varType == "HCK" | varType == "ENC" | varType == "IME")
                query_final += "AND Clinical_Exam = 0";
                //query_final += "AND Clinical_Exam = 0 OR cli_date_time IS NULL ";
            else
                query_final = "";

            if (!string.IsNullOrEmpty(query_final))
                query_final = query_final + " ORDER BY checkin_date ASC";//,start_date_time

            Get_query = query_final;
            return Get_query;
        }
        #endregion

        protected void RadGrid5_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string PID = item.GetDataKeyValue("patient_id").ToString();
                string PVID = item.GetDataKeyValue("visible_patient_id").ToString();

                dynamic response = WebHelpers.GetAPI("api/Patient/check-primary/" + PID);

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic data = JObject.Parse(response.Data);

                    if (data.primary_visible_patient_id != null)
                    {
                        hf_primary_visible_patient_id.Value = data.primary_visible_patient_id;
                        lbl_primary_visible_patient_id.Text = data.primary_visible_patient_id;
                        response = WebHelpers.GetAPI("api/Patient/select-patient-linked/" + data.patient_id);
                        if (response.Status == System.Net.HttpStatusCode.OK)
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), ScriptKey.SHOW_POPUP, "setTimeout(()=> { $('#DocumentList').modal({backdrop: 'static', keyboard: false}); },0);", true);
                            radGridPidList.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                            radGridPidList.DataBind();
                        }
                    }
                    else
                    {
                        string url = $"/emr/emrinfor.aspx?pid={PID}&vbid={PVID}";

                        PatientHistoryVm patientHistoryVm = new PatientHistoryVm()
                        {
                            date_of_birth = DataHelpers.ConvertSQLDateTime(WebHelpers.ConvertDateTime(item["date_of_birth"].Text, out bool isValid, out string dateTime)),
                            gender = Convert.ToString(item.GetDataKeyValue("gender_l")),
                            patient_name = Convert.ToString(item["patient_name_l"].Text),
                            user_name = Convert.ToString(Session["UserId"]),
                            visible_patient_id = Convert.ToString(item.GetDataKeyValue("visible_patient_id"))
                        };

                        dynamic response1 = WebHelpers.PostAPI($"api/emr/patient-history", patientHistoryVm);

                        if (response1.Status == System.Net.HttpStatusCode.OK)
                        {
                            Response.Redirect(url);
                        }
                    }
                }
            }
            else if (e.CommandName.Equals("btnComplete"))
            {
                //GridDataItem item = (GridDataItem)(sender as RadGrid).SelectedItems[0];

                //Button btn = sender as Button;
                //Panel myPanel = btn.Parent as Panel;
                //GridDataItem dataItem = myPanel.NamingContainer as GridDataItem;
                string vid = item.GetDataKeyValue("visible_patient_id").ToString();
                Guid pvid = Guid.Parse(Convert.ToString(item.GetDataKeyValue("patient_visit_id")));

                SQLAppClass SQL_Class = new SQLAppClass();

                string queryInsert = "INSERT INTO consult_complete_date (account_name, visible_patient_id, patient_visit_id ) ";
                queryInsert += "VALUEs ('" + Session["UserID"] + "','" + vid + "','" + pvid + "') ";
                SQL_Class.RunQuery(queryInsert, ConnStringEMR);

                RadGrid1.MasterTableView.Rebind();
            }
        }

        protected void radGridPidList_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("selectPID"))
            {
                string PID = item.GetDataKeyValue("patient_id").ToString();
                string PVID = item.GetDataKeyValue("visible_patient_id").ToString();
                string url = $"/emr/emrinfor.aspx?pid={PID}&vbid={PVID}&pvpid={lbl_primary_visible_patient_id.Text}" ;
                Response.Redirect(url);
            } 
        }

        protected void RadGrid3_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            WebApiService webApiService = new WebApiService();
            IEnumerable<PatientHistory> patientHistories = webApiService.get_patient_histories(7, (string)Session["UserId"]);
            RadGrid3.DataSource = patientHistories;

            //string url = "api/emr/patient-history-list?day=7&user_name=" + (string)Session["UserId"];
            //dynamic response = WebHelpers.GetAPI(url);
            //if (response.Status == System.Net.HttpStatusCode.OK)
            //{
            //    RadGrid3.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
            //}
        }
        
        protected void RadGrid4_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            WebApiService webApiService = new WebApiService();
            IEnumerable<PatientHistory> patientHistories = webApiService.get_patient_histories(30, (string)Session["UserId"]);
            RadGrid4.DataSource = patientHistories;
            
            //string url = "api/emr/patient-history-list?day=30&user_name=" + (string)Session["UserId"];
            //dynamic response = WebHelpers.GetAPI(url);
            //if (response.Status == System.Net.HttpStatusCode.OK)
            //{
            //    RadGrid4.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
            //}
        }

        protected void RadGrid3_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string PID = "";
                string VPID = item.GetDataKeyValue("visible_patient_id").ToString();

                dynamic response = WebHelpers.GetAPI("api/Patient/demographic-search?pageIndex=1&pageSize=1&keyword=" + VPID);

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    DataTable db = WebHelpers.GetJSONToDataTable(response.Data);
                    if(db.Rows.Count > 0)
                    {
                        PID = Convert.ToString(db.Rows[0]["patient_id"]);

                        string url = $"/emr/emrinfor.aspx?pid={PID}&vbid={VPID}";

                        PatientHistoryVm patientHistoryVm = new PatientHistoryVm()
                        {
                            date_of_birth = DataHelpers.ConvertSQLDateTime(WebHelpers.ConvertDateTime(item["date_of_birth"].Text, out bool isValid, out string dateTime)),
                            gender = Convert.ToString(item.GetDataKeyValue("gender")),
                            patient_name = Convert.ToString(item["patient_name"].Text),
                            user_name = Convert.ToString(Session["UserId"]),
                            visible_patient_id = Convert.ToString(item.GetDataKeyValue("visible_patient_id"))
                        };
                         
                        dynamic response1 = WebHelpers.PostAPI($"api/emr/patient-history", patientHistoryVm);

                        if (response1.Status == System.Net.HttpStatusCode.OK)
                        {
                            Response.Redirect(url);
                        }
                    }
                }
            }
        }
    }
}