using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmrLib.Utility
{
    public class EmrDocument
    {
        public Guid document_id { get; }
        public string user_name { get; }
        public string status { get; }
        public string amend_reason { get; }
        public Guid created_user_id { get; set; }
        public string created_name_e { get; set; }
        public string created_name_l { get; set; }
        public string created_date_time { get; set; }
        public Guid modified_user_id { get; set; }
        public string modified_name_e { get; set; }
        public string modified_name_l { get; set; }
        string modified_date_time { get; set; }
        public Guid submited_user_id { get; set; }
        public string submited_name_e { get; set; }
        public string submited_name_l { get; set; }
        public string submited_date_time { get; set; }
        public Guid signed_user_id { get; set; }
        public string signed_name_e { get; set; }
        public string signed_name_l { get; set; }
        public string signed_date_time { get; set; }
        public Guid delete_user_id { get; set; }
        public string delete_name_e { get; set; }
        public string delete_name_l { get; set; }
        public string delete_date_time { get; set; }
    }
    public class GroupAccess
    {
        public const string ADM = "ADM";

    }
    public class AccessAuthorize
    {
        public const string View = "View";
    }
    public class User
    {
        public string GroupAccess { get; set; }
        public string AccessAuthorize { get; set; }
    }
    public class EmrHelper
    {
        
        protected void GrantPermissions(User user, EmrDocument doc)
        {
            //bool IsSameCompanyCode = !IsLocationChanged;

            //LinkButton btnComplete = (LinkButton)FindControl("btnComplete");
            //Control btnSave = FindControl("btnSave");
            //Control btnDelete = FindControl("btnDelete");
            //Control btnAmend = FindControl("btnAmend");
            //Control btnPrint = FindControl("btnPrint");
            //Control btnCancel = FindControl("btnCancel");

            //HideControl(btnCancel);

            //if (!IsSameCompanyCode || IsViewLog)
            //{
            //    HideControl(btnComplete, btnSave, btnDelete, btnAmend, btnPrint);
            //    return;
            //}

            //if (doc.status == DocumentStatus.FINAL)
            //{
            //    ShowControl(btnAmend, btnPrint);
            //    HideControl(btnComplete, btnSave, btnDelete);
            //}
            //else
            //{
            //    HideControl(btnAmend, btnPrint);
            //    ShowControl(btnComplete, btnSave, btnDelete);
            //}

            //switch (user.AccessAuthorize)
            //{
            //    case AccessAuthorize.View:
            //        //Edit: quy?n view có th? print
            //        HideControl(btnAmend, btnComplete, btnSave, btnDelete);
            //        break;
            //}

            //if (user.GroupAccess == GroupAccess.ADM)
            //{
            //    ShowControl(btnDelete);
            //}
        }
        public static string FormatPID(string pid)
        {
            string formatpid = "000000000" + pid;
            formatpid = "9" + formatpid.Substring(formatpid.Length - 8, 8);
            return formatpid;
        }
        public static int CalculateAge(DateTime dateOfBirth)
        {
            int age = DateTime.Now.Year - dateOfBirth.Year;
            if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
                age = age - 1;
            return age;
        }
        public static string ConvertSQLDateTime(DateTime datetime)
        {
            return datetime.ToString("yyyy-MM-ddTHH:mm:ss");
        }
    }
}
