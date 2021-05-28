<%@ Control Language="C#" ClassName="Signature" %>
<%@ Import Namespace="EMR.UserControls" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>


<script runat="server">

    public string Day { get; set; }
    public string Month { get; set; }
    public string Year { get; set; }

    public string Title { get; set; }
    public string SubTitle { get; set; }
    public string FullName { get; set; }

    [TemplateContainer(typeof(Container))]
    [PersistenceMode(PersistenceMode.InnerProperty)]
    public ITemplate ItemTemplate { get; set; }

    public string CssClass { get; set; }

    void Page_Init()
    {
        if(ItemTemplate != null)
        {
            Container container = new Container();
            ItemTemplate.InstantiateIn(container);
            itemTemplate.Controls.Add(container);
        }
    }

    public class Container : Control, INamingContainer
    {
        internal Container()
        {
        }
    }
</script>

<div class="<%= CssClass %> text-center">
    <asp:PlaceHolder runat="server" ID="itemTemplate"></asp:PlaceHolder>
    <div>
        <label class="d-block mb-0 h4"><%= Title %></label>
        <span class="text-primary"><%= SubTitle %></span>
    </div>
    <div style="margin-top: 100px"><%= FullName %></div>
</div>