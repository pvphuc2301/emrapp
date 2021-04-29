<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextField.ascx.cs" Inherits="EMR.TextField" %>

<input type="hidden" name="txtChiefComplaint"  id="InputControl" runat="server">
<div spellcheck="false" style="height: auto; text-align: left; display: block;" class="form-control" id="DisplayControl" contenteditable='true' runat="server"></div>

<script>
    document.getElementById('<%= DisplayControl.ClientID %>').addEventListener('blur', function (e) {
        document.getElementById('<%= InputControl.ClientID %>').value = this.innerHTML;
    });
</script>
