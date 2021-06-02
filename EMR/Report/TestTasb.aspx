<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestTasb.aspx.cs" Inherits="EMR.Report.TestTasb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="Style1.css" />
</head>
<body>
<form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="false" />
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
        <div class="demo-container no-bg size-narrow">
            <div class="demo-content">
                <h2>TabStrip representing different types of orientation.</h2>
                <telerik:RadTabStrip RenderMode="Lightweight" OnClientTabSelecting="onTabSelecting" ID="RadTabStrip1" SelectedIndex="0" 
            runat="server" MultiPageID="RadMultiPage1" Skin="MetroTouch" Width="100%" Align="Justify" Orientation="VerticalLeft"
            OnTabClick="RadTabStrip1_TabClick">
        </telerik:RadTabStrip>
        <div class="recipeImage qsf-ib">
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="multiPage"
            OnPageViewCreated="RadMultiPage1_PageViewCreated">
        </telerik:RadMultiPage>             
            </div>
        </div>
    </telerik:RadAjaxPanel>
    

    </form>
</body>
</html>
