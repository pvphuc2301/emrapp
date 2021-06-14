<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextField1.ascx.cs" Inherits="EMR.UserControls.TextField1" ClientIDMode="Static" %>


<asp:PlaceHolder runat="server" ID="TextFieldPlaceHolder">
    <div spellcheck="false" style="height: auto; text-align: left; display: inline-block;" class="form-control" id="DisplayControl"  contenteditable='true' runat="server"></div>

    <div class="input-group-append">
        <span class="input-group-text" runat="server" id="basicAddon2"></span>
    </div>
</asp:PlaceHolder>
<%--<div class="input-group" style="place-self: flex-start;">
    <input type="text"  runat="server" id="TextField_Wrapper"  placeholder="" aria-label="Recipient's username" aria-describedby="" class="form-control text-right" />
    <div class="input-group-append">
    <span class="input-group-text" runat="server" id="basicAddon2"></span>
    </div>
</div>--%>