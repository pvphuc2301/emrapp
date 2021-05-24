using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Asp.Net.Web.UI
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:PopupModal runat=server></{0}:PopupModal>")]
    public class PopupModal : WebControl
    {
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

        protected override void RenderContents(HtmlTextWriter output)
        {
            output.Write(Text);
        }
    }

    [
        ParseChildren(ChildrenAsProperties = true)
    ]
    public class AggregateFeeds : Control
     {
         public AggregateFeeds()
         {
             this.Feeds = new RssFeedCollection();
            this.Settings = new AggregateSettings();
         }

        [PersistenceMode(PersistenceMode.InnerProperty)] //Update
        public RssFeedCollection Feeds
         {
             get;
             private set;
         }

        [PersistenceMode(PersistenceMode.InnerProperty)] //Update
        public Button Button;

        [PersistenceMode(PersistenceMode.InnerProperty)]// update
        public AggregateSettings Settings
         {
             get;
             private set;
         }
    protected override void Render(HtmlTextWriter writer)
         {
             this.Feeds.ForEach(rssRes => writer.Write(rssRes.Url));
         }
     }

    public class AggregateSettings
     {
         public int TimeOut { get; set; }
         public bool CacheResults { get; set; }
     }

        public class RssFeedCollection : List<RssResource>
     {
 
     }

     
     public abstract class RssResource
     {
         public string Url { get; set; }
     }
     public class MediaRss : RssResource
     {
 
     }
     public class ITunesRss : RssResource
     {
 
     }
}
