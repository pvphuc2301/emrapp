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
using System.Web.UI.HtmlControls;

namespace EMR
{
    public partial class emrinfor : System.Web.UI.Page
    {
        public string ConnStringHIS = ""; public string ConnStringEMR = "";

        public string varPID = ""; public string varVPID = ""; private string orderType = "";
        public string UserID;

        protected void Page_Load(object sender, EventArgs e)
        {
            WebHelpers.CheckSession(this);
            //if (Session["PageOpenEMR"] != null)
            //{
            //    HttpContext current_ss = HttpContext.Current;
            //    HttpContext.Current.Response.Redirect("InvalidAccess.aspx");
            //    // The page is already opened in another tab.
            //}
            //else { Session["PageOpenEMR"] = true; }
            varPID = Request.QueryString["pid"]; // "97052A99-0134-11EB-B34D-D89EF37D444C";//  "C248E0FC-39B6-493F-A197-6CF2A96B37AD";//
            varVPID = Request.QueryString["vbid"]; //"3afc144a-86ca-11eb-9dfe-dca2660bc0a2";// ValueHiddenField.Value;
            //varVisibleID = Request.QueryString["vbid"]; //"900031267";
            //LoadPatientInfomation();
            
            lblUserName.InnerText = UserID;
            //
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;
            ConnStringEMR = ConnStr.SQL_EMRConnString;

            if (!IsPostBack)
            {

                BindLocation();
                
                DataHelpers.LoadPatientInfomation(varPID);

                new Patient(varPID);
                
                DateTime dob;

                DateTime.TryParse(Convert.ToString(DataHelpers.patient.date_of_birth), out dob);

                lblPatientInfo.InnerHtml = "<strong>" + DataHelpers.patient.first_name_e + " " + DataHelpers.patient.last_name_e + " (" + DataHelpers.patient.title_e + ")</strong>, <small>DOB</small> " + dob.ToString("dd/MM/yyyy") + " (" + DataHelpers.CalculateAge(dob) + "y) <small>SEX</small> " + DataHelpers.patient.gender_l + " <small>PID</small> <strong>" + DataHelpers.patient.visible_patient_id + "</strong>";

                MainContent.ContentUrl = string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", varPID, varVPID);

                FetchImage();
            }

            switch (Request["__EVENTTARGET"])
            {
                case "location_Change":
                    DataHelpers._LOCATION = Request["__EVENTARGUMENT"];
                    Response.Redirect(Request.RawUrl);
                    break;
                case "lblURL_click":

                    //MainContent.ContentUrl = Return_Doc_URL( $"../";
                    break;

            }
            if (Request["__EVENTTARGET"] == "")
            {
                DataHelpers._LOCATION = Request["__EVENTARGUMENT"];
                Response.Redirect(Request.RawUrl);
            }
            //if (Convert.ToString(Session["company_code"]) == "AIH")            
        }

        private void BindLocation()
        {

            lbl_location.Text = DataHelpers._LOCATION;
            switch (DataHelpers._LOCATION)
            {
                case "AIH":
                    location_cli.Visible = true;
                    location_aih.Visible = false;
                    break;
                case "CLI":
                    location_cli.Visible = false;
                    location_aih.Visible = true;
                    break;
            }
        }

