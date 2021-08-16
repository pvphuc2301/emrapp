using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.Other
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        class test
        {
            public string title { get; set; }
            public string body { get; set; }
            public string[] to_email { get; set; }
            public string[] cc_email { get; set; }
            public string[] bcc_email { get; set; }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            test a = new test()
            {
                title = "Test XN Covid",
                body = "<!DOCTYPE html><html><head><title>Page Title</title></head><body><h1>This is a Heading</h1><p>This is a paragraph.</p></body></html>",
                to_email = new string[2] { "minh.tran@aih.com.vn", "phut.phan" },
                cc_email = new string[2] { "tuan.cao@aih.com.vn", "chung.nguyen" },
                bcc_email = new string[1] { "long.do@aih.com.vn" }
            };

            WebHelpers.PostAPI("http://172.16.0.78:8888/sendemail", a);
        }
    }
}