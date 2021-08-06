<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EMR.Dashboard" Async="true"%>

<%@ Register Src="~/icons/House.ascx" TagPrefix="icon" TagName="House" %>
<%@ Register Src="~/icons/Bell.ascx" TagPrefix="icon" TagName="Bell" %>
<%@ Register Src="~/icons/Person.ascx" TagPrefix="icon" TagName="Person" %>
<%@ Register Src="~/icons/CaretDown.ascx" TagPrefix="icon" TagName="CaretDown" %>
<%@ Register Src="~/icons/Gear.ascx" TagPrefix="icon" TagName="Gear" %>
<%@ Register Src="~/icons/InfoCircle.ascx" TagPrefix="icon" TagName="InfoCircle" %>
<%@ Register Src="~/icons/BoxArrowInLeft.ascx" TagPrefix="icon" TagName="BoxArrowInLeft" %>
<%@ Register Src="~/icons/Envelope.ascx" TagPrefix="icon" TagName="Envelope" %>
<%@ Register Src="~/icons/ChatRight.ascx" TagPrefix="icon" TagName="ChatRight" %>
<%@ Register Src="~/icons/GeoAlt.ascx" TagPrefix="icon" TagName="GeoAlt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="images/aih.ico"/>
    <link href="./styles/style.css" rel="stylesheet" />
    <link href="./styles/myStyle.css" rel="stylesheet" />
    <%--<link href="./styles/style-custom.css" rel="stylesheet" />--%>
    <link href="./styles/telerik-custom.css" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        .rtsImg {
            width: 25px; height: 29px;
        }
        #RadMultiPage2 {
            height: 100vh;
        }
        .RadTabStrip_MetroTouch .rtsLevel1 {
            background: #dee3e7 !important;
        }
        
        .RadTabStrip_MetroTouch .rtsLevel1 .rtsLink {
            background: #dee3e7;
        }

        .RadTabStrip_MetroTouch .rtsSelected .rtsLink {

            background: #004866 !important;
        }
        .RadTabStrip .rtsTxt {
            font-weight: 600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <header class="topbar" id="header" runat="server" style="position: sticky; top: 0; border-bottom: 1px solid #E8E9F0; border-left: 2px solid #E8E9F0;">
                        <nav class="navbar top-navbar navbar-expand-md navbar-white bg-white border-bottom-2 border-darkgrey">
                            <div class="navbar-collapse">
                                <ul class="navbar-nav my-lg-0 ml-auto">
                        <%--<li class="nav-item dropdown">
                            <a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                                <icon:House runat="server" ID="House" />
                            </a>
                        </li>--%>
                        <li class="nav-item dropdown">
                            <a class="nav-link btn-link  waves-effect waves-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 <icon:GeoAlt runat="server" ID="GeoAlt" />
                                <asp:Label runat="server" ID="lbl_location"></asp:Label>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right animated flipInY" aria-labelledby="btnGroupDrop1">
                                <a runat="server" onclick="__doPostBack('location_Change', 'AIH')" id="location_aih" class="dropdown-item disabled" href="javascript:void(0)">
                                    AIH
                                </a>
                                <div class="dropdown-divider m-0"></div>
                                <a runat="server" onclick="__doPostBack('location_Change', 'CLI')" id="location_cli" class="dropdown-item disabled" href="#">
                                    CLI
                                </a>
                            </div>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link btn-link waves-effect waves-primary icon-badge-container" href="../other/sendlogview.aspx?view=mail" title="Mail" target="MainContent">
                                <icon:Envelope runat="server" />
                                <div class="icon-badge">mail</div>
                            </a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link btn-link waves-effect waves-primary icon-badge-container" href="../other/sendlogview.aspx?view=sms" title="SMS" target="MainContent">
                                <icon:ChatRight runat="server" />
                                <div class="icon-badge">sms</div>
                            </a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link btn-link  waves-effect waves-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <icon:Person runat="server"/>
                                <asp:Label ID="lblUserName" runat="server">No Name</asp:Label>
                                <span class="hidden-md-down">&nbsp;<icon:CaretDown runat="server" id="CaretDown" /></span>
                            </a>

                            <a class="nav-link btn-link dropdown-toggle waves-effect waves-primary d-lg-none" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <icon:Person runat="server" id="Person" />
                            </a>

                            <div class="dropdown-menu dropdown-menu-right animated flipInY" aria-labelledby="btnGroupDrop1" style="width: 253px;">
                                <a class="dropdown-item" href="javascript:void(0)">
                                    <icon:Gear runat="server" id="Gear" />
                                    User Settings
                                </a>
                                <div class="dropdown-divider m-0"></div>
                                <a class="dropdown-item" href="#">
                                    <icon:InfoCircle runat="server" id="InfoCircle" />
                                    Help
                                </a>
                                <div class="dropdown-divider m-0"></div>
                                <a class="dropdown-item" href="#">Tiếng Việt</a>
                                <div class="dropdown-divider m-0"></div>
                                <a class="dropdown-item" runat="server" id="btnLogout" onserverclick="btnLogout_Click">
                                    <icon:BoxArrowInLeft runat="server" />
                                    LOGOUT
                                </a>
                                <div class="text-center">
                                    <img width="150" src="../images/AIH_PI_FULL.png" alt="homepage" class="dark-logo" />
                                </div>
                            </div>
                        </li>
                    </ul>
                            </div>
                        </nav>
                    </header>
        
        <div style="display: grid; grid-template-columns: auto 1fr; height:100vh;">
            <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip2"  MultiPageID="RadMultiPage2"
                    Orientation="VerticalLeft" Skin="Silk" Width="190px" SelectedIndex="0">
                    <Tabs>
                        <telerik:RadTab Text="Demographic Search"></telerik:RadTab>
                        <telerik:RadTab Text="Admin"></telerik:RadTab>
                        <telerik:RadTab Text="Allow Update EMR"></telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
            <div>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" CssClass="innerMultiPage">
                    <telerik:RadPageView id="DemographicSearch" runat="server"></telerik:RadPageView>
                    <telerik:RadPageView runat="server" ContentUrl="~/Other/AdminGroup.aspx" ID="RadPageView1"></telerik:RadPageView>
                    <telerik:RadPageView runat="server" ContentUrl="~/Report/AllowUpdateEMR.aspx" ID="PageView2"></telerik:RadPageView>
                </telerik:RadMultiPage>
            </div>
        </div>
        
    </form>

    <script src="scripts/jquery-3.2.1.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script src="scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="scripts/myScript.js"></script>
    <script src="scripts/emrScript.js"></script>
    <script src="scripts/waves.js"></script>

     <script type="text/javascript">

         function beforeAsyncPostBack() {
             var curtime = new Date();
         }

         function afterAsyncPostBack() {
         };
     </script>
</body>
</html>
