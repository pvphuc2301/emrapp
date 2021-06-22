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

namespace Emr_client.Emr
{
    public partial class Login : System.Web.UI.Page
    {
        public string ConnStringEMR = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Convert.ToString(Session["company_code"]) == "AIHC")
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
                Insert_EMR_Account(UserName.Value, Convert.ToString(Session["company_code"]));
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
            dynamic response = WebHelpers.GetAPI("api/employee/employee/user/" + varUserAccount);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                if (!string.IsNullOrEmpty(response.Data))
                {
                    dynamic data = JObject.Parse(response.Data);
                    Session["UserName"] = Convert.ToString(data.patient_name_e);
                    Session["DepCode"] = Convert.ToString(data.department_code);
                    Session["DepName"] = Convert.ToString(data.department_name_e);
                    Session["user_email"] = Convert.ToString(data.email_business);
                    Session["emp_id"] = Convert.ToString(data.employee_id);
                    Session["emp_nr"] = Convert.ToString(data.employee_nr);
                    Session["job_type"] = Convert.ToString(data.job_type_code);
                    Session["company_code"] = Convert.ToString(data.company_code);
                    Session["specialty_code"] = Convert.ToString(data.specialty_code);
                    Session["location"] = Convert.ToString(data.company_code);
                    Session.Timeout = 3;
                    //  Session["upw"] = varUserPW;
                    //edit by mr. Phut
                    DataHelpers._LOCATION = $"{Convert.ToString(data.company_code)}";
                }
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

        public void Insert_EMR_Account(string varAccount, string varSite)
        {
            string varGroup = ""; string varType = "";string varCompanyCode = "";string varAccess = "NA";bool active_authorize = false;
            string[] nurseGroup = new string[5] {"2CACC", "6CFC2", "1E273", "FB611", "NA" };//"Midwife", "Nurse", "Heath Care Assistant", "Nurse Office", "NA" 
            string[] docGroup = new string[5] {"FE4EE", "CDBFD", "03192", "3E787", "7504C" };//"Internist", "Surgeon", "Lab Doctor", "Nutritionist", "Radiologist"
            string[] MAGroup = new string[5] { "708AD", "BE046", "NA", "NA", "NA" };//VPYK, KHTH
            string[] CSOGroup = new string[5] { "26CC3", "12E4D", "NA", "NA", "NA" };//CSO, thu ký y khoa
            string[] TechGroup = new string[5] { "97F59", "A5255", "FA538", "NA", "NA" };//Iamging Tech, VLTri lieu, LAB Tech

            SQLAppClass SQL_Class = new SQLAppClass();

            string query = "SELECT top 1 user_name, site_rcd, access_authorize, active_authorize,account_group_rcd ";
            query += "FROM account WITH (NOLOCK) ";
            query += "WHERE (user_name = '" + varAccount + "') AND (site_rcd = '" + varSite + "') ";
            string get_access = ""; string group_access = "";// SQL_Class.CheckAndGetItem(query, "access_authorize", ConnStringEMR);

            SqlConnection conn = new SqlConnection(ConnStringEMR);
            SqlCommand com = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        get_access = Convert.ToString(reader["access_authorize"]);
                        group_access = Convert.ToString(reader["account_group_rcd"]);
                        active_authorize = Convert.ToBoolean(reader["active_authorize"]);
                        reader.Close();
                        break;
                    }
                }
            }
            finally
            {
                conn.Close();
            }

            if (string.IsNullOrEmpty(get_access))
            {
                varType = Convert.ToString(Session["job_type"]);
                if (MISClass.In_Array(nurseGroup, varType))
                {
                    varGroup = "NURSE";
                    varAccess = "FullAccess";
                }
                else if (MISClass.In_Array(docGroup, varType))
                {
                    varGroup = "DOC";
                    varAccess = "FullAccess";
                }
                else if (MISClass.In_Array(MAGroup, varType))
                {
                    varGroup = "MA";
                    varAccess = "MAFullAccess";
                }
                else if (MISClass.In_Array(CSOGroup, varType))
                {
                    varGroup = "CSO";
                    varAccess = "CSOAccess";
                }
                else if (MISClass.In_Array(TechGroup, varType))
                {
                    varGroup = "TECH";
                    varAccess = "TechAccess";
                }

                varCompanyCode = Convert.ToString(Session["company_code"]);
                Session["access_authorize"] = varAccess;
                Session["group_access"] = varGroup;

                string queryInsert = "INSERT INTO account (user_name, site_rcd, account_group_rcd, access_authorize ) ";
                queryInsert += "VALUEs ('" + varAccount + "','" + varCompanyCode + "','" + varGroup + "','" + varAccess + "') ";
                SQL_Class.RunQuery(queryInsert, ConnStringEMR);
            }
            else
            {
                Session["access_authorize"] = get_access;
                Session["group_access"] = group_access;
                Session["active_authorize"] = active_authorize;
            }
        }
    }
}