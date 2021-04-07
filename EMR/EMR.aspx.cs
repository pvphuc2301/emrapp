using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR
{
    public partial class EMR : System.Web.UI.Page, IPostBackEventHandler
    {
        
        public PatientInfo patient = new PatientInfo();

        public string pid = "";

        public void LoadInfomation(object sender, EventArgs e)
        {
            pid = ValueHiddenField.Value;

            string _jsonData = WebHelpers.GetAPI("api/emr/demographic/" + pid);

            if (_jsonData != null)
            {
                dynamic data = JObject.Parse(_jsonData);

                patient.Name = data.first_name_l + " " + data.last_name_l;
                patient.Gender = data.gender_e;
                patient.Title = data.title_l;
                patient.PID = data.visible_patient_id;
                patient.Age = DataHelpers.CalculateAge(DateTime.Parse(data.date_of_birth.ToString())).ToString();
                patient.DOB = data.date_of_birth.ToString("dd-MM-yyyy");
            }
        }

        public void RaisePostBackEvent(string eventArgument)
        {

        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}