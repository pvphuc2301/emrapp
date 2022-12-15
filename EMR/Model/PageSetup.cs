using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EMR.Model
{
    public class PageSetup
    {
        public dynamic pager_width { get; set; }
        public dynamic pager_height { get; set; }
        public dynamic header_height { get; set; }
        public dynamic footer_height { get; set; }
        public dynamic margin { get; set; }
        public dynamic margin_top { get => margin.Split(' ')[0]; set => margin_top = value; }
        public dynamic margin_right { get => margin.Split(' ')[1]; set => margin_right = value; }
        public dynamic margin_bottom { get => margin.Split(' ')[2]; set => margin_bottom = value; }
        public dynamic margin_left { get => margin.Split(' ')[3]; set => margin_left = value; }
        public dynamic font_size { get; set; }
        public dynamic font_family { get; set; }
        public dynamic line_spacing { get; set; }
    }
}
