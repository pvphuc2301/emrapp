﻿using Newtonsoft.Json.Linq;
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
using System.Web.SessionState;
using System.Web.Services;

namespace EMR
{
    public partial class emrinfor : System.Web.UI.Page
    {
        public string ConnStringHIS = ""; public string ConnStringEMR = "";

        public string varPID = ""; 
        public string varVPID = ""; 
        public string varPVPID = "";
        private string orderType = "";
        public string UserID;
        PatientInfo patient;
        protected string loc;
        PatientVisitInfo patientVisitInfo;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!WebHelpers.CheckSession(this, "", false)) return;

            loc = (string)Session["company_code"];
            //linkDemographicSearch.HRef = $"~/Other/DemographicSearch.aspx?loc={loc}";
            //if (Session["PageOpenEMR"] != null)
            //{
            //    HttpContext current_ss = HttpContext.Current;
            //    HttpContext.Current.Response.Redirect("InvalidAccess.aspx");
            //    // The page is already opened in another tab.
            //}
            //else { Session["PageOpenEMR"] = true; }
             varPID = Request.QueryString["pid"]; // "97052A99-0134-11EB-B34D-D89EF37D444C";//  "C248E0FC-39B6-493F-A197-6CF2A96B37AD";//
            lblPID.Text = varVPID = Request.QueryString["vbid"]; //"3afc144a-86ca-11eb-9dfe-dca2660bc0a2";// ValueHiddenField.Value;
                                                                 //varVisibleID = Request.QueryString["vbid"]; //"900031267";
                                                                 //LoadPatientInfomation();
            varPVPID = Request.QueryString["pvpid"];

            linkMail.HRef = "../other/sendlogview.aspx?view=mail&pid=" + varPID;
            //
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;
            ConnStringEMR = ConnStr.SQL_EMRConnString;

            if (!IsPostBack)
            {
                PatientSummary.ContentUrl = $"~/Other/PatientSummary.aspx?pid={varPID}&vpid={varVPID}&loc={loc}";
                OrderList.ContentUrl = $"~/Phar/orderlist.aspx?pid={varPID}&vbid={varVPID}";
                OpdPrescription.ContentUrl = $"~/Phar/opdpreslist.aspx?pid={varPID}&vbid={varVPID}&loc={loc}";
                MARPrinting.ContentUrl = $"~/Phar/marprinting.aspx?vbid={varVPID}";
                RxHistory.ContentUrl = $"~/Report/rxHistory.aspx?pid={varPID}";
                //LoadRootNodes(RadTreeView1, TreeNodeExpandMode.ServerSideCallBack);
                //LoadRootLAB_RAD(RadTreeView2, TreeNodeExpandMode.ServerSideCallBack);
                //LoadRootScan(RadTreeView3, TreeNodeExpandMode.ServerSideCallBack);

                BindLocation();
                lblUserName.Text = (string)Session["UserName"];
                
                patient = new PatientInfo(varPID);

                if (Request.QueryString["pvpid"] != null)
                {
                   patientLinked.Visible = true;

                   var response = WebHelpers.GetAPI("api/Patient/select-patient-linked/" + varPID);
                   if (response.Status == System.Net.HttpStatusCode.OK)
                   {
                        foreach (DataRow row in WebHelpers.GetJSONToDataTable(response.Data).Rows)
                        {
                            string vpid = row.Field<string>("visible_patient_id");
                            HtmlGenericControl a = new HtmlGenericControl();
                            //a.Attributes["onclick"] = "__doPostBack('pid_Change', '" + vpid + "')";
                            a.Attributes["class"] = "dropdown-item disabled";
                            a.InnerText = vpid;

                            if(varPVPID == vpid)
                            {
                                a.InnerHtml += " <svg width=\"12\" height=\"12\" aria-hidden=\"true\" focusable=\"false\" data-prefix=\"fas\" data-icon=\"key\" class=\"svg-inline--fa fa-key fa-w-16\" role=\"img\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 512 512\"><path fill=\"currentColor\" d=\"M512 176.001C512 273.203 433.202 352 336 352c-11.22 0-22.19-1.062-32.827-3.069l-24.012 27.014A23.999 23.999 0 0 1 261.223 384H224v40c0 13.255-10.745 24-24 24h-40v40c0 13.255-10.745 24-24 24H24c-13.255 0-24-10.745-24-24v-78.059c0-6.365 2.529-12.47 7.029-16.971l161.802-161.802C163.108 213.814 160 195.271 160 176 160 78.798 238.797.001 335.999 0 433.488-.001 512 78.511 512 176.001zM336 128c0 26.51 21.49 48 48 48s48-21.49 48-48-21.49-48-48-48-48 21.49-48 48z\"></path></svg>";
                            }

                            pidList.Controls.Add(a);
                        }
                    }
                }
                else
                {
                    patientLinked.Visible = false;
                }

                lblPatientInfo.InnerText = $"{patient.FullName} ({patient.Title}), DOB {WebHelpers.FormatDateTime(patient.date_of_birth)} ({patient.GetAge()} y) SEX {patient.Gender} PID {patient.visible_patient_id}";

                //MainContent.ContentUrl = string.Format("../other/patientsummary.aspx?pid={0}&vpid={1}", varPID, varVPID);

                FetchImage();
            }
            
