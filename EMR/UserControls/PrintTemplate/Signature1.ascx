<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Signature1.ascx.cs" Inherits="EMR.UserControls.PrintTemplate.Signature1" %>

<asp:Panel runat="server" id="signature">
    <div style="margin-bottom: 100px;">
        <div runat="server" id="prt_dateTime"></div>
        <label class="d-block" runat="server" id="prt_title"></label>
        <span class="text-primary" runat="server" id="prt_supTitle"></span>
    </div>
    <asp:Label runat="server" ID="prt_fullname"></asp:Label>
</asp:Panel>