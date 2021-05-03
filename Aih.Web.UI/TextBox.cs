using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;

[assembly: TagPrefix("Aih.Web.UI", "aih")]
namespace Aih.Web.UI
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:TextBox runat=server></{0}:TextBox>")]
    public class TextBox : System.Web.UI.WebControls.TextBox
    {
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        [Localizable(true)]
        public override string Text { get => base.Text; set => base.Text = value; }

        [
        Bindable(true),
        Category("Appearance"),
        DefaultValue(""),
        Description("The title of the texbox."),
        Localizable(true)
        ]
        public virtual bool Editor
        {
            get
            {
                bool s = (bool)ViewState["Editor"];
                return (s == null) ? false : true;
            }
            set
            {
                ViewState["Title"] = value;
            }
        }

        protected override void RenderContents(HtmlTextWriter writer)
        {
            writer.AddAttribute(HtmlTextWriterAttribute.Class, "form-group");
            writer.AddAttribute("disabled", "disabled");
            writer.Write(Text);
        }
    }
}
