using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Models
{
    public class NutritionalStatus
    {
        public string ns_code { get; set; }
        public int ns_score { get; set; }
        public int loss_weight { get; set; }
        public int food_intake { get; set; }
        public int total_score { get; set; }
    }
}
