using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CustomControls
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:Message runat=server></{0}:Message>")]
    public class Message : WebControl
    {
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]

        public string ID
        {
            get
            {
                String s = (String)ViewState["ID"];
                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["ID"] = value;
            }
        }
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]

        public int Timeout
        {
            get
            {
                String s = (String)ViewState["Timeout"];
                return ((s == null) ? 0 : int.Parse(s));
            }

            set
            {
                ViewState["Timeout"] = value;
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]

        public string Text
        {
            get
            {
                String s = (String)ViewState["Text"];
                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["Text"] = value;
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]

        public string Skin
        {
            get
            {
                String s = (String)ViewState["Skin"];
                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["Skin"] = value;
            }
        }
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]

        public string Position
        {
            get
            {

                String s = (String)ViewState["Position"];
                return ((s == null) ? String.Empty : s);
            }

            set
            {
                ViewState["Position"] = value;
            }
        }
        public static class SKIN
        {
            public static string PRIMARY = "alert-primary";
            public static string SECONDARY = "alert-success";
            public static string SUCCESS = "alert-success";
            public static string DANGER = "alert-danger";
            public static string WARNING = "alert-warning";
            public static string INFO = "alert-info";
            public static string LIGHT = "alert-light";
            public static string DARK = "alert-dark";
            public static string NONE = "";
        }
        public static class POSITION
        {
            public static string TOP = "top";
            public static string BOTTOM = "bottom";
        }
        protected override void RenderContents(HtmlTextWriter output)
        {
            var style = "";
            
            switch (Position)
            {
                case "top":
                    style += "position: fixed; top: 0; left: 0; right: 0;";
                    break;
                case "bottom":
                    style += "position: fixed; bottom: 0; left: 0; right: 0;";
                    break;
                default:
                    break;
            }

            output.Write("<div id=\""+this.ID+"\" style=\"" + style + "\" class=\"alert " + Skin + "\">");
            switch (Skin)
            {
                case "alert-success":
                    output.Write("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-check-circle mr-2\" viewBox=\"0 0 16 16\">");
                    output.Write("<path d=\"M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z\"/>");
                    output.Write("<path d=\"M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z\"/>");
                    output.Write("</svg>");
                    break;
                case "alert-danger":
                    output.Write("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-exclamation-triangle-fill mr-2\" viewBox=\"0 0 16 16\">");
                    output.Write("<path d=\"M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z\"/>");
                    output.Write("</svg>");
                    break;
                default:

                    break;
            }

            output.Write("<span>");
            output.Write(Text);
            output.Write("</span>");
            output.Write("</div>");

            if(Timeout != 0)
            {
                output.Write("<script type=\"text/javascript\"> console.log('sdfsd'); setTimeout(function(){ console.log('delete'); document.getElementById(\"" + this.ID+"\").remove();  }, " + Timeout + ")</script>");
            }

        }

        protected override void Render(HtmlTextWriter writer)
        {
            this.RenderContents(writer);
        }
    }
}
