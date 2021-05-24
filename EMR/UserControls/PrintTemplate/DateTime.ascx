
<%@ Control Language="C#" ClassName="DateTime" %>
<%@ Import Namespace="EMR.UserControls" %>
<%@ Import Namespace="System.ComponentModel"  %>
<script runat="server">

    public int Hour { get; set; }
    public int Minute { get; set; }
    public int Day { get; set; }
    public int Month { get; set; }
    public int Year { get; set; }

    public string CssClass { get; set; }

    void Page_Init()
    {
    }
</script>

<div class='<%= CssClass %>'>
    <div class="d-inline-block" runat="server" id="lblHour">
        <div class="d-inline-block align-top h4" style="width: 30px"><%= Hour %></div>
        <div class="d-inline-block">
            <label class="d-block mb-0 h4">giờ</label>
            <span class="text-primary">hour</span>
        </div>
    </div>
    <div class="d-inline-block" runat="server" id="lblMinute">
        <div class="d-inline-block align-top h4" style="width: 30px"><%= Minute %></div>
        <div class="d-inline-block">
            <label class="d-block mb-0 h4">phút,</label>
            <span class="text-primary">minutes,</span>
        </div>
    </div>
    <div class="d-inline-block" runat="server" id="lblDay">
        <div class="d-inline-block">
            <label class="d-block mb-0 h4">ngày</label>
            <span class="text-primary">day</span>
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

