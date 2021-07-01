<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emr.aspx.cs" Inherits="EMR.emr.emr" %>
<%@ Register Src="~/icons/Envelope.ascx" TagPrefix="icon" TagName="Envelope" %>
<%@ Register Src="~/icons/ChatRight.ascx" TagPrefix="icon" TagName="ChatRight" %>
<%@ Register Src="~/icons/Person.ascx" TagPrefix="icon" TagName="Person" %>
<%@ Register Src="~/icons/CaretDown.ascx" TagPrefix="icon" TagName="CaretDown" %>
<%@ Register Src="~/icons/Gear.ascx" TagPrefix="icon" TagName="Gear" %>
<%@ Register Src="~/icons/InfoCircle.ascx" TagPrefix="icon" TagName="InfoCircle" %>
<%@ Register Src="~/icons/BoxArrowInLeft.ascx" TagPrefix="icon" TagName="BoxArrowInLeft" %>
<%@ Register Src="~/icons/X.ascx" TagPrefix="icon" TagName="X" %>
<%@ Register Src="~/icons/House.ascx" TagPrefix="icon" TagName="House" %>

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
    <style>
        #RadMultiPage1 {
            height: calc(100vh - 94px);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="topbar">
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
                            <a runat="server" href="~/Dashboard.aspx" class="nav-link btn-icon" title="close patient's details">
                                <icon:X runat="server"/>
                            </a>
                        </li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                    </ul>
                    <ul class="navbar-nav d-none d-lg-flex">                        
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
                        <%--<li class="nav-item dropdown">
                            <a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                                <icon:House runat="server" ID="House" />
                            </a>
                        </li>--%>
                        <li class="nav-item dropdown">
                            <a class="nav-link btn-link  waves-effect waves-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                 <icon:House runat="server" ID="House1" />
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
             OnTabClick="RadTabStrip1_TabClick" >
            <Tabs>
                <telerik:RadTab Text="Patient Summary" Value="PatientSummary" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="Order Printing" Value="orderprint" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="OPD Prescription" Value="opdprescription" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="MAR Printing" Value="marprinting" Width="200px"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>

        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0">
            <telerik:RadPageView id="EmrInfo" ContentUrl="emrinfor.aspx" runat="server"></telerik:RadPageView>
            <telerik:RadPageView id="OrderList" runat="server"></telerik:RadPageView>
            <telerik:RadPageView id="OpdPrescription" runat="server"></telerik:RadPageView>
        </telerik:RadMultiPage>
    </form>
</body>
</html>
