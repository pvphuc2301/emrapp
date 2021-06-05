<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabTab.aspx.cs" Inherits="EMR.Report.LabTab" %>

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
<telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="MetroTouch">
        </telerik:RadAjaxLoadingPanel>
        <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" EnablePageHeadUpdate="true">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadTabStrip1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadTabStrip1"></telerik:AjaxUpdatedControl>
                        <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" LoadingPanelID="LoadingPanel1"></telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="RadMultiPage1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadMultiPage1"></telerik:AjaxUpdatedControl>
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
        <script type="text/javascript">
            /* <![CDATA[ */
            function onTabSelecting(sender, args) {
 
                if (args.get_tab().get_pageViewID()) {
                    args.get_tab().set_postBack(false);
                }
            }
            /* ]]> */
        </script>
        <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip1"  MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk" 
            OnClientTabSelecting="onTabSelecting" OnTabClick="RadTabStrip1_TabClick">
                <Tabs>
                    <telerik:RadTab Text="BIOCHEMISTRY" Value="BIOCHEMISTRY" Width="200px"></telerik:RadTab>
                    <telerik:RadTab Text="HEMATOLOGY" Value="HEMATOLOGY" Width="200px"></telerik:RadTab>
                    <telerik:RadTab Text="MICROBIOLOGY" Value="MICROBIOLOGY" Width="200px"></telerik:RadTab>
                    <telerik:RadTab Text="All" Value="All" Width="200px"></telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" OnPageViewCreated="RadMultiPage1_PageViewCreated">
            
        </telerik:RadMultiPage>

       <%-- <telerik:RadTabStrip RenderMode="Lightweight" OnClientTabSelecting="onTabSelecting" ID="RadTabStrip1" SelectedIndex="0" 
            runat="server" MultiPageID="RadMultiPage1" Width="100%" Skin="Silk" Orientation="HorizontalTop"
            OnTabClick="RadTabStrip1_TabClick" ScrollChildren="true">
        </telerik:RadTabStrip>
        <div class="recipeImage qsf-ib">
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" 
            OnPageViewCreated="RadMultiPage1_PageViewCreated" ScrollBars="Auto">
        </telerik:RadMultiPage>--%>
            </div>  
    </form>
</body>
</html>
