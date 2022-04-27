<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImagingTab.aspx.cs" Inherits="EMR.ImagingTab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="TabStyle.css" />
    <%--<style>
        #RadTabStrip1 .rtsLI {
            height: 33px;
            text-align: left;
            overflow: hidden;
        }
    </style>--%>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="false" />
    <div class="demo-container no-bg">
        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel1" Skin="MetroTouch"></telerik:RadAjaxLoadingPanel>
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
        <div style="display: flex;">
            <div id="tabstrip_wrapper">
                <telerik:RadTabStrip RenderMode="Lightweight" OnClientTabSelecting="onTabSelecting" ID="RadTabStrip1" SelectedIndex="0" runat="server" 
                    MultiPageID="RadMultiPage1" Skin="MetroTouch" Align="Justify" Orientation="VerticalLeft" OnTabClick="RadTabStrip1_TabClick">
                </telerik:RadTabStrip>
            </div>
            
            <%--<div class="recipeImage qsf-ib">--%>
                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" OnPageViewCreated="RadMultiPage1_PageViewCreated">
                </telerik:RadMultiPage>
            <%--</div>--%>
        </div>
        <div id="cardcontent"  class="card" style="position: fixed; padding: 10px;"></div>
    </div>  
    </form>

    <%--<script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>--%>
    <script src="../scripts/myScript.js"></script>
    <%--<script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/alertify.js"></script>--%>

     <script>

         loadtitle();

         function beforeAsyncPostBack() {
             //var curtime = new Date();
         }

         function afterAsyncPostBack() {
             loadtitle();
         }

         function loadtitle() {
             let rtsLink = document.getElementsByClassName("rtsLink");
             let cardcontent = document.getElementById("cardcontent");

             for (let i = 0; i < rtsLink.length; i++) {
                 rtsLink[i].addEventListener("mouseover", function (e) {

                     cardcontent.hidden = "";
                     cardcontent.innerHTML = rtsLink[i].innerHTML;
                     cardcontent.style.top = e.clientY + 'px';
                     cardcontent.style.left = e.clientX + "px";
                 });

                 rtsLink[i].addEventListener("mouseout", function (e) {
                     cardcontent.hidden = "hidden";
                     cardcontent.innerHTML = "";
                 });
             }
         }

         document.getElementById("tabstrip_wrapper").style.height = window.innerHeight + "px";
         document.getElementById("tabstrip_wrapper").style.overflowY = "scroll";

         document.getElementById("RadMultiPage1Panel").style.height = window.innerHeight + "px";
         document.getElementById("RadMultiPage1Panel").style.width = "100%";
         document.getElementById("RadMultiPage1Panel").style.overflowY = "scroll";
         document.getElementById("RadMultiPage1Panel").style.paddingBottom = "10px";

         let MsoNormal = document.getElementsByTagName("p");
         //.getElementsByClassName("MsoNormal");
         for (let i = 0; i < MsoNormal.length; i++) {
             if (MsoNormal[i].innerText.trim() == "") {
                 MsoNormal[i].setAttribute("style", "display: none");
             }
         }

         function showInfo() {
             let select = document.getElementsByTagName("select");

             console.log(select);

             if (select.length > 0) {
                 let content = select[0].innerHTML;

                 console.log("select");

                 content = "<div class='bg-primary text-white'>MÔ TẢ / FINDINGS:</div>" + content;
                 content = content.replaceAll("&nbsp;-", "<br/>-");
                 content = content.replaceAll("&nbsp;*", "<br/>*");
                 content = content.replace("KẾT LUẬN/ IMPRESSION:", "<div class='bg-primary text-white'>KẾT LUẬN/ IMPRESSION:</div>");
                 content = content.replace("ADDENDUM:", "<div class='bg-primary text-white'>ADDENDUM:</div>");

                 //document.getElementById("fe064fa4-6b4f-4d70-2726-000020fba3d1_userControl_temp_field").innerHTML = content;
                 document.getElementsByClassName("temp_field")[document.getElementsByClassName("temp_field").length - 1].innerHTML = content;
                 console.log(content);
                 //document.getElementById("fe064fa4-6b4f-4d70-2726-000020fba3d1_userControl_findings_field").setAttribute("style", "display: none");
             }
         }
     </script>
</body>
</html>

