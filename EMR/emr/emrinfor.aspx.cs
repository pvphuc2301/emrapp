using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Telerik.Web.UI;
using System.Data;
using Newtonsoft.Json;

namespace EMR
{
    public partial class emrinfor : System.Web.UI.Page
    {
        public string ConnStringHIS = ""; public string ConnStringEMR = "";

        public PatientInfo patient = new PatientInfo();
        public string varPID = ""; string varPVId = "";
        //string varVisibleID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;
            ConnStringEMR = ConnStr.SQL_EMRConnString;

            varPID = Request.QueryString["pid"];// "97052A99-0134-11EB-B34D-D89EF37D444C";//  "C248E0FC-39B6-493F-A197-6CF2A96B37AD";//
            varPVId = Request.QueryString["pvid"]; //"3afc144a-86ca-11eb-9dfe-dca2660bc0a2";// ValueHiddenField.Value;        
            //varVisibleID = Request.QueryString["vbid"]; //"900031267";
            LoadPatientInfomation();

            BtnPatientSummary_Click(sender, e);
        }

        protected void BtnPatientSummary_Click(object sender, EventArgs e)
        {
            MainContent.ContentUrl = "../other/patientsummary.aspx?pid=" + varPID;
            
        }

        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (!IsPostBack)
            {
                string _jsonData = WebHelpers.GetAPI("api/emr/menu-visit/" + varPID);

                if (_jsonData != null)
                {
                    RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(_jsonData);
                }
            }
        }

        protected void RadGrid1_DetailTableDataBind(object source, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;

            switch (e.DetailTableView.Name)
            {
                case "F1":
                    {
                        string ParentID = Convert.ToString(dataItem.GetDataKeyValue("patient_visit_id"));
                        string _jsonData = WebHelpers.GetAPI("api/emr/menu-form/" + ParentID);
                        if (!string.IsNullOrEmpty(_jsonData))
                        {
                            e.DetailTableView.DataSource = WebHelpers.GetJSONToDataTable(_jsonData);
                        }
                        break;
                    }
            }
        }

        //public static DataTable GetDataTableJS(string jsquery)
        //{
        //    dynamic jsonObject = Newtonsoft.Json.JsonConvert.DeserializeObject(jsquery);
        //    DataTable dt = JsonConvert.DeserializeObject<DataTable>(Convert.ToString(jsonObject));
        //    return dt;
        //}

        /// <summary>
        /// 
        /// </summary>
        public void LoadPatientInfomation()//object sender, EventArgs e
        {
            
            string _jsonData = WebHelpers.GetAPI("api/emr/demographic/" + varPID);

            if (_jsonData != null)
            {
                dynamic data = JObject.Parse(_jsonData);
                _jsonData = "[" + _jsonData + "]";
                DataTable tbl = new DataTable();
                tbl = WebHelpers.GetJSONToDataTable(_jsonData);
                WebHelpers.BindingDatafield(tbl, patient);
            }
        }
        public void LoadLeftMenu()//object sender, EventArgs e
        {
            string query = "";
            string _jsonData = WebHelpers.GetAPI("api/emr/menu-form/" + varPID);

            if (_jsonData != null)
            {
                RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(query);
            }
        }
        public string ReturnVisit_Date(object varDate, object varVisitType, object varVisitNo)
        {
            string tmp = ""; DateTime tmpDate;
            if (!string.IsNullOrEmpty(Convert.ToString(varDate)))
            {
                tmpDate = Convert.ToDateTime(varDate);
                tmp = tmpDate.Year.ToString() + "-" + tmpDate.Month.ToString() + "-" + tmpDate.Day.ToString();
                tmp += " (" + varVisitType.ToString().Trim() + "-" + varVisitNo.ToString() + ")";
            }
            return tmp;
        }
        public string ReturnForm_Name(object varStatus, object varFormName, object varDr)
        {
            string tmp = "";
            tmp = varStatus.ToString() + "_" + varFormName.ToString() + " " + varDr.ToString();
            return tmp;
        }

        //public string Return_URL(object varModelID)
        //{
        //    string tmp = "";string apiURL = "api/emr/get-api/" + varModelID;
        //    string _jsonData = WebHelpers.GetAPI(apiURL);

        //    if (_jsonData != null)
        //    {
        //        dynamic data = JObject.Parse(_jsonData);                
        //        tmp = "../" + data.url + "?pid=" + varVisibleID;//"../emr/"+ 
        //    }                
        //    return tmp;
        //}
        public string Return_Doc_URL(object varModelId, object varDocID)
        {
            string tmp = ""; string apiURL = "api/emr/get-api/" + varModelId;
            string _jsonData = WebHelpers.GetAPI(apiURL);

            if (_jsonData != null)
            {
                dynamic data = JObject.Parse(_jsonData);
                tmp = "../" + data.url + "?modelId="+ varModelId + "&docID=" + varDocID + "&pId=" + varPID + "&pvId=" + varPVId;//"../emr/"+ 
            }

            return tmp;
        }

        public DataTable GetDataTable(string query, string varConn)
        {
            SqlConnection conn = new SqlConnection(varConn);
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
        protected void RadGrid2_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            //string query = "SELECT document_type_rcd, description FROM  emr_document_type ";
            //query += "WHERE (document_type_rcd = N'IMG' OR document_type_rcd = N'LAB') AND (active_flag = 1) ";
            //query += "ORDER BY SORT";
            //if(!string.IsNullOrEmpty(varPID) && !IsPostBack)
            //    RadGrid2.DataSource = GetDataTable(query, ConnStringEMR); 
        }
        protected void RadGrid2_DetailTableDataBind(object source, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {       
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;

            switch (e.DetailTableView.Name)
            {
                case "F1":
                    {
                        string ParentID = varPID;// Convert.ToString(dataItem.GetDataKeyValue("patient_id"));
                        string ParentID1 = Convert.ToString(dataItem.GetDataKeyValue("document_type_rcd"));
                        string apiURL = "api/patient/menu-lab-visit/"+ ParentID;
                        if (ParentID1 == "IMG")
                            apiURL = "api/patient/menu-rad-visit/" + ParentID;
                        string _jsonData = WebHelpers.GetAPI(apiURL);
                        if (!string.IsNullOrEmpty(_jsonData))
                        {                            
                            e.DetailTableView.DataSource = WebHelpers.GetJSONToDataTable(_jsonData);
                        }
                        break;
                    }
            }
        }
        protected void RadGrid3_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (!IsPostBack)
            {
                string _jsonData = WebHelpers.GetAPI("api/patient/document-type-list/" + varPID);

                if (_jsonData != null)
                {
                    RadGrid3.DataSource = WebHelpers.GetJSONToDataTable(_jsonData);
                }
            }
        }
        protected void RadGrid3_DetailTableDataBind(object source, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;

            switch (e.DetailTableView.Name)
            {
                case "F1":
                    {
                        string ParentID1 = Convert.ToString(dataItem.GetDataKeyValue("patient_id")); 
                        string ParentID = Convert.ToString(dataItem.GetDataKeyValue("document_type_rcd"));
                        string apiURL = "api/patient/document-list/" + ParentID1 + "/" + ParentID;
                        string _jsonData = WebHelpers.GetAPI(apiURL);
                        if (!string.IsNullOrEmpty(_jsonData))
                        {                            
                            e.DetailTableView.DataSource = WebHelpers.GetJSONToDataTable(_jsonData);
                        }
                        break;
                    }
            }
        }

        public string GetQuery(bool showDetail, string varID)
        {
            string Get_query = ""; //string query_final = "";

            /*
            string query = "SELECT scnd.visible_patient_id, scnd.person_name_e, scnd.person_name_l, scnd.document_type_rcd,";
            query += "scnd.doc_type_name_e, scnd.doc_type_name_l, scnd.document_type_rcd ";
            query += "FROM (SELECT DISTINCT patv.visible_patient_id, patv.display_patient_id AS patient_id, pfn.list_name_e AS person_name_e, ";
            query += "pfn.list_name_l AS person_name_l, doc.document_id, doc.creation_date, doc.entry_date, doc.document_type_rcd, ";
            query += "dtr.name_e AS doc_type_name_e, dtr.name_l AS doc_type_name_l, doc.description AS document_description, ";
            query += "doc.patient_visit_id, doc.organizational_unit_id AS organizational_unit, hsp.name_e AS hospital_name_e, ";
            query += "hsp.name_l AS hospital_name_l, CASE WHEN dc.document_id IS NULL THEN 0 ELSE 1 END AS related_document_flag ";
            query += "FROM document_nl_view AS doc INNER JOIN ";
            query += "hospital_nl_view AS hsp ON hsp.hospital_code = doc.cust_site_code INNER JOIN ";
            query += "document_type_ref_nl_view AS dtr ON dtr.document_type_rcd = doc.document_type_rcd LEFT JOIN ";
            query += "document_context_nl_view AS dc ON dc.document_id = doc.document_id INNER JOIN ";
            query += "document_version_nl_view AS dv ON dv.document_id = doc.document_id AND dv.version_number = doc.latest_version_number ";
            query += "INNER JOIN document_page_nl_view AS dp ON dp.document_version_id = dv.document_version_id LEFT JOIN ";
            query += "document_scan_info_nl_view AS dsi ON dsi.document_scan_info_id = dp.document_scan_info_id LEFT JOIN ";
            query += "primary_patient_view AS patv ON patv.transaction_patient_id = doc.person_id AND patv.hospital_code = 'AIH' LEFT JOIN ";
            query += "person_formatted_name_iview_nl_view AS pfn ON pfn.person_id = patv.display_patient_id ";            
            query += "WHERE visible_patient_id = '" + varVisibleID + "') as scnd ";
            query += "GROUP BY scnd.visible_patient_id, scnd.person_name_e, scnd.person_name_l, scnd.document_type_rcd, ";
            query += "scnd.doc_type_name_e, scnd.doc_type_name_l, scnd.document_type_rcd ";// --AND ecr.name_e LIKE N'Lab%'
            query += "ORDER BY scnd.doc_type_name_l";
            */
            //Get_query = query;

            return Get_query;
        }
        public string GetQuery_Detail(bool showDetail, string varDocTypeID)
        {
            string Get_query = "";
            
            return Get_query;

        }

        public string ReturnScan_Date(object varDate, object varEvent)
        {
            string tmp = ""; DateTime tmpDate;
            if (!string.IsNullOrEmpty(Convert.ToString(varDate)))
            {
                tmpDate = Convert.ToDateTime(varDate);
                tmp = tmpDate.Year.ToString() + "-" + tmpDate.Month.ToString() + "-" + tmpDate.Day.ToString();
                tmp += " " + varEvent.ToString().Trim();
            }
            return tmp;
        }
        public string Return_OrderURL(object varModelID)
        {           
            string tmp = "labinfor.aspx?pid=" + varPID + "&vid="+ varModelID;

            return tmp;
        }

        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "RowClick" || e.CommandName == "ExpandCollapse")
            {
                bool lastState = e.Item.Expanded;

                if (e.CommandName == "ExpandCollapse")
                {
                    lastState = !lastState;
                }

                CollapseAllRows();
                e.Item.Expanded = !lastState;
            }
        }

        private void CollapseAllRows()
        {
            foreach (GridItem item in RadGrid1.MasterTableView.Items)
            {
                item.Expanded = false;
            }
        }

        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}