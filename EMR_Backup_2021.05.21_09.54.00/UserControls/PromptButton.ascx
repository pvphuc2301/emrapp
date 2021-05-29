<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PromptButton.ascx.cs" Inherits="EMR.PromptButton" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="Input" TagName="TextField" %>

<style>

    .modal1 {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      padding-top: 100px; /* Location of the box */
      left: 0;
      top: 0;
      border-radius: 4px;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    .modal1-content {
        background-color: #fefefe;
        margin: auto;
        border: 1px solid #888;
        width: 80%;
    }

</style>

<asp:UpdatePanel ID="upd" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <div class="modal1" id="myModal" runat="server">
            <div class="modal1-content">
                <div class="card-header">
                    <h5><span class="text-primary">Delete document</span></h5>
                </div>
                <div class="card-body">
                    <p runat="server">Please provide reason for deletion</p>
                    <div class="form-group mb-2">
                        <Input:TextField runat="server" ID="txtDeleteReason" />
                    </div>
                    <div id="lblDeleteReason" class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                </div>
                <div class="card-footer">
                    <button id="btnDelete" class="btn btn-danger" runat="server">Delete</button>
                    <button id="btnClose" class="btn btn-secondary" onclick="document.getElementById('<%= myModal.ClientID %>').style.display='none'">Close</button>
                </div>
            </div>
        </div>
    </ContentTemplate>
    <%--<Triggers>
        <asp:AsyncPostBackTrigger ControlID="btn" EventName="Click" />
    </Triggers>--%>
</asp:UpdatePanel>

<div onclick="document.getElementById('<%= myModal.ClientID %>').style.display='block'" class="btn btn-secondary">Delete</div>
