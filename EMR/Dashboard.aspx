<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EMR.Dashboard" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

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
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <header class="topbar" style="border-bottom: 1px solid #E8E9F0; border-left: 2px solid #E8E9F0;">
                        <nav class="navbar top-navbar navbar-expand-md navbar-white bg-white border-bottom-2 border-darkgrey">
                            <!-- ============================================================== -->
                            <!-- End Logo -->
                            <!-- ============================================================== -->
                            <div class="navbar-collapse">
                                <ul class="navbar-nav my-lg-0 ml-auto">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z" />
                                                <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z" />
                                            </svg>
                                        </a>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a class="nav-link btn-link icon-badge-container" href="javascript:void(0)">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                                                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                                            </svg>
                                            <div class="icon-badge">6</div>
                                        </a>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a class="nav-link btn-link dropdown-toggle d-none d-lg-block" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#1976d2" class="bi bi-person" viewBox="0 0 16 16">
                                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                                            </svg>
                                            <span id="lblUserName" style="cursor: default;" runat="server">Phan Van Phut</span>
                                            <span class="hidden-md-down">&nbsp;
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#1976d2" class="bi bi-caret-down" viewBox="0 0 16 16">
                                        <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z" />
                                    </svg>
                                            </span>
                                        </a>

                                        <a class="nav-link btn-link dropdown-toggle waves-effect waves-primary d-lg-none" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#1976d2" class="bi bi-person" viewBox="0 0 16 16">
                                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                                            </svg>
                                        </a>

                                        <div class="dropdown-menu dropdown-menu-right animated flipInY" aria-labelledby="btnGroupDrop1" style="width: 253px;">
                                            <a class="dropdown-item" href="javascript:void(0)">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#1976d2" class="bi bi-gear" viewBox="0 0 16 16">
                                                    <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z" />
                                                    <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z" />
                                                </svg>
                                                User Settings</a>
                                            <div class="dropdown-divider m-0"></div>
                                            <a class="dropdown-item" href="#">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#1976d2" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                                                </svg>
                                                Help</a>
                                            <div class="dropdown-divider m-0"></div>
                                            <a class="dropdown-item" href="#">Tiếng Việt</a>
                                            <div class="dropdown-divider m-0"></div>
                                            <a class="dropdown-item" runat="server" id="btnLogout" onserverclick="btnLogout_ServerClick">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#1976d2" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z" />
                                                    <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z" />
                                                </svg>
                                                LOGOUT</a>
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
                        <main class="page-content" style="width: 100%; height: 100%; overflow: hidden">
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

                            <div class="scroll-sidebar h-100 w-100" style="border-left: 2px solid #E8E9F0;">


                                <asp:UpdatePanel ID="updatePanel_demographicSearch" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                        <div class="card">
                                            <div class="card-header bg-white">
                                                <h4 class="text-primary">Demographic Search</h4>
                                            </div>

                                            <div class="card-body">
                                                <div class="form-group">
                                                    <input placeholder="Search for PID" class="form-control" style="max-width: 240px;" runat="server" id="txt_pid" />
                                                </div>
                                                <asp:Button CssClass="mt-2 mb-1 btn btn-primary" runat="server" ID="btnSearch" OnClick="btnSearch_Click" Text="Search" />
                                            </div>
                                            <div class="table-responsive">
                                                <telerik:RadGrid OnSelectedIndexChanged="RadGrid5_SelectedIndexChanged1" CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid5" runat="server" AllowPaging="True" AllowSorting="true">
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
                                        <asp:UpdateProgress ID="updateProgress_demographicSearch" runat="server" AssociatedUpdatePanelID="updatePanel_demographicSearch">
                                            <ProgressTemplate>
                                                <div class="loader">
                                                    <div class="loader__figure"></div>
                                                    <p class="loader__label">AIH Hospital</p>
                                                </div>
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>

                                <%--<div class="card-footer bg-white py-4">--%>
                                <%--<nav aria-label="Page navigation example">
                                                <ul class="pagination">
                                                    <li class="page-item disabled">
                                                        <a class="page-link" href="javascript:void(0)" tabindex="-1">Previous</a>
                                                    </li>
                                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">1</a></li>
                                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">2</a></li>
                                                    <li class="page-item"><a class="page-link" href="javascript:void(0)">3</a></li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="javascript:void(0)">Next</a>
                                                    </li>
                                                </ul>
                                            </nav>--%>
                                <%--</div>--%>


                                <%--<div class="card">
                        <div class="card-header bg-white">
                            <h4 class="card-title control-label m-0">
                                <span class="text-primary">My Outpatient List</span>
                            </h4>
                        </div>
                        <div class="card-body" style="padding: 0">
                            <div class="table-responsive">
                                <telerik:RadGrid CssClass="table" BorderWidth="0" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True" OnItemDataBound="RadGrid1_ItemDataBound" AllowSorting="true" OnNeedDataSource="RadGrid1_NeedDataSource">
                                    <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="patient_id">
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
                                                FooterStyle-Font-Bold="true">
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
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings EnableRowHoverStyle="true">
                                        <Selecting AllowRowSelect="True" />
                                        <ClientEvents OnRowSelected="RadGrid1_RowSelected" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </div>
                        </div>
                        <div class="card-footer bg-white py-4"></div>
                    </div>

                    <div class="card">
                        <div class="card-header bg-white">
                            <h4 class="card-title control-label m-0">
                                <span class="text-primary">My Appointments for Today</span>
                            </h4>
                        </div>
                        <div class="card-body" style="padding: 0">
                            <div class="table-responsive">
                                <telerik:RadGrid CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid2" runat="server" AllowPaging="True" OnItemDataBound="RadGrid2_ItemDataBound" AllowSorting="true" OnNeedDataSource="RadGrid2_NeedDataSource">
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
                        <div class="card-footer bg-white py-4"></div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header bg-white">
                                    <h4 class="card-title control-label m-0">
                                        <span class="text-primary">Last 1 Week</span>
                                    </h4>
                                </div>
                                <div class="card-body" style="padding: 0">
                                    <div class="table-responsive">
                                        <telerik:RadGrid CssClass="table" BorderWidth="0" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" AutoGenerateColumns="false" ID="RadGrid3" runat="server" AllowPaging="True" OnItemDataBound="RadGrid2_ItemDataBound" AllowSorting="true" OnNeedDataSource="RadGrid1_NeedDataSource">
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
                                        <telerik:RadGrid CssClass="table" BorderWidth="0" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" AutoGenerateColumns="false" ID="RadGrid4" runat="server" AllowPaging="True" OnItemDataBound="RadGrid2_ItemDataBound" AllowSorting="true" OnNeedDataSource="RadGrid1_NeedDataSource">
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
                    </div>--%>
                            </div>
                    </main>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <%--<asp:PostBackTrigger ControlID="btnAmend" />
                    <asp:PostBackTrigger ControlID="btnCancel" />--%>
                    <%--<asp:PostBackTrigger ControlID="btnSave" />
                    <asp:PostBackTrigger ControlID="btnComplete" />--%>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/emrScript.js"></script>

    <script type="text/javascript">

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
