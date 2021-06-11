using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMR.UserControls
{
    public partial class TextField1 : System.Web.UI.UserControl
    {
        public bool Disabled { get; set; }
        public string TextMode { get; set; }
        public string Value { get { return TextField_Wrapper.Value; } set { TextField_Wrapper.Value = value; } }

        private ITemplate modalHeader = null;
        private ITemplate modalBody = null;
        private ITemplate append = null;

        public string ID { get { return TextField_Wrapper.ID; } set { TextField_Wrapper.ID = value; } }

        [TemplateContainer(typeof(MessageContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate ModalHeader { get { return modalHeader; } set { modalHeader = value; } }

        [TemplateContainer(typeof(MessageContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate ModalBody { get { return modalBody; } set { modalBody = value; } }

        [TemplateContainer(typeof(MessageContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate Append { get { return append; } set { append = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Append != null)
            {
                MessageContainer container = new MessageContainer();
                Append.InstantiateIn(container);
                basicAddon2.Controls.Add(container);
            }
            else { basicAddon2.Visible = false; }
            if(Disabled != null)
            {
                TextField_Wrapper.Disabled = Disabled;
            }
            if(TextMode != null)
            {
                TextField_Wrapper.Attributes["data-type"] = TextMode;
            }
        }
    }

    public class MessageContainer : Control, INamingContainer
    {
        private int m_index;
        private String m_message;
        internal MessageContainer()
        {
        }
        public int Index
        {
            get
            {
                return m_index;
            }
        }
        public String Message
        {
            get
            {
                return m_message;
            }
        }
    }
}