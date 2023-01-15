using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.Shared.Models
{
    public class OutpatientTodayListModel
    {
        public string patient_id { get; set; }
        public string patient_visit_id { get; set; }
        public string visible_patient_id { get; set; }
        public string patient_name_e { get; set; }
        public string patient_name_l { get; set; }
        public DateTime? date_of_birth { get; set; }
        public string gender_e { get; set; }
        public string gender_l { get; set; }
        public string work_queue_e { get; set; }
        public string work_queue_l { get; set; }
        public string adtending_doctor_e { get; set; }
        public string adtending_doctor_l { get; set; }
        public DateTime? start_date_time { get; set; }
        public DateTime? completed_date_time { get; set; }
        public string wq_status_e { get; set; }
        public string wq_status_l { get; set; }
    }
}
