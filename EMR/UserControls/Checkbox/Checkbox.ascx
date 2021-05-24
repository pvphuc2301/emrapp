<%@ Control language="C#" ClassName="Checkbox" %>
<%@ Import Namespace="EMR.UserControls"  %>

<script runat="server">

    public override string ID {
        get {
            return checkbox.ID;
        }
        set
        {
            checkbox.ID = value;
        }
    }

    public string Text { get; set; }

    public bool Checked
    {
        get
        {
            bool s = bool.Parse(ViewState[checkbox.ID].ToString());
            return ((s == true) ? true : false);
        }
        set
        {
            ViewState[checkbox.ID] = value;
        }
    }

    void Page_Load()
    {
        //checkbox.Checked = bool.TryParse(ViewState[checkbox.ID].ToString(), out true);
    }

    public object getCheck()
    {
        var a = checkbox.Checked;

        return null;
    }

    public bool Disabled { get; set; }
</script>

<label class="custom-control custom-checkbox d-inline-block mr-2">
    <input type="checkbox" onchange='<%# this.Checked = !this.Checked %>' class="custom-control-input" runat="server" id="checkbox" />
    <span class="custom-control-label" runat="server" id="label"><%= Text %></span>
</label>