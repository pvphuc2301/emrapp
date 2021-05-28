using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.Net;

namespace EMR
{
    public partial class formview : System.Web.UI.Page
    {
        public string ConnStringHIS = ""; string ConnStringEMR = "";
        public string org_FileName = ""; string org_Ext = ""; string full_orgFileName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnClass ConnStr = new ConnClass();
            ConnStringHIS = ConnStr.SQL_HISConnString;
            ConnStringEMR = ConnStr.SQL_EMRConnString;

            string doc_pageid = Request.QueryString["dp"];

            if (!string.IsNullOrEmpty(doc_pageid))
                get_org_file(doc_pageid); // Get org_FileName and org_Ext

            full_orgFileName = org_FileName + "." + org_Ext;                               

            string sourceFile = getFolder(Request.QueryString["pf"]);
            string source_Name = System.IO.Path.GetFileName(sourceFile);

            if (org_Ext.ToLower() == "tif")
            {
                filescan.Visible = false;
                viewTIF(sourceFile);
            }
            else if (org_Ext.ToLower() == "pdf")
            {
                filescan.Visible = true;
                viewPDF(sourceFile);
            }
            else
            {
                filescan.Visible = false;
                viewImg(sourceFile);
            }
        }
        public string getFolder(string varFobjID)
        {
            SQLAppClass SQL_Class = new SQLAppClass();
            string get_folder = "";

            string final_query = "SELECT PrimaryServer = dbo.PrimaryServer('" + varFobjID + "')";
            get_folder = SQL_Class.CheckAndGetItem(final_query, "PrimaryServer", ConnStringEMR);

            return get_folder;
        }

        public void get_org_file(string vardocPageID)
        {
            string query = "SELECT top 1 ISNULL(dp.original_file_name,'scan' + CONVERT(NVARCHAR(14), CAST(dp.lu_updated AS TIME))) AS o_name, ";
            query += "dp.file_extension AS o_ext ";
            query += "FROM document_nl_view AS d INNER JOIN document_version_nl_view AS dv ON dv.document_id = d.document_id ";
            query += "AND dv.version_number = d.latest_version_number INNER JOIN document_page_nl_view AS dp ";
            query += "ON dp.document_version_id = dv.document_version_id ";
            query += "WHERE dp.document_page_id = '" + vardocPageID + "' ";

            SqlConnection conn = new SqlConnection(ConnStringHIS);
            SqlCommand com = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = com.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    org_FileName = Convert.ToString(reader["o_name"]);
                    org_Ext = Convert.ToString(reader["o_ext"]);
                }
            }
            finally
            {
                conn.Close();
            }
        }
        protected void viewTIF(string varTIFFile)
        {
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(varTIFFile);//path

            if (buffer != null)
            {
                Response.ContentType = "image/tiff"; //"image/jpg";// 
                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }
        }
        protected void viewPDF(string varPDFFile)
        {
            //  string path = Server.MapPath(varPDFFile);//"Yourpdf.pdf"            
            WebClient client = new WebClient();
            Byte[] buffer = client.DownloadData(varPDFFile);//path

            if (buffer != null)
            {
                Response.ContentType = "application/pdf"; //"image/jpg";// 
                Response.AppendHeader("Content-Disposition", "inline; filename=" + full_orgFileName);
                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }
        }
        public void viewImg(string varImgFile)
        {
            string DefaultImagePath = HttpContext.Current.Server.MapPath("../images/Pic1.jpg");

            //byte[] bytes = (byte[])DefaultImagePath;
            //string b64img = Convert.ToBase64String(bytes);
            //Image1.ImageUrl = "data:image/jpeg;base64," + b64img;

            byte[] imageArray = System.IO.File.ReadAllBytes(varImgFile);//DefaultImagePath
            string base64ImageRepresentation = Convert.ToBase64String(imageArray);
            byte[] bytes = Convert.FromBase64String(base64ImageRepresentation);

            Image1.ImageUrl = "data:image/png;base64," + base64ImageRepresentation;
        }
    }
}