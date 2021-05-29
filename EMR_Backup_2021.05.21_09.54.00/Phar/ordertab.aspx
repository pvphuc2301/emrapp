<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ordertab.aspx.cs" Inherits="EMR.Phar.ordertab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="false" />
    <div class="demo-container no-bg">
        <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip1"  MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk">
            <Tabs>
                <telerik:RadTab Text="Order Printing" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="MAR Printing" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="OPD Prescription" Width="200px"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1"  SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="RadPageView1" ContentUrl="orderlist.aspx">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RadPageView2" ContentUrl="marprinting.aspx">
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" Height="300px" ID="RadPageView3">
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </div>  
    </form>
</body>
</html>
