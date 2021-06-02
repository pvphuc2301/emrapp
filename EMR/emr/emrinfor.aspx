<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="emrinfor.aspx.cs" Inherits="EMR.emrinfor" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/html5reset-1.6.1.css" rel="stylesheet" />
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
    <style>
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

        /*.tooltip__item:before {
            top: 50%;
            left: 0;*/
            /*transform: translate3d(0, -50%, 0);*/
            /*border-width: 0.5em 0 0.5em 0.5em;
            border-color: transparent transparent transparent white;
            -webkit-filter: drop-shadow(1px 2px 1px #bcbcbc);
            filter: drop-shadow(1px 2px 1px #bcbcbc);
            transform: translate(0, -50%) rotateY(180deg);
      }*/

        

    </style>ipt>
</head>
<body onload="bodyOnloadHandler()">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
<%--        <asp:UpdatePanel ID="updatePanel_main" runat="server" UpdateMode="Always">
            <ContentTemplate>--%>
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
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                                            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                        </svg>
                                    </a>
                                </li>
                                <!-- ============================================================== -->
                                <!-- Search -->
                                <!-- ============================================================== -->
                            </ul>
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
                                    <a class="nav-link btn-link icon-badge-container" href="../other/sendlogview.aspx?view=mail" target="MainContent">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                                            <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                                        </svg>
                                        <div class="icon-badge">mail</div>
                                    </a>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link btn-link icon-badge-container" href="../other/sendlogview.aspx?view=sms" target="MainContent">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
                                            <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                                        </svg>
                                        <div class="icon-badge">sms</div>
                                    </a>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link btn-link dropdown-toggle d-none d-lg-block" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#1976d2" class="bi bi-person" viewBox="0 0 16 16">
                                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z" />
                                        </svg>
                                        <span id="lblUserName" style="cursor: default;" runat="server">No Name</span>
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
                <telerik:RadSplitter runat="server" ID="RadSplitter1" CssClass="border-top border-default" LiveResize="true"
                    ResizeWithParentPane="false" SplitBarsSize="2" RenderMode="Mobile" ResizeMode="Proportional"
                    Orientation="Vertical" Width="100%" Height="100%">
                    <telerik:RadPane runat="server" ID="TopPane" Width="220" MinWidth="150" MaxWidth="550">
                        <!-- Sidebar scroll-->
                        <div class="scroll-sidebar w-100">
                            <nav class="sidebar-wrapper" style="position: initial; width: inherit">
                                  

                                <div class="sidebar-menu">
                                    <asp:UpdatePanel ID="updatePanel_main" runat="server" UpdateMode="Always">
            <ContentTemplate>
                                    <ul class="text-nowrap">
                                        <li>
                                            <a href="../emr/emrinfor.aspx?pid=<%= varPID %>" class="bnt-link">Patient Summary</a>
                                        </li>

                                        <%--Load Left Menu--%>
                                        <telerik:RadGrid ID="RadGrid1" runat="server" Width="100%" OnNeedDataSource="RadGrid1_NeedDataSource" OnItemCommand="RadGrid1_ItemCommand"
                                            ShowHeader="false" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" OnDetailTableDataBind="RadGrid1_DetailTableDataBind" AllowSorting="true" AllowFilteringByColumn="false"
                                            AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false">
                                            <MasterTableView DataKeyNames="patient_visit_id" AllowMultiColumnSorting="True" Width="100%" Name="Master" TableLayout="Fixed"
                                                ItemStyle-Font-Size="Small" AlternatingItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="Left"
                                                AlternatingItemStyle-HorizontalAlign="Left" ExpandCollapseColumn-HeaderStyle-Width="1%">
                                                <DetailTables>
                                                    <telerik:GridTableView CssClass="border-0" Name="F1" DataKeyNames="patient_visit_id" Width="100%" ShowHeader="false"
                                                        ShowFooter="false" TableLayout="Fixed">
                                                        <Columns>
                                                            <telerik:GridBoundColumn SortExpression="model_name" DataField="model_name" HeaderStyle-Width="1%"
                                                                ItemStyle-HorizontalAlign="Left" Visible="false">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridTemplateColumn HeaderStyle-Width="99%" UniqueName="model_name">
                                                                <ItemTemplate>

                                                                    <%-- <asp:HyperLink ID="lbURL" 
                           NavigateUrl ="http://172.16.0.78:8082/api/omr/0d79db3e-ae3f-433e-a1d2-aa96107654e1"                           
                          </asp:HyperLink>--%>
                                                                    
                                                                    <asp:HyperLink data-title='<%# ReturnForm_Name(Eval("status"),Eval("model_name"), "") %>' data-category='' data-visit='' data-author='<%# Eval("created_name_e") %>' CssClass="list-item d-inline-block" ID="lbURL" runat="server" NavigateUrl='<%# Return_Doc_URL(Eval("model_id"),Eval("document_id")) %>'
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
                                                    <telerik:GridBoundColumn SortExpression="No" DataField="actual_visit_date_time" HeaderStyle-Width="99%" Visible="false">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true">
                                                <Selecting AllowRowSelect="true" />
                                                <ClientEvents 
                                                     OnColumnCreated="OnGridCreated"
                                                     OnDataBinding="OnGridCreated" OnDataSourceResolved="OnGridCreated" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                        <%--END Load Left Menu--%>

                                        <%--Load LAB and IMG Document--%>
                                        <telerik:RadGrid ID="RadGrid2" runat="server" Width="100%" OnNeedDataSource="RadGrid2_NeedDataSource" OnItemDataBound="RadGrid2_ItemDataBound"
                                            ShowHeader="false" OnDetailTableDataBind="RadGrid2_DetailTableDataBind" AllowSorting="true" AllowFilteringByColumn="false"
                                            AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false">
                                            <MasterTableView DataKeyNames="document_type_rcd" AllowMultiColumnSorting="True" Width="100%" Name="Master" TableLayout="Fixed"
                                                ItemStyle-Font-Size="Small" AlternatingItemStyle-Font-Size="Small" ItemStyle-HorizontalAlign="Left"
                                                AlternatingItemStyle-HorizontalAlign="Left" ExpandCollapseColumn-HeaderStyle-Width="1%">
                                                <DetailTables>
                                                    <telerik:GridTableView CssClass="border-0" Name="F1" DataKeyNames="actual_visit_date_time" Width="100%" ShowHeader="false"
                                                        ShowFooter="false" TableLayout="Fixed">
                                                        <Columns>
                                                            <telerik:GridBoundColumn SortExpression="actual_visit_date_time" DataField="actual_visit_date_time" HeaderStyle-Width="99%"
                                                                ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-MMM-yyyy hh:mm}" Visible="false">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridTemplateColumn HeaderStyle-Width="10%" UniqueName="actual_visit_date_time" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:HyperLink ID="lbScanLink" runat="server" NavigateUrl='<%# Return_OrderURL(Eval("patient_visit_id"), Eval("employee_id")) %>'
                                                                        Text='<%# ReturnScan_Date(Eval("actual_visit_date_time"),Eval("caregiver_name_l")) %>' Target="MainContent" SkinID="test">
                                                                    </asp:HyperLink>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn>
                        <ItemTemplate>
                          <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Link</asp:LinkButton>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                                                        </Columns>
                                                    </telerik:GridTableView>
                                                </DetailTables>
                                                <Columns>
                                                    <telerik:GridBoundColumn SortExpression="No" DataField="description" HeaderStyle-Width="99%">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true">
                                                <Selecting AllowRowSelect="True" />
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
                                                    <telerik:GridTableView CssClass="border-0" Name="F1" DataKeyNames="creation_date_time" Width="100%" ShowHeader="false"
                                                        ShowFooter="false" TableLayout="Fixed">
                                                        <Columns>
                                                            <telerik:GridBoundColumn SortExpression="creation_date_time" DataField="creation_date_time" HeaderStyle-Width="99%"
                                                                ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-MMM-yyyy hh:mm}" Visible="false">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridTemplateColumn HeaderStyle-Width="10%" UniqueName="creation_date_time">
                                                                <ItemTemplate>
                                                                    <asp:HyperLink ID="lbScanLink" runat="server" NavigateUrl='<%# string.Format("/emr/emrview.aspx?pf={0}&dp={1}&action=view",
                                Eval("file_system_object_id"), Eval("document_page_id")) %>'
                                                                        Text='<%# ReturnScan_Date(Eval("creation_date_time"),Eval("event_category_name_l")) %>' Target="MainContent" SkinID="test">
                                                                    </asp:HyperLink>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                        </Columns>
                                                    </telerik:GridTableView>
                                                </DetailTables>
                                                <Columns>
                                                    <telerik:GridBoundColumn SortExpression="No" DataField="doc_type_name_l" HeaderStyle-Width="99%">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true">
                                                <Selecting AllowRowSelect="True" />
                                                <Scrolling AllowScroll="True" ScrollHeight="100%" UseStaticHeaders="True" SaveScrollPosition="true" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                        <%--End Load Scan Document--%>
                                    </ul>
                                    <asp:UpdateProgress ID="updateProgress_main" runat="server" AssociatedUpdatePanelID="updatePanel_main">
                                        <ProgressTemplate>
                                            <div class="loader">
                                                <div class="loader__figure"></div>
                                                <p class="loader__label">AIH Hospital</p>
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </ContentTemplate>
                                <Triggers>
                                    <%--<asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />--%>
                                </Triggers>
                            </asp:UpdatePanel>
                                </div>
                            </nav>
                        </div>

                    </telerik:RadPane>
                    <telerik:RadSplitBar CollapseMode="none" Visible="true" runat="server" ID="RadSplitBar1" ResizeStep="3" />

                    <telerik:RadPane ID="MainContent" runat="server" align="center"></telerik:RadPane>

                </telerik:RadSplitter>
                <%--<asp:UpdateProgress ID="updateProgress_main" runat="server" AssociatedUpdatePanelID="updatePanel_main">
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
        </asp:UpdatePanel>--%>
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
                </tbody>
            </table>
        </div>

    </form>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>

    <script>

        //window.addEventListener('load', function () {
        //    console.log('All assets are loaded')
        //})

        //window.addEventListener('DOMContentLoaded', (event) => {
        //    console.log('DOM fully loaded and parsed');
        //});

        window.onload = function () {
            console.log('window loaded');
            let listItem = document.getElementsByClassName("list-item");
            let tooltip1 = document.getElementById("tooltip__item");

            tooltip1.style.position = "fixed";
            
            tooltip1.style.zIndex = 1000;
            tooltip1.style.visibility = "visible";
            tooltip1.style.opacity = 1;
            
            //listItem[0].addEventListener("mouseenter", function () {
            //    console.log("dsfsfs");
            //});

            //listItem[0].addEventListener("mouseover", function () {

            //    tooltip1.style.visibility = "hidden";
            //    tooltip1.style.opacity = 0;
            //});
        }

        //document.onload = function () {
        //    console.log('document loaded');
        //}

        //window.addEventListener('DOMContentLoaded', function () {
        //    console.log('window - DOMContentLoaded - capture'); // 1st
        //}, true);
        //document.addEventListener('DOMContentLoaded', function () {
        //    console.log('document - DOMContentLoaded - capture'); // 2nd
        //}, true);
        //document.addEventListener('DOMContentLoaded', function () {
        //    console.log('document - DOMContentLoaded - bubble'); // 2nd
        //});
        //window.addEventListener('DOMContentLoaded', function () {
        //    console.log('window - DOMContentLoaded - bubble'); // 3rd
        //});

        //window.addEventListener('load', function () {
        //    console.log(document.getElementsByClassName("list-item"));

        //}, true);
        //document.addEventListener('load', function (e) {
        //    /* Filter out load events not related to the document */
        //    if (['style', 'script'].indexOf(e.target.tagName.toLowerCase()) < 0)
        //        console.log('document - load - capture'); // DOES NOT HAPPEN
        //}, true);
        //document.addEventListener('load', function () {
        //    console.log('document - load - bubble'); // DOES NOT HAPPEN
        //});
        //window.addEventListener('load', function () {
        //    console.log('window - load - bubble'); // 4th
        //    setTimeout(function () {
        //        console.log(document.getElementsByClassName("list-item"));
        //    }, 3000);
        //});

        //window.onload = function () {
        //    console.log('window - onload'); // 4th

        //};
        //document.onload = function () {
        //    console.log('document - onload'); // DOES NOT HAPPEN
        //};

        //function bodyOnloadHandler() {
        //    console.log("body onload");
        //}

    </script>

    <script type="text/javascript">
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
                    })

                    item.addEventListener("mouseleave", function (e) {
                        
                        tooltip1.style.visibility = "hidden";
                        tooltip1.style.opacity = 0;
                    })
                })
            }
            
        }
    </script>
</body>
</html>
