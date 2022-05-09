<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalculateAge.aspx.cs" Inherits="EMR.Test.CalculateAge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Days: <asp:Label runat="server" ID="lblDay"></asp:Label> <br />
            Months: <asp:Label runat="server" ID="lblMonth"></asp:Label> <br />
            Years: <asp:Label runat="server" ID="lblYear"></asp:Label> <br />
            Raw age: <asp:Label runat="server" ID="lblRawAge"></asp:Label>
            Age: <asp:Label runat="server" ID="lblAge"></asp:Label>
        </div>
    </form>
</body>
</html>
