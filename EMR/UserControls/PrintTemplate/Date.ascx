<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Date.ascx.cs" Inherits="EMR.UserControls.PrintTemplate.Date" %>

<div runat="server" id="datetimeContainer">
    <div class="d-inline-block" runat="server" id="lblDay">
        <div class="d-inline-block">
            <label class="d-block mb-0">Ngày</label>
            <span class="text-primary">Day</span>
        </div>
        <asp:Label class="d-inline-block align-top" style="width: 30px" runat="server" id="prt_day"></asp:Label>
    </div>
    <div class="d-inline-block" runat="server" id="lblMonth">
        <div class="d-inline-block">
            <label class="d-block mb-0">tháng</label>
            <span class="text-primary">month</span>
        </div>
        <asp:Label class="d-inline-block align-top" style="width: 30px" runat="server" id="prt_month"></asp:Label>
    </div>
    <div class="d-inline-block" runat="server" id="lblYear">
        <div class="d-inline-block">
            <label class="d-block mb-0">năm</label>
            <span class="text-primary">year</span>
        </div>
        <asp:Label class="d-inline-block align-top" style="width: 45px" runat="server" id="prt_year"></asp:Label>
    </div>
</div>
