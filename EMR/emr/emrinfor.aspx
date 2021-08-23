<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emrinfor.aspx.cs" Inherits="EMR.emrinfor" %>

<%@ Register Src="~/icons/Envelope.ascx" TagPrefix="icon" TagName="Envelope" %>
<%@ Register Src="~/icons/ChatRight.ascx" TagPrefix="icon" TagName="ChatRight" %>
<%@ Register Src="~/icons/Person.ascx" TagPrefix="icon" TagName="Person" %>
<%@ Register Src="~/icons/CaretDown.ascx" TagPrefix="icon" TagName="CaretDown" %>
<%@ Register Src="~/icons/Gear.ascx" TagPrefix="icon" TagName="Gear" %>
<%@ Register Src="~/icons/InfoCircle.ascx" TagPrefix="icon" TagName="InfoCircle" %>
<%@ Register Src="~/icons/BoxArrowInLeft.ascx" TagPrefix="icon" TagName="BoxArrowInLeft" %>
<%@ Register Src="~/icons/X.ascx" TagPrefix="icon" TagName="X" %>
<%@ Register Src="~/icons/House.ascx" TagPrefix="icon" TagName="House" %>
<%@ Register Src="~/icons/GeoAlt.ascx" TagPrefix="icon" TagName="GeoAlt" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="../images/aih.ico"/>
    <%--<link href="../styles/html5reset-1.6.1.css" rel="stylesheet" />--%>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <%--<link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../style/style-custom.css" rel="stylesheet" />--%>
    <style>
        
        #RadMultiPage1 {
            height: calc(100vh - 94px);
        }

        .tooltip1 {
            position: relative;
        }

        .tooltip__item {
            position: fixed;
            min-width: 100px;
            padding: 20px;
            visibility: hidden;
            opacity: 0;
            background: white;
            transition: all .250s cubic-bezier(0, 0, 0.2, 1);
            color: #484848;
            border: 1px solid #cecece;
            border-radius: 3px;
            font-weight: 500;
            box-shadow: 0 2px 1px #bcbcbc;
            z-index: 1000;
        }

        /*.tooltip__item:before {
            content: "";
              display: block;
              position: absolute;
              width: 0;
              height: 0;
              border-style: solid;
        }*/

        .tooltip__initiator {
            cursor: pointer;
            z-index: 5;
        }

            .tooltip__initiator:hover ~ .tooltip__item {
                /*transform: translate3d(0, -50%, 0);*/
                visibility: visible;
                opacity: 1;
                transform: translate(5px, 50%) scale(1);
            }

        .tooltip__item {
            top: 50%;
            left: calc(100% + 1em);
            transform: translate3d(15px, -50%, 0);
        }

        .RadTabStrip .rtsTxt {
            font-weight: 600;
        }

        .RadTabStrip_Silk .rtsLevel1 .rtsSelected .rtsLink {
            background-image: none !important;
            background-color: #fff !important;
            color: #337ab7 !important;
        }

        .RadTabStrip_Silk .rtsLevel1 .rtsSelected .rtsLink:before {
            color: #337ab7 !important;
            border-color: #337ab7 !important;
        }

        .RadTabStrip_Silk .rtsLevel1 .rtsLink {
            background-color: #F7F7F7 !important;
            background-image: none !important;
        }

        .RadTabStrip_Silk .rtsLevel1 .rtsHovered .rtsLink {
            background-color: #F0F0F0 !important;
        }
    </style>
</head>
<body onload="bodyOnloadHandler()">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="progress" style="position: fixed;top:0;left:0;right:0;z-index:1000;" >
          <div id="myProgress" class="progress-bar progress-bar-animated progress progress-bar-striped" role="progressbar" style="width: 0%; height: 4px;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <header class="topbar" style="border-bottom: 4px solid #edf1f5;">
            <nav class="navbar top-navbar navbar-expand-md navbar-white bg-white border-bottom-2 border-darkgrey">
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav d-none d-lg-flex" style="background-color: #edf1f5; padding-left: 24px;">
                        <!-- This is  -->
                        <li class="nav-item"><a class="nav-link" runat="server" id="lblPatientInfo"></a></li>
                        <li class="nav-item ml-2">
                            <asp:LinkButton ToolTip="Close" CssClass="nav-link btn-icon" Text="X" runat="server" ID="LinkDemographicSearch" OnClick="LinkDemographicSearch_Click" />
                            <%--<a runat="server" id="linkDemographicSearch" onclick="headerDisplay.style.display='';leftMenuWidth.style.width='180px';" class="nav-link btn-icon" title="">
                                <icon:X runat="server"/>
                            </a>--%>
                        </li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                    </ul>

                    <a class="nav-link btn-link dropdown-toggle waves-effect waves-primary d-lg-none" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <icon:Person runat="server" id="Person1" /><asp:Label runat="server" ID="lblPID" CssClass="ml-2"></asp:Label>
                    </a>

                    <ul class="navbar-nav d-none d-lg-flex ml-2">
                        <li><a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                            <asp:image ID="Image1" runat="server" Height="16" Width="16" Visible="false" /></a></li>
                        <li><a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                            <asp:image ID="Image2" runat="server" Height="16" Width="16" Visible="false" /></a></li>
                        <li><a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                            <asp:image ID="Image3" runat="server" Height="16" Width="16" Visible="false" /></a></li>
                        <li><a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                            <asp:image ID="Image4" runat="server" Height="16" Width="16" Visible="false" /></a></li>
                        <li><a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                            <asp:image ID="Image5" runat="server" Height="16" Width="16" Visible="false" /></a></li>
                        <li><a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                            <asp:image ID="Image6" runat="server" Height="16" Width="16" Visible="false" /></a></li>
                        <li><a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                            <asp:image ID="Image7" runat="server" Height="16" Width="16" Visible="false" /></a></li>
                        <li><a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                            <asp:image ID="Image8" runat="server" Height="16" Width="16" Visible="false" /></a></li>
                        <li><a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                            <asp:image ID="Image9" runat="server" Height="16" Width="16" Visible="false" /></a></li>
                        <li><a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                            <asp:image ID="Image10" runat="server" Height="16" Width="16" Visible="false" /></a></li>
                    </ul>

                    <ul class="navbar-nav my-lg-0 ml-auto">
                        <li class="nav-item dropdown"><asp:LinkButton CssClass="nav-link btn-link waves-effect waves-primary" runat="server" ID="btnHome" OnClick="btnHome_Click" ><icon:House runat="server" ID="House" /></asp:LinkButton>
                        </li>

                        <li runat="server" id="patientLinked" class="nav-item dropdown">
                            <a class="nav-link btn-link  waves-effect waves-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">&#9903;
                                <asp:Label runat="server" ID="Label1"></asp:Label>
                            </a>
                            <div runat="server" id="pidList" class="dropdown-menu dropdown-menu-right animated flipInY" aria-labelledby="btnGroupDrop1">
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link btn-link  waves-effect waves-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="text-primary"><icon:GeoAlt runat="server" ID="GeoAlt" /></span>
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
                                <span class="text-primary"><icon:Person runat="server"/></span>
                                <asp:Label ID="lblUserName" runat="server">No Name</asp:Label>
                                <span class="hidden-md-down text-primary">&nbsp;<icon:CaretDown runat="server" id="CaretDown" /></span>
                            </a>

                            <%--<a class="nav-link btn-link dropdown-toggle waves-effect waves-primary d-lg-none" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <icon:Person runat="server" id="Person" />
                            </a>--%>

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
                                <a class="dropdown-item" runat="server" id="btnLogout" onserverclick="btnLogout_ServerClick">
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
        
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1"  MultiPageID="RadMultiPage1" SelectedIndex="0"
             OnTabClick="RadTabStrip1_TabClick" Skin="Silk" >
            <Tabs>
                <telerik:RadTab Text="Patient Summary" Value="PatientSummary" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="Order Printing" Value="orderprint" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="OPD Prescription" Value="opdprescription" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="MAR Printing" Value="marprinting" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="Medication History" Value="rxhistory" Width="200px"></telerik:RadTab>

            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0">
            <telerik:RadPageView id="PatientSummary" runat="server"></telerik:RadPageView>
            <telerik:RadPageView id="OrderList" runat="server"></telerik:RadPageView>
            <telerik:RadPageView id="OpdPrescription" runat="server"></telerik:RadPageView>
            <telerik:RadPageView id="MARPrinting" runat="server"></telerik:RadPageView>
            <telerik:RadPageView id="RxHistory" runat="server"></telerik:RadPageView>
        </telerik:RadMultiPage>

        <div id="tooltip__item" class="tooltip__item">
            <table>
                <tbody>
                    <tr>
                        <th colspan="2" class="title mb-2 font-bold"></th>
                    </tr>
                    <tr>
                        <td style="width: 90px;">Category</td>
                        <td class="category"></td>
                    </tr>
                    <tr>
                        <td>Author</td>
                        <td class="author"></td>
                    </tr>
                    <tr>
                        <td>Visit</td>
                        <td class="visit"></td>
                    </tr>
                    <tr>
                        <td>Lasted updated</td>
                        <td class="lastedUpdated"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>

    <script>
        window.onload = function () {
            
            let listItem = document.getElementsByClassName("list-item");
            let tooltip1 = document.getElementById("tooltip__item");

            tooltip1.style.position = "fixed";

            tooltip1.style.zIndex = 1000;
            tooltip1.style.visibility = "visible";
            tooltip1.style.opacity = 1;

        }

    </script>

    <script>
        let headerDisplay = window.parent.document.getElementById("header");
        let leftMenuWidth = window.parent.document.getElementById("RadTabStrip2");

        headerDisplay.style.display = "none";
        leftMenuWidth.style.width = "0";

        //var i = 0;
        //var progressWidth = 1;

        var elem = document.getElementById("myProgress");
        progress(elem);

        function OnGridCreated(sender, args) {

            let listItem = document.querySelectorAll(".list-item");
            let tooltip1 = document.getElementById("tooltip__item");

            if (listItem.length > 0) {

                listItem.forEach(item => {
                    item.addEventListener("mouseenter", function (e) {
                        tooltip1.style.top = e.clientY + "px";
                        tooltip1.style.left = e.clientX + "px";
                        tooltip1.style.visibility = "visible";
                        tooltip1.style.opacity = 1;
                        tooltip1.querySelector(".title").innerText = item.getAttribute("data-title");
                        tooltip1.querySelector(".category").innerText = item.getAttribute("data-category");
                        tooltip1.querySelector(".author").innerText = item.getAttribute("data-author");
                        tooltip1.querySelector(".visit").innerText = item.getAttribute("data-visit");
                        tooltip1.querySelector(".lastedUpdated").innerText = item.getAttribute("data-modified-name") + " " + item.getAttribute("data-modified-datetime");
                    })

                    item.addEventListener("mouseleave", function (e) {

                        tooltip1.style.visibility = "hidden";
                        tooltip1.style.opacity = 0;
                    })
                })
            }

        }

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() { }
    </script>
</body>
</html>