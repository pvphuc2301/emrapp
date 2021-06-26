<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EMR.Dashboard" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/icons/House.ascx" TagPrefix="icon" TagName="House" %>
<%@ Register Src="~/icons/Bell.ascx" TagPrefix="icon" TagName="Bell" %>
<%@ Register Src="~/icons/Person.ascx" TagPrefix="icon" TagName="Person" %>
<%@ Register Src="~/icons/CaretDown.ascx" TagPrefix="icon" TagName="CaretDown" %>
<%@ Register Src="~/icons/Gear.ascx" TagPrefix="icon" TagName="Gear" %>
<%@ Register Src="~/icons/InfoCircle.ascx" TagPrefix="icon" TagName="InfoCircle" %>
<%@ Register Src="~/icons/BoxArrowInLeft.ascx" TagPrefix="icon" TagName="BoxArrowInLeft" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="./styles/style.css" rel="stylesheet" />
    <link href="./styles/myStyle.css" rel="stylesheet" />
    <link href="./styles/style-custom.css" rel="stylesheet" />
    <link href="./styles/telerik-custom.css" rel="stylesheet" />
</head>
<body class="skin-default fixed-layout">

    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div style="overflow: scroll; height: calc(100vh - 52px); overflow-x: hidden;">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <header class="topbar" style="position: sticky; top: 0; border-bottom: 1px solid #E8E9F0; border-left: 2px solid #E8E9F0;">
                        <nav class="navbar top-navbar navbar-expand-md navbar-white bg-white border-bottom-2 border-darkgrey">
                            <div class="navbar-collapse">
                                <ul class="navbar-nav my-lg-0 ml-auto">
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
                                        <a class="nav-link btn-link waves-effect waves-primary icon-badge-container" href="javascript:void(0)">
                                            <icon:Bell runat="server" ID="Bell" />
                                            <div class="icon-badge">6</div>
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
                    <div class="page-wrapper1 chiller-theme toggled">
                        <main class="page-content" style="height: 100%">
                            <a id="show-sidebar" style="z-index: 998;" class="btn btn-sm btn-sidebar" href="javascript:void(0)"><i class="fas fa-bars"></i></a>
                            <nav id="sidebar" class="sidebar-wrapper">
                                <div class="scroll-sidebar">
                                    <div class="sidebar-content">
                                        <div class="sidebar-brand">
                                            <div id="close-sidebar">
                                                <i class="fas fa-times"></i>
                                            </div>
                                        </div>
                                        <div class="sidebar-menu">
                                            <ul>
                                                <li class="header-menu">
                                                    <span>General</span>
                                                </li>
                                                <li class="sidebar-dropdown">
                                                    <a href="#">
                                                        <i class="fa fa-tachometer-alt"></i>
                                                        <span>Dashboard</span>

                                                    </a>
                                                    <div class="sidebar-submenu">
                                                        <ul>
                                                            <li>
                                                                <a href="#">Dashboard 1
                   
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="#">Dashboard 2</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <li class="header-menu">
                                                    <span>Extra</span>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <i class="fa fa-book"></i>
                                                        <span>Documentation</span>

                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </nav>

                            <asp:UpdatePanel ID="updatePanel_demographicSearch" runat="server" UpdateMode="Always">
                                <ContentTemplate>
                                    <div class="card">
                                        <div class="card-header bg-white">
                                            <h4 class="card-title control-label m-0">
                                                <span class="text-primary">Demographic Search</span>
                                            </h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="input-group mb-3">
                                                    <input type="text" class="form-control" placeholder="Search for PID" aria-label="Search for PID" aria-describedby="basic-addon2" style="max-width: 240px;" runat="server" id="txt_pid" />
                                                    <div class="input-group-append">

                                                        <asp:LinkButton CssClass="btn btn-outline-secondary waves-effect form-edit" runat="server" ID="btnSearch" OnClick="btnSearch_Click">Search</asp:LinkButton>

                                                        </button>
                                                    </div>
                                                    <asp:UpdateProgress ID="updateProgress_demographicSearch" runat="server" AssociatedUpdatePanelID="updatePanel_demographicSearch">
                                                        <ProgressTemplate>
                                                            <div class="loader1 ml-2">
                                                                <div class="loader-wheel"></div>
                                                                <%--<div class="loader-text"></div>--%>
                                                            </div>
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                </div>
                                            <div class="table-responsive">
                                                        <telerik:RadGrid OnSelectedIndexChanged="RadGrid_SelectedIndexChanged" CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid5" runat="server" AllowPaging="True" AllowSorting="true">
                                                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_id, visible_patient_id" ClientDataKeyNames="patient_id">
                                                                <Columns>
                                                                    <telerik:GridBoundColumn SortExpression="visible_patient_id" HeaderText="Patient ID" DataField="visible_patient_id" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                                    </telerik:GridBoundColumn>
                                                                    <telerik:GridBoundColumn SortExpression="patient_name_l" HeaderText="Name" DataField="patient_name_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                                    </telerik:GridBoundColumn>
                                                                    <telerik:GridBoundColumn SortExpression="date_of_birth" HeaderText="Age" DataField="date_of_birth" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                                    </telerik:GridBoundColumn>
                                                                    <telerik:GridBoundColumn SortExpression="gender_e" HeaderText="Gender" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="gender_e" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                                    </telerik:GridBoundColumn>
                                                                    <telerik:GridBoundColumn SortExpression="work_queue_l" HeaderText="Work Queue" DataField="work_queue_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                                    </telerik:GridBoundColumn>
                                                                    <telerik:GridBoundColumn SortExpression="adtending_doctor_l" HeaderText="Attending Doctor" DataField="adtending_doctor_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                                    </telerik:GridBoundColumn>
                                                                    <telerik:GridBoundColumn SortExpression="start_date_time" HeaderText="Visit Date" DataField="start_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                                    </telerik:GridBoundColumn>
                                                                </Columns>
                                                            </MasterTableView>
                                                            <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                                                                <Selecting AllowRowSelect="True" />
                                                            </ClientSettings>
                                                        </telerik:RadGrid>
                                                    </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                                </Triggers>
                            </asp:UpdatePanel>

                            <div class="card">
                                <div class="card-header bg-white">
                                    <h4 class="card-title control-label m-0">
                                        <span class="text-primary">My Outpatient for Today</span>
                                    </h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                                <%--<telerik:RadGrid CssClass="table" BorderWidth="0" OnSelectedIndexChanged="RadGrid_SelectedIndexChanged"
                                                    AutoGenerateColumns="false" ID="RadGrid6" runat="server" AllowPaging="True" OnItemDataBound="RadGrid1_ItemDataBound"
                                                    AllowSorting="true" OnNeedDataSource="RadGrid1_NeedDataSource">
                                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="patient_id, visible_patient_id,patient_visit_id">
                                                        <Columns>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="visible_patient_id"
                                                                HeaderText="Patient ID"
                                                                DataField="visible_patient_id"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                ItemStyle-Font-Bold="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="patient_name_l"
                                                                HeaderText="Name"
                                                                DataField="patient_name_l"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="date_of_birth"
                                                                HeaderText="Age"
                                                                DataField="date_of_birth"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="gender_e"
                                                                HeaderText="Gender"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                DataField="gender_e"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="work_queue_l"
                                                                HeaderText="Work Queue"
                                                                DataField="work_queue_l"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="adtending_doctor_l"
                                                                HeaderText="Attending Doctor"
                                                                DataField="adtending_doctor_l"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true" Visible="false">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="start_date_time"
                                                                HeaderText="Visit Date"
                                                                DataField="start_date_time"
                                                                DataFormatString="{0:dd/MM/yyyy hh:mm tt}"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" ItemStyle-Wrap="false" Visible="true"
                                                                HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457"
                                                                UniqueName="completed" HeaderText="Consult date" SortExpression="visible_patient_id" HeaderStyle-HorizontalAlign="Left">
                                                                <ItemTemplate>
                                                                    <asp:Panel ID="panel1" runat="server">
                                                                        <asp:Button OnClick="btnComplete_Click" Enabled="true" CssClass="btn btn-primary"
                                                                            ID="btnAction" Text="Completed" Width="100%" runat="server" Visible="false" />
                                                                    </asp:Panel>
                                                                    <asp:Label ID="lbCompleted_Date" runat="server" Text='<%#Eval("completed_date_time","{0:dd/MMM/yyyy hh:mm}")%>' />
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                        </Columns>
                                                        <CommandItemSettings ShowAddNewRecordButton="false" />
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                                                        <Selecting AllowRowSelect="True" />
                                                    </ClientSettings>
                                                </telerik:RadGrid>--%>
                                        <telerik:RadGrid CssClass="table" BorderWidth="0" OnSelectedIndexChanged="RadGrid_SelectedIndexChanged"
                                            AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True" OnItemDataBound="RadGrid1_ItemDataBound"
                                            AllowSorting="true" OnNeedDataSource="RadGrid1_NeedDataSource">
                                            <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="patient_id, visible_patient_id,patient_visit_id">
                                                <Columns>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="visible_patient_id"
                                                        HeaderText="Patient ID"
                                                        DataField="visible_patient_id"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        ItemStyle-Font-Bold="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="patient_name_l"
                                                        HeaderText="Name"
                                                        DataField="patient_name_l"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="date_of_birth"
                                                        HeaderText="Age"
                                                        DataField="date_of_birth"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="gender_e"
                                                        HeaderText="Gender"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        DataField="gender_e"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="work_queue_l"
                                                        HeaderText="Work Queue"
                                                        DataField="work_queue_l"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="adtending_doctor_l"
                                                        HeaderText="Attending Doctor"
                                                        DataField="adtending_doctor_l"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="start_date_time"
                                                        HeaderText="Visit Date"
                                                        DataField="start_date_time"
                                                        DataFormatString="{0:dd/MM/yyyy hh:mm tt}"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" ItemStyle-Wrap="false" Visible="true"
                                                        HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457"
                                                        UniqueName="completed" HeaderText="Consult date" SortExpression="visible_patient_id" HeaderStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Panel ID="panel1" runat="server">
                                                                <asp:Button OnClick="btnComplete_Click" Enabled="true" CssClass="btn btn-primary"
                                                                    ID="btnAction" Text="Completed" Width="100%" runat="server" Visible="false" />
                                                            </asp:Panel>
                                                            <asp:Label ID="lbCompleted_Date" runat="server" Text='<%#Eval("completed_date_time","{0:dd/MMM/yyyy hh:mm}")%>' />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                            </div>
                                </div>

                                <%--<div class="card-body" style="padding: 0">
                                    <div class="table-responsive">
                                        <telerik:RadGrid CssClass="table" BorderWidth="0" OnSelectedIndexChanged="RadGrid_SelectedIndexChanged"
                                            AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True" OnItemDataBound="RadGrid1_ItemDataBound"
                                            AllowSorting="true" OnNeedDataSource="RadGrid1_NeedDataSource">
                                            <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="patient_id, visible_patient_id,patient_visit_id">
                                                <Columns>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="visible_patient_id"
                                                        HeaderText="Patient ID"
                                                        DataField="visible_patient_id"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        ItemStyle-Font-Bold="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="patient_name_l"
                                                        HeaderText="Name"
                                                        DataField="patient_name_l"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="date_of_birth"
                                                        HeaderText="Age"
                                                        DataField="date_of_birth"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="gender_e"
                                                        HeaderText="Gender"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        DataField="gender_e"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="work_queue_l"
                                                        HeaderText="Work Queue"
                                                        DataField="work_queue_l"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="adtending_doctor_l"
                                                        HeaderText="Attending Doctor"
                                                        DataField="adtending_doctor_l"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn
                                                        SortExpression="start_date_time"
                                                        HeaderText="Visit Date"
                                                        DataField="start_date_time"
                                                        DataFormatString="{0:dd/MM/yyyy hh:mm tt}"
                                                        ItemStyle-Wrap="false"
                                                        HeaderStyle-Wrap="false"
                                                        HeaderStyle-ForeColor="#457"
                                                        CurrentFilterFunction="Contains"
                                                        FilterDelay="4000"
                                                        ShowFilterIcon="true"
                                                        FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" ItemStyle-Wrap="false" Visible="true"
                                                        HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457"
                                                        UniqueName="completed" HeaderText="Consult date" SortExpression="visible_patient_id" HeaderStyle-HorizontalAlign="Left">
                                                        <ItemTemplate>
                                                            <asp:Panel ID="panel1" runat="server">
                                                                <asp:Button OnClick="btnComplete_Click" Enabled="true" CssClass="btn btn-primary"
                                                                    ID="btnAction" Text="Completed" Width="100%" runat="server" Visible="false" />
                                                            </asp:Panel>
                                                            <asp:Label ID="lbCompleted_Date" runat="server" Text='<%#Eval("completed_date_time","{0:dd/MMM/yyyy hh:mm}")%>' />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                </Columns>
                                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                    </div>
                                </div>
                                <div class="card-footer bg-white py-4"></div>--%>
                            </div>

                            <div class="card">
                                <div class="card-header bg-white">
                                    <h4 class="card-title control-label m-0">
                                        <span class="text-primary">My Appointments for Today</span>
                                    </h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                            <telerik:RadGrid CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid2" runat="server" AllowPaging="True"
                                                ShowHeader="true"
                                                OnItemDataBound="RadGrid2_ItemDataBound" AllowSorting="true" OnNeedDataSource="RadGrid2_NeedDataSource">
                                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_id">
                                                    <Columns>
                                                        <telerik:GridBoundColumn
                                                            SortExpression="visible_patient_id"
                                                            HeaderText="Patient ID"
                                                            DataField="visible_patient_id"
                                                            ItemStyle-Wrap="false"
                                                            HeaderStyle-Wrap="false"
                                                            ItemStyle-Font-Bold="false"
                                                            HeaderStyle-ForeColor="#457"
                                                            CurrentFilterFunction="Contains"
                                                            FilterDelay="4000"
                                                            ShowFilterIcon="true" Visible="false">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridTemplateColumn HeaderButtonType="TextButton" DataField="visible_patient_id" ItemStyle-Wrap="false"
                                                            HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457"
                                                            UniqueName="visible_patient_id" HeaderText="Patient ID" SortExpression="visible_patient_id" HeaderStyle-HorizontalAlign="Center">
                                                            <ItemTemplate>
                                                                <asp:HyperLink ID="LinkHD" runat="server" NavigateUrl='<%# string.Format("/emr/emrinfor.aspx?pid={0}&vbid={1}&action=view",
                                Eval("patient_id"),Eval("visible_patient_id")) %>'
                                                                    Text='<%# Eval("visible_patient_id") %>'>  
                                                                </asp:HyperLink>
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>
                                                        <telerik:GridBoundColumn
                                                            SortExpression="patient_name_l"
                                                            HeaderText="Name"
                                                            DataField="patient_name_l"
                                                            ItemStyle-Wrap="false"
                                                            HeaderStyle-Wrap="false"
                                                            HeaderStyle-ForeColor="#457"
                                                            CurrentFilterFunction="Contains"
                                                            FilterDelay="4000"
                                                            ShowFilterIcon="true"
                                                            FooterStyle-Font-Bold="true">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn
                                                            SortExpression="date_of_birth"
                                                            HeaderText="Age"
                                                            DataField="date_of_birth"
                                                            ItemStyle-Wrap="false"
                                                            HeaderStyle-Wrap="false"
                                                            HeaderStyle-ForeColor="#457"
                                                            CurrentFilterFunction="Contains"
                                                            FilterDelay="4000"
                                                            ShowFilterIcon="true"
                                                            FooterStyle-Font-Bold="true">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn
                                                            SortExpression="gender_e"
                                                            HeaderText="Gender"
                                                            ItemStyle-Wrap="false"
                                                            HeaderStyle-Wrap="false"
                                                            DataField="gender_e"
                                                            HeaderStyle-ForeColor="#457"
                                                            CurrentFilterFunction="Contains"
                                                            FilterDelay="4000"
                                                            ShowFilterIcon="true"
                                                            FooterStyle-Font-Bold="true">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn
                                                            SortExpression="specialty_name_l"
                                                            HeaderText="Specialty"
                                                            DataField="specialty_name_l"
                                                            ItemStyle-Wrap="false"
                                                            HeaderStyle-Wrap="false"
                                                            HeaderStyle-ForeColor="#457"
                                                            CurrentFilterFunction="Contains"
                                                            FilterDelay="4000"
                                                            ShowFilterIcon="true"
                                                            FooterStyle-Font-Bold="true">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn
                                                            SortExpression="employee_name_l"
                                                            HeaderText="Attending Doctor"
                                                            DataField="employee_name_l"
                                                            ItemStyle-Wrap="false"
                                                            HeaderStyle-Wrap="false"
                                                            HeaderStyle-ForeColor="#457"
                                                            CurrentFilterFunction="Contains"
                                                            FilterDelay="4000"
                                                            ShowFilterIcon="true"
                                                            FooterStyle-Font-Bold="true">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn
                                                            SortExpression="appointment_date"
                                                            HeaderText="Appointment Date"
                                                            DataField="appointment_date"
                                                            ItemStyle-Wrap="false"
                                                            HeaderStyle-Wrap="false"
                                                            DataFormatString="{0:dd/MM/yyyy hh:mm tt}"
                                                            HeaderStyle-ForeColor="#457"
                                                            CurrentFilterFunction="Contains"
                                                            FilterDelay="4000"
                                                            ShowFilterIcon="true"
                                                            FooterStyle-Font-Bold="true">
                                                        </telerik:GridBoundColumn>
                                                        <telerik:GridBoundColumn
                                                            SortExpression="visit_date"
                                                            DataFormatString="{0:dd/MM/yyyy hh:mm tt}"
                                                            HeaderText="Visit Date"
                                                            DataField="visit_date"
                                                            ItemStyle-Wrap="false"
                                                            HeaderStyle-Wrap="false"
                                                            HeaderStyle-ForeColor="#457"
                                                            CurrentFilterFunction="Contains"
                                                            FilterDelay="4000"
                                                            ShowFilterIcon="true"
                                                            FooterStyle-Font-Bold="true">
                                                        </telerik:GridBoundColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <ClientSettings EnableRowHoverStyle="true">
                                                    <Selecting AllowRowSelect="True" />
                                                </ClientSettings>
                                            </telerik:RadGrid>
                                        </div>
                                </div>
                            </div>

                            <div class="card">
                                <div class="card-header bg-white">
                                    <h4 class="card-title control-label m-0">
                                        <span class="text-primary">
                                            <asp:LinkButton ID="btn_my_hc" runat="server" Text="My Health Check-up for Today" OnClick="cmd_refresh_hc"></asp:LinkButton>
                                        </span>
                                        <span style="padding-left: 600px">
                                            <a href="#" onclick="javascript:window.open('../report/CompleteVisitReport.aspx?view=hc','mywin','left=60,top=20,width=1300,height=1000,toolbar=0,resizable=0');return false;">My Completed Health Check-up List</a>
                                        </span>
                                    </h4>
                                </div>
                                <div class="card-body" style="padding: 0">
                                    <div class="table-responsive">
                                        <telerik:RadGrid ID="RadGridHC" runat="server" Width="100%" OnNeedDataSource="RadGridHC_NeedDataSource"
                                            AllowSorting="true" AllowFilteringByColumn="false" CssClass="table" BorderWidth="0"
                                            AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false">
                                            <MasterTableView DataKeyNames="visible_patient_id" AllowMultiColumnSorting="True" Width="100%" Name="Master" TableLayout="Fixed"
                                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                                <Columns>
                                                    <telerik:GridTemplateColumn SortExpression="visible_patient_id" HeaderText="PID" HeaderButtonType="TextButton"
                                                        DataField="visible_patient_id" ShowFilterIcon="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbvisible_patient_id" runat="server" Text='<%# Eval("visible_patient_id") %>' />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn SortExpression="patient_name" HeaderText="Last Name" HeaderButtonType="TextButton"
                                                        DataField="patient_name" ShowFilterIcon="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbpatient_name" runat="server" Text='<%# Eval("patient_name") %>' />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="checkin_date" HeaderText="Check-in date" DataField="checkin_date"
                                                        ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true">
                                                <Selecting AllowRowSelect="True" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                    </div>
                                </div>
                                <div class="card-footer bg-white py-4"></div>
                            </div>

                            <div class="row" id="last_customer" runat="server" visible="false">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header bg-white">
                                            <h4 class="card-title control-label m-0">
                                                <span class="text-primary">Last 1 Week</span>
                                            </h4>
                                        </div>
                                        <div class="card-body" style="padding: 0">
                                            <div class="table-responsive">
                                                <telerik:RadGrid CssClass="table" BorderWidth="0" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged"
                                                    AutoGenerateColumns="false" ID="RadGrid3" runat="server" AllowPaging="True"
                                                    OnItemDataBound="RadGrid2_ItemDataBound" AllowSorting="true" OnNeedDataSource="RadGrid3_NeedDataSource">
                                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_id">
                                                        <Columns>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="visible_patient_id"
                                                                HeaderText="Patient ID"
                                                                DataField="visible_patient_id"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                ItemStyle-Font-Bold="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="patient_name_l"
                                                                HeaderText="Name"
                                                                DataField="patient_name_l"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="date_of_birth"
                                                                HeaderText="Age"
                                                                DataField="date_of_birth"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="gender_e"
                                                                HeaderText="Gender"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                DataField="gender_e"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true">
                                                        <Selecting AllowRowSelect="True" />
                                                    </ClientSettings>
                                                </telerik:RadGrid>
                                            </div>
                                        </div>
                                        <div class="card-footer bg-white py-4"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header bg-white">
                                            <h4 class="card-title control-label m-0">
                                                <span class="text-primary">Last 1 Month</span>
                                            </h4>
                                        </div>
                                        <div class="card-body" style="padding: 0">
                                            <div class="table-responsive">
                                                <telerik:RadGrid CssClass="table" BorderWidth="0" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" AutoGenerateColumns="false"
                                                    ID="RadGrid4" runat="server" AllowPaging="True" OnItemDataBound="RadGrid2_ItemDataBound"
                                                    AllowSorting="true" OnNeedDataSource="RadGrid4_NeedDataSource">
                                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_id">
                                                        <Columns>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="visible_patient_id"
                                                                HeaderText="Patient ID"
                                                                DataField="visible_patient_id"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                ItemStyle-Font-Bold="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="patient_name_l"
                                                                HeaderText="Name"
                                                                DataField="patient_name_l"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="date_of_birth"
                                                                HeaderText="Age"
                                                                DataField="date_of_birth"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn
                                                                SortExpression="gender_e"
                                                                HeaderText="Gender"
                                                                ItemStyle-Wrap="false"
                                                                HeaderStyle-Wrap="false"
                                                                DataField="gender_e"
                                                                HeaderStyle-ForeColor="#457"
                                                                CurrentFilterFunction="Contains"
                                                                FilterDelay="4000"
                                                                ShowFilterIcon="true"
                                                                FooterStyle-Font-Bold="true">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true">
                                                        <Selecting AllowRowSelect="True" />
                                                    </ClientSettings>
                                                </telerik:RadGrid>
                                            </div>
                                        </div>
                                        <div class="card-footer bg-white py-4"></div>
                                    </div>
                                </div>
                            </div>
                            <asp:PlaceHolder runat="server" ID="messagePlaceHolder"></asp:PlaceHolder>
                        </main>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
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

        $(".sidebar-dropdown > a").click(function () {
            $(".sidebar-submenu").slideUp(200);
            if (
                $(this)
                    .parent()
                    .hasClass("active")
            ) {
                $(".sidebar-dropdown").removeClass("active");
                $(this)
                    .parent()
                    .removeClass("active");
            } else {
                $(".sidebar-dropdown").removeClass("active");
                $(this)
                    .next(".sidebar-submenu")
                    .slideDown(200);
                $(this)
                    .parent()
                    .addClass("active");
            }
        });

        $("#close-sidebar").click(function () {
            $(".page-wrapper1").removeClass("toggled");
        });

        $("#show-sidebar").click(function () {
            $(".page-wrapper1").addClass("toggled");
        });

        function searchPID() {
            __doPostBack('searchPID');
        }

        function RadGrid1_RowSelected(grid, args) {
            var pid = args.getDataKeyValue("patient_id");

            $.ajax({
                url: "http://172.16.0.78:8082/api/Patient/check-primary/" + pid
            }).done(function (data) {
                console.log(data);
                if (data.primary_visible_patient_id) {
                    $.ajax({
                        url: "http://172.16.0.78:8082/api/Patient/select-patient-linked/" + data.patient_id
                    }).done(function (data) {
                        $("#patientLinkList").innerHTML = "";
                        for (let i = 0; i < data.length; i++) {
                            let op = document.createElement("a");
                            op.classList.add("list-group-item", "list-group-item-action", "mb-2");
                            op.href = "javascript:void(0)";
                            op.innerText = data[i].visible_patient_id;
                            op.addEventListener('click', function () { openPID(data[i].patient_id) });
                            $("#patientLinkList").append(op);
                        }
                    })
                    $('#exampleModal').modal();
                } else {
                    openPID(pid);
                }
            });
        }
    </script>

</body>
</html>
