using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Windows.Documents.Flow.Model.Fields;
using System.Net.Mail;
using System.Net;

namespace EMR.Report
{
    public partial class AllowUpdateEMR : System.Web.UI.Page
    {
        public string varPID = "";string UserID = ""; bool active_authorize = false;
        public bool showPopup = false;
        public bool isDraft = false;
        public string docId = "";
        public string ConnStringEMR = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            UserID = (string)Session["UserID"];
            string redirecturl = "../login.aspx?ReturnUrl=";
            redirecturl += Request.ServerVariables["script_name"] + "?";
            redirecturl += Server.UrlEncode(Request.QueryString.ToString());
            if (string.IsNullOrEmpty(UserID))
                Response.Redirect(redirecturl);

            active_authorize = Convert.ToBoolean(Session["active_authorize"]);
        }
        protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                LinkButton btnAllow = e.Item.FindControl("btnAllow") as LinkButton;
                LinkButton btnDeny = e.Item.FindControl("btnDeny") as LinkButton;

                GridDataItem item = (e.Item as GridDataItem);

                string closure_date_time = item["closure_date_time"].Text;
                string allow_date_time = ((GridDataItem)e.Item).GetDataKeyValue("allow_date_time").ToString();

                string request_date_time = Convert.ToString((item["PatientInfor"].FindControl("lbRequest_date_time") as Label).Text);
                string close_date_time = Convert.ToString((item["PatientInfor"].FindControl("lbClosed_date_time") as Label).Text);
                string deny_date_time = Convert.ToString((item["PatientInfor"].FindControl("lbDenied_date_time") as Label).Text);
                string check_send = Convert.ToString((item["PatientInfor"].FindControl("lbCheckSend") as Label).Text);

                //     btnDeny.CssClass = "btn btn-sm btn-secondary waves-effect ";
                //   btnAllow.CssClass = "btn btn-sm btn-secondary waves-effect ";
                if (!string.IsNullOrEmpty(close_date_time))
                {
                    btnAllow.Text = "Closed";
                    btnAllow.CssClass += "btn btn-sm btn-secondary waves-effect ";
                    btnDeny.CssClass += "btn btn-sm btn-secondary waves-effect ";
                    btnAllow.Enabled = false;
                    btnDeny.Enabled = false;
                    btnDeny.Visible = false;
                }
                else if (!string.IsNullOrEmpty(deny_date_time))
                {
                    btnAllow.Text = "Denied";
                    btnDeny.Enabled = false;
                    btnAllow.CssClass += "btn btn-sm btn-secondary waves-effect ";
                    btnDeny.CssClass += "btn btn-sm btn-secondary waves-effect ";
                    btnAllow.Enabled = false;
                    btnDeny.Visible = false;
                }
                else if (!string.IsNullOrEmpty(request_date_time) & string.IsNullOrEmpty(allow_date_time))
                {
                    btnAllow.Enabled = true;
                    btnDeny.Enabled = true;
                }
                else if (!string.IsNullOrEmpty(allow_date_time))
                {                    
                    btnAllow.Text = "Close";
                    btnAllow.CommandName = "sendClose";
                    btnDeny.Text = "Approved";
                    btnDeny.CssClass += "btn btn-sm btn-secondary waves-effect ";
                    btnDeny.Enabled = false;
                    btnDeny.Enabled = false;
                    btnDeny.Visible = false;
                }
                else 
                {
                    btnAllow.CssClass += "btn btn-sm btn-secondary waves-effect ";
                    btnDeny.CssClass += "btn btn-sm btn-secondary waves-effect ";
                    btnAllow.Enabled = false;
                    btnDeny.Enabled = false;
                }
            }
        }
        protected void RadGrid1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            if (active_authorize)
            {
                string apiString = $"api/patient/allow-doc-req-list";

                dynamic response = WebHelpers.GetAPI(apiString);

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    RadGrid1.DataSource = WebHelpers.GetJSONToDataTable(response.Data);
                }
            }
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (e.Item as GridDataItem);
                string pvid = item.GetDataKeyValue("patient_visit_id").ToString();
                string visitType = item.GetDataKeyValue("visit_type_rcd").ToString();
                string visible_id = Convert.ToString(item.GetDataKeyValue("visible_patient_id"));
                string request_full_name = Convert.ToString(item["request_full_name"].Text);
                Label lbVisit_date_time = (Label)item["PatientInfor"].FindControl("lbActual_visit_date_time");
                Label lbVisit_code = (Label)item["PatientInfor"].FindControl("lbVisit_code");
                Label lbRequest_email = (Label)item["PatientInfor"].FindControl("lbRequest_email");
                string visitDate = Convert.ToString(lbVisit_date_time.Text);
                string visitCode = Convert.ToString(lbVisit_code.Text);
                string r_email = "itsystem@aih.com.vn";
                if (!string.IsNullOrEmpty(Convert.ToString(lbRequest_email)))
                    r_email = Convert.ToString(lbRequest_email.Text);
                
                switch (e.CommandName)
                {
                    case "sendAllow":
                        AddFormSend(pvid, visitType, visible_id, visitCode, visitDate, r_email, request_full_name, "Allow");
                        RadGrid1.Rebind();
                        break;
                    case "sendDeny":
                        AddFormSend(pvid, visitType, visible_id, visitCode, visitDate, r_email, request_full_name, "Deny");
                        RadGrid1.Rebind();
                        break;
                    case "sendClose":
                        AddFormSend(pvid, visitType, visible_id, visitCode, visitDate, r_email, request_full_name, "Close");
                        RadGrid1.Rebind();
                        break;
                }
            }
        }
        public MailAddress MailAddressFrom { get; set; }
        public MailAddress MailAddressTo { get; set; }
        private void AddFormSend(string pvid, string visitType, string visibleID, string visitCode, string visitDate, string varTo_Email, string request_full_name, string varRequest)
        {
            string varToMail = varTo_Email;string[] qc_mail = new string[5];// "tuan.cao@aih.com.vn"; 
            string varUserName = Convert.ToString(Session["UserID"]);
            string varFullName = Convert.ToString(Session["UserName"]);
            string varEmail = Convert.ToString(Session["user_email"]);
            string sbj = " đã được chấp thuận.";

            var msg_Body = "Kính gửi Bác,<br /> <br /> ";
            msg_Body += "Phòng KTTH đã cấp quyền cập nhật hồ sơ bệnh án của khách hàng: " + visibleID + ", ngày đến khám: " + visitDate + ", ";
            msg_Body += "visit code: " + visitCode + ", visit type: " + visitType + "<br /> <br /> " + Session["UserName"] + "<br /> ";

            string apiString = $"api/patient/allow-doc-app/{pvid}/{varUserName}?full_name={varFullName}&email={varEmail}";

            if (varRequest == "Deny")
            {
                sbj = " không được chấp thuận.";
                apiString = $"api/patient/allow-doc-den/{pvid}/{varUserName}?full_name={varFullName}&email={varEmail}";

                msg_Body = "Kính gửi Bác,<br /> <br /> ";
                msg_Body += "Phòng KTTH đã từ chối cấp quyền cập nhật hồ sơ bệnh án của khách hàng: " + visibleID + ", ngày đến khám: " + visitDate + ", ";
                msg_Body += "visit code: " + visitCode + ", visit type: " + visitType + "<br /> <br /> " + Session["UserName"] + "<br /> ";
            }
            else if (varRequest == "Close")
            {
                sbj = " đã bị đóng.";
                apiString = $"api/patient/allow-doc-clo/{pvid}/{varUserName}?full_name={varFullName}&email={varEmail}";

                msg_Body = "Kính gửi Bác,<br /> <br /> ";
                msg_Body += "Phòng KTTH đã đóng quyền cập nhật hồ sơ bệnh án của khách hàng: " + visibleID + ", ngày đến khám: " + visitDate + ", ";
                msg_Body += "visit code: " + visitCode + ", visit type: " + visitType + "<br /> <br /> " + Session["UserName"] + "<br /> ";
            }

            dynamic response = WebHelpers.PostAPI(apiString);

            //qc_mail[0] = "chung.nguyen@aih.com.vn";
            //qc_mail[1] = "long.do@aih.com.vn";
            //qc_mail[2] = "phut.phan@aih.com.vn";

            var objMailForm = new MailAddress("itsystem@aih.com.vn", "itsystem@aih.com.vn");
            MailAddressFrom = objMailForm;

            var objMailTo = new MailAddress(varToMail);
            MailAddressTo = objMailTo;

            MailMessage objMail = new MailMessage(MailAddressFrom, MailAddressTo);

            //objMail.Subject = "Yêu cầu cập nhật Hồ Sơ Bệnh Án từ: " + Session["UserName"] + sbj;
            objMail.Subject = "Yêu cầu cập nhật Hồ Sơ Bệnh Án từ: " + request_full_name + sbj;
            
            objMail.Body = msg_Body;// "Content office 365";
            objMail.IsBodyHtml = true;

            objMail.BodyEncoding = System.Text.Encoding.UTF8;
            //objMail.CC.Add(qc_mail[0]);
            //objMail.CC.Add(qc_mail[1]);
            //objMail.CC.Add(qc_mail[2]);

            SmtpClient smtpMail = new SmtpClient("smtp.office365.com");
            smtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpMail.EnableSsl = true;// chkEnable.Checked;
            smtpMail.Port = 25;// Convert.ToInt32(spinPort.EditValue.ToString());
                               //smtpMail.Credentials = new NetworkCredential(MailAddressFrom.Address, txtPassword.Text);
            smtpMail.Credentials = new NetworkCredential(MailAddressFrom.Address, "AIH2@18!@");//"AIH2@18!@"
                                                                                               //if (!string.IsNullOrEmpty(varFr) && !string.IsNullOrEmpty(varToMail))
            if (!string.IsNullOrEmpty(varToMail))
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
    }
}