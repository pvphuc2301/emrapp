<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AmendReason.ascx.cs" Inherits="EMR.AmendReason" %>
<div class="row" id="amendReasonBox" runat="server" style="position: fixed; top: 0;">
    <div class="col-md-12">
        <div class="card amend-box">
            <div class="card-header">
                <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span><span class="text-danger">*</span></h5>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <input id="txtAmendReason" class="contenteditable" runat="server" value="" />
                </div>
                <div id="lblAmendReasonError" class="text-danger" runat="server">Nội dung lý do thay đổi phải trên 3 ký tự</div>
            </div>
            <button onserverclick="close_ServerClick" class="btn" runat="server" id="close">Close</button>
        </div>
    </div>
</div>

<script>
    if (document.getElementsByClassName("scroll-sidebar").length > 0 && document.getElementsByClassName("amend-box").length > 0) {
        document.getElementsByClassName("scroll-sidebar")[0].onscroll = function () {
            if (this.scrollTop > 20) {
                document.getElementsByClassName("amend-box")[0].classList.add('shadow');
                document.getElementsByClassName("amend-box")[0].style.margin = '0';
            } else {
                document.getElementsByClassName("amend-box")[0].classList.remove('shadow');
                document.getElementsByClassName("amend-box")[0].style.margin = '12px';
            }
        }
    }
</script>