        protected void FetchImage()
        {
            string apiURL = "api/patient/patient-indicator/" + varPID;
            dynamic response = WebHelpers.GetAPI(apiURL); int i = 0;

            DataTable mydataTable = new DataTable();

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                mydataTable = WebHelpers.GetJSONToDataTable(response.Data);
                foreach (DataRow row in mydataTable.Rows)
                {
                    //byte[] bytes = row.Field<byte[]>("icon_image");// (byte[])row["icon_image"]; //GetDataTable(query, ConnStringHIS).Rows[1]["icon_image"];
                    string base64String = row.Field<string>("icon_image");// Convert.ToBase64String(bytes, 0, bytes.Length);
                    if (i == 0)
                    {
                        Image1.ImageUrl = base64String;
                        Image1.ToolTip = row.Field<string>("name_e");
                        Image1.Visible = true;
                    }
                    else if (i == 1)
                    {
                        Image2.ImageUrl = base64String;
                        Image2.ToolTip = row.Field<string>("name_e");
                        Image2.Visible = true;
                        //       mydataTable.Columns.Add(new DataColumn("ID" + i, typeof(string)));
                    }
                    else if (i == 2)
                    {
                        Image3.ImageUrl = base64String;
                        Image3.ToolTip = row.Field<string>("name_e");
                        Image3.Visible = true;
                    }
                    else if (i == 3)
                    {
                        Image4.ImageUrl = base64String;
                        Image4.ToolTip = row.Field<string>("name_e");
                        Image4.Visible = true;
                    }
                    else if (i == 4)
                    {
                        Image5.ImageUrl = base64String;
                        Image5.ToolTip = row.Field<string>("name_e");
                        Image5.Visible = true;
                    }
                    else if (i == 5)
                    {
                        Image6.ImageUrl = base64String;
                        Image6.ToolTip = row.Field<string>("name_e");
                        Image6.Visible = true;
                    }
                    else if (i == 6)
                    {
                        Image7.ImageUrl = base64String;
                        Image7.ToolTip = row.Field<string>("name_e");
                        Image7.Visible = true;
                    }
                    else if (i == 7)
                    {
                        Image8.ImageUrl = base64String;
                        Image8.ToolTip = row.Field<string>("name_e");
                        Image8.Visible = true;
                    }
                    else if (i == 8)
                    {
                        Image9.ImageUrl = base64String;
                        Image9.ToolTip = row.Field<string>("name_e");
                        Image9.Visible = true;
                    }
                    else if (i == 9)
                    {
                        Image10.ImageUrl = base64String;
                        Image10.ToolTip = row.Field<string>("name_e");
                        Image10.Visible = true;
                    }
                    i += 1;
                }
            }
        }
        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (!IsPostBack)
            {
                dynamic response = WebHelpers.GetAPI($"api/emr/menu-visit/{DataHelpers._LOCATION}/{varPID}");

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
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

                        DataHelpers.LoadPatientVisitInfomation(ParentID);

                        new PatientVisit(ParentID);

                        dynamic response = WebHelpers.GetAPI($"api/emr/menu-form/{DataHelpers._LOCATION}/{ParentID}");

                        if (response.Status == System.Net.HttpStatusCode.OK)
                        {
                            e.DetailTableView.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                        }
                        break;
                    }
            }
        }

        public void LoadLeftMenu()//object sender, EventArgs e
        {
            string query = "";
            dynamic response = WebHelpers.GetAPI($"api/emr/menu-form/{DataHelpers._LOCATION}/{varPID}");

            if (response.Status == System.Net.HttpStatusCode.OK)
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
        public string Return_Doc_URL(object varModelId, object varDocID, object varPVID)
        {
            string tmp = ""; string apiURL = $"api/emr/get-api/{DataHelpers._LOCATION}/{varModelId}";
            dynamic response = WebHelpers.GetAPI(apiURL);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic data = JObject.Parse(response.Data);
                tmp = $"../{data.url}?modelId={varModelId}&docId={varDocID}&pId={varPID}&vpId={varVPID}&pvid={varPVID}");
            }

            return tmp;
        }

        public DataTable GetDataTable(string query, string varConn)
        {
            //if (Convert.ToString(Session["company_code"]) == "AIH")
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
        }
        protected void RadGrid2_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string query = "SELECT document_type_rcd, document_type_name description FROM document_type ";
            query += "WHERE (document_type_rcd = N'RAD' OR document_type_rcd = N'LAB') ";// AND (active_flag = 1) ";
            query += "ORDER BY document_type_rcd";
            if (!string.IsNullOrEmpty(varPID) && !IsPostBack)
                RadGrid2.DataSource = GetDataTable(query, ConnStringEMR);
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
                        string apiURL = $"api/patient/menu-lab-visit/{DataHelpers._LOCATION}/" + ParentID;
                        if (ParentID1 == "RAD")
                        {
                            apiURL = $"api/patient/menu-rad-visit/{DataHelpers._LOCATION}/" + ParentID;
                            orderType = ParentID1;
                        }
                        dynamic response = WebHelpers.GetAPI(apiURL);
                        if (response.Status == System.Net.HttpStatusCode.OK)
                        {
                            if (!string.IsNullOrEmpty(response.Data))
                            {
                                e.DetailTableView.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                            }
                        }

                        break;
                    }
            }
        }
        protected void RadGrid2_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                if (e.Item is GridDataItem && e.Item.OwnerTableView.Name == "F1")
                {
                    e.Item.BackColor = System.Drawing.Color.White;
                }
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            GridDataItem item1 = ((sender as LinkButton).NamingContainer as GridDataItem);
            GridTableView gridTable = RadGrid2.MasterTableView;

            foreach (GridDataItem item in gridTable.Items)
            {
                if (item.Expanded)
                {
                    foreach (GridTableView childItem in item.ChildItem.NestedTableViews)
                    {
                        childItem.BackColor = System.Drawing.Color.Blue; // set this color as per your skin
                    }
                }
            }

            item1.BackColor = System.Drawing.Color.Red;
        }
        protected void RadGrid3_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (!IsPostBack)
            {
                dynamic response = WebHelpers.GetAPI("api/patient/document-type-list/" + Session["company_code"] + "/" + varPID);

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    RadGrid3.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
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
                        dynamic response = WebHelpers.GetAPI(apiURL);

                        if (response.Status == System.Net.HttpStatusCode.OK)
                        {
                            e.DetailTableView.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                        }
                        break;
                    }
            }
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

        public string Return_OrderURL(object varModelID, object varDate)
        {
            DateTime tmpDate; string tmpD = "";
            if (!string.IsNullOrEmpty(Convert.ToString(varDate)))
            {
                tmpDate = Convert.ToDateTime(varDate);
                tmpD = tmpDate.Year.ToString() + "-" + tmpDate.Month.ToString() + "-" + tmpDate.Day.ToString();
            }
            string tmp = "../report/labtab.aspx?pid=" + varPID + "&vid=" + varModelID + "&frd=" + tmpD;

            if (Convert.ToString(orderType) == "RAD")
            {
                tmp = "../report/ImagingTab.aspx?pid=" + varPID + "&vid=" + varModelID;
               // tmp = "ImagingDiagnosticReporting.aspx?pid=" + varPID + "&vid=" + varModelID;
            }
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

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session["UserID"] = "";
            Response.Redirect("../login.aspx");
        }

        [System.Web.Services.WebMethod]
        public static string lblURL_Click(string varModelId, string varDocID, string varPID, string varVPID)
        {
            string apiURL = $"api/emr/get-api/{DataHelpers._LOCATION}/{varModelId}";
            dynamic response = WebHelpers.GetAPI(apiURL);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic data = JObject.Parse(response.Data);
                return string.Format("/{0}?modelId={1}&docId={2}&pId={3}&vpId={4}", data.url, varModelId, varDocID, varPID, varVPID);
            }

            return null;
        }

        protected void location_Change(string location)
        {
            DataHelpers._LOCATION = location;
        }

        private void CheckUserID()
        {
            UserID = (string)Session["UserID"];
            string redirecturl = "../login.aspx?ReturnUrl=";
            redirecturl += Request.ServerVariables["script_name"] + "?";
            redirecturl += Server.UrlEncode(Request.QueryString.ToString());
            if (string.IsNullOrEmpty(UserID))
                Response.Redirect(redirecturl);
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void location_cli_Click(object sender, EventArgs e)
        {

        }
    }
}