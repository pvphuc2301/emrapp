﻿using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.Other
{
    public partial class FormMenu : System.Web.UI.Page
    {
        private dynamic selectedItem;
        private string varPID;
        private string varVPID;
        private string loc;
        private string locChanged;
        private string ConnStringEMR = "";
        PatientVisitInfo patientVisitInfo;


        protected void Page_Load(object sender, EventArgs e)
        {
            loc = (string)Session["company_code"];
            locChanged = (string)Session["const_company_code"];
            varPID = Request.QueryString["pid"];
            varVPID = Request.QueryString["vpid"];

            //[0]: root, [1]: children
            string selectedItemURL = Request.QueryString["item"];
            if(!string.IsNullOrEmpty(selectedItemURL))
                selectedItem = JObject.Parse(selectedItemURL);
            
            ConnClass ConnStr = new ConnClass();

            ConnStringEMR = ConnStr.SQL_EMRConnString;

            if (!IsPostBack)
            {
                //MainContent.ContentUrl = $"index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}";

                LoadRootNodes(RadTreeView1, TreeNodeExpandMode.ServerSideCallBack);
                LoadRootLAB_RAD(RadTreeView2, TreeNodeExpandMode.ServerSideCallBack);
                LoadRootScan(RadTreeView3, TreeNodeExpandMode.ServerSideCallBack);
                LoadRootScan(RadTreeView4, TreeNodeExpandMode.ServerSideCallBack, "/" + (string)Session["company_code"]);

            }

            LeftMenuAccess();
        }
        protected void radGridComplexDoc_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            string apiURL = $"api/emr/menu-doc-complex/{loc}/{varPID}";
            dynamic response = WebHelpers.GetAPI(apiURL);

            DataTable mydataTable;

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                mydataTable = WebHelpers.GetJSONToDataTable(response.Data);

                radGridComplexDoc.DataSource = mydataTable;
            }
        }
        protected void RadTreeView1_NodeExpand(object sender, RadTreeNodeEventArgs e)
        {
            PopulateNodeOnDemand(e, TreeNodeExpandMode.ServerSideCallBack);
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
        public string ReturnForm_Name(object varStatus, object varFormName, object varDr, object varCreatedDateTime)
        {
            string tmp = "";
            tmp = varStatus.ToString() + "_" + varFormName.ToString() + " " + varDr.ToString() + " (" + WebHelpers.ConvertDateTime(varCreatedDateTime.ToString(), out bool isValid, out string datetime).ToString("HH:mm") + ")";
            return tmp;
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
        protected void RadTreeView4_NodeExpand(object sender, RadTreeNodeEventArgs e)
        {
            PopulateScanOnDemand("/" + loc, e, TreeNodeExpandMode.ServerSideCallBack);
        }
        protected void RadTreeView3_NodeExpand(object sender, RadTreeNodeEventArgs e)
        {
            PopulateScanOnDemand("", e, TreeNodeExpandMode.ServerSideCallBack);
        }
        private void PopulateScanOnDemand(string f_code, RadTreeNodeEventArgs e, TreeNodeExpandMode expandMode)
        {
            DataTable data = GetChildScan(f_code, varPID, e.Node.Value);
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
        private DataTable GetChildScan(string f_code, string PatientID, string ParentID)
        {
            string apiURL = $"api/patient/document-list{f_code}/" + PatientID + "/" + ParentID;
            dynamic response = WebHelpers.GetAPI(apiURL);

            DataTable mydataTable = new DataTable();

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                mydataTable = WebHelpers.GetJSONToDataTable(response.Data);
            }
            return mydataTable;
        }
        private DataTable GetChildLabRad(string PatientID, string ParentID)
        {
            //DataHelpers.LoadPatientVisitInfomation(PatientID);

            patientVisitInfo = new PatientVisitInfo(PatientID, loc);

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
        private void PopulateNodeOnDemand(RadTreeNodeEventArgs e, TreeNodeExpandMode expandMode)
        {
            DataTable data = GetChildNodes(e.Node.Value);
            string ParentID = e.Node.Value;

            foreach (DataRow row in data.Rows)
            {
                RadTreeNode node = new RadTreeNode();

                node.Text = ReturnForm_Name(row["status"], row["model_name"], row["created_name_e"], row["created_date_time"]);
                node.Value = row["model_name"].ToString();

                node.Attributes["docId"] = row["document_id"].ToString();
                node.Attributes["modelId"] = row["model_id"].ToString();
                node.Attributes["status"] = row["status"].ToString();
                node.Attributes["model_type_rcd"] = row["model_type_rcd"].ToString();
                node.Attributes["created_name_l"] = row["created_name_l"].ToString();
                node.Attributes["modified_date_time"] = row["modified_date_time"].ToString();
                node.Attributes["modified_name_l"] = row["modified_name_l"].ToString();
                node.Attributes["patient_visit_id"] = ParentID;

                //node.Attributes.Add("data-modified-datetime", row["modified_date_time"].ToString());
                //node.Attributes.Add("data-modified-name", row["modified_name_l"].ToString());
                //node.Attributes.Add("data-title", ReturnForm_Name(row["status"], row["model_name"], row["created_name_e"]));
                //node.Attributes.Add("data-category", "");
                //node.Attributes.Add("data-visit", "");
                //node.Attributes.Add("data-author", row["created_name_e"].ToString());

                node.CssClass = "list-item";

                dynamic temp = new System.Dynamic.ExpandoObject();
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

                #region Update 8/19/2021
                if (selectedItem != null)
                {
                    if (Convert.ToString(selectedItem.item) == node.Text)
                    {
                        node.Selected = true;
                    }
                }
                //if (node.Text == _SELECTED_ITEM.Text)
                //{
                //    node.Selected = true;
                //}
                #endregion

                e.Node.Nodes.Add(node);
            }

            e.Node.Expanded = true;
        }
        protected void radGridComplexDoc_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("selectDoc"))
            {
                string docid = item.GetDataKeyValue("document_id").ToString();
                string modelId = item.GetDataKeyValue("model_id").ToString();
                string status = item.GetDataKeyValue("status").ToString();
                string url = item.GetDataKeyValue("url").ToString();

                if (WebHelpers.CanOpenForm(Page, docid, status, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
                {
                    //MainContent.ContentUrl = $"/{url}?modelId={modelId}&docId={docid}&pId={varPID}&vpId={varVPID}&loc={loc}";

                    //string apiURL = $"api/emr/get-api/{DataHelpers._LOCATION}/{modelId}";

                    //dynamic response = WebHelpers.GetAPI(apiURL);

                    //if (response.Status == System.Net.HttpStatusCode.OK)
                    //{
                    //    dynamic data = JObject.Parse(response.Data);

                    //    //new PatientVisit(e.Node.Attributes["patient_visit_id"]);

                    //    MainContent.ContentUrl = $"/OPD/SumOfComOutpCase.aspx?modelId={modelId}&docId={docid}&pId={varPID}&vpId={varVPID}";

                    //    //return string.Format("/{0}?modelId={1}&docId={2}&pId={3}&vpId={4}", data.url, varModelID, varDocID, varPID, varVPID);
                    //}
                }
            }
        }
        private void LoadRootScan(RadTreeView treeView, TreeNodeExpandMode expandMode, string f_code = "")
        {
            string apiURL = "api/patient/document-type-list" + f_code + "/" + varPID;
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
        private void LoadRootNodes(RadTreeView treeView, TreeNodeExpandMode expandMode)
        {

            string apiURL = $"api/emr/menu-visit/{loc}/{varPID}";
            dynamic response = WebHelpers.GetAPI(apiURL);

            DataTable mydataTable;

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
                    //Edit
                    //if(selectedItem != null)
                    //{
                    //    if(selectedItem.root == node.Text)
                    //    {
                    //        node.Expanded = true;
                    //    }
                    //}
                    //
                    treeView.Nodes.Add(node);
                }
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
        protected void RadTreeView1_NodeClick(object sender, RadTreeNodeEventArgs e)
        {
            if (e.Node.Level != 0)
            {
                string docid = e.Node.Attributes["docId"];
                string modelId = e.Node.Attributes["modelId"];
                string status = e.Node.Attributes["status"];
                string Url = $"index.aspx?pid={varPID}&vpid={varVPID}";

                //string preDocid = (string)Session["docid"];

                if (!string.IsNullOrEmpty(TempDocId.Value))
                {
                    if (TempDocId.Value != docid)
                    {
                        string apiUri = $"api/emr/clear-session/{loc}/{TempDocId.Value}";
                        WebHelpers.PostAPI(apiUri);
                    }
                }

                if (WebHelpers.CanOpenForm(Page, docid, status, (string)Session["emp_id"], loc, (string)Session["access_authorize"]))
                {
                    string apiURL = $"api/emr/get-api/{loc}/{modelId}";

                    dynamic response = WebHelpers.GetAPI(apiURL);

                    if (response.Status == System.Net.HttpStatusCode.OK)
                    {
                        dynamic data = JObject.Parse(response.Data);

                        patientVisitInfo = new PatientVisitInfo(e.Node.Attributes["patient_visit_id"], loc);
                        TempDocId.Value = docid;
                        TempDocName.Value = e.Node.Text;

                        Url = $"/{data.url}?modelId={modelId}&docId={docid}&pId={varPID}&vpId={varVPID}&pvid={patientVisitInfo.patient_visit_id}&loc={loc}";

                        WebHelpers.AddJS(Page, "window.parent.window.document.getElementById('RAD_SPLITTER_PANE_EXT_CONTENT_MainContent').src=\"" + Url + "\"; window.parent.window.document.getElementById('_TRANSACTION').value = '" + e.Node.Text + "'");

                        //MainContent.ContentUrl = $"/{data.url}?modelId={modelId}&docId={docid}&pId={varPID}&vpId={varVPID}&pvid={patientVisitInfo.patient_visit_id}&loc={loc}";

                        //return string.Format("/{0}?modelId={1}&docId={2}&pId={3}&vpId={4}", data.url, varModelID, varDocID, varPID, varVPID);
                    }
                }
                else
                {
                    WebHelpers.AddJS(Page, "window.parent.window.document.getElementById('RAD_SPLITTER_PANE_EXT_CONTENT_MainContent').src=\"" + Url + "\"");
                }
                
            }
        }

        private void LeftMenuAccess()
        {
            WebHelpers.VisibleControl(false, RadTreeView1, RadTreeView2, RadTreeView3, RadTreeView4);
            string get_access = (string)Session["access_authorize"];
            switch (get_access)
            {
                case "FullAccess":
                    WebHelpers.VisibleControl(true, RadTreeView1, RadTreeView2, RadTreeView3, RadTreeView4);
                    break;
                case "View":
                    WebHelpers.VisibleControl(true, RadTreeView1, RadTreeView2, RadTreeView3, RadTreeView4);
                    break;
                case "ScanView":
                    WebHelpers.VisibleControl(true, RadTreeView3, RadTreeView4);
                    break;
                case "CLSView":
                    WebHelpers.VisibleControl(true, RadTreeView2);
                    break;
            }
        }
    }
}