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
        public static int CalculateAge(DateTime dateOfBirth)
        {
            int age = 0;
            age = DateTime.Now.Year - dateOfBirth.Year;
            if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
                age = age - 1;

            return age;
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
            if (value == null) return null;
            try
            {
                string[] temp = value.ToString().Split('•');

                string result = "";

                for (int i = 1; i < temp.Length; i++)
                {
                    result += "•" + temp[i];
                    if (temp[i].Substring(temp[i].Length - 4, 4) != "<br>")
                        result += "<br>";
                }

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
        public static string varDocType;  // Document Type: OPD/ IPD/ERO/ OTHER
        public static string varModelId;  // Document Model ID
        public static string varDocId;// Document ID
        public static string varPVId; // Patient Visit ID
        public static string varUseName = "chung.nguyen"; // UseName: get username AD login hien tai
        public static string varDocumentStatus;// Document Status: kiem tra trang thai Document
        public static string varNotifications;// Thong bao ket qua xu ly: thanh cong/ fail

        public static PatientInfo patient;
        public static PatientInfo LoadPatientInfomation(string varPID)//object sender, EventArgs e
        {
            try
            {
                dynamic response = WebHelpers.GetAPI("api/emr/demographic/" + varPID);

                if (response.Status == System.Net.HttpStatusCode.OK)
                {
                    patient = new PatientInfo();
                    dynamic data = JObject.Parse(response.Data);
                    DataTable tbl = WebHelpers.GetJSONToDataTable(response.Data);
                    WebHelpers.BindingDatafield(tbl, patient);
                    // Gan bien trung gian ( Global)
                    // DataHelpers.patient = this.patient;
                }

                return patient;
            }
            catch(Exception ex)
            {
                return null;
            }
            
        }

        public static PatientVisitInfo patientVisit;

        public static void LoadPatientVisitInfomation(string varPVId)
        {
            dynamic response = WebHelpers.GetAPI("api/emr/patient-visit/" + varPVId);

            if (response.Status == System.Net.HttpStatusCode.OK)
            {
                patientVisit = new PatientVisitInfo();
                dynamic data = JObject.Parse(response.Data);
                DataTable tbl = WebHelpers.GetJSONToDataTable(response.Data);
                WebHelpers.BindingDatafield(tbl, patientVisit);

                // Gan bien trung gian ( Global)
                // DataHelpers.patientVisit = this.patientVisit;
            }
        }
    }
}