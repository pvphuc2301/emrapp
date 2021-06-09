<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrtRowS3.ascx.cs" Inherits="EMR.UserControls.PrintTemplate.PrtRowS3" %>

<asp:Panel CssClass="prt-row-s3" runat="server" ID="prtRowS3Wraper">
    <asp:Label runat="server" CssClass="prt-order font-bold" ID="prt_order" />
    <asp:Panel runat="server" id="prt_content">
        <asp:Label CssClass="prt-title font-bold" runat="server" ID="prt_title" />
        / <asp:Label CssClass="prt-subtitle" runat="server" ID="prt_subtitle" />
    </asp:Panel>
    <asp:Label CssClass="prt-value" runat="server" ID="prt_value" Text="String" />
</asp:Panel>