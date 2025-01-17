﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Telerik.Web.UI;
using System.Net.Mail;
using System.Net;
using System.IO;

namespace EMR.Other
{
    public partial class sendlogview : System.Web.UI.Page
    {
        public string ConnStringEMR = ""; string varView = "";string User_Name = "";
        public string Fr_Date = ""; string To_Date = ""; string DepName = ""; string Job_Type = "";
        public string UserID = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringEMR = ConnStr.SQL_EMRConnString;
            string pid = Request.QueryString["pid"];
            PatientInfo patientInfo = new PatientInfo(pid);

            UserID = (string)Session["UserID"]; User_Name = (string)Session["UserName"];
            DepName = (string)Session["Dep"];

            Label1.Text = patientInfo.FullName;
            Label2.Text = Label3.Text = Label4.Text = Label5.Text = User_Name;

            string redirecturl = "~/login.aspx?ReturnUrl=";
            redirecturl = redirecturl + Request.ServerVariables["script_name"] + "?";
            redirecturl = redirecturl + Server.UrlEncode(Request.QueryString.ToString());
            // lbUserName.Text = UserName;
            if (string.IsNullOrEmpty(UserID))
            {
                Response.Redirect(redirecturl);
            }
            else
            {
                varView = Request.QueryString["view"];
                if (varView == "mail")
                {
                    RadGrid1.Visible = true;
                    RadGrid2.Visible = false;
                    lblTitle.InnerText = "Send Mail History";
                    btnNewMail.Visible = true;
                    newMail.Visible = false;

                    btnNewSMS.Visible = false;
                    newSMS.Visible = false;
                }
                else if (varView == "sms")
                {
                    RadGrid1.Visible = false;
                    RadGrid2.Visible = true;
                    lblTitle.InnerText = "Send SMS History";
                    btnNewMail.Visible = false;
                    newMail.Visible = false;

                    btnNewSMS.Visible = true;
                    newSMS.Visible = false;
                }
            }
        }
        public DataTable GetDataTable(string query, string varConStr)
        {
            SqlConnection conn = new SqlConnection(varConStr);
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
        protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                foreach (TableCell cell in e.Item.Cells)
                {
                    if (cell.Text == "0" | cell.Text == "0%" | cell.Text == "0.0" | cell.Text == "0.00" | cell.Text == "0.000")
                        cell.Text = String.Empty;
                }
            }
        }
        protected void RadGrid1_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string query = "SELECT * FROM send_mail_log WHERE CREATED_BY = '" + UserID + "' ORDER BY STT DESC ";

            if (Convert.ToString(Session["group_access"]) == "ADM")
                query = "SELECT * FROM send_mail_log ORDER BY STT DESC ";

            RadGrid1.DataSource = GetDataTable(query, ConnStringEMR);
        }
        protected void RadGrid2_NeedDataSource(object source, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            string query = "SELECT * FROM send_sms_log WHERE CREATED_BY = '" + UserID + "' ORDER BY STT DESC ";

            if (Convert.ToString(Session["group_access"]) == "ADM")
                query = "SELECT * FROM send_mail_log ORDER BY STT DESC ";

            RadGrid2.DataSource = GetDataTable(query, ConnStringEMR);
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (varView == "mail")
            {
                btnNewMail.Visible = true;
                newMail.Visible = true;

                btnNewSMS.Visible = false;
                newSMS.Visible = false;
            }
            else if (varView == "sms")
            {
                btnNewMail.Visible = false;
                newMail.Visible = false;

                btnNewSMS.Visible = true;
                newSMS.Visible = true;
            }
        }

        protected void bttn_Send_Click(object sender, EventArgs e)
        {
            if (varView == "mail")
                Send_mail();
            else if (varView == "sms")
                Send_sms();
        }
        public void Send_mail()
        {
            if (ServicePointManager.SecurityProtocol.HasFlag(SecurityProtocolType.Tls12) == false)
            {
                ServicePointManager.SecurityProtocol = ServicePointManager.SecurityProtocol | SecurityProtocolType.Tls12;
            }

            //string varFrom = "itsystem@aih.com.vn";// "tuan.cao@aih.com.vn"; //example:- sourabh9303@gmail.com  
            string varFrom = "bvqtmy@aih.com.vn";
            string varTo = txtTo.Text;
            if (!string.IsNullOrEmpty(varFrom) && !string.IsNullOrEmpty(varTo))
            {
                using (MailMessage mail = new MailMessage(varFrom, varTo))
                {
                    mail.Subject = txtSubject.Text;
                    string signature = "By signing below, I consent to the use of email communication between myself/ " + Label1.Text + " and " + Label2.Text + ".  I recognize that there are risks to its use, and despite " + Label3.Text + "’s best efforts, he/she cannot absolutely guarantee confidentiality.  I understand and accept those risks and the policies for email use outlined in the form.  I further agree to follow these policies and agree that should I fail do so, " + Label4.Text + " may cease to allow me to use email to communicate with him/her.  I also understand that I may withdraw my consent to communicate via email at any time by notifying " + Label5.Text + " in writing.";
                    mail.Body = txtMessage.Text + "<br><br><br>" + signature;
                    if (fileUploader.HasFile)
                    {
                        string fileName = Path.GetFileName(fileUploader.PostedFile.FileName);
                        mail.Attachments.Add(new Attachment(fileUploader.PostedFile.InputStream, fileName));
                    }
                    //mail.IsBodyHtml = false;
                    mail.IsBodyHtml = true;
                    mail.BodyEncoding = System.Text.Encoding.UTF8;
                    SmtpClient smtpMail = new SmtpClient("smtp.office365.com");
                    smtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtpMail.EnableSsl = true;
                    smtpMail.Port = 25;// Convert.ToInt32(spinPort.EditValue.ToString());smtp.Port = 587;gmail
                    //smtpMail.Credentials = new NetworkCredential(varFrom, "AIH2@18!@");// Convert.ToString(Session["upw"])
                    smtpMail.Credentials = new NetworkCredential(varFrom, "P@ssw0rd@");
                    smtpMail.Send(mail);
                    save_log(varFrom, varTo, txtSubject.Text, txtMessage.Text, "mail");
                    RadGrid1.Rebind();
                    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Message has been sent successfully.');", true);
                }
            }
            else
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please input email address to send.');", true);
        }

        private const string URLPro = "http://cloudsms.vietguys.biz:8088/api/";
        private string username = "aih"; string password = "4zt6h"; string sms = "";
        private string sms_from = "BVQT MY"; string varPhone = "0903718817";

        public void Send_sms()
        {
            sms = sms_body.Text;
            varPhone = sms_to.Text;

            string urlSend = URLPro + "?u=" + username + "&pwd=" + password + "&from=" + sms_from + "&phone=" + varPhone + "&sms=" + sms;//item
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(urlSend);
            request.Method = "GET";

            try
            {
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    // got response
                    using (Stream responseStream = response.GetResponseStream())
                    {
                        StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                        String Responsed = reader.ReadToEnd();
                        save_log(User_Name, varPhone, "", sms, "SMS");
                        RadGrid2.Rebind();
                    }
                }
            }
            catch (WebException ex)
            {
                WebResponse errorResponse = ex.Response;
                using (Stream responseStream = errorResponse.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(responseStream, System.Text.Encoding.UTF8);
                    String errorText = reader.ReadToEnd();
                }
                throw;
            }
        }
        public void save_log(string varFrom, string varTo, string varSbj, string varBody, string varType)
        {
            SQLAppClass SQL_Class = new SQLAppClass();
           
            string query = "INSERT INTO send_mail_log (mail_subject, mail_body, mail_from_name, mail_from, mail_to, CREATED_BY) ";
            query += "VALUES (N'" + varSbj + "', N'" + varBody + "', N'" + User_Name + "',N'" + varFrom + "',N'" + varTo + "', N'" + UserID + "') ";

            if (varType == "SMS")
            {
                query = "INSERT INTO send_sms_log (sms_body, sms_from_name, sms_from, sms_to, CREATED_BY) ";
                query += "VALUES (N'" + varBody + "', N'" + User_Name + "',N'" + varFrom + "',N'" + varTo + "', N'" + UserID + "') ";
            }

            SQL_Class.RunQuery(query, ConnStringEMR);
        }
    }
}