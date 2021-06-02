<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Spinner1.ascx.cs" Inherits="EMR.UserControls.Spinner1" %>
<asp:UpdateProgress ID="UpdateProgress1" DynamicLayout="true" runat="server" >
    <ProgressTemplate>
        <div runat="server" id="Spinner1" class="spinner">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>