using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Model
{
    public class EmrDictionary
    {
        public static Dictionary<string, string> DISC_WARD_CODE = new Dictionary<string, string>()
        {
            { "", "" },
            { "K18", "Khoa Nhi – Săn sóc đặc biệt sơ sinh" },
            { "K03", "Khoa Nội Tổng Hợp" },
            { "K26", "Khoa Gây mê – Hồi sức" },
            { "K19", "Khoa Ngoại Tổng Hợp" },
            { "K02", "Khoa Cấp cứu" },
            { "K27", "Khoa Sản – Phụ khoa" },
            { "K48", "Khoa Hồi sức tích cực – Chống độc" },
        };
    }
}
