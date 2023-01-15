using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.Shared.Models
{
    public class AppointmentTodayListModel
    {
        public string patient_id { get; set; }
        public string visible_patient_id { get; set; }
        public string patient_name_e { get; set; }
        public string patient_name_l { get; set; }
        public DateTime? date_of_birth { get; set; }
        public string gender_e { get; set; }
        public string gender_l { get; set; }
        public string specialty_name_e { get; set; }
        public string specialty_name_l { get; set; }
        public string employee_name_e { get; set; }
        public string employee_name_l { get; set; }
        public DateTime? appointment_date { get; set; }
        public DateTime? visit_date { get; set; }
        public DateTime? cancel_date_time { get; set; }
    }
}
