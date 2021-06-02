<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PatientLabel1.ascx.cs" Inherits="EMR.UserControls.PrintTemplate.PatientLabel1" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>

<div style="width: 200px;">
    <asp:Label runat="server" ID="lbl_fullname"></asp:Label>
    <div><asp:Label runat="server" ID="lbl_DOB"></asp:Label> | <asp:Label runat="server" ID="lbl_gender"></asp:Label></div>
    <webUI:Barcode runat="server" ID="Barcode" Width="200" Height="40" />
    <asp:Label runat="server" ID="lbl_vpid"></asp:Label>
</div>