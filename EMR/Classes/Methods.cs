using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace EMR.Classes
{
    public class Methods : System.Web.UI.Page
    {
        public IDictionary<string, Object> LoadSettings(int excol, int exrow)
        {
            var path = Server.MapPath("~/EMR_Doc.xlsx");

            ExcelPackage EXCEL_PACKAGE;

            ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;

            EXCEL_PACKAGE = new ExcelPackage(new FileInfo(path));

            var settings = EXCEL_PACKAGE.Workbook.Worksheets["Settings"];

            var dynamicObject = new System.Dynamic.ExpandoObject() as IDictionary<string, Object>;

            if (settings != null)
            {
                //int exrow = 4;
                string propKey = "";
                string propVal = "";
                //int excol = 67; //67:C
                while (settings.Cells[(char)excol + "4"].Value != null)
                {
                    propKey = settings.Cells[(char)excol + "4"].Value.ToString();
                    propVal = settings.Cells[(char)excol + "5"].Value.ToString();

                    dynamicObject.Add(propKey, propVal);
                    excol++;
                }
            }

            return dynamicObject;
        }

        public string LoadVersion(string loc, string modelId, string url, int exrow = 1)
        {
            var path = Server.MapPath("~/EMR_Doc.xlsx");
            string ContentUrl = "/";
            ExcelPackage EXCEL_PACKAGE;

            ExcelPackage.LicenseContext = OfficeOpenXml.LicenseContext.NonCommercial;

            EXCEL_PACKAGE = new ExcelPackage(new FileInfo(path));

            var version = EXCEL_PACKAGE.Workbook.Worksheets["Version"];

            var dynamicObject = new System.Dynamic.ExpandoObject() as IDictionary<string, Object>;

            switch (loc)
            {
                case "AIH":

                    if (version != null)
                    {
                        string version_extension = "";

                        //int exrow = 1;

                        while (version.Cells["A" + exrow].Value != null)
                        {
                            if (version.Cells["A" + exrow].Value.ToString() == modelId)
                            {
                                if (version.Cells["B" + exrow].Value != null)
                                {
                                    version_extension = version.Cells["B" + exrow].Value.ToString();
                                }
                            }
                            exrow++;
                        }

                        //string a = version.Cells["B2"].Value.ToString();
                        string ModelUrl = url;
                        var urlArr = ModelUrl.Split('.');

                        url = urlArr[0] + version_extension + "." + urlArr[1];
                    }

                    break;
                case "CLI":
                    ContentUrl += "DBP/";
                    break;
            }

            return ContentUrl + url;
        }
    }
}