<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrtRowS1.ascx.cs" Inherits="EMR.UserControls.PrintTemplate.PrtRowS1" %>

<asp:Panel CssClass="prt-row-s1" runat="server" ID="prtRowS1Wraper">
    <asp:Label runat="server" CssClass="prt-order" ID="prt_order" />
    <asp:Panel runat="server" id="prt_content">
        <asp:Label CssClass="prt-title" runat="server" ID="prt_title" />
        <asp:Label CssClass="prt-subtitle" Style="line-height: 12px; margin-bottom: 2px;" runat="server" ID="prt_subtitle" />
    </asp:Panel>
    <asp:Label CssClass="prt-value ml-2" runat="server" ID="prt_value"/>
</asp:Panel>    