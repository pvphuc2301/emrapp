<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PatientLabel1.ascx.cs" Inherits="EMR.UserControls.PrintTemplate.PatientLabel1" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>

<div style="width: 200px; text-align: center">
    <asp:Label runat="server" ID="lbl_fullname"></asp:Label> 
    <asp:Label runat="server" ID="lbl_gender"></asp:Label>

    <asp:Label CssClass="d-block" runat="server" ID="lbl_DOB"></asp:Label> 
     
    <webUI:Barcode runat="server" ID="Barcode" Width="100" Height="22" />
    <asp:Label runat="server" ID="lbl_vpid" CssClass="d-block"></asp:Label>
</div>