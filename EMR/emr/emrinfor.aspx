<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emrinfor.aspx.cs" Inherits="Emr_client.emr.emrinfor" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/html5reset-1.6.1.css" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet" />
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
    <style>
        
        .submenu-item:hover, .submenu-item.active {
            border-color: #4791db !important;
            background-color: rgba(25, 118, 210, 0.04);
        }

        .submenu-item.active {
            border-left-width: 4px;
        }

        .submenu-item {
            /*border-left-width: 4px;*/
            transition: border-left-width .2s ease;
            border-style: solid;
            border-color: transparent;
        }
        table {
            border: none !important;
        }

        .kenTable table tr > td {
            background-color: #dee3e7 !important;
            color: #000000 !important;
            border: none !important;
        }

        .kenTable .rgDetailTable tr.rgHoveredRow td, .kenTable .rgDetailTable tr.rgHoveredRow td a {
            color: #000000 !important;
            background-color: #f6f6f6 !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:HiddenField ID="ValueHiddenField" runat="server" />
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
                        <li class="nav-item"><a class="nav-link"><strong class="font-bold"><%= patient.Name %> (<%= patient.Title %>)</strong>, <small>DOB</small> <%= patient.DOB %> (<%= patient.Age %> y) <small>Sex</small> <%= patient.Gender %> <small>PID</small> <%= patient.PID %></a></li>
                        <li class="nav-item ml-2"><a class="nav-link color-secondary" href="javascript:void(0)" onclick="closePID();"><i class="fa fa-times"></i></a></li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                    </ul>
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
                                <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-user mr-2"></i>User Settings</a>
                                <div class="dropdown-divider m-0"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-question mr-2"></i>Help</a>
                                <div class="dropdown-divider m-0"></div>
                                <a class="dropdown-item" href="javascript:void(0)">Tiếng Việt</a>
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
    <telerik:RadSplitter runat="server" ID="RadSplitter1" CssClass="border-top border-default" LiveResize="true" 
        ResizeWithParentPane="false" SplitBarsSize="2" RenderMode="Mobile" ResizeMode="Proportional" 
        Orientation="Vertical" Width="100%" Height="100%">
            <telerik:RadPane runat="server" ID="TopPane" Width="220" MinWidth="150" MaxWidth="550">
                <!-- Sidebar scroll-->
                <div class="scroll-sidebar w-100">
                    <nav class="sidebar-wrapper" style="position: initial; width: inherit">
                        <div class="sidebar-menu">
                            <ul class="text-nowrap">
                                <%--<li class="header-menu">
                                    <span>General</span>
                                </li>--%>
                                <li>
                                    <a href="javascript:void(0)" class="waves-effect waves-primary btn-link" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
                                        <span>Add New Document</span>
                                    </a>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="exampleModalLabel1">Add New Document</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="form-group">
                                                            <!-- Nav tabs -->
                                                            <ul class="nav nav-tabs" role="tablist">
                                                                <li class="nav-item">
                                                                    <a class="nav-link active" data-toggle="tab" href="#home" role="tab">
                                                                        <span class="hidden-sm-up"><i class="ti-home"></i></span><span class="hidden-xs-down">OPD</span>
                                                                    </a>
                                                                </li>
                                                                <li class="nav-item">
                                                                    <a class="nav-link" data-toggle="tab" href="#profile" role="tab">
                                                                        <span class="hidden-sm-up"><i class="ti-user"></i></span><span class="hidden-xs-down">IPD</span>
                                                                    </a>
                                                                </li>
                                                                <li class="nav-item">
                                                                    <a class="nav-link" data-toggle="tab" href="#messages" role="tab">
                                                                        <span class="hidden-sm-up"><i class="ti-email"></i></span><span class="hidden-xs-down">ERO</span>
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                            <!-- Tab panes -->
                                                            <div class="tab-content tabcontent-border">
                                                                <div class="tab-pane active" id="home" role="tabpanel">
                                                                    <div class="p-20">
                                                                        <select class="form-control custom-select">
                                                                            <option value="">Outpatient Initial Nursing Assessment </option>
                                                                            <option value="">Outpatient Medical Record</option>
                                                                            <option value="">Medical Certificate</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane" id="profile" role="tabpanel">
                                                                    <div class="p-20">
                                                                        <select class="form-control custom-select">
                                                                            <option value="">Inpatient Initial Medical Assessment </option>
                                                                            <option value="">Inpatient Initial Nursing Assessment </option>
                                                                            <option value="">Discharge Summary</option>
                                                                            <option value="">Discharge Certificate</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="tab-pane" id="messages" role="tabpanel">
                                                                    <div class="p-20">
                                                                        <select class="form-control custom-select">
                                                                            <option value="">Emergency Medical Record</option>
                                                                            <option value="">Emergency Triage And Nursing Assessment Record </option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Create</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                
<%--Load Left Menu--%>
<telerik:RadGrid ID="RadGrid1" runat="server" Width="100%"  OnNeedDataSource="RadGrid1_NeedDataSource"
    ShowHeader="false" OnDetailTableDataBind="RadGrid1_DetailTableDataBind" AllowSorting="true" AllowFilteringByColumn="false"
    AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false">
    <MasterTableView DataKeyNames="patient_visit_id" AllowMultiColumnSorting="True" Width="100%" Name="Master" TableLayout="Fixed" 
        ItemStyle-Font-Size="Small" AlternatingItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="Left"
        AlternatingItemStyle-HorizontalAlign="Left" ExpandCollapseColumn-HeaderStyle-Width="1%">
        <DetailTables>
            <telerik:GridTableView CssClass="border-0"  Name="F1" DataKeyNames="patient_visit_id" Width="100%" ShowHeader="false" 
                ShowFooter="false" TableLayout="Fixed">
                <Columns>
                    <telerik:GridBoundColumn  SortExpression="model_name" DataField="model_name" HeaderStyle-Width = "1%"
                        ItemStyle-HorizontalAlign="Left" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderStyle-Width="99%" UniqueName="model_name">
                        <ItemTemplate>                                            
                            <asp:HyperLink ID="lbURL" runat="server" NavigateUrl='<%# Return_URL(Eval("model_id")) %>' 
                                Text='<%# ReturnForm_Name(Eval("status"),Eval("model_name"),Eval("created_name_e")) %>' Target="MainContent">
                            </asp:HyperLink>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
            </telerik:GridTableView>
        </DetailTables>
        <Columns>
            <telerik:GridTemplateColumn HeaderStyle-Width="99%" UniqueName="actual_visit_date_time">
                <ItemTemplate>                                                 
                    <asp:Label runat="server" ID="lbVisit_date" 
                        Text='<%# ReturnVisit_Date(Eval("actual_visit_date_time"),Eval("visit_type"),Eval("visit_code"))%>'></asp:Label>
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridBoundColumn SortExpression="No" DataField="actual_visit_date_time" HeaderStyle-Width = "99%" Visible="false">
            </telerik:GridBoundColumn>                    
        </Columns>
        <CommandItemSettings ShowAddNewRecordButton="false" />
    </MasterTableView>
    <ClientSettings EnableRowHoverStyle="true">
        <Selecting AllowRowSelect="True"/>                        
    </ClientSettings>
</telerik:RadGrid> 
<%--END Load Left Menu--%>

<%--Load LAB and IMG Document--%>
<telerik:RadGrid ID="RadGrid2" runat="server" Width="100%" OnNeedDataSource="RadGrid2_NeedDataSource" 
    ShowHeader="false" OnDetailTableDataBind="RadGrid2_DetailTableDataBind" AllowSorting="true" AllowFilteringByColumn="false"
    AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false">
    <MasterTableView DataKeyNames="document_type_rcd" AllowMultiColumnSorting="True" Width="100%" Name="Master" TableLayout="Fixed" 
        ItemStyle-Font-Size="Small" AlternatingItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="Left"
        AlternatingItemStyle-HorizontalAlign="Left" ExpandCollapseColumn-HeaderStyle-Width="1%">
        <DetailTables>
        <telerik:GridTableView CssClass="border-0"  Name="F1" DataKeyNames="actual_visit_date_time" Width="100%" ShowHeader="false" 
            ShowFooter="false" TableLayout="Fixed">
            <Columns>
                <telerik:GridBoundColumn  SortExpression="actual_visit_date_time" DataField="actual_visit_date_time" HeaderStyle-Width = "99%"
                    ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-MMM-yyyy hh:mm}" Visible="false">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderStyle-Width="10%" UniqueName="actual_visit_date_time">
                    <ItemTemplate>                       
                        <asp:HyperLink ID="lbScanLink" runat="server" NavigateUrl='<%# Return_OrderURL(Eval("patient_visit_id")) %>' 
                            Text='<%# ReturnScan_Date(Eval("actual_visit_date_time"),Eval("caregiver_name_l")) %>' Target="MainContent" SkinID="test">
                        </asp:HyperLink>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </telerik:GridTableView>
        </DetailTables>
        <Columns>
            <telerik:GridBoundColumn SortExpression="No" DataField="description" HeaderStyle-Width = "99%">
            </telerik:GridBoundColumn>                    
        </Columns>
        <CommandItemSettings ShowAddNewRecordButton="false" />
    </MasterTableView>
    <ClientSettings EnableRowHoverStyle="true">
        <Selecting AllowRowSelect="True"/>         
    </ClientSettings>
</telerik:RadGrid>    
<%--End Load LAB and IMG Document--%>


<%--Load Scan Document--%>
    <a href="javascript:void(0)" class="waves-effect waves-primary btn-link" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
        <span>Scan Document</span>
    </a>
<telerik:RadGrid ID="RadGrid3" runat="server" Width="100%" OnNeedDataSource="RadGrid3_NeedDataSource" 
    ShowHeader="false" OnDetailTableDataBind="RadGrid3_DetailTableDataBind" AllowSorting="true" AllowFilteringByColumn="false"
    AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false">
    <MasterTableView DataKeyNames="patient_id,document_type_rcd" AllowMultiColumnSorting="True" Width="100%" Name="Master" TableLayout="Fixed" 
        ItemStyle-Font-Size="Small" AlternatingItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="Left"
        AlternatingItemStyle-HorizontalAlign="Left" ExpandCollapseColumn-HeaderStyle-Width="1%">
        <DetailTables>
        <telerik:GridTableView CssClass="border-0"  Name="F1" DataKeyNames="creation_date_time" Width="100%" ShowHeader="false" 
            ShowFooter="false" TableLayout="Fixed">
            <Columns>
                <telerik:GridBoundColumn  SortExpression="creation_date_time" DataField="creation_date_time" HeaderStyle-Width = "99%"
                    ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-MMM-yyyy hh:mm}" Visible="false">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn HeaderStyle-Width="10%" UniqueName="creation_date_time">
                    <ItemTemplate>                       
                        <asp:HyperLink ID="lbScanLink" runat="server"  NavigateUrl='<%# string.Format("/emr/emrview.aspx?pf={0}&dp={1}&action=view",
                                Eval("file_system_object_id"),Eval("document_page_id")) %>'
                            Text='<%# ReturnScan_Date(Eval("creation_date_time"),Eval("event_category_name_l")) %>' Target="MainContent" SkinID="test">
                        </asp:HyperLink>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
        </telerik:GridTableView>
        </DetailTables>
        <Columns>
            <telerik:GridBoundColumn SortExpression="No" DataField="doc_type_name_l" HeaderStyle-Width = "99%">
            </telerik:GridBoundColumn>                    
        </Columns>
        <CommandItemSettings ShowAddNewRecordButton="false" />
    </MasterTableView>
    <ClientSettings EnableRowHoverStyle="true">
        <Selecting AllowRowSelect="True"/> 
        <Scrolling AllowScroll="True" ScrollHeight="100%" UseStaticHeaders="True" SaveScrollPosition="true" />
    </ClientSettings>
</telerik:RadGrid>
<%--End Load Scan Document--%>
                                                                                                                                                                   
                            </ul>
                        </div>
                    </nav>
                </div>

            </telerik:RadPane>
            <telerik:RadSplitBar CollapseMode="none" Visible="true" runat="server" ID="RadSplitBar1" ResizeStep="3" />        
            <telerik:RadPane ID="MainContent" runat="server" ContentUrl="../other/patientsummary.aspx" align="center"></telerik:RadPane>
        </telerik:RadSplitter>
    </form>
</body>
</html>
