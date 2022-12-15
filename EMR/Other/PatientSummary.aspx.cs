using EMR.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using Telerik.Web.UI;
using Telerik.Web.UI.Map;

namespace EMR
{
    public partial class PatientSummary : System.Web.UI.Page
    {
        HttpClient client = new HttpClient();

        public string varPID = "";
        public bool showPopup = false;
        public bool isDraft = false;
        public string docId = "";
        public string varVPID = "";
        public string ConnStringEMR = "";
        PatientVisitInfo patientVisitInfo;
        protected string loc;
        protected string locChanged;
        public string UserId { get => (string)Session["UserId"]; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!WebHelpers.CheckSession(this)) { return; }

            varPID = Request.QueryString["pid"];
            varVPID = Request.QueryString["vpid"];
            loc = (string)Session["company_code"];
            locChanged = (string)Session["const_company_code"];

            ConnClass ConnStr = new ConnClass();

            ConnStringEMR = ConnStr.SQL_EMRConnString;
            //RadPageView1.ContentUrl = "~/phar/orderlist.aspx?pid=" + varPID + "&vbid=" + varVbID;
            //RadPageView3.ContentUrl = "~/phar/opdpreslist.aspx?pid=" + varPID;

            if (!IsPostBack)
            {
                MainContent.ContentUrl = $"index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}";
                
                LoadRootNodes(RadTreeView1, TreeNodeExpandMode.ServerSideCallBack);
                LoadRootLAB_RAD(RadTreeView2, TreeNodeExpandMode.ServerSideCallBack);
                LoadRootScan(RadTreeView3, TreeNodeExpandMode.ServerSideCallBack);
                LoadRootScan(RadTreeView4, TreeNodeExpandMode.ServerSideCallBack, "/" + (string)Session["company_code"]);
            }
            PostBackEvent();
            LeftMenuAccess();
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
        //protected async Task RunAsync(string api, string document_id)
        //{
        //    client.BaseAddress = new Uri(WebHelpers.URL);
        //    client.DefaultRequestHeaders.Accept.Clear();
        //    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

        //    api = "api/emr";
        //    document_id = "fe098a2d-9f76-4da5-9493-3ab67f79b54c";

        //    HttpResponseMessage response = await client.GetAsync($"{api}/get-log-list/{loc}/{document_id}");
        //    if (response.IsSuccessStatusCode)
        //    {
        //        string data = await response.Content.ReadAsStringAsync();
        //        JavaScriptSerializer JSserializer = new JavaScriptSerializer();
        //        dynamic jarr = JArray.Parse(data);

        //        //string paramater_value = obj.paramater_value;

