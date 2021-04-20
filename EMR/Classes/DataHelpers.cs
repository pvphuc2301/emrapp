﻿using Newtonsoft.Json.Linq;
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

        public static string ConvertSQLDateTime(DateTime datetime)
        {
            var utc = datetime.ToUniversalTime();
            var localRendered = datetime.ToString("o");
            return utc.ToString("o").PadRight(localRendered.Length, ' ');
        }

        public static string FormatPhysicalExamination(string value)
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
            string _jsonData = WebHelpers.GetAPI("api/emr/demographic/" + varPID);

            if (_jsonData != null)
            {
                patient = new PatientInfo();
                dynamic data = JObject.Parse(_jsonData);
                _jsonData = "[" + _jsonData + "]";
                DataTable tbl = new DataTable();
                tbl = WebHelpers.GetJSONToDataTable(_jsonData);
                WebHelpers.BindingDatafield(tbl, patient);
                // Gan bien trung gian ( Global)
                // DataHelpers.patient = this.patient;               
            }
            return patient;
        }

        public static PatientVisitInfo patientVisit;

        public static void LoadPatientVisitInfomation(string varPVId)
        {
            string _jsonData = WebHelpers.GetAPI("api/emr/patient-visit/" + varPVId);

            if (_jsonData != null)
            {
                patientVisit = new PatientVisitInfo();
                dynamic data = JObject.Parse(_jsonData);
                _jsonData = "[" + _jsonData + "]";
                DataTable tbl = new DataTable();
                tbl = WebHelpers.GetJSONToDataTable(_jsonData);
                WebHelpers.BindingDatafield(tbl, patientVisit);

                // Gan bien trung gian ( Global)
                // DataHelpers.patientVisit = this.patientVisit;

            }
        }
    }
}