<%@ Control language="C#" ClassName="PopupModal" %>
<%@ Import Namespace="EMR.UserControls"  %>

<script runat="server">
    private ITemplate modalHeader = null;
    private ITemplate modalBody = null;
    private ITemplate modalFooter = null;
    public string ID { get { return modaltemp.ID; } set { modaltemp.ID = value; } }

    [TemplateContainer(typeof(MessageContainer))]
    [PersistenceMode(PersistenceMode.InnerProperty)]
    public ITemplate ModalHeader { get { return modalHeader; } set { modalHeader = value; } }

    [ TemplateContainer(typeof(MessageContainer)) ]
    [ PersistenceMode(PersistenceMode.InnerProperty) ]
    public ITemplate ModalBody { get { return modalBody; } set { modalBody = value; } }

    [ TemplateContainer(typeof(MessageContainer)) ]
    [ PersistenceMode(PersistenceMode.InnerProperty) ]
    public ITemplate ModalFooter { get { return modalFooter; } set { modalFooter = value; } }

    void Page_Init() {

        if (modalHeader != null) {

            MessageContainer container = new MessageContainer();
            modalHeader.InstantiateIn(container);
            modal_header.Controls.Add(container);
        }
        else { modal_header.Visible = false; }
        if(modalBody != null)
        {
            MessageContainer container = new MessageContainer();
            modalBody.InstantiateIn(container);
            modal_body.Controls.Add(container);
        }
        else { modal_body.Visible = false; }
        if (modalFooter != null)
        {
            MessageContainer container = new MessageContainer();
            modalFooter.InstantiateIn(container);
            modal_footer.Controls.Add(container);
        }
        else { modal_footer.Visible = false; }
    }

    public class MessageContainer: Control, INamingContainer {
        private int m_index;
        private String m_message;
        internal MessageContainer()
        {
        }
        public int Index {
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

</script>

<div runat="server" id="modaltemp" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" runat="server" id="modal_header">
            </div>

            <div class="modal-body" runat="server" id="modal_body">
            </div>

            <div class="modal-footer"  runat="server" id="modal_footer">
            </div>
        </div>
    </div>
</div>
