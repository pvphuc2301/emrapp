using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;

namespace EMR.Model
{
    public class AccessButtonInfo
    {
        public HtmlForm Form { get; set; }
        public string DocStatus { get; set; }
        public string AccessGroup { get; set; }
        public string AccessAuthorize { get; set; }
        public bool IsSameCompanyCode { get; set; }
        public bool IsViewLog { get; set; }
    }
}