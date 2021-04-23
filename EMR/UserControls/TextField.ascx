<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextField.ascx.cs" Inherits="EMR.TextField" %>

<input name="txtChiefComplaint"  id="InputControl" runat="server">
<div spellcheck="false" style="height: auto; display: inline-block;" class="form-control" id="DisplayControl" contenteditable="true" runat="server"></div>

<script>
    binding_data(document.getElementById('<%= DisplayControl.ClientID %>'), document.getElementById('<%= InputControl.ClientID %>'));
</script>
