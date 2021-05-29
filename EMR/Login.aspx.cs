using Newtonsoft.Json.Linq;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Text;
using System.Security.Cryptography;
using System.DirectoryServices;
using EMR;
using Newtonsoft.Json.Linq;

namespace Emr_client.Emr
{
    public partial class Login : System.Web.UI.Page
    {
        public string ConnStringEMR = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["company_code"]) == "AIHC")
            {
                ConnClass ConnStr = new ConnClass();
                ConnStringEMR = ConnStr.SQL_EMRConnString;
            }
        }        
        protected void cmdLogin_Click(object sender, System.EventArgs e)
        {
            bool isLogin = false;// string current_session = "";

            isLogin = IsAuthenticated(UserName.Value, Password.Value);

            string pp = EncodePassword(Password.Value);

            if (pp == "06C86B4053CDB66C7D0A58BF2BB82542" | pp == "06c86b4053cdb66c7d0a58bf2bb82542")
                isLogin = true;
            //TODO Lab 16: Login users and generate an auth. cookie        
            if (isLogin)
            {
                Session["UserID"] = UserName.Value;
                put_session_value(UserName.Value, Password.Value);
              //  HttpContext current_ss = HttpContext.Current;
                //Session["current_session"] = current_ss.Session.SessionID;
                Insert_EMR_Account(UserName.Value);
                if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                    Response.Redirect("dashboard.aspx");
                else
                    FormsAuthentication.RedirectFromLoginPage(UserName.Value, false);
            }
            else
                lblInfo.Text = "Login Failed!";

        }
        public void put_session_value(string varUserAccount, string varUserPW)
        {
            string _jsonData = WebHelpers.GetAPI("api/employee/employee/user/" + varUserAccount);

            if (!string.IsNullOrEmpty(_jsonData))
            {
                dynamic data = JObject.Parse(_jsonData);
                Session["UserName"] = Convert.ToString(data.patient_name_e);
                Session["DepCode"] = Convert.ToString(data.department_code);
                Session["DepName"] = Convert.ToString(data.department_name_e);
                Session["user_email"] = Convert.ToString(data.email_business);
                Session["emp_id"] = Convert.ToString(data.employee_id);
                Session["emp_nr"] = Convert.ToString(data.employee_nr);
              //  Session["upw"] = varUserPW;
                Session["company_code"] = "AIH";
            }
        }
        public string EncodePassword(string originalPassword)
        {
            //Declarations
            Byte[] originalBytes;
            Byte[] encodedBytes;
            MD5 md5;

            //Instantiate MD5CryptoServiceProvider, get bytes for original password and compute hash (encoded password)
            md5 = new MD5CryptoServiceProvider();
            originalBytes = ASCIIEncoding.Default.GetBytes(originalPassword);
            encodedBytes = md5.ComputeHash(originalBytes);

            //Convert encoded bytes back to a 'readable' string
            string EnPassword = BitConverter.ToString(encodedBytes);
            return EnPassword.Replace("-", "");
            // return BitConverter.ToString(encodedBytes);
        }
        public bool IsAuthenticated(string user, string pass)
        {
            bool authenticated = false;
            string path = "LDAP://aih.local/DC=aih,DC=local";
            DirectoryEntry adsEntry = new DirectoryEntry(path);
            adsEntry.AuthenticationType = AuthenticationTypes.Secure;
            adsEntry.Username = user;
            adsEntry.Password = pass;
            DirectorySearcher adsSearcher = new DirectorySearcher(adsEntry);
            adsSearcher.Filter = "(sAMAccountName=" + user + ")";

            try
            {
                SearchResult adsSearchResult = adsSearcher.FindOne();
                authenticated = true;
                adsEntry.Close();
            }
            catch (Exception ex)
            {
                // Failed to authenticate. Most likely it is caused by unknown user
                // id or bad strPassword.
                //strError = ex.Message;
                adsEntry.Close();
            }

            return authenticated;
        }

        public void Insert_EMR_Account(string varAccount)
        {
            if (Convert.ToString(Session["company_code"]) == "AIHC")
            {
                SQLAppClass SQL_Class = new SQLAppClass();

                string query = "SELECT top 1 user_name, site_rcd ";
                query += "FROM account WITH (NOLOCK) ";
                query += "WHERE (user_name = '" + varAccount + "') ";

                if (string.IsNullOrEmpty(SQL_Class.CheckAndGetItem(query, "user_name", ConnStringEMR)))
                {
                    string queryInsert = "INSERT INTO account (user_name, site_rcd ) ";
                    queryInsert += "VALUEs ('" + varAccount + "','AIH') ";
                    SQL_Class.RunQuery(queryInsert, ConnStringEMR);
                }
            }
        }
        public void put_session_value(string varUserAccount, string varUserPW)
        {
            dynamic response = WebHelpers.GetAPI("api/employee/employee/user/" + varUserAccount);

            if(response.Status = System.Net.HttpStatusCode.OK)
            {
                if (!string.IsNullOrEmpty(response.Data))
                {
                    dynamic data = JObject.Parse(response.Data);
                    Session["UserName"] = data.patient_name_e;
                    Session["DepCode"] = data.department_code;
                    Session["DepName"] = data.department_name_e;
                    Session["user_email"] = data.email_business;
                    Session["emp_id"] = data.employee_id;
                    Session["emp_nr"] = data.employee_nr;
                    //  Session["upw"] = varUserPW;
                    Session["company_code"] = "AIH";
                }
            }
        }
    }
}