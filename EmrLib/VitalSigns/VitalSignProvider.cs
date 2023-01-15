using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmrLib.VitalSigns
{
    public class VitalSignProvider
    {
        public double? CalculateBmi(double? vs_weight, double? vs_height)
        {
            if(vs_height == null || vs_weight == null)
            {
                return null;
            }
            return Math.Round((double)(vs_weight / ((vs_height / 100) * (vs_height / 100))), 1);
        }
    }
}
