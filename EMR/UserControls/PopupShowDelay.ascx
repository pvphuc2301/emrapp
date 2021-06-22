<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupShowDelay.ascx.cs" Inherits="EMR.UserControls.PopupShowDelay" %>
<div class="modal fade" id="PopupShowDelay" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <h4>Automactic Inactivity Logout</h4>
                <p>You will be logged out soon.</p>
                <h4 id="timeleft" class="text-center">15</h4>
                <div>
                    <asp:LinkButton CssClass="btn btn-primary waves-effect" runat="server" OnClientClick="stayLoggedIn()" ID="btnStayLoggedIn" OnClick="Page_Load">Stay Logged In</asp:LinkButton>
                    <div class="btn btn-outline-default waves-effect form-edit" onclick="location.replace('http://localhost:4200/login.aspx?ReturnUrl=/Dashboard.aspx?')">Logout</div>
                </div>
            </div>
        </div>
    </div>
</div>
