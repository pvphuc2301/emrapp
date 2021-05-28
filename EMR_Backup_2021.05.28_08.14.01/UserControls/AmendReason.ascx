<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AmendReason.ascx.cs" Inherits="EMR.AmendReason" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>

<div class="card">
    <div class="card-body">
        <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span><span class="text-danger">*</span></h5>
        <div class="form-group mb-2">
            <aih:TextField runat="server" ID="txtAmendReason" />
        </div>
        <div id="lblAmendReasonError" class="text-danger" runat="server">* Nội dung lý do thay đổi phải trên 3 ký tự</div>
    </div>
</div>

<script type="text/javascript">
    document.getElementById('<%= txtAmendReason.ClientID %>_DisplayControl').addEventListener("input", function () {
        if (this.innerText.length < 3) {
            if (document.getElementById("btnComplete").disabled != undefined) document.getElementById("btnComplete").setAttribute("disabled", "disabled");
        } else { document.getElementById("btnComplete").removeAttribute("disabled") }
    })
</script>
