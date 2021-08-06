<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrtRowS2.ascx.cs" Inherits="EMR.UserControls.PrintTemplate.PrtRowS2" %>

<asp:Panel CssClass="prt-row-s2" runat="server" ID="prtRowS2Wraper">
    <asp:Label runat="server" CssClass="prt-order font-bold" ID="prt_order" />
    <asp:Panel runat="server" id="prt_content">
        <asp:Label CssClass="prt-title font-bold" runat="server" ID="prt_title" />
        <asp:Label CssClass="prt-subtitle" Style="line-height: 12px; margin-bottom: 2px;" runat="server" ID="prt_subtitle" />
    </asp:Panel>
    <div style="display: flex; align-items: flex-start;" runat="server" id="options">
    </div>
</asp:Panel>