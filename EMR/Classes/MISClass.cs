using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Telerik.Web.UI;
using System.Drawing;

namespace EMR
{
    public class MISClass
    {
        public static string Left(string param, int length)
        {
            string result = "";
            //start at the index based on the lenght of the sting minus
            //the specified lenght and assign it a variable
            if (!string.IsNullOrEmpty(param)) result = param.Substring(0, length);
            //return the result of the operation
            return result;
        }
        public static string Right(string param, int length)
        {
            string result = "";
            //start at the index based on the lenght of the sting minus
            //the specified lenght and assign it a variable
            if (!string.IsNullOrEmpty(param))
                result = param.Substring(param.Length - length, length);
            //return the result of the operation
            return result;
        }
    }
    class SQLAppClass
    {
        public string GetDepRead(string query, string Field, String ConnString)
        {
            //String ConnString = ConfigurationManager.ConnectionStrings["QLHDConnectionString"].ConnectionString;
            int i = 0;
            string Get_FormRead = "";
            string DepID = "";
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand com = new SqlCommand();//(query, conn);
            com.CommandText = query;
            com.Connection = conn;
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        DepID = Convert.ToString(reader["DepID"]);
                        if (!string.IsNullOrEmpty(DepID))
                        {
                            Get_FormRead = Get_FormRead + Field + " = " + "'" + DepID + "'" + " or ";
                            i = i + 1;
                        }
                    }
                    Get_FormRead = MISClass.Left(Get_FormRead, Get_FormRead.Length - 3);
                }
            }
            finally
            {
                conn.Close();
            }
            return Get_FormRead;
        }
        public string CheckAndGetItem(string query, string Item, String ConnString)
        {
            //String ConnString = ConfigurationManager.ConnectionStrings["QLHDConnectionString"].ConnectionString;
            string ID = "";
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand com = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ID = Convert.ToString(reader[Item]);
                        reader.Close();
                        break;
                    }
                }
            }
            finally
            {
                conn.Close();
            }
            return ID;
        }
        public bool RunQuery(string query, String ConnString)
        {
            bool Success = false;
            //    String ConnString = ConfigurationManager.ConnectionStrings["QLHDConnectionString"].ConnectionString;
            SqlConnection MySqlConnection = new SqlConnection(ConnString);
            SqlCommand SqlCommand = new SqlCommand();
            try
            {
                MySqlConnection.Open();
                SqlCommand.CommandText = query;
                SqlCommand.Connection = MySqlConnection;
                SqlCommand.ExecuteNonQuery();
                Success = true;
            }
            finally //catch (Exception ex)
            {
                MySqlConnection.Close();
                //RadGridPL_U.Controls.Add(new LiteralControl(string.Format("<span style='color:red'>{0}</span>","Unable to delete Contract. Reason: " + ex.Message)));
            }
            return Success;
        }
        public void GetStrArray(string querystr, string MaCode, string[] StrArray, String ConnString)
        {
            int i = 0;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand com = new SqlCommand(querystr, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        StrArray[i] = Convert.ToString(reader[MaCode]);
                        i = i + 1;
                    }
                    reader.Close();
                }
            }
            finally
            {
                conn.Close();
            }
        } //dung trong contractlistall
        public string GetPhaseQuery(string query, string Field, string varField, String ConnString)
        {
            int i = 0;
            string Get_PhaseQuery = "";
            string DepID = "";
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand com = new SqlCommand();//(query, conn);
            com.CommandText = query;
            com.Connection = conn;
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        DepID = Convert.ToString(reader[varField]);
                        if (!string.IsNullOrEmpty(DepID))
                        {
                            Get_PhaseQuery = Get_PhaseQuery + Field + " = " + "'" + DepID + "'" + " or ";
                            i = i + 1;
                        }
                    }
                    Get_PhaseQuery = MISClass.Left(Get_PhaseQuery, Get_PhaseQuery.Length - 3);
                }
            }
            finally
            {
                conn.Close();
            }
            return Get_PhaseQuery;
        }
        public double CheckAndGetDoubleItem(string query, string Item, String ConnString)
        {
            string tmp;
            double ID = 0;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand com = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        tmp = Convert.ToString(reader[Item]);
                        if (!string.IsNullOrEmpty(tmp))
                            ID = Convert.ToDouble(reader[Item]);
                        else
                            ID = 0;
                        reader.Close();
                        break;
                    }
                }
            }
            finally
            {
                conn.Close();
            }
            return ID;
        }
        public int CheckAndGetIntItem(string query, string Item, String ConnString)
        {
            string tmp;
            Int32 ID = 0;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand com = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        tmp = Convert.ToString(reader[Item]);
                        if (!string.IsNullOrEmpty(tmp))
                            ID = Convert.ToInt32(reader[Item]);
                        else
                            ID = 0;
                        reader.Close();
                        break;
                    }
                }
            }
            finally
            {
                conn.Close();
            }
            return ID;
        }
        public string CheckAndGetEmail(string query, string Item, String ConnString)
        {
            //String ConnString = ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            string ID = "";
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand com = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ID = (string)reader[Item];
                        reader.Close();
                        break;
                    }
                }
            }
            finally
            {
                conn.Close();
            }
            return ID;
        }
        public bool CheckAndGetBoolItem(string query, string Item, String ConnString)
        {
            bool ID = false;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand com = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        if (!string.IsNullOrEmpty(Convert.ToString(reader[Item])))
                        {
                            ID = (bool)reader[Item];
                            reader.Close();
                            break;
                        }
                    }
                }
            }
            finally
            {
                conn.Close();
            }
            return ID;
        }
        public void GetListArray(string querystr, string MaCode, string[] ListArray, string ConnString)
        {
            int i = 0;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand com = new SqlCommand(querystr, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ListArray[i] = Convert.ToString(reader[MaCode]);
                        i = i + 1;
                    }
                    reader.Close();
                }
            }
            finally
            {
                conn.Close();
            }
        } //dung trong HR E-Form
        public void Get3ListArray(string querystr, string Ma1, string Ma2, string Ma3, string[] ListArray1, string[] ListArray2, string[] ListArray3, string ConnString)
        {
            int i = 0;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand com = new SqlCommand(querystr, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ListArray1[i] = Convert.ToString(reader[Ma1]);
                        ListArray2[i] = Convert.ToString(reader[Ma2]);
                        ListArray3[i] = Convert.ToString(reader[Ma3]);
                        i = i + 1;
                    }
                    reader.Close();
                }
            }
            finally
            {
                conn.Close();
            }
        } //dung trong HR E-Form
        public string GetMa3So(string query, string sItem, string ConnString)
        {
            //string ConnString = ConfigurationManager.ConnectionStrings["QLHDConnectionString"].ConnectionString;
            string NewMaxSoHD = "001"; int New_MaxSoHD = 0;
            SqlConnection conn = new SqlConnection(ConnString);
            SqlCommand com = new SqlCommand();//(query, conn);
            com.CommandText = query;
            com.Connection = conn;
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        string MaxSoHD = (string)reader[sItem];
                        if (MaxSoHD != null)
                        {
                            New_MaxSoHD = Convert.ToInt16(MaxSoHD);
                            New_MaxSoHD = New_MaxSoHD + 1;
                            if (New_MaxSoHD < 10)
                                NewMaxSoHD = "00" + New_MaxSoHD;
                            else if (New_MaxSoHD >= 10 && New_MaxSoHD < 100)
                                NewMaxSoHD = "0" + New_MaxSoHD;
                            else if (New_MaxSoHD >= 100)
                                NewMaxSoHD = Convert.ToString(New_MaxSoHD);
                        }
                        else
                            NewMaxSoHD = "001";
                        reader.Close();
                        break;
                    }
                }
            }
            finally
            {
                conn.Close();
            }
            return NewMaxSoHD;
        }
    }
}