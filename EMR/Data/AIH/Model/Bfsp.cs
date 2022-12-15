using EMR.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Data.AIH.Model
{
    public class Bfsp : EmrDocument
    {
        #region Properties
        /// <summary>
        /// Preoperative diagnosis
        /// </summary>
        public string preoperative_diagnosis { get; set; }
        /// <summary>
        /// Surgeon
        /// </summary>
        public string surgeon { get; set; }
        /// <summary>
        /// Assistant surgeon
        /// </summary>
        public string assistant_surgeon { get; set; }
        /// <summary>
        /// Performance method
        /// </summary>
        public string performance_method { get; set; }
        /// <summary>
        /// Package name
        /// </summary>
        public string package_name { get; set; }
        /// <summary>
        ///  Package Code
        /// </summary>
        public string package_code { get; set; }
        /// <summary>
        /// Dayward/IPD
        /// </summary>
        public string admitted_code { get; set; }
        /// <summary>
        /// Dayward/IPD
        /// </summary>
        public string admitted_desc { get; set; }
        /// <summary>
        /// IPD, specify
        /// </summary>
        public string admitted_specify { get; set; }
        /// <summary>
        /// Thời gian mổ (dự kiến)
        /// </summary>
        public string performance_date_time { get; set; }
        /// <summary>
        /// Surgical time
        /// </summary>
        public string surgical_time { get; set; }
        /// <summary>
        /// Duration of using OT room
        /// </summary>
        public string duration_using_room
        {
            get
            {
                if(int.TryParse(surgical_time, out int value))
                {
                    return Convert.ToString(value + 30);
                }
                return "30";
            }
        }
        /// <summary>
        /// Infected case
        /// </summary>
        public string infected_case_code { get; set; }
        /// <summary>
        /// Infected case
        /// </summary>
        public string infected_case_desc { get; set; }
        /// <summary>
        /// Special Equipment
        /// </summary>
        public string special_equipment { get; set; }
        /// <summary>
        /// Implant
        /// </summary>
        public string implant { get; set; }
        /// <summary>
        /// Special Consumable
        /// </summary>
        public string special_consumable { get; set; }
        /// <summary>
        /// Frozen section
        /// </summary>
        public string frozen_section { get; set; }
        /// <summary>
        /// Anatomical pathology
        /// </summary>
        public string anatomical_pathology { get; set; }
        /// <summary>
        /// Other, please specif
        /// </summary>
        public string other_please_specify { get; set; }
        public string surgical_equipment_code { get; set; }
        public string surgical_equipment_desc { get; set; }
        public string surgical_equipment_note { get; set; }
        public string position_patient_code { get; set; }
        public string position_patient_desc { get; set; }
        public string position_patient_specify { get; set; }
        public string lateral_specify { get; set; }
        public string type_anaesthesia_code { get; set; }
        public string type_anaesthesia_desc { get; set; }
        public string type_anaesthesia_note { get; set; }
        public string preoperative_preparation_code { get; set; }
        public string preoperative_preparation_desc { get; set; }
        public string preoperative_preparation_note { get; set; }
        public string hair_removal_code { get; set; }
        public string hair_removal_desc { get; set; }
        public string booking_time { get; set; }
        /// <summary>
        /// Hair removal
        /// </summary>
        public string hair_removal_diagram { get; set; }
        #endregion
        public Bfsp() { }
        public Bfsp(string document_id) { this.document_id = document_id; }
        public Bfsp(string document_id, string location) : base(document_id, location)
        {
        }

        public Bfsp(string document_id, string location, string document_log_id) : base(document_id, location, document_log_id)
        {
        }

        public override string api => "api/surpro";
        public const string _api = "api/surpro";

        protected override void DefaultDocument()
        {
            
        }
        public bool IsFirstCreated(string location) => Logs(location)?.Rows.Count == 1;
    }
}
