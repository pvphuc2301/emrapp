<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PrtGender.ascx.cs" Inherits="EMR.UserControls.PrintTemplate.PrtGender" %>

<div class="prt-gender" runat="server" id="prtGenderWraper">
    <div>
        <asp:Label CssClass="prt-title" runat="server" ID="prt_title" />
        <asp:Label CssClass="prt-subtitle" runat="server" ID="prt_subtitle"/>
    </div>
    <div style="display: grid; grid-template-columns: 100px 100px">
        <table>
            <tr>
                <td><asp:Label runat="server" ID="prt_male" Text="❏" Font-Size="20" /></td>
                <td><asp:Label runat="server" Text="Nam"/></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Label runat="server" CssClass="text-primary" Text="Male"/></td>
            </tr>
        </table>
        <table>
            <tr>
                <td><asp:Label runat="server" ID="prt_female" Text="❏" Font-Size="20" /></td>
                <td><asp:Label runat="server" Text="Nữ"/></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Label runat="server" CssClass="text-primary" Text="Female"/></td>
            </tr>
        </table>
    </div>
</div>