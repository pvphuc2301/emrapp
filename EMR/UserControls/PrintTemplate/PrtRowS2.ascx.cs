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
                string _checked = "❏";
                dynamic value = "";
                string _text = "";
                string _fixWidth = "";

                for (int i = 0; i < tb.Rows.Count; i++)
                {
                    if(tb.Columns.Contains("Value"))
                    {
                        value = tb.Rows[i]["Value"];
                    }
                    if (tb.Columns.Contains("Text")) { _text = tb.Rows[i]["Text"].ToString(); }
                    if(tb.Columns.Contains("FixWidth")) { _fixWidth = "width: " + tb.Rows[i]["FixWidth"] + "px"; }

                    value = tb.Columns.Contains("Value") ? tb.Rows[i]["Value"].ToString() : "";
                    if(SelectedValue != null)
                    {
                        _checked = value == SelectedValue.ToString() ? "☒" : "❏";
                    }

                    content += string.Format(
                        @"<div style='margin-right: {2}px; {3}' >
                        <span style='font-size: 20px; line-height: 13.3048px;'>
                        {0}
                        <span style='font-size: 13.3048px'> {1}</span>
                        </span>
                    </div>", _checked, _text, Gap, _fixWidth);
                }

            }
            

            if (FixedWidth > 0) { prt_content.Width = FixedWidth; }
            
            options.InnerHtml = content;

        }
    }
}