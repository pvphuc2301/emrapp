<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AmendReason.ascx.cs" Inherits="EMR.AmendReason" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="Input" TagName="TextField" %>

<div class="row" id="amendReasonBox" runat="server" style="position: sticky;top: 0;z-index: 1000;">
    <div class="col-md-12">
        <div class="card amend-box">
            <div class="card-header">
                <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span><span class="text-danger">*</span></h5>
            </div>
            <div class="card-body">
                <div class="form-group mb-2">
                    <Input:TextField runat="server" ID="txtAmendReason" />
                </div>
                <div id="lblAmendReasonError" class="text-danger" runat="server">* Nội dung lý do thay đổi phải trên 3 ký tự</div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    if (document.getElementsByClassName("scroll-sidebar").length > 0 && document.getElementsByClassName("amend-box").length > 0) {
        document.getElementsByClassName("scroll-sidebar")[0].onscroll = function () {
            try {
                if (this.scrollTop > 20) {
                    document.getElementsByClassName("amend-box")[0].classList.add('shadow');
                    document.getElementsByClassName("amend-box")[0].style.margin = '0';
                } else {
                    document.getElementsByClassName("amend-box")[0].classList.remove('shadow');
                    document.getElementsByClassName("amend-box")[0].style.margin = '12px';
                }
            } catch (err) { }
        }
    }
    document.getElementById('<%= txtAmendReason.ClientID %>_DisplayControl').addEventListener("input", function () {
        if (this.innerText.length < 3) {
            if (document.getElementById("btnComplete").disabled != undefined) document.getElementById("btnComplete").setAttribute("disabled", "disabled");
        } else { document.getElementById("btnComplete").removeAttribute("disabled") }
    })
</script>
