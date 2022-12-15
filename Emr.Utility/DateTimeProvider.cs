using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Emr.Utility
{
    public class DateTimeProvider
    {
        public static string ConvertSQLDateTime(DateTime? _datetime)
        {
            try
            {
                return ((DateTime)_datetime).ToString("yyyy-MM-ddTHH:mm:ss");
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}