        //    }
        //}
        #region log document
        protected void rgdLogHistory_ItemDataBound(object sender, GridItemEventArgs e)
        {
            //if(e.Item is GridDataItem)
            //{
            //    GridDataItem item = (e.Item as GridDataItem);
            //    //string document_log_id;
            //    //string document_id;

            //    string dl_id = (e.Item.DataItem as DataRowView)[nameof(document_log_id)].ToString();
                
            //    if (dl_id == document_log_id)
            //    {
            //        item.Selected = true;
            //    }
            //}
        }
        protected void rgdLogHistory_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("Open"))
            {
                string doc_log_id = item.GetDataKeyValue("document_log_id").ToString();
                string url = PAGE_URL.Value + $"&docIdLog={doc_log_id}";
                item.Selected = true;
                MainContent.ContentUrl = url;
                Upd.Update();

                string script = string.Format("function f(){{ close_window(\"" + rwndLogHistory.ClientID + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "close_log_history", script, true);
            }
        }
        protected string GetLogUrl(object doc_log_id)
        {
            return PAGE_URL.Value + $"&docIdLog={doc_log_id}";
        }
        protected string GetHistoryName(object status, object created_name, object created_date_time, object modified_name, object modified_date_time, object amend_reason)
        {
            string result = WebHelpers.getLogText(status, created_name, created_date_time, modified_name, modified_date_time, amend_reason);
            return result;
        }
        #endregion
        string document_log_id = "";
        private void SelectDocument(string args)
        {
            NameValueCollection nameValueCollection = HttpUtility.ParseQueryString(args);
            string document_id = nameValueCollection["docId"];
            string patient_visit_id = nameValueCollection["pvid"];

            RadTreeView1.Nodes.Clear();
            LoadRootNodes(RadTreeView1, TreeNodeExpandMode.ServerSideCallBack);

            RadTreeNode rtn1 = RadTreeView1.FindNodeByValue(patient_visit_id);
            PopulateNodeOnDemand(rtn1, TreeNodeExpandMode.ServerSideCallBack);
            var item = RadTreeView1.FindNodeByAttribute("docId", document_id);
            if (item != null)
            {
                item.Selected = true;
                MainContent.ContentUrl = args;
            }
        }
        private void PostBackEvent()
        {
            string target = Request["__EVENTTARGET"];
            string args = Request["__EVENTARGUMENT"];
            string document_id;
            string patient_visit_id;
            string page_url_arg;
            NameValueCollection nameValueCollection;
            string api;

            switch (target)
            {
                case "reload_treeview":
                    SelectDocument(args);
                    break;
                case "document_log":
                    //RunAsync("", args).GetAwaiter().GetResult();
                    page_url_arg = args;
                    nameValueCollection = HttpUtility.ParseQueryString(args);
                    api = nameValueCollection["api"];
                    document_id = nameValueCollection["docId"];
                    document_log_id = nameValueCollection["docId"];

                    string page_url = page_url_arg.Substring(0, page_url_arg.IndexOf("api") - 1);

                    string url = MainContent.ContentUrl;

                    dynamic res = WebHelpers.GetAPI($"{api}/get-log-list/{loc}/{document_id}");
                    DataTable db = new DataTable();
                    
                    if (res.Status == System.Net.HttpStatusCode.OK)
                    {
                        db = WebHelpers.GetJSONToDataTable(res.Data);
                    }
                    WebHelpers.loadRadGridHistoryLog(rgdLogHistory, db, out string signature_date, out string signature_name);
                    //string url = 
                    //PAGE_URL.Value = String.Join("", nameValueCollection.Cast<string>().Select(e => nameValueCollection[e]);
                    PAGE_URL.Value = page_url;
                    break;
                case "complete_document":
                    try
                    {
                        nameValueCollection = HttpUtility.ParseQueryString(args);

                        document_id = nameValueCollection["docId"];
                        patient_visit_id = nameValueCollection["pvid"];

                        RadTreeView1.Nodes.Clear();
                        LoadRootNodes(RadTreeView1, TreeNodeExpandMode.ServerSideCallBack);

                        RadTreeNode rtn1 = RadTreeView1.FindNodeByValue(patient_visit_id);
                        PopulateNodeOnDemand(rtn1, TreeNodeExpandMode.ServerSideCallBack);
                        var item = RadTreeView1.FindNodeByAttribute("docId", document_id);
                        if (item != null)
                        {
                            item.Selected = true;
                            MainContent.ContentUrl = args;
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    break;
                case "delete_document":
                    hfdDeleteDocument.Value = args;
                    break;
                case "block_document":

                    break;
                case "reload_complex_document":
                    try
                    {
                        document_id = args.Substring(args.IndexOf("docId") + 6, 36);
                        radGridComplexDoc.Rebind();
                        var ComplexDocitem = radGridComplexDoc.MasterTableView.FindItemByKeyValue(nameof(document_id), document_id);
                        if (ComplexDocitem != null && WebHelpers.CanOpenForm(Page, document_id, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
                        {
                            ComplexDocitem.Selected = true;
                            MainContent.ContentUrl = args;
                        }
                    }
                    catch(Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    break;

            }
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

                MainContent.ContentUrl = tmp;
            }
            else e.Node.NavigateUrl = "javascript:void(0);";
        }
        #endregion

        #region Menu Scan
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
        protected void RadTreeView3_NodeExpand(object sender, RadTreeNodeEventArgs e)
        {
            PopulateScanOnDemand("",e, TreeNodeExpandMode.ServerSideCallBack);
        }
        private void PopulateScanOnDemand(string f_code,RadTreeNodeEventArgs e, TreeNodeExpandMode expandMode)
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

        protected void RadTreeView3_NodeClick(object sender, RadTreeNodeEventArgs e)
        {
            if (e.Node.Level != 0)
            {
                string docid = e.Node.Attributes["docId"];
                string modelId = e.Node.Attributes["modelId"];

                //     if (WebHelpers.CanOpenForm(Page, docid, status, (string)Session["emp_id"], loc))
                {
                    string apiURL = $"../emr/emrview.aspx?pf={docid}&dp={modelId}&action=view";
                    MainContent.ContentUrl = apiURL;
                }
            }
            else e.Node.NavigateUrl = "javascript:void(0);";
        }
        #endregion

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
        private void PopulateNodeOnDemand(RadTreeNode e, TreeNodeExpandMode expandMode)
        {
            DataTable data = GetChildNodes(e.Value);
            string ParentID = e.Value;

            foreach (DataRow row in data.Rows)
            {
                RadTreeNode node = new RadTreeNode();

                node.Text = ReturnForm_Name(row["status"], row["model_name"], row["created_name_e"], row["created_date_time"]);
                node.Value = row["model_name"].ToString();
                string document_id = row["document_id"].ToString();
                node.Attributes["docId"] = document_id;
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

                e.Nodes.Add(node);
            }

            e.Expanded = true;
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
                string document_id = row["document_id"].ToString();
                node.Attributes["docId"] = document_id;
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

                e.Node.Nodes.Add(node);
            }

            e.Node.Expanded = true;
        }
        protected void RadTreeView1_NodeClick(object sender, RadTreeNodeEventArgs e)
        {
            if (e.Node.Level != 0)
            {
                string docid = e.Node.Attributes["docId"];
                string modelId = e.Node.Attributes["modelId"];
                string status = e.Node.Attributes["status"];

                //string preDocid = (string)Session["docid"];

                if (!string.IsNullOrEmpty(TempDocId.Value))
                {
                    if (TempDocId.Value != docid)
                    {
                        string apiUri = $"api/emr/clear-session/{loc}/{TempDocId.Value}";
                        WebHelpers.PostAPI(apiUri);
                    }
                }

                if (WebHelpers.CanOpenForm(Page, docid, status, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
                {
                    string apiURL = $"api/emr/get-api/{loc}/{modelId}";

                    dynamic response = WebHelpers.GetAPI(apiURL);

                    if (response.Status == System.Net.HttpStatusCode.OK)
                    {
                        dynamic data = JObject.Parse(response.Data);

                        patientVisitInfo = new PatientVisitInfo(e.Node.Attributes["patient_visit_id"], loc);
                        TempDocId.Value = docid;
                        TempDocName.Value = e.Node.Text;

                        string ContentUrl = "/";

                        switch (loc)
                        {
                            case "AIH":

                                break;
                            case "CLI":
                                ContentUrl += "DBP/";
                                break;
                        }

                        MainContent.ContentUrl = ContentUrl + $"{data.url}?modelId={modelId}&docId={docid}&pId={varPID}&vpId={varVPID}&pvid={patientVisitInfo.patient_visit_id}&loc={loc}";

                        //MainContent.ContentUrl = $"/{data.url}?modelId={modelId}&docId={docid}&pId={varPID}&vpId={varVPID}&pvid={patientVisitInfo.patient_visit_id}&loc={loc}";

                        //return string.Format("/{0}?modelId={1}&docId={2}&pId={3}&vpId={4}", data.url, varModelID, varDocID, varPID, varVPID);
                    }
                }
                else
                {
                    MainContent.ContentUrl = $"index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}";
                }
            }
        }

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

                    string NoteText = ReturnVisit_Date(row["actual_visit_date_time"], row["visit_type"], row["visit_code"]);

                    patientVisitInfo = new PatientVisitInfo(Convert.ToString(row["patient_visit_id"]), loc);

                    if (patientVisitInfo.associated_visit_id != Convert.ToString(Guid.Empty))
                    {
                        PatientVisitInfo patientVisitInfo1 = new PatientVisitInfo(patientVisitInfo.associated_visit_id, loc);
                        NoteText = NoteText.Substring(0, NoteText.Length - 1) + "<span style='font-size: 10px'>🔗</span>" + patientVisitInfo1.visit_type + "-" + patientVisitInfo1.visit_code + ")";
                    }

                    node.Text = NoteText;

                    node.Value = row["patient_visit_id"].ToString();
                    node.ExpandMode = expandMode;
                    node.NavigateUrl = "";// row["visit_code"].ToString();
                    node.Target = "MainContent";
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
        #region Complex Document
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
        protected void radGridComplexDoc_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (e.Item as GridDataItem);
            if (e.CommandName.Equals("selectDoc"))
            {
                string docid = item.GetDataKeyValue("document_id").ToString();
                string modelId = item.GetDataKeyValue("model_id").ToString();
                string status = item.GetDataKeyValue("status").ToString();
                string URL = $"index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}";

                if (WebHelpers.CanOpenForm(Page, docid, status, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
                {
                    URL = $"/{Convert.ToString(item.GetDataKeyValue("url"))}?modelId={modelId}&docId={docid}&pId={varPID}&vpId={varVPID}&loc={loc}";
                    
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

                MainContent.ContentUrl = URL;
            }
        }

        #endregion

        protected void btnDeleteDocument_Click(object sender, EventArgs e)
        {
            dynamic obj = JsonConvert.DeserializeObject<dynamic>(hfdDeleteDocument.Value);

            string patient_visit_id = obj.patient_visit_id;
            string api = obj.api;
            string document_id = obj.document_id;
            //dynamic delete_document = JsonConvert.DeserializeObject<dynamic>(hfdDeleteDocument.Value);

            dynamic response = WebHelpers.PostAPI($"api/emr/document-del/{loc}/{UserId}/{document_id}");

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                dynamic response1 = WebHelpers.PostAPI($"{api}/log/{loc}/{document_id}");

                string script = string.Format("function f(){{ delete_document();Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "delete_document", script, true);
                RadTreeView1.Nodes.Clear();
                LoadRootNodes(RadTreeView1, TreeNodeExpandMode.ServerSideCallBack);
                RadTreeNode rtn1 = RadTreeView1.FindNodeByValue(patient_visit_id);
                PopulateNodeOnDemand(rtn1, TreeNodeExpandMode.ServerSideCallBack);

                MainContent.ContentUrl = $"index.aspx?pid={varPID}&vpid={varVPID}&loc={loc}";
                Upd.Update();
            }
        }
    }
}