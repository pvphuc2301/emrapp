<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Message.ascx.cs" Inherits="EMR.Message" %>

<style>
    .message-box {
        transition: all .5s ease-in-out;
        position: fixed;
        top: 12px;
        right: 12px;
    }
</style>

<div class="message-box" id="messageBox" runat="server">
    <div id="alertType" runat="server">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle mr-2" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
            <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
        </svg>
        <span runat="server" id="messageContent"></span>
    </div>
</div>

<script>
    let alertbox = document.getElementsByClassName("message-box")[0];

    setTimeout(function () {
        alertbox.style.top = "-60px";
    }, '<%= timeout %>');

    setTimeout(function () {
        alertbox.remove();
    }, '<%= timeout + 1000 %>');

</script>