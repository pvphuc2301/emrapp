using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace EMR.Classes
{
    public static class Methods
    {
        public static void GrantPermission(Page page, string user, bool isADM)
        {
            var path = page.Server.MapPath("~/EMR_Doc.xlsx");

            ExcelPackage EXCEL_PACKAGE;

            ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;

            EXCEL_PACKAGE = new ExcelPackage(new FileInfo(path));

            var permission = EXCEL_PACKAGE.Workbook.Worksheets["Permission"];

            //var dynamicObject = new System.Dynamic.ExpandoObject() as IDictionary<string, Object>;

            int excol = 66; //66:B
            int exrow = 2;

            if (isADM)
            {
                while (permission.Cells[(char)excol + Convert.ToString(exrow)].Value != null
                    && Convert.ToString(permission.Cells[(char)excol + Convert.ToString(exrow)].Value) == "x")
                {
                    switch (Convert.ToString(permission.Cells["A" + Convert.ToString(exrow)].Value))
                    {
                        case "Edit_Input New VitalSign":
                            try
                            {
                                page.Form.FindControl("btnNewVitalSign").Visible = true;
                            }
                            catch (Exception ex) { }

                            break;
                        case "Print Form":
                            try
                            {
                                page.Form.FindControl("btnPrint").Visible = true;
                            }
                            catch (Exception ex) { }

                            break;
                    }
                    exrow++;
                }
                    
            }
            else
            {
                while (permission.Cells[(char)excol + "1"].Value != null
                && Convert.ToString(permission.Cells[(char)excol + "1"].Value) == user)
                {
                    while (permission.Cells[(char)excol + Convert.ToString(exrow)].Value != null
                        && Convert.ToString(permission.Cells[(char)excol + Convert.ToString(exrow)].Value) == "x")
                    {
                        switch (Convert.ToString(permission.Cells["A" + Convert.ToString(exrow)].Value))
                        {
                            case "Input New VitalSign":
                                try
                                {
                                    page.Form.FindControl("btnNewVitalSign").Visible = true;
                                }
                                catch (Exception ex) { }

                                break;
                            case "Print Form":
                                try
                                {
                                    page.Form.FindControl("btnPrint").Visible = true;
                                }
                                catch (Exception ex) { }

                                break;
                        }
                        exrow++;
                    }
                    excol++;
                }
            }

            //return dynamicObject;
        }
        //public string LoadVersion(string loc, string modelId, string url, int exrow = 1)
        //{
        //    var path = Server.MapPath("~/EMR_Doc.xlsx");
        //    string ContentUrl = "/";
        //    ExcelPackage EXCEL_PACKAGE;

        //    ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;

        //    EXCEL_PACKAGE = new ExcelPackage(new FileInfo(path));

        //    var version = EXCEL_PACKAGE.Workbook.Worksheets["Version"];

        //    var dynamicObject = new System.Dynamic.ExpandoObject() as IDictionary<string, Object>;

        //    switch (loc)
        //    {
        //        case "AIH":

        //            if (version != null)
        //            {
        //                string version_extension = "";

        //                //int exrow = 1;

        //                while (version.Cells["A" + exrow].Value != null)
        //                {
        //                    if (version.Cells["A" + exrow].Value.ToString() == modelId)
        //                    {
        //                        if (version.Cells["B" + exrow].Value != null)
        //                        {
        //                            version_extension = version.Cells["B" + exrow].Value.ToString();
        //                        }
        //                    }
        //                    exrow++;
        //                }

        //                //string a = version.Cells["B2"].Value.ToString();
        //                string ModelUrl = url;
        //                var urlArr = ModelUrl.Split('.');

        //                url = urlArr[0] + version_extension + "." + urlArr[1];
        //            }

        //            break;
        //        case "CLI":
        //            ContentUrl += "DBP/";
        //            break;
        //    }

        //    return ContentUrl + url;
        //}
    }
}