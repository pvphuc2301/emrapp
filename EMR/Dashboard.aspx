<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EMR.Dashboard" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="./styles/style.css" rel="stylesheet" />
    <link href="./styles/myStyle.css" rel="stylesheet" />
    <link href="./styles/style-custom.css" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f6f6fa;
        }

        #close-sidebar:hover > i {
            color: #777598;
        }
    </style>
</head>
<body class="skin-default fixed-layout">
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server"></telerik:RadScriptManager>
        <%--<div class="preloader">
            <div class="loader">
                <div class="loader__figure"></div>
                <p class="loader__label">AIH Hospital</p>
            </div>
        </div>--%>
        <header class="topbar" style="border-bottom: 1px solid #E8E9F0; border-left: 2px solid #E8E9F0;">
            <nav class="navbar top-navbar navbar-expand-md navbar-white bg-white border-bottom-2 border-darkgrey">
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->

                    <ul class="navbar-nav my-lg-0 ml-auto">
                        <li class="nav-item dropdown u-pro">
                            <a class="nav-link btn-link  waves-effect waves-primary" href="javascript:void(0)"><i class="fa fa-home"></i></a>
                        </li>

                        <li class="nav-item dropdown u-pro mr-3">
                            <a class="nav-link btn-link pl-0 pr-0" href="javascript:void(0)" style="position: relative; padding-bottom: 8px">
                                <i class="fa fa-bell waves-effect waves-primary" style="padding: .5rem 1rem; line-height: 35px; box-sizing: border-box; margin-top: -13px; margin-bottom: -7px;"></i>
                                <span style="z-index: 100; position: absolute; top: 4px; left: 25px; border: 2px solid #fff;" class="badge badge-pill badge-danger notification">3</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown u-pro">

                            <a class="nav-link btn-link dropdown-toggle waves-effect waves-primary d-none d-lg-block" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-user"></i>
                                <span class="">Phan Van Phut</span>

                                <span class="hidden-md-down">&nbsp;<i class="fa fa-angle-down"></i></span>
                            </a>

                            <a class="nav-link btn-link dropdown-toggle waves-effect waves-primary d-lg-none" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-user"></i>
                            </a>

                            <div class="dropdown-menu dropdown-menu-right animated flipInY" aria-labelledby="btnGroupDrop1" style="width: 253px;">
                                <!-- <div class="dropdown-header">Phan Van Phut</div> -->
                                <a class="dropdown-item" href="#"><i class="fa fa-user mr-2"></i>User Settings</a>
                                <div class="dropdown-divider m-0"></div>
                                <a class="dropdown-item" href="#"><i class="fa fa-question mr-2"></i>Help</a>
                                <div class="dropdown-divider m-0"></div>
                                <a class="dropdown-item" href="#">Tiếng Việt</a>
                                <div class="dropdown-divider m-0"></div>
                                <a class="dropdown-item" href="./Login.aspx">LOGOUT</a>
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
                <a id="show-sidebar" style="z-index: 998;" class="btn btn-sm btn-sidebar" href="javascript:void(0)">
                    <i class="fas fa-bars"></i>
                </a>

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
                        <!-- sidebar-menu  -->
                    </div>
                </nav>

                <div class="scroll-sidebar h-100 w-100" style="border-left: 2px solid #E8E9F0;">
                    <div class="container-fluid pb-5 mt-3">
                        <%-- Demographic Search --%>
                        <div class="card">
                            <div class="card-header bg-white">
                                <h4 class="card-title control-label mb-2">
                                    <span class="text-primary">Demographic Search</span>
                                </h4>
                                <div class="form-group">
                                    <asp:TextBox placeholder="Search for PID" CssClass="form-control" Style="max-width: 280px;" runat="server" ID="txt_pid" />
                                    <span class="append" onclick="searchPID()" style="color: #777598; cursor: pointer;"><i class="fa fa-search"></i></span>
                                </div>
                            </div>

                            <div class="card-body" style="padding: 0;">
                                <div class="table-responsive">
                                    <telerik:RadGrid CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid5" runat="server" AllowPaging="True" AllowSorting="true">
                                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_id" ClientDataKeyNames="patient_id">
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
                                Eval("patient_id"),Eval("visible_patient_id")) %>' Text='<%# Eval("visible_patient_id") %>'>  
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
                            <div class="card-footer bg-white py-4">
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
                            </div>
                        </div>

                        <%-- My Outpatient List --%>
                        <div class="card">
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

                        <%-- My Appointments for Today --%>
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
                                Eval("patient_id"),Eval("visible_patient_id")) %>' Text='<%# Eval("visible_patient_id") %>'>  
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
                        </div>

                    </div>
                </div>

            </main>
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
