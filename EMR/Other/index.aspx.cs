using EMR.Classes;
using EMR.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.Mail;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.Other
{
    public partial class index : System.Web.UI.Page
    {
        public string UserId { get => (string)Session["UserId"]; }
        public string varPID = "";
        public string varVPID { get; set; }
        PatientInfo patientInfo;
        PatientVisitInfo patientVisitInfo;
        SendRequestVm sendRequestVm;
        public string loc { get; set; }
        public string locChanged { get; set; }
        HttpClient client = new HttpClient();
        public bool EMR_ALLOW_DUPLICATE { get; set; } = true;
        protected void Page_Load(object sender, EventArgs e)
        {
            varPID = Request.QueryString["pid"];
            varVPID = Request.QueryString["vpid"];
            loc = (string)Session["company_code"];
            locChanged = (string)Session["const_company_code"];
            if (!IsPostBack)
            {
                LoadPatientInfo();
            }
        }
        protected async Task RunAsync()
        {
            PageSetup PageSetup = null;
            client.BaseAddress = new Uri(WebHelpers.URL);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            HttpResponseMessage response = await client.GetAsync("api/settings/get/" + nameof(EMR_ALLOW_DUPLICATE));
            if (response.IsSuccessStatusCode)
            {
                string data = await response.Content.ReadAsStringAsync();

                JavaScriptSerializer JSserializer = new JavaScriptSerializer();
                dynamic obj = JObject.Parse(data);
                string paramater_value = obj.paramater_value;
                EMR_ALLOW_DUPLICATE = JSserializer.Deserialize<bool>(paramater_value);
            }
        }
        protected void LoadPatientInfo()
        {
            patientInfo = new PatientInfo(varPID);

            lbl_demographics_title.Text = $"{patientInfo.FullName} ({patientInfo.visible_patient_id})";

            lblGender.InnerText = patientInfo.Gender;
            lblAge.InnerText = WebHelpers.FormatDateTime(patientInfo.date_of_birth);
            lblAddress.InnerText = patientInfo.Address;
            lblPhone.InnerText = patientInfo.contact_phone_number;
            lblName.InnerText = patientInfo.Contact;
            lblRelationship.InnerText = patientInfo.relationship_type_rcd;
        }
        #region Encounter History
        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            string apiString = $"api/patient/encounter-history/{loc}/{varPID}";

            dynamic response = WebHelpers.GetAPI(apiString);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                (sender as RadGrid).DataSource = WebHelpers.GetJSONToDataTable(response.Data);
            }
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if(e.Item is GridDataItem)
            {
                GridDataItem item = (e.Item as GridDataItem);
                string pvid = item.GetDataKeyValue("patient_visit_id").ToString();
                
                string visitType = item.GetDataKeyValue("visit_type_group_rcd").ToString();
                string visible_id = Request.QueryString["vpid"];
                string visitCode = "";
                string visitDate = "";

                Label lbVisit_date_time = (Label)item["PatientInfor"].FindControl("lbActual_visit_date_time");
                Label lbVisit_code = (Label)item["PatientInfor"].FindControl("lbVisit_code");
                // Label lbVisit_code = (Label)item["PatientInfor"].FindControl("lbVisit_code");
                visitDate = Convert.ToString(lbVisit_date_time.Text);
                visitCode = Convert.ToString(lbVisit_code.Text);

                switch (e.CommandName)
                {
                    case "addNew":
                        string type = Convert.ToString(item.GetDataKeyValue("visit_type_rcd"));
                        lblVisitDate.Value = WebHelpers.FormatDateTime(lbVisit_date_time.Text, "yyyy-M-dd") + " (" + type.Trim() + "-" + visitCode + ")";
                        AddForm(pvid, visitType, WebHelpers.FormatDateTime(lbVisit_date_time.Text, "dd-MMM-yyyy HH:mm"));
                        break;

                    //case "sendRequest":
                    //    AddFormSend(pvid, visitType, visible_id, visitCode, visitDate);
                    //    RadGrid1.Rebind();
                    //    break;

                    case "sendRequest":
                        sendRequestVm = new SendRequestVm()
                        {
                            pvid = item.GetDataKeyValue("patient_visit_id").ToString(),
                            visible_id = Request.QueryString["vpid"],
                            visitCode = Convert.ToString(lbVisit_code.Text),
                            visitDate = Convert.ToString(lbVisit_date_time.Text),
                            visitType = item.GetDataKeyValue("visit_type_group_rcd").ToString()
                        };

                        sendRequestVmDB.Value = JsonConvert.SerializeObject(sendRequestVm);
                        uplSaveForm.Update();
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "show_window", "setTimeout(()=>{ showWindow(); }, 0);", true);

                        break;
                }
            }
        }
        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                LinkButton btnAction = e.Item.FindControl("btnAddNew") as LinkButton;

                //btnAction.AutoPostBack = true;

                GridDataItem item = (e.Item as GridDataItem);

                string closure_date_time = item.GetDataKeyValue("closure_date_time").ToString();

                string allow_date_time = item.GetDataKeyValue("allow_date_time").ToString();

                string request_date_time = Convert.ToString((item["PatientInfor"].FindControl("lbRequest_date_time") as Label).Text);

                string check_send = Convert.ToString((item["PatientInfor"].FindControl("lbCheckSend") as Label).Text);

                var StatusSMS = item["StatusSMS"].FindControl("CheckRequest");

                if(StatusSMS != null) { ((CheckBox)StatusSMS).Enabled = false; }

                string closed_date_time = Convert.ToString(item.GetDataKeyValue("closed_date_time"));

                //Kiểm tra nếu visit đã đóng
                if (DateTime.TryParse(closure_date_time, out DateTime closure_date_time_parsed))
                {
                    btnAction.Text = "Send";
                    btnAction.CssClass = "btn btn-sm btn-secondary";

                    //Mở tính năng update nếu allow date time có giá trị và closed date time không có giá trị
                    if (!string.IsNullOrEmpty(allow_date_time) && string.IsNullOrEmpty(closed_date_time))
                    {
                        btnAction.CssClass = "btn btn-sm btn-primary";
                        btnAction.Text = "Update";
                        btnAction.Enabled = true;
                    }
                    else if (!string.IsNullOrEmpty(check_send) && check_send.ToLower() == "true" && (string.IsNullOrEmpty(request_date_time) || !string.IsNullOrEmpty(closed_date_time)))
                    {
                        btnAction.CssClass = "btn btn-sm btn-primary";
                        btnAction.CommandName = "sendRequest";
                        //btnAction.AutoPostBack = false;
                        //   btnAction.CssClass += "disabled";
                        btnAction.Enabled = true;
                    }
                    else if (!string.IsNullOrEmpty(request_date_time) & string.IsNullOrEmpty(allow_date_time))
                    {
                        //   btnAction.CommandName = "sendRequest";
                        btnAction.Text = "Pending";
                        btnAction.CssClass += "disabled";
                        btnAction.Enabled = false;
                    }
                    else // if (!string.IsNullOrEmpty(request_date_time) & string.IsNullOrEmpty(allow_date_time))
                    {
                        //   btnAction.CommandName = "sendRequest";
                        btnAction.CssClass += "disabled";
                        btnAction.Enabled = false;
                    }

                    if(btnAction.Text == "Send")
                    {
                        // allow check request checkbox
                        if (StatusSMS != null) { ((CheckBox)StatusSMS).Enabled = true; }
                    }
                }
                else 
                {
                    DateTime visit_date = DateTime.Parse(item.GetDataKeyValue("actual_visit_date_time").ToString());

                    int diff2 = int.Parse((DateTime.Now.Date - visit_date.Date).TotalDays.ToString());

                    if (diff2 > 2) e.Item.BackColor = Color.Red;
                    else if (diff2 == 2) e.Item.BackColor = Color.Yellow;
                }

                // Kiểm tra quyền FullAccess
                // Có thể send request nếu user có quyền FullAccess
                if ((string)Session["access_authorize"] != "FullAccess")
                {
                    btnAction.CssClass = "btn btn-sm btn-secondary";
                    btnAction.Enabled = false;
                    if (StatusSMS != null) { ((CheckBox)StatusSMS).Enabled = false; }
                }
            }
        }
        #endregion
        private void AddForm(string pvid, string visitType, string datetime)
        {
            if(visitType != "OPD") { visitType = "IPD"; }
            string apiStr = "api/emr/list-form/" + pvid + "/" + visitType;

            dynamic response = WebHelpers.GetAPI(apiStr);
            
            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);
                hfdPVID.Value = pvid;

                #region ...
                //ddlDocList.Items.Clear();

                //ListItem item1 = new ListItem();
                //item1.Text = "—— Please select form document ——";
                //item1.Value = "";

                //ddlDocList.Items.Add(item1);

                //foreach (DataRow row in db.Rows)
                //{
                //    item1 = new ListItem();

                //    item1.Value = row.Field<string>("model_id") + "|" + row.Field<string>("url") + "|" + pvid;
                //    item1.Text = row.Field<string>("model_name");

                //    ddlDocList.Items.Add(item1);
                //}
                #endregion

                rddnFormItems.DataSource = db;
                rddnFormItems.DataBind();

                lblVisitDetails.Text = $"<i>Date: { datetime }<br/> Type: { visitType }</i>";

                string script = string.Format("function f(){{ show_window(\"" + nameof(rwndFormDoc) + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "add_form", script, true);

                //WebHelpers.AddJS(Page, "showWindow2();");
                upl_form_document_items.Update();
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), ScriptKey.SHOW_POPUP, "setTimeout(()=> { $('#DocumentList').modal({backdrop: 'static', keyboard: false}); },0);", true);

            }
        }
        public MailAddress MailAddressFrom { get; set; }
        public MailAddress MailAddressTo { get; set; }
        private void AddFormSend(string pvid, string visitType, string visibleID, string visitCode, string visitDate)
        {
            if (ServicePointManager.SecurityProtocol.HasFlag(SecurityProtocolType.Tls12) == false)
            {
                ServicePointManager.SecurityProtocol = ServicePointManager.SecurityProtocol | SecurityProtocolType.Tls12;
            }

            string varToMail = "trang.tranthi@aih.com.vn";
            string[] qc_mail = new string[5];
            string varUserName = Convert.ToString(Session["UserID"]);
            string varFullName = Convert.ToString(Session["UserName"]);
            string varEmail = Convert.ToString(Session["user_email"]);
            
            string varUrl = "http://emr.aih.com.vn/report/AllowUpdateEMR.aspx";

            string apiString = $"api/patient/allow-doc-req/{pvid}/{varUserName}?full_name={varFullName}&email={varEmail}&reason={txtUpdateReason.Text}";

            dynamic response = WebHelpers.PostAPI(apiString);
            //send request success
            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                // Kiểm tra chỉ gửi mail trên production
                if (!WebHelpers.IsDEVELOP())
                {
                    try
                    {
                        //qc_mail[0] = "chung.nguyen@aih.com.vn";
                        //qc_mail[1] = "long.do@aih.com.vn";
                        qc_mail[0] = "phut.phan@aih.com.vn";

                        var objMailForm = new MailAddress("itsystem@aih.com.vn", "itsystem@aih.com.vn");
                        MailAddressFrom = objMailForm;

                        var objMailTo = new MailAddress(varToMail);
                        MailAddressTo = objMailTo;

                        MailMessage objMail = new MailMessage(MailAddressFrom, MailAddressTo);
                        //cc email user đăng nhập nếu tồn tại
                        if (!string.IsNullOrEmpty(varEmail))
                        {
                            objMail.CC.Add(varEmail);
                        }

                        #region Nội dung email
                        //var msg_Body = "Kính gửi phòng KHTH,<br /> <br /> ";
                        //msg_Body += "Kính gửi phòng KTTH cấp quyền cập nhật hồ sơ bệnh án của khách hàng: " + visibleID + ", ngày đến khám: " + visitDate + ", ";
                        var msg_Body = "";
                        msg_Body += "Cập nhật hồ sơ bệnh án của khách hàng: " + visibleID + ", ngày đến khám: " + visitDate + ", ";
                        msg_Body += "visit code: " + visitCode + ", visit type: " + visitType + " <br /> ";

                        msg_Body += "Lý do: " + txtUpdateReason.Text + " <br /> ";

                        //msg_Body += "Vui lòng nhấn đường link phía dưới để xem chi tiết và phê duyệt: <br /> " + varUrl + " <br /> <br /> " + Session["UserName"] + "<br /> ";

                        //objMail.Subject = "Cập nhật Hồ Sơ Bệnh Án: " + Session["UserName"];
                        objMail.Subject = "Yêu cầu cập nhật Hồ Sơ Bệnh Án từ: " + Session["UserName"];
                        objMail.Body = msg_Body;// "Content office 365";
                        objMail.IsBodyHtml = true;

                        objMail.BodyEncoding = System.Text.Encoding.UTF8;
                        //objMail.CC.Add(qc_mail[0]);
                        //objMail.CC.Add(qc_mail[1]);
                        //objMail.CC.Add(qc_mail[2]);
                        #endregion

                        SmtpClient smtpMail = new SmtpClient("smtp.office365.com");
                        smtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
                        smtpMail.EnableSsl = true;// chkEnable.Checked;
                        smtpMail.Port = 25;// Convert.ToInt32(spinPort.EditValue.ToString());
                                           //smtpMail.Credentials = new NetworkCredential(MailAddressFrom.Address, txtPassword.Text);
                        smtpMail.Credentials = new NetworkCredential(MailAddressFrom.Address, "AIH2@18!@");//"AIH2@18!@"
                                                                                                           //if (!string.IsNullOrEmpty(varFr) && !string.IsNullOrEmpty(varToMail))
                        smtpMail.Send(objMail);
                    }
                    catch (Exception ex)
                    {
                        // send mail error
                        Console.WriteLine(ex.Message);
                    }
                }
                //update 17/10/2021 - Tự động approve
                //string apiString1 = $"api/patient/allow-doc-app/{pvid}/{varUserName}?full_name={varFullName}&email={varEmail}";
                string appUserName = "trang.tranthi";
                string appFullname = "";
                string appEmail = "";
                string apiString1 = $"api/patient/allow-doc-app/{pvid}/{appUserName}?full_name={appFullname}&email={appEmail}";
                response = WebHelpers.PostAPI(apiString1);
                // approved success
                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    RadGrid1.Rebind();
                }
            }
        }
        protected void CheckedRequest(object sender, System.EventArgs e)
        {
            SQLAppClass SQL_Class = new SQLAppClass();

            CheckBox chkBox = (sender as CheckBox);
            Panel myPanel = chkBox.Parent as Panel;
            GridDataItem item = myPanel.NamingContainer as GridDataItem;

            string pvid = item.GetDataKeyValue("patient_visit_id").ToString();
            string varCheck = "false";
            if (chkBox.Checked)
                varCheck = "true";
            string apiString = $"api/patient/allow-doc-ckc/{pvid}/{varCheck}";

            dynamic res = WebHelpers.PostAPI(apiString);

            if (res.Status == System.Net.HttpStatusCode.OK)
            {
                RadGrid1.Rebind();
            }
        }
        //protected void btnOpen_Click(object sender, EventArgs e)
        //{

        //    try
        //    {
        //        string selectedItem = Request.Form.Get("ddlDocList");

        //        string[] _params = selectedItem.Split('|');

        //        Response.Redirect("../" + _params[1] + "?docId=" + DataHelpers.varDocID, false);
        //    }
        //    catch (Exception ex)
        //    {
        //        WebHelpers.SendError(Page, ex);
        //    }
        //}
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //RunAsync().GetAwaiter().GetResult();
            //string selectedItem = Request.Form.Get("rwndFormDoc$C$ddlDocList");
            //string[] _params = new string[3];
            //= selectedItem.Split('|');
            string model_url = rddnFormItems.SelectedItem.Attributes["url"].ToString();
            //= _params[1];
            string PVID = hfdPVID.Value;
            //= _params[2];
            string modelID = rddnFormItems.SelectedValue;
            //= _params[0];
            string userName = (string)Session["UserID"];

            patientVisitInfo = new PatientVisitInfo(PVID, loc);

            if (EMR_ALLOW_DUPLICATE)
            {
                AddDocument(modelID, PVID, model_url);
            }
            else
            {
                dynamic document_exists = WebHelpers.GetAPI(string.Format("api/emr/check-document-exists/{0}/{1}/{2}?username={3}", loc, PVID, modelID, userName));

                if (document_exists.Status == System.Net.HttpStatusCode.OK)
                {
                    dynamic response = WebHelpers.GetAPI(string.Format("api/emr/get-api/{0}/{1}", loc, modelID));
                    if (response.Status == System.Net.HttpStatusCode.OK)
                    {
                        dynamic ModelInfo = JObject.Parse(response.Data);

                        dynamic data = JArray.Parse(document_exists.Data);
                        if (data != null && data.Count > 0)
                        {
                            //string script = string.Format("function f(){{openDialog('{0}', {1}, {2}, {3});Sys.Application.remove_load(f);}}Sys.Application.add_load(f);", "RadWindow4", "true", 500, 200);
                            dynamic obj = data[0];
                            rlblFormName.Text = ModelInfo.model_name;
                            hfdFormUrl.Value = $"../{model_url}?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={PVID}&modelId={modelID}&docId={obj.document_id}";
                            
                            string script = string.Format("function f(){{ show_window(\"" + nameof(rwndExistDoc) + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "rwnd_exist_document", script, true);
                            uplExistDoc.Update();
                            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "someKey", script, true);
                            //upl_open_exist_form_document.Update();
                            //Response.Redirect(url, false);
                        }
                        else
                        {
                            AddDocument(modelID, PVID, model_url);
                        }
                    }
                }
            }
        }
        private void AddDocument(string ModelID, string PVID, string model_url)
        {
            dynamic response = WebHelpers.GetAPI(string.Format("api/emr/get-api/{0}/{1}", loc, ModelID));

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                //dynamic response2 = WebHelpers.GetAPI(string.Format("api/emr/get-api/{0}/{1}", DataHelpers._LOCATION, modelID));

                //if (response2.Status == System.Net.HttpStatusCode.OK)
                //{
                dynamic data = JObject.Parse(response.Data);

                string docId = Guid.NewGuid().ToString();

                dynamic response3;

                if (data.api == "scoc")
                {
                    string apiURL = $"api/emr/menu-doc-complex/{loc}/{varPID}";
                    response = WebHelpers.GetAPI(apiURL);

                    DataTable mydataTable;

                    if (response.Status == System.Net.HttpStatusCode.OK)
                    {
                        mydataTable = WebHelpers.GetJSONToDataTable(response.Data);

                        if (mydataTable.Rows.Count > 0)
                        {
                            //string url = $"../{_params[1]}?modelId={modelID}&docId={mydataTable.Rows[0].Field<string>("document_id")}&pId={varPID}&vpId={Request["vpid"]}&pvid={PVID}";
                            string url = $"../{model_url}?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={PVID}&modelId={ModelID}&docId={mydataTable.Rows[0].Field<string>("document_id")}";

                            string script = string.Format("function f(){{ window.parent.reload_complex_document(\"" + url + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "reload_complex_document", script, true);

                            //Response.Redirect(url, false);
                        }
                        else
                        {
                            var objTemp = new
                            {
                                document_id = docId,
                                patient_visit_id = PVID,
                                model_id = ModelID,
                                user_name = UserId,
                                patient_id = varPID,
                                status = DocumentStatus.DRAFT,
                                created_user_id = (string)Session["UserId"],
                                created_name_e = "",
                                created_name_l = "",
                                created_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Now)
                            };

                            response3 = WebHelpers.PostAPI($"api/{data.api}/add/{loc}", objTemp);

                            if (response3.Status == System.Net.HttpStatusCode.OK)
                            {
                                dynamic response4 = WebHelpers.PostAPI($"api/{data.api}/log/{loc}/{docId}");
                                if (response4.Status == System.Net.HttpStatusCode.OK)
                                {
                                    string url = $"../{model_url}?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={PVID}&modelId={ModelID}&docId={docId}";
                                    Response.Redirect(url, false);
                                }
                            }
                        }
                    }
                }
                else
                {
                    var objTemp = new
                    {
                        document_id = docId,
                        patient_visit_id = PVID,
                        model_id = ModelID,
                        user_name = UserId
                    };

                    response3 = WebHelpers.PostAPI($"api/{data.api}/add/{loc}", objTemp);

                    if (response3.Status == System.Net.HttpStatusCode.OK)
                    {
                        dynamic response4 = WebHelpers.PostAPI($"api/{data.api}/log/{loc}/{docId}");
                        if (response4.Status == System.Net.HttpStatusCode.OK)
                        {
                            string url = $"../{model_url}?loc={loc}&pId={varPID}&vpId={varVPID}&pvid={PVID}&modelId={ModelID}&docId={docId}";

                            string ContentUrl = "/";
                            #region ...
                            //var path = Server.MapPath("~/EMR_Doc.xlsx");

                            //ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;

                            //ExcelPackage EXCEL_PACKAGE = new ExcelPackage(new FileInfo(path));

                            //var version = EXCEL_PACKAGE.Workbook.Worksheets["Version"];
                            #endregion
                            switch (loc)
                            {
                                case "AIH":
                                    #region ...
                                    //if (version != null)
                                    //{
                                    //    string version_extension = "";

                                    //    int exrow = 1;

                                    //    while (version.Cells["A" + exrow].Value != null)
                                    //    {
                                    //        if (version.Cells["A" + exrow].Value.ToString() == modelID)
                                    //        {
                                    //            if (version.Cells["B" + exrow].Value != null)
                                    //            {
                                    //                version_extension = version.Cells["B" + exrow].Value.ToString();
                                    //            }
                                    //        }
                                    //        exrow++;
                                    //    }

                                    //    //string a = version.Cells["B2"].Value.ToString();
                                    //    string ModelUrl = data.url;
                                    //    var urlArr = ModelUrl.Split('.');

                                    //    data.url = urlArr[0] + version_extension + "." + urlArr[1];
                                    //}
                                    #endregion
                                    break;
                                case "CLI":
                                    ContentUrl += "DBP/";
                                    break;
                            }

                            url = ContentUrl + $"{data.url}?modelId={ModelID}&docId={docId}&pId={varPID}&vpId={varVPID}&pvid={patientVisitInfo.patient_visit_id}&loc={loc}";

                            if (WebHelpers.CanOpenForm(Page, docId, DocumentStatus.DRAFT, (string)Session["emp_id"], loc, locChanged, (string)Session["access_authorize"]))
                            {
                                string script = string.Format("function f(){{ window.parent.reload_treeview(\"" + url + "\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "reload_treeview", script, true);

                                //Response.Redirect(url);
                            }
                        }
                    }
                }
            }
        }
        protected void RadGridPatientProblem_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            string apiString = $"api/patient/patient-problem/{varPID}";

            dynamic response = WebHelpers.GetAPI(apiString);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                (sender as RadGrid).DataSource = WebHelpers.GetJSONToDataTable(response.Data);
            }
        }
        protected void RadGridAllergy_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            string apiString = $"api/patient/patient-allergy-list/{varPID}";

            dynamic response = WebHelpers.GetAPI(apiString);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                (sender as RadGrid).DataSource = WebHelpers.GetJSONToDataTable(response.Data);
            }
        }
        protected void btnSendRequest_Click(object sender, EventArgs e)
        {
            dynamic sendRequestVm  = JObject.Parse(sendRequestVmDB.Value);
            if(sendRequestVm != null)
            {
                string a = txtUpdateReason.Text;

                string pvid = sendRequestVm.pvid;
                string visitType = sendRequestVm.visitType;
                string visible_id = sendRequestVm.visible_id;
                string visitCode = sendRequestVm.visitCode;
                string visitDate = WebHelpers.FormatDateTime(sendRequestVm.visitDate, "dd-MMM-yyyy HH:mm");

                AddFormSend(pvid, visitType, visible_id, visitCode, visitDate);
                //RadGrid1.Rebind();
            }
        }
        protected void RadDropDownProducts_ItemDataBound(object sender, DropDownListItemEventArgs e)
        {
            string url = (e.Item.DataItem as DataRowView)["url"].ToString();
            e.Item.Attributes.Add("url", url);
            //e.Item.Attributes.Add("url", (e.Item.DataItem as DataRowView)["url"].ToString());
            //e.Item.Attributes.Add("UnitsInStock", (e.Item.DataItem as DataRowView)["UnitsInStock"].ToString());
        }
        #region
        protected void rbtnOpenExistDoc_Click(object sender, EventArgs e)
        {
            string url = hfdFormUrl.Value;
            string script = string.Format("function f(){{ window.parent.reload_treeview(\""+url+"\");Sys.Application.remove_load(f);}}Sys.Application.add_load(f);");
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "reload_treeview", script, true);

            //Response.Redirect(hfdFormUrl.Value, false);
        }
        #endregion
    }
}