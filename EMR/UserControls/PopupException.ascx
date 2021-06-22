<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupException.ascx.cs" Inherits="EMR.UserControls.PopupException" %>

<div id="PopupException" runat="server" class="modal fade in" role="dialog" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <h4>Something went wrong</h4>
                <asp:Label runat="server" ID="lbl_msg"></asp:Label>
                <div>
                    <asp:LinkButton CssClass="btn btn-primary waves-effect" runat="server" ID="btnStayLoggedIn">Contact IT</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</div>