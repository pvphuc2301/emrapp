<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageWidthAjax.aspx.cs" Inherits="EMR.Other.PageWidthAjax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <%=DateTime.Now %>
        <br />
        <asp:ScriptManager ID="scr" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <%=DateTime.Now %>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btn" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:Button ID="btn" runat="server" Text="Click Me" />
    </div>
    </form>
</body>
</html>
