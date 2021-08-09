using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EMR.Model
{
    public class PatientHistoryVm
    {
        public string visible_patient_id { get; set; }
        public string user_name { get; set; }
        public string patient_name { get; set; }
        public string gender { get; set; }
        public string date_of_birth { get; set; }
    }
}