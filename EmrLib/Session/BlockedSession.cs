using System;

namespace EmrLib.Session
{
    public class BlockedSession
    {
        public Guid document_id { get; set; }
        public string employee_id { get; set; }
        public string user_name { get; set; }
        public string full_name_e { get; set; }
        public string full_name_l { get; set; }
        public DateTime? session_date { get; set; }
        public DateTime? lu_date_time { get; set; }
        public int session_time { get; set; }
    }
}
