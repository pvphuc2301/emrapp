using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EMR.Model
{
    public class SendRequestVm
    {
        public string pvid { get; set; }
        public string visitType { get; set; }
        public string visible_id { get; set; }
        public string visitCode { get; set; }
        public string visitDate { get; set; }
    }
}