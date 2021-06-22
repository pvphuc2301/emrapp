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


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link href="../styles/html5reset-1.6.1.css" rel="stylesheet" />--%>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
    
    <%--<link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../style/style-custom.css" rel="stylesheet" />--%>
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
    </style>
</head>
<body onload="bodyOnloadHandler()">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
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
                            <a style="cursor: default;" class="nav-link btn-link  waves-effect waves-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                            <a class="nav-link btn-link icon-badge-container" href="../other/sendlogview.aspx?view=mail" title="Mail" target="MainContent">
                                <icon:Envelope runat="server" />
                                <div class="icon-badge">mail</div>
                            </a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link btn-link icon-badge-container" href="../other/sendlogview.aspx?view=sms" title="SMS" target="MainContent">
                                <icon:ChatRight runat="server" />
                                <div class="icon-badge">sms</div>
                            </a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link btn-link dropdown-toggle d-none d-lg-block" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <icon:Person runat="server"/>

                                <span id="lblUserName" style="cursor: default;" runat="server">No Name</span>
                                <span class="hidden-md-down">&nbsp;
                                    <icon:CaretDown runat="server" id="CaretDown" />
                                </span>
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
        <%--        <asp:UpdatePanel ID="updatePanel_main" runat="server" UpdateMode="Always">
            <ContentTemplate>--%>
        
        <telerik:RadSplitter runat="server" ID="RadSplitter1" CssClass="border-top border-default" SplitBarsSize="2" 
            Orientation="Vertical" Width="100%" Height="100%">
            <telerik:RadPane runat="server" ID="TopPane" Width="220" MinWidth="150" MaxWidth="550">
                <!-- Sidebar scroll-->
                <div style="overflow-y: scroll; overflow-x: hidden; height: calc(100vh - 51px);">
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
                                                                    
                                                                    <%--<asp:HyperLink data-title='<%# ReturnForm_Name(Eval("status"),Eval("model_name"), "") %>' data-category='' data-visit='' data-author='<%# Eval("created_name_e") %>' CssClass="list-item d-inline-block" ID="lbURL" runat="server" NavigateUrl='<%# Return_Doc_URL(Eval("model_id"),Eval("document_id"), Eval("patient_visit_id")) %>'
                                                                        Text='<%# ReturnForm_Name(Eval("status"),Eval("model_name"),Eval("created_name_e")) %>' Target="MainContent">
                                                                    </asp:HyperLink>--%>

                                                                    <a runat="server" data-varpid='<%# varPID %>' data-varvpid='<%# varVPID %>' data-modelid='<%#Eval("model_id") %>' data-documentid='<%#Eval("document_id") %>' id="lblURL" href="javascript:void(0);" onclick="__doPostBack('lblURL_click', this)'><%# ReturnForm_Name(Eval("status"),Eval("model_name"),Eval("created_name_e")) %></a>

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
                                                            <telerik:GridTemplateColumn HeaderStyle-Width="10%" UniqueName="actual_visit_date_time" Visible="true">
                                                                <ItemTemplate>
                                                                    <asp:HyperLink ID="lbScanLink" runat="server" NavigateUrl='<%# Return_OrderURL(Eval("patient_visit_id"), Eval("actual_visit_date_time")) %>'
                                                                        Text='<%# ReturnScan_Date(Eval("actual_visit_date_time"),Eval("caregiver_name_l")) %>' Target="MainContent" SkinID="test">
                                                                    </asp:HyperLink>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Link</asp:LinkButton>
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

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <%--<script s"../../scripts/perfect-scrollbar.jquery.min.js"></script>--%>
    <%--<script src="../scripts/custom.min.js"></script>--%>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>

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

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() { }
    </script>
</body>
</html>