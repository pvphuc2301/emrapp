<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emrview.aspx.cs" Inherits="EMR.formview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    <iframe scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:100%; height:5000px;"
        id="filescan" runat="server" visible="true">
    </iframe>
        <asp:image ID="Image1" runat="server" ImageUrl ="formview.aspx?ImageID=1"/>      
    </div>
    </form>
</body>
</html>