            PostBackEventHandler();
        }

        #region Menu Lab RAD
        private void LoadRootLAB_RAD(RadTreeView treeView, TreeNodeExpandMode expandMode)
        {
            string query = "SELECT document_type_rcd, document_type_name description FROM document_type ";
            query += "WHERE (document_type_rcd = N'RAD' OR document_type_rcd = N'LAB') ";// AND (active_flag = 1) ";
            query += "ORDER BY document_type_rcd";

            string apiURL = $"api/emr/menu-visit/{loc}/{varPID}";
            dynamic response = WebHelpers.GetAPI(apiURL);

            DataTable mydataTable = new DataTable();
            mydataTable = GetDataTable(query, ConnStringEMR);

            //     if (response.Status == System.Net.HttpStatusCode.OK)
            {
                //       mydataTable = WebHelpers.GetJSONToDataTable(response.Data);

                foreach (DataRow row in mydataTable.Rows)
                {
                    RadTreeNode node = new RadTreeNode();
                    node.Text = row["description"].ToString();
                    node.Value = row["document_type_rcd"].ToString();
                    node.ExpandMode = expandMode;
                    node.NavigateUrl = "";// row["visit_code"].ToString();
                    node.Target = "MainContent";
                    treeView.Nodes.Add(node);
                }
            }
        }
        protected void RadTreeView2_NodeExpand(object sender, RadTreeNodeEventArgs e)
        {
            PopulateLabRadOnDemand(e, TreeNodeExpandMode.ServerSideCallBack);
        }
        private void PopulateLabRadOnDemand(RadTreeNodeEventArgs e, TreeNodeExpandMode expandMode)
        {
            DataTable data = GetChildLabRad(varPID, e.Node.Value);// e.Node.Value);
            //string ParentID = e.Node.Value;

            foreach (DataRow row in data.Rows)
            {
                RadTreeNode node = new RadTreeNode();

                node.Text = ReturnScan_Date(row["actual_visit_date_time"], row["caregiver_name_l"]);
                node.Value = e.Node.Value; //varPID;// row["actual_visit_date_time"].ToString();
                node.Attributes["docId"] = row["actual_visit_date_time"].ToString();
                node.Attributes["modelId"] = row["patient_visit_id"].ToString();
                // node.Attributes["status"] = row["status"].ToString();

                //node.Attributes.Add("data-modified-datetime", row["modified_date_time"].ToString());
                //node.Attributes.Add("data-modified-name", row["modified_name_l"].ToString());
                //node.Attributes.Add("data-title", ReturnForm_Name(row["status"], row["model_name"], row["created_name_e"]));
                //node.Attributes.Add("data-category", "");
                //node.Attributes.Add("data-visit", "");
                //node.Attributes.Add("data-author", row["created_name_e"].ToString());

                node.CssClass = "list-item";
                node.NavigateUrl = "javascript:void(0);";
                node.Target = "MainContent";

                e.Node.Nodes.Add(node);
            }

            e.Node.Expanded = true;
        }
        private DataTable GetChildLabRad(string PatientID, string ParentID)
        {
            //DataHelpers.LoadPatientVisitInfomation(PatientID);

            PatientVisitInfo patientVisitInfo = new PatientVisitInfo(ParentID, loc);
            string apiURL = $"api/patient/menu-lab-visit/{loc}/" + PatientID;

            if (ParentID == "RAD")
                apiURL = $"api/patient/menu-rad-visit/{loc}/" + PatientID;

            dynamic response = WebHelpers.GetAPI(apiURL);

            DataTable mydataTable = new DataTable();

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                mydataTable = WebHelpers.GetJSONToDataTable(response.Data);
            }
            return mydataTable;
        }
        protected void RadTreeView2_NodeClick(object sender, RadTreeNodeEventArgs e)
        {
            DateTime tmpDate; string tmpD = "";

            if (e.Node.Level != 0)
            {
                string docid = e.Node.Attributes["docId"];
                string modelId = e.Node.Attributes["modelId"];

                if (!string.IsNullOrEmpty(Convert.ToString(docid)))
                {
                    tmpDate = Convert.ToDateTime(docid);
                    tmpD = string.Format("{0:yyyy-mm-dd}", tmpDate);// tmpDate.Year.ToString() + "-" + tmpDate.Month.ToString() + "-" + tmpDate.Day.ToString();
                }
                string tmp = $"../report/labtab.aspx?pid={varPID}&vid={modelId}&frd={tmpD}";
                string ParentID = e.Node.Value;
                if (ParentID == "RAD")
                    tmp = $"../report/ImagingTab.aspx?pid={varPID}&vid={modelId}";

                //MainContent.ContentUrl = tmp;
            }
            else e.Node.NavigateUrl = "javascript:void(0);";
        }
        #endregion

        #region Menu Scan
        private void LoadRootScan(RadTreeView treeView, TreeNodeExpandMode expandMode)
        {

            string apiURL = "api/patient/document-type-list/" + Session["company_code"] + "/" + varPID;
            dynamic response = WebHelpers.GetAPI(apiURL);

            DataTable mydataTable = new DataTable();

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                mydataTable = WebHelpers.GetJSONToDataTable(response.Data);

                foreach (DataRow row in mydataTable.Rows)
                {
                    RadTreeNode node = new RadTreeNode();
                    node.Text = row["doc_type_name_l"].ToString();
                    node.Value = row["document_type_rcd"].ToString();
                    node.ExpandMode = expandMode;
                    node.NavigateUrl = "";// row["visit_code"].ToString();
                    node.Target = "MainContent";
                    treeView.Nodes.Add(node);
                }
            }
        }
        protected void RadTreeView3_NodeExpand(object sender, RadTreeNodeEventArgs e)
        {
            PopulateScanOnDemand(e, TreeNodeExpandMode.ServerSideCallBack);
        }
        private void PopulateScanOnDemand(RadTreeNodeEventArgs e, TreeNodeExpandMode expandMode)
        {
            DataTable data = GetChildScan(varPID, e.Node.Value);
            string ParentID = e.Node.Value;

            foreach (DataRow row in data.Rows)
            {
                RadTreeNode node = new RadTreeNode();

                node.Text = ReturnScan_Date(row["creation_date_time"], row["event_category_name_l"]);
                node.Value = row["document_type_rcd"].ToString();
                node.Attributes["docId"] = row["file_system_object_id"].ToString();
                node.Attributes["modelId"] = row["document_page_id"].ToString();
                //node.Attributes["status"] = row["status"].ToString();

                node.CssClass = "list-item";

                node.NavigateUrl = "javascript:void(0);";
                node.Target = "MainContent";

                e.Node.Nodes.Add(node);
            }

            e.Node.Expanded = true;
        }
        private DataTable GetChildScan(string PatientID, string ParentID)
        {
            string apiURL = $"api/patient/document-list/{loc}/" + PatientID + "/" + ParentID;
            dynamic response = WebHelpers.GetAPI(apiURL);

            DataTable mydataTable = new DataTable();

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                mydataTable = WebHelpers.GetJSONToDataTable(response.Data);
            }
            return mydataTable;
        }
        protected void RadTreeView3_NodeClick(object sender, RadTreeNodeEventArgs e)
        {
            if (e.Node.Level != 0)
            {
                string docid = e.Node.Attributes["docId"];
                string modelId = e.Node.Attributes["modelId"];

                //     if (WebHelpers.CanOpenForm(Page, docid, status, (string)Session["emp_id"], loc))
                {
                    string apiURL = $"../emr/emrview.aspx?pf={docid}&dp={modelId}&action=view";
                    //MainContent.ContentUrl = apiURL;

                }
            }
            else e.Node.NavigateUrl = "javascript:void(0);";
        }
        #endregion

        private void LoadRootNodes(RadTreeView treeView, TreeNodeExpandMode expandMode)
        {

            string apiURL = $"api/emr/menu-visit/{loc}/{varPID}";
            dynamic response = WebHelpers.GetAPI(apiURL);

            DataTable mydataTable = new DataTable();

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                mydataTable = WebHelpers.GetJSONToDataTable(response.Data);

                foreach (DataRow row in mydataTable.Rows)
                {
                    RadTreeNode node = new RadTreeNode();
                    node.Text = ReturnVisit_Date(row["actual_visit_date_time"], row["visit_type"], row["visit_code"]);
                    node.Value = row["patient_visit_id"].ToString();
                    node.ExpandMode = expandMode;
                    node.NavigateUrl = "";// row["visit_code"].ToString();
                    node.Target = "MainContent";
                    treeView.Nodes.Add(node);
                }
            }
        }

        protected void RadTreeView1_NodeExpand(object sender, RadTreeNodeEventArgs e)
        {
            PopulateNodeOnDemand(e, TreeNodeExpandMode.ServerSideCallBack);
        }

        private void PopulateNodeOnDemand(RadTreeNodeEventArgs e, TreeNodeExpandMode expandMode)
        {
            DataTable data = GetChildNodes(e.Node.Value);
            string ParentID = e.Node.Value;

            foreach (DataRow row in data.Rows)
            {
                RadTreeNode node = new RadTreeNode();

                node.Text = ReturnForm_Name(row["status"], row["model_name"], row["created_name_e"]);
                node.Value = row["model_name"].ToString();
                node.Attributes["docId"] = row["document_id"].ToString();
                node.Attributes["modelId"] = row["model_id"].ToString();
                node.Attributes["status"] = row["status"].ToString();

                //node.Attributes.Add("data-modified-datetime", row["modified_date_time"].ToString());
                //node.Attributes.Add("data-modified-name", row["modified_name_l"].ToString());
                //node.Attributes.Add("data-title", ReturnForm_Name(row["status"], row["model_name"], row["created_name_e"]));
                //node.Attributes.Add("data-category", "");
                //node.Attributes.Add("data-visit", "");
                //node.Attributes.Add("data-author", row["created_name_e"].ToString());

                node.CssClass = "list-item";
                
                dynamic temp = new  System.Dynamic.ExpandoObject();
                temp.modelId = row["model_id"].ToString();
                temp.docId = row["document_id"].ToString();
                temp.pid = varPID;
                temp.status = row["status"].ToString();
                temp.vpid = varPID;

                //node.Attributes.Add("onclick", "lblURL_click(__doPostBack('lblURL_click','" + JsonConvert.SerializeObject(temp) + "'))");

                //if (Convert.ToInt32(row["ChildrenCount"]) > 0)
                //{
                //    node.ExpandMode = expandMode;
                //}
                //   node.NavigateUrl = row["URL"].ToString() + "?id=" + ParentID;// row["CategoryID"].ToString();
                node.NavigateUrl = "javascript:void(0);";
                //node.NavigateUrl = Return_Doc_URL(row["model_id"], row["document_id"], row["patient_visit_id"]);// '// row["model_name"].ToString();
                node.Target = "MainContent";

                e.Node.Nodes.Add(node);
            }

            e.Node.Expanded = true;
        }
        private DataTable GetChildNodes(string ParentID)
        {
            //DataHelpers.LoadPatientVisitInfomation(ParentID);
            patientVisitInfo = new PatientVisitInfo(ParentID, loc);
            dynamic response = WebHelpers.GetAPI($"api/emr/menu-form/{loc}/{ParentID}");

            DataTable mydataTable = new DataTable();

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                mydataTable = WebHelpers.GetJSONToDataTable(response.Data);
            }
            return mydataTable;
        }
        
        private void PostBackEventHandler()
        {
            switch (Request["__EVENTTARGET"])
            {
                case "location_Change":
                    //DataHelpers._LOCATION = Request["__EVENTARGUMENT"];
                    Session["company_code"] = Request["__EVENTARGUMENT"];
                    Response.Redirect(Request.RawUrl);
                    break;
                case "lblURL_click":
                    dynamic args = JObject.Parse(Request["__EVENTARGUMENT"]);

                    if (WebHelpers.CanOpenForm(Page, (string)args.varDocID, (string)args.docStatus, (string)Session["emp_id"], loc, loc))
                    {
                        //MainContent.ContentUrl = Return_Doc_URL(args.varModelID, args.varDocID, args.varVPID);
                    }

                    break;
            }
        }

        private void BindLocation()
        {

            lbl_location.Text = loc;
            switch (loc)
            {
                case "AIH":
                    lbl_location.ToolTip = "Bệnh Viện Quốc Tế Mỹ";
                    //location_cli.Visible = true;
                    //location_aih.Visible = false;
                    break;
                case "CLI":
                    lbl_location.ToolTip = "Phòng Khám Điện Biên Phủ";

                    //location_cli.Visible = false;
                    //location_aih.Visible = true;
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
        
        //protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        dynamic response = WebHelpers.GetAPI($"api/emr/menu-visit/{DataHelpers._LOCATION}/{varPID}");

        //        if (response.Status == System.Net.HttpStatusCode.OK)
        //        {
        //            RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
        //        }
        //    }
        //}

        protected void RadGrid1_DetailTableDataBind(object source, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;

            switch (e.DetailTableView.Name)
            {
                case "F1":
                    {
                        string ParentID = Convert.ToString(dataItem.GetDataKeyValue("patient_visit_id"));

                        //DataHelpers.LoadPatientVisitInfomation(ParentID);

                        patientVisitInfo = new PatientVisitInfo(ParentID, loc);

                        dynamic response = WebHelpers.GetAPI($"api/emr/menu-form/{loc}/{ParentID}");

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
            //string query = "";
            dynamic response = WebHelpers.GetAPI($"api/emr/menu-form/{loc}/{varPID}");

            //if (response.Status == System.Net.HttpStatusCode.OK)
            //{
            //    RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(query);
            //}
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

        public string Return_Doc_URL(object varModelID, object varDocID, object varPVID)
        {
            string tmp = ""; string apiURL = $"api/emr/get-api/{loc}/{varModelID}";
            dynamic response = WebHelpers.GetAPI(apiURL);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic data = JObject.Parse(response.Data);
                tmp = $"../{data.url}?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={varPVID}&modelId={varModelID}&docId={varDocID}&pvid={varPVID}";
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
        //protected void RadGrid2_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        //{
        //    string query = "SELECT document_type_rcd, document_type_name description FROM document_type ";
        //    query += "WHERE (document_type_rcd = N'RAD' OR document_type_rcd = N'LAB') ";// AND (active_flag = 1) ";
        //    query += "ORDER BY document_type_rcd";
        //    if (!string.IsNullOrEmpty(varPID) && !IsPostBack)
        //        RadGrid2.DataSource = GetDataTable(query, ConnStringEMR);
        //}

        protected void RadGrid2_DetailTableDataBind(object source, Telerik.Web.UI.GridDetailTableDataBindEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.DetailTableView.ParentItem;

            switch (e.DetailTableView.Name)
            {
                case "F1":
                    {
                        string ParentID = varPID;// Convert.ToString(dataItem.GetDataKeyValue("patient_id"));
                        string ParentID1 = Convert.ToString(dataItem.GetDataKeyValue("document_type_rcd"));
                        string apiURL = $"api/patient/menu-lab-visit/{loc}/" + ParentID;
                        if (ParentID1 == "RAD")
                        {
                            apiURL = $"api/patient/menu-rad-visit/{loc}/" + ParentID;
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
        //protected void LinkButton1_Click(object sender, EventArgs e)
        //{
        //    GridDataItem item1 = ((sender as LinkButton).NamingContainer as GridDataItem);
        //    GridTableView gridTable = RadGrid2.MasterTableView;

        //    foreach (GridDataItem item in gridTable.Items)
        //    {
        //        if (item.Expanded)
        //        {
        //            foreach (GridTableView childItem in item.ChildItem.NestedTableViews)
        //            {
        //                childItem.BackColor = System.Drawing.Color.Blue; // set this color as per your skin
        //            }
        //        }
        //    }

        //    item1.BackColor = System.Drawing.Color.Red;
        //}
        //protected void RadGrid3_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        dynamic response = WebHelpers.GetAPI("api/patient/document-type-list/" + Session["company_code"] + "/" + varPID);

        //        if (response.Status == System.Net.HttpStatusCode.OK)
        //        {
        //            RadGrid3.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
        //        }
        //    }
        //}

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
            //foreach (GridItem item in RadGrid1.MasterTableView.Items)
            //{
            //    item.Expanded = false;
            //}
        }

        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void btnLogout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../login.aspx");
        }

        [System.Web.Services.WebMethod]
        public static string lblURL_Click(string varModelID, string varDocID, string varPID, string varVPID)
        {
            return "";
            //string apiURL = $"api/emr/get-api/{DataHelpers._LOCATION}/{varModelID}";
            //dynamic response = WebHelpers.GetAPI(apiURL);

            //if (response.Status == System.Net.HttpStatusCode.OK)
            //{
            //    dynamic data = JObject.Parse(response.Data);
            //    return string.Format("/{0}?modelId={1}&docId={2}&pId={3}&vpId={4}", data.url, varModelID, varDocID, varPID, varVPID);
            //}

            //return null;
        }

        protected void location_Change(string location)
        {
            //DataHelpers._LOCATION = location;

            Session["company_code"] = location;

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

        protected void location_cli_Click(object sender, EventArgs e)
        {

        }

        protected void btnPatientSummary_Click(object sender, EventArgs e)
        {
            //MainContent.ContentUrl = $"../other/patientsummary.aspx?pid={varPID}&vpid={varVPID}";
        }

        protected void RadTreeView1_NodeClick(object sender, RadTreeNodeEventArgs e)
        {
            if (e.Node.Level != 0)
            {
                string docid = e.Node.Attributes["docId"];
                string modelId = e.Node.Attributes["modelId"];
                string status = e.Node.Attributes["status"];

                if (WebHelpers.CanOpenForm(Page, docid, status, (string)Session["emp_id"], loc, loc))
                {
                    string apiURL = $"api/emr/get-api/{loc}/{modelId}";
                    dynamic response = WebHelpers.GetAPI(apiURL);
                    
                    if (response.Status == System.Net.HttpStatusCode.OK)
                    {
                        dynamic data = JObject.Parse(response.Data);

                        //MainContent.ContentUrl = $"/{data.url}?modelId={modelId}&docId={docid}&pId={varPID}&vpId={varVPID}";

                        //return string.Format("/{0}?modelId={1}&docId={2}&pId={3}&vpId={4}", data.url, varModelID, varDocID, varPID, varVPID);
                    }
                }
            }
        }

        protected void RadTabStrip1_TabClick(object sender, RadTabStripEventArgs e)
        {
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            RadTabStrip1.Tabs[0].Selected = true;
            RadMultiPage1.SelectedIndex = 0;
        }

        protected void LinkDemographicSearch_Click(object sender, EventArgs e)
        {
            string url = $"/emr.aspx";
            Response.Redirect(url);
            //WebHelpers.AddJS(Page, "window.location.href = \"" + url + "\"");
        }
    }
}