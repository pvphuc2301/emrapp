<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Message.ascx.cs" Inherits="EMR.Message" %>
<%@ Register Src="~/icons/X.ascx" TagPrefix="uc1" TagName="X" %>
<%@ Register Src="~/icons/CheckCircle.ascx" TagPrefix="uc1" TagName="CheckCircle" %>

<style>
    .message-box {
        transition: all .5s ease-in-out;
        /*position: fixed;
        top: 12px;
        right: 12px;*/
    }
</style>

<div class="card message-box" id="messageBox" runat="server">
    <div class="card-body" id="alertType" style="display: flex;" runat="server">
        <uc1:CheckCircle runat="server"/>
        <span style="flex-grow: 1; align-items: center;" runat="server" id="messageContent"></span>
        <a href="javascript:void(0)" onclick="document.getElementsByClassName('message-box')[0].remove()">
            <uc1:X runat="server" ID="X" />
        </a>
    </div>
</div>

<script>
    let alertbox = document.getElementsByClassName("message-box")[0];
    if ('<%= timeout %>' != '0') {
        setTimeout(function () {
            alertbox.style.top = "-60px";
        }, '<%= timeout %>');

        setTimeout(function () {
            alertbox.remove();
        }, '<%= timeout + 1000 %>');
    }

</script>