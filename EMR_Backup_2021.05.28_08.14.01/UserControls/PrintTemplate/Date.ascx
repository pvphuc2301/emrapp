<%@ Control Language="C#" ClassName="Date" %>
<%@ Import Namespace="EMR.UserControls" %>
<%@ Import Namespace="System.ComponentModel"  %>
<script runat="server">

    public string Day { get; set; }
    public string Month { get; set; }
    public string Year { get; set; }

    public string CssClass { get; set; }

    void Page_Init()
    {
    }
</script>

<div class='<%= CssClass %>'>
    <div class="d-inline-block" runat="server" id="lblDay">
        <div class="d-inline-block">
            <label class="d-block mb-0 h4">Ngày</label>
            <span class="text-primary">Day</span>
        </div>
        <div class="d-inline-block align-top h4" style="width: 30px"><%= Day %></div>
    </div>
    <div class="d-inline-block" runat="server" id="lblMonth">
        <div class="d-inline-block">
            <label class="d-block mb-0 h4">tháng</label>
            <span class="text-primary">month</span>
        </div>
        <div class="d-inline-block align-top h4" style="width: 30px"><%= Month %></div>
    </div>
    <div class="d-inline-block" runat="server" id="lblYear">
        <div class="d-inline-block">
            <label class="d-block mb-0 h4">năm</label>
            <span class="text-primary">year</span>
        </div>
        <div class="d-inline-block align-top h4" style="width: 45px"><%= Year %></div>
    </div>
</div>
