using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls.PrintTemplate
{
    public partial class PrtRowS2 : System.Web.UI.UserControl
    {
        public string Title { get; set; }
        public string SubTitle { get; set; }
        public int FixedLeft { get; set; }
        public int FixedWidth { get; set; }
        public bool flag { get; set; }
        public string option1 { get; set; }
        public string TitleOption1 { get; set; }
        public string SubtitleOption1 { get; set; }
        public string option2 { get; set; }
        public string TitleOption2 { get; set; }
        public string SubtitleOption2 { get; set; }
        public string Content { get; set; }
        public int SelectedIndex { get; set; }
        public dynamic SelectedValue { get; set; }
        public string Order { get; set; }
        public string Options { get; set; }
        public int Gap { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Order)) { prt_order.Text = Order; prt_order.Width = 30; }
            prt_title.Text = Title;
            prt_subtitle.Text = SubTitle;
            prtRowS2Wraper.Attributes["style"] = string.Format("margin-left: {0}px", FixedLeft);

            DataTable tb = WebHelpers.GetJSONToDataTable(Options);

            string content = "";
            if(tb != null)
            {
                for (int i = 0; i < tb.Rows.Count; i++)
                {
                    content += string.Format(
                        @"<div style='margin-right: {2}px; {3}' >
                        <span style='font-size: 20px; line-height: 13.3048px;'>
                        {0}
                        <span style='font-size: 13.3048px'> {1}</span>
                        </span>
                        
                    </div>", (tb.Columns.Contains("Value") ? tb.Rows[i]["Value"].ToString() == SelectedValue.ToString() : false) ? "☒" : "❏", tb.Columns.Contains("Text") ? tb.Rows[i]["Text"] : "", Gap, tb.Columns.Contains("FixWidth") ? "width: " + tb.Rows[i]["FixWidth"] + "px" : "");

                    //< div class='align-top' style='margin-left: 6px; display: inline-block;'> {1} </div>
                }

            }
            

            if (FixedWidth > 0) { prt_content.Width = FixedWidth; }
            
            options.InnerHtml = content;

        }
    }
}