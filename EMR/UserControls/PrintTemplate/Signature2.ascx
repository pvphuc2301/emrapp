<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Signature2.ascx.cs" Inherits="EMR.UserControls.PrintTemplate.Signature2" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>

<asp:Panel runat="server" id="signature">
    <div style="margin-bottom: 100px;">
        <webUI:Date runat="server" ID="prt_date" />
        <label class="d-block mb-0 mt-2" runat="server" id="prt_title"></label>
        <span class="text-primary" runat="server" id="prt_supTitle"></span>
    </div>
    <asp:Label runat="server" ID="prt_fullname"></asp:Label>
</asp:Panel>