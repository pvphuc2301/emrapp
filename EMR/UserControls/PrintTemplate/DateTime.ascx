<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DateTime.ascx.cs" Inherits="EMR.UserControls.PrintTemplate.DateTime" %>

<div runat="server" id="datetimePanel">
    <div class="d-inline-block" runat="server" id="lblHour">
        <asp:Label class="d-inline-block align-top text-left" style="width: 20px" runat="server" id="prt_hour"></asp:Label>
        <div class="d-inline-block">
            <label class="d-block mb-0">giờ</label>
            <span class="text-primary">hour</span>
        </div>
    </div>
    <div class="d-inline-block" runat="server" id="lblMinute">
        <asp:Label class="d-inline-block align-top text-left" style="width: 20px" runat="server" id="prt_minute"></asp:Label>
        <div class="d-inline-block">
            <label class="d-block mb-0">phút,</label>
            <span class="text-primary">minutes,</span>
        </div>
    </div>
    <div class="d-inline-block" runat="server" id="lblDay">
        <div class="d-inline-block">
            <label class="d-block mb-0">ngày</label>
            <span class="text-primary">day</span>
        </div>
        <asp:Label class="d-inline-block align-top text-center" style="width: 20px" runat="server" id="prt_day"></asp:Label>
    </div>
    <div class="d-inline-block" runat="server" id="lblMonth">
        <div class="d-inline-block">
            <label class="d-block mb-0">tháng</label>
            <span class="text-primary">month</span>
        </div>
        <asp:Label class="d-inline-block align-top text-center" style="width: 20px" runat="server" id="prt_month"></asp:Label>
    </div>
    <div class="d-inline-block" runat="server" id="lblYear">
        <div class="d-inline-block">
            <label class="d-block mb-0">năm</label>
            <span class="text-primary">year</span>
        </div>
        <asp:Label class="d-inline-block align-top text-center" style="width: 35px" runat="server" id="prt_year"></asp:Label>
    </div>
</div>