using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace EMR
{

    public static class DataHelpers
    {
        public static dynamic CalculateAge(DateTime dateOfBirth)
        {
            if (dateOfBirth == null) return null;
            int age = 0;
            age = DateTime.Now.Year - dateOfBirth.Year;
            if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
                age = age - 1;

            return age;
        }

        public static dynamic GetAgeAsString(DateTime dob)
        {
            DateTime now = DateTime.Now;
            
            string AgeStr = string.Empty;
            int age = DataHelpers.CalculateAge(dob);

            int days = (now.Date - dob.Date).Days;
            int month = ((now.Year - dob.Year) * 12) + now.Month - dob.Month;
            
            if (age <= 5)
            {
                if (days <= 30)
                {
                    AgeStr = days.ToString() + " Ngày/Days";
                }
                else
                {
                    AgeStr = month.ToString() + " Tháng/Months";
                }
            }
            else
            {
                AgeStr = age.ToString();
            }

            return AgeStr;
        }

        public static string ConvertSQLDateTime(DateTime? _datetime)
        {
            try
            {
                return ((DateTime)_datetime).ToString("yyyy-MM-ddTHH:mm:ss");
            } 
            catch (Exception ex) 
            { 
                return null; 
            }
        }
        public static string FormatPhysicalExamination(string value)
        {
            if (string.IsNullOrEmpty(value)) return null;
            try
            {
                string result = value.Replace("\n", "<br>");

                return result;
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }

        /// <summary>
        /// Khai bao bien su dung toan Project EMR
        /// </summary>
        //public static string varDocType;  // Document Type: OPD/ IPD/ERO/ OTHER
        //public static string varModelID;  // Document Model ID
        //public static string varDocID;// Document ID
        //public static string varPVID; // Patient Visit ID
        //public static string varUseName = "chung.nguyen"; // UseName: get username AD login hien tai
        //public static string varDocumentStatus;// Document Status: kiem tra trang thai Document
        //public static string varNotifications;// Thong bao ket qua xu ly: thanh cong/ fail
        //public static string _LOCATION;

        //public static PatientInfo patient;
        //public static PatientInfo LoadPatientInfomation(string varPID)//object sender, EventArgs e
        //{
        //    try
        //    {
        //        dynamic response = WebHelpers.GetAPI("api/emr/demographic/" + varPID);

        //        if (response.Status == System.Net.HttpStatusCode.OK)
        //        {
        //            patient = new PatientInfo();
        //            dynamic data = JObject.Parse(response.Data);
        //            DataTable tbl = WebHelpers.GetJSONToDataTable(response.Data);
        //            WebHelpers.BindingDatafield(tbl, patient);
        //            // Gan bien trung gian ( Global)
        //            // DataHelpers.patient = this.patient;
        //        }

        //        return patient;
        //    }
        //    catch(Exception ex)
        //    {
        //        return null;
        //    }
            
        //}

        //public static PatientVisitInfo patientVisit;

        //public static void LoadPatientVisitInfomation(string varPVID)
        //{
        //    dynamic response = WebHelpers.GetAPI("api/emr/patient-visit/" + varPVID);

        //    if (response.Status == System.Net.HttpStatusCode.OK)
        //    {
        //        patientVisit = new PatientVisitInfo();
        //        dynamic data = JObject.Parse(response.Data);
        //        DataTable tbl = WebHelpers.GetJSONToDataTable(response.Data);
        //        WebHelpers.BindingDatafield(tbl, patientVisit);

        //        // Gan bien trung gian ( Global)
        //        // DataHelpers.patientVisit = this.patientVisit;
        //    }
        //}

        internal static int? ConvertToInt(string value)
        {
            if (value == null || Convert.ToString(value) == "") return null;
            return Convert.ToInt32(value);
        }
    }
}