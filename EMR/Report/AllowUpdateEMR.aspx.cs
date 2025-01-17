﻿using Newtonsoft.Json;
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
        public bool Export = false;
        int varColor = 0;

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
                    DataTable root = WebHelpers.GetJSONToDataTable(response.Data);
                    DataTable dt = root.Clone();

                    foreach (DataRow row in root.Rows)
                    {
                        string pid = Convert.ToString(row["visible_patient_id"]);
                        if (pid == "900000488" || pid == "900005754") { continue; }
                        dt.Rows.Add(row.ItemArray);
                    }
                    RadGrid1.DataSource = dt;
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
            if (ServicePointManager.SecurityProtocol.HasFlag(SecurityProtocolType.Tls12) == false)
            {
                ServicePointManager.SecurityProtocol = ServicePointManager.SecurityProtocol | SecurityProtocolType.Tls12;
            }

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
            //Không gửi mail đối với version DEV
            if (WebHelpers.IsDEVELOP()) return;

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

        protected void ButtonExport_Click(object sender, System.EventArgs e)
        {
            //Export = true;
            GridTableView view = RadGrid1.MasterTableView;  //Top-level view  
            string ExportExcel = ((LinkButton)sender).ID;
            if (ExportExcel == "ExportGroup")
            {
                //Export_Group = true;
                RadGrid1.MasterTableView.HierarchyDefaultExpanded = false;
            }
            if (ExportExcel == "ExportDetail")
            {
                //ExportAll = true;
                //ExpandGridTableView(this.RadGrid1.MasterTableView, true);
                RadGrid1.MasterTableView.HierarchyDefaultExpanded = true;
            }
            RadGrid1.MasterTableView.AllowFilteringByColumn = false;
            RadGrid1.ExportSettings.ExportOnlyData = true;
            RadGrid1.ExportSettings.IgnorePaging = true;
            RadGrid1.ExportSettings.OpenInNewWindow = true;
            string gridcaption = "<b style='color: blue; text-align: left; font-size:20'>Danh Sách Yêu Cầu Bổ Sung Hồ Sơ Bệnh Án</b>";
            //if (!string.IsNullOrEmpty(To_Date))
            //    gridcaption += "<BR/>" + "<b>From date: </b>" + String.Format("{0:dd/MMM/yyyy}", FromDate.SelectedDate) + "<b> to:</b>" + String.Format("{0:dd/MMM/yyyy}", ToDate.SelectedDate);
            //else
            //    gridcaption += "<BR/>" + "<b>From date: </b>" + String.Format("{0:dd/MMM/yyyy}", FromDate.SelectedDate) + "<b> to:</b>" + String.Format("{0:dd/MMM/yyyy}", DateTime.Today.Date);
            //gridcaption += "<BR/>" + "<b> Shit name: " + Shift_Name + " </b>";
            RadGrid1.MasterTableView.Caption = gridcaption;
            RadGrid1.MasterTableView.ExportToExcel();
        }

        protected void RadGrid1_DataBound(object sender, EventArgs e)
        {
            if (Export)
            {
                foreach (GridHeaderItem headercha in RadGrid1.MasterTableView.GetItems(GridItemType.Header))
                {
                    headercha.BackColor = System.Drawing.Color.LightBlue;
                }
                LoopHierarchyRecursive(RadGrid1.MasterTableView, 0);
            }
        }

        protected void LoopHierarchyRecursive(GridTableView gridTableView, int i)
        {
            foreach (GridNestedViewItem nestedViewItem in gridTableView.GetItems(GridItemType.NestedView))
            {
                // you should skip the items if not expanded, or tables not bound
                if (nestedViewItem.NestedTableViews.Length > 0)
                {
                    // now you can access: nestedViewItem.NestedTableViews[0].Items, which will be the DataItems of this nested table
                    // then make recursive call
                    foreach (GridDataItem item in gridTableView.Items)
                    {
                        if (i == 0)
                        {
                            //if (!Export_Group)
                            //    item.BackColor = System.Drawing.Color.LightGray;
                        }
                        else if (i == 1)
                            item.BackColor = System.Drawing.Color.LightBlue;
                        item.Font.Bold = true;

                        if (item.Expanded)
                        {
                            foreach (GridTableView childTable in item.ChildItem.NestedTableViews)
                            {
                                foreach (GridHeaderItem headercon in childTable.GetItems(GridItemType.Header))
                                {
                                    headercon.Visible = false;
                                }
                            }
                        }
                    }
                    varColor = varColor + 1;
                    LoopHierarchyRecursive(nestedViewItem.NestedTableViews[0], varColor);
                    // above [0] stands for the first table in the hierarchy, since Telerik RadGrid supports multiple tables at a level
                }
            }
        }
    }
}