using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace EMR.Other
{
    public partial class index : System.Web.UI.Page
    {
        public string varPID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            varPID = Request.QueryString["pid"];
            if (!IsPostBack)
            {
                LoadPatientInfo();
            }
        }
        public void LoadPatientInfo()
        {
            Patient patient = Patient.Instance();

            lblGender.InnerText = patient.GetGender();
            lblAge.InnerText = WebHelpers.FormatDateTime(patient.date_of_birth);
            lblAddress.InnerText = patient.GetAddress();
            lblPhone.InnerText = patient.contact_phone_number;
            lblName.InnerText = patient.GetFullName();
            lblRelationship.InnerText = patient.relationship_type_rcd;
        }
        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            string apiString = $"api/patient/encounter-history/{DataHelpers._LOCATION}/{varPID}";

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
                        DocumentList.Visible = true;
                        AddForm(pvid, visitType);
                        break;
                    case "sendRequest":
                        AddFormSend(pvid, visitType, visible_id, visitCode, visitDate);
                        RadGrid1.Rebind();
                        break;
                }
            }
        }

        private void AddForm(string pvid, string visitType)
        {
            if(visitType != "OPD") { visitType = "IPD"; }
            string apiStr = "api/emr/list-form/" + pvid + "/" + visitType;

            dynamic response = WebHelpers.GetAPI(apiStr);
            
            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                DataTable db = WebHelpers.GetJSONToDataTable(response.Data);
                ddlDocList.Items.Clear();

                ListItem item1 = new ListItem();
                item1.Text = "—— Please select form document ——";
                item1.Value = "";

                ddlDocList.Items.Add(item1);

                foreach (DataRow row in db.Rows)
                {
                    item1 = new ListItem();

                    item1.Value = row.Field<string>("model_id") + "|" + row.Field<string>("url") + "|" + pvid;
                    item1.Text = row.Field<string>("model_name");

                    ddlDocList.Items.Add(item1);
                }
                lbl_visit_type.Text = db.Rows[0].Field<string>("model_type_rcd");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), ScriptKey.SHOW_POPUP, "setTimeout(()=> { $('#DocumentList').modal({backdrop: 'static', keyboard: false}); },0);", true);

            }
        }

        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                LinkButton btnAction = e.Item.FindControl("btnAddNew") as LinkButton;

                GridDataItem item = (e.Item as GridDataItem);

                string closure_date_time = item["closure_date_time"].Text;
                string allow_date_time = ((GridDataItem)e.Item).GetDataKeyValue("allow_date_time").ToString();

                string request_date_time = Convert.ToString((item["PatientInfor"].FindControl("lbRequest_date_time") as Label).Text);
                string check_send = Convert.ToString((item["PatientInfor"].FindControl("lbCheckSend") as Label).Text);

                //DateTime dateTime;
                if (DateTime.TryParse(closure_date_time, out DateTime dateTime))
                {
                    btnAction.Text = "Send";

                    btnAction.CssClass = "btn btn-sm btn-secondary waves-effect ";
                    if (!string.IsNullOrEmpty(allow_date_time))
                    {
                        btnAction.CssClass = "btn btn-sm btn-primary waves-effect";
                        btnAction.Text = "Update";
                        btnAction.Enabled = true;
                    }
                    else if (!string.IsNullOrEmpty(check_send) && check_send.ToLower() == "true" && string.IsNullOrEmpty(request_date_time))
                    {
                        btnAction.CssClass = "btn btn-sm btn-primary waves-effect";
                        btnAction.CommandName = "sendRequest";
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
                    else// if (!string.IsNullOrEmpty(request_date_time) & string.IsNullOrEmpty(allow_date_time))
                    {
                        //   btnAction.CommandName = "sendRequest";
                        btnAction.CssClass += "disabled";
                        btnAction.Enabled = false;
                    }
                }
                else
                {
                    DateTime visit_date = DateTime.Parse(item["actual_visit_date_time"].Text.ToString());

                    System.TimeSpan diff = DateTime.Now.Subtract(visit_date);
                    System.TimeSpan diff1 = DateTime.Now - visit_date;

                    int diff2 = int.Parse((DateTime.Now.Date - visit_date.Date).TotalDays.ToString());

                    if(diff2 > 2)
                    {
                        e.Item.BackColor = Color.Red;
                    } else if(diff2 == 2)
                    {
                        e.Item.BackColor = Color.Yellow;
                    }
                }

                if ((string)Session["access_authorize"] != "FullAccess") 
                {
                    btnAction.CssClass = "btn btn-sm btn-secondary waves-effect";
                    btnAction.Enabled = false;
                    (item["StatusSMS"].FindControl("CheckRequest") as CheckBox).Enabled = false;
                }
            }
        }
        public MailAddress MailAddressFrom { get; set; }
        public MailAddress MailAddressTo { get; set; }
        private void AddFormSend(string pvid, string visitType, string visibleID, string visitCode, string visitDate)
        {
            string varToMail = "tuan.cao@aih.com.vn"; string[] qc_mail = new string[5];
            string varUserName = Convert.ToString(Session["UserID"]);
            string varFullName = Convert.ToString(Session["UserName"]);
            string varEmail = Convert.ToString(Session["user_email"]);

            string varUrl = "http://mis.aih.com.vn/portal/report/AllowUpdateEMR.aspx";

            string apiString = $"api/patient/allow-doc-req/{pvid}/{varUserName}?full_name={varFullName}&email={varEmail}";

            dynamic response = WebHelpers.PostAPI(apiString);

            qc_mail[0] = "chung.nguyen@aih.com.vn";
            qc_mail[1] = "long.do@aih.com.vn";
            qc_mail[2] = "phut.phan@aih.com.vn";

            var objMailForm = new MailAddress("itsystem@aih.com.vn", "itsystem@aih.com.vn");
            MailAddressFrom = objMailForm;

            var objMailTo = new MailAddress(varToMail);
            MailAddressTo = objMailTo;

            MailMessage objMail = new MailMessage(MailAddressFrom, MailAddressTo);

            var msg_Body = "Kính gửi phòng KHTH,<br /> <br /> ";
            msg_Body += "Kính gửi phòng KTTH cấp quyền cập nhật hồ sơ bệnh án của khách hàng: " + visibleID + ", ngày đến khám: " + visitDate + ", ";
            msg_Body += "visit code: " + visitCode + ", visit type: " + visitType + " < br /> ";
            msg_Body += "Vui lòng nhấn đường link phía dưới để xem chi tiết và phê duyệt: < br /> " + varUrl + "< br /> < br /> " + Session["UserName"] + "<br /> ";

            objMail.Subject = "Yêu cầu cập nhật Hồ Sơ Bệnh Án từ:" + Session["UserName"];
            objMail.Body = msg_Body;// "Content office 365";
            objMail.IsBodyHtml = true;

            objMail.BodyEncoding = System.Text.Encoding.UTF8;
            objMail.CC.Add(qc_mail[0]);
            objMail.CC.Add(qc_mail[1]);
            objMail.CC.Add(qc_mail[2]);

            SmtpClient smtpMail = new SmtpClient("smtp.office365.com");
            smtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpMail.EnableSsl = true;// chkEnable.Checked;
            smtpMail.Port = 25;// Convert.ToInt32(spinPort.EditValue.ToString());
                               //smtpMail.Credentials = new NetworkCredential(MailAddressFrom.Address, txtPassword.Text);
            smtpMail.Credentials = new NetworkCredential(MailAddressFrom.Address, "AIH2@18!@");//"AIH2@18!@"
                                                                                               //if (!string.IsNullOrEmpty(varFr) && !string.IsNullOrEmpty(varToMail))
            smtpMail.Send(objMail);

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

            dynamic response = WebHelpers.PostAPI(apiString);

            RadGrid1.Rebind();
        }
        protected void btnOpen_Click(object sender, EventArgs e)
        {

            try
            {
                string selectedItem = Request.Form.Get("ddlDocList");

                string[] _params = selectedItem.Split('|');

                Response.Redirect("../" + _params[1] + "?docId=" + DataHelpers.varDocId, false);
            }
            catch (Exception ex)
            {
                WebHelpers.SendError(Page, ex);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            string selectedItem = Request.Form.Get("ddlDocList");

                string[] _params = selectedItem.Split('|');

                string PVID = _params[2];
                string modelID = _params[0];
                string userName = (string)Session["UserID"];

            new PatientVisit(PVID);
            //dynamic response = WebHelpers.GetAPI(string.Format("api/emr/check-document-exists/{0}/{1}/{2}", DataHelpers._LOCATION, PVID, modelID));

            dynamic response = WebHelpers.GetAPI(string.Format("api/emr/get-api/{0}/{1}", DataHelpers._LOCATION, modelID));

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    //dynamic response2 = WebHelpers.GetAPI(string.Format("api/emr/get-api/{0}/{1}", DataHelpers._LOCATION, modelID));

                    //if (response2.Status == System.Net.HttpStatusCode.OK)
                    //{
                    dynamic data = JObject.Parse(response.Data);

                    string docId = Guid.NewGuid().ToString();

                    DataHelpers.varDocId = docId;
                    DataHelpers.varModelId = modelID;
                    DataHelpers.varPVId = PVID;

                    dynamic response3;

                    if (data.api == "scoc")
                    {
                        string apiURL = $"api/emr/menu-doc-complex/{DataHelpers._LOCATION}/{varPID}";
                        response = WebHelpers.GetAPI(apiURL);

                        DataTable mydataTable;

                        if (response.Status == System.Net.HttpStatusCode.OK)
                        {
                            mydataTable = WebHelpers.GetJSONToDataTable(response.Data);

                            if (mydataTable.Rows.Count > 0)
                            {

                                string url = $"../{_params[1]}?modelId={modelID}&docId={mydataTable.Rows[0].Field<string>("document_id")}&pId={varPID}&vpId={Request["vpid"]}&pvid={PVID}";

                                Response.Redirect(url, false);
                            }
                            else
                            {

                                var objTemp = new
                                {
                                    document_id = docId,
                                    patient_visit_id = PVID,
                                    model_id = modelID,
                                    user_name = userName,
                                    patient_id = varPID,
                                    status = DocumentStatus.DRAFT,
                                    created_user_id = (string)Session["UserId"],
                                    created_name_e = "",
                                    created_name_l = "",
                                    created_date_time = DataHelpers.ConvertSQLDateTime(DateTime.Now)
                                };
                                
                                response3 = WebHelpers.PostAPI($"api/{data.api}/add/{DataHelpers._LOCATION}", objTemp);

                                if (response3.Status == System.Net.HttpStatusCode.OK)
                                {
                                    dynamic response4 = WebHelpers.PostAPI($"api/{data.api}/log/{DataHelpers._LOCATION}/{docId}");
                                    if (response4.Status == System.Net.HttpStatusCode.OK)
                                    {
                                        string url = $"../{_params[1]}?modelId={modelID}&docId={docId}&pId={varPID}&vpId={Request["vpid"]}&pvid={PVID}";

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
                            model_id = modelID,
                            user_name = userName
                        };

                        response3 = WebHelpers.PostAPI($"api/{data.api}/add/{DataHelpers._LOCATION}", objTemp);

                        if (response3.Status == System.Net.HttpStatusCode.OK)
                        {
                            dynamic response4 = WebHelpers.PostAPI($"api/{data.api}/log/{DataHelpers._LOCATION}/{docId}");
                            if (response4.Status == System.Net.HttpStatusCode.OK)
                            {
                                string url = $"../{_params[1]}?modelId={modelID}&docId={docId}&pId={varPID}&vpId={Request["vpid"]}&pvid={PVID}";

                                if (WebHelpers.CanOpenForm(Page, docId, DocumentStatus.DRAFT, (string)Session["emp_id"], (string)Session["location"]))
                                {
                                    Session["Transaction"] = "Add";
                                    Response.Redirect(url, false);
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

    }
}