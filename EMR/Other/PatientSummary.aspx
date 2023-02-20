<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientSummary.aspx.cs" Inherits="EMR.PatientSummary" ValidateRequest="false" %>

<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style>
        .sidebar-wrapper .sidebar-menu ul li a {
            padding: 0;
        }
        .RadTreeView_Bootstrap .rtPlus, 
        .RadTreeView_Bootstrap .rtMinus, 
        .RadTreeView_Bootstrap .rtIn {
            margin: 0 !important;
            padding: 0 !important;
        }
        .RadTreeView .rtPlus, 
        .RadTreeView .rtMinus { top:5px !important; }
        .RadTreeView .rtLines .rtLI:before, 
        .RadTreeView .rtLines .rtOut:before { content: none !important; }
        ul.rtUL > li.rtLI > ul.rtUL > li.rtLI { padding-left: 0 !important; }
        ul.rtUL > li.rtLI > ul.rtUL > li.rtLI > div.rtOut > a.rtIn { border-radius: 0 !important; }
        div.RadTreeView > ul.rtLines, 
        ul.rtLines > li.rtLI > ul.rtUL { width: 100%; }

        .RadTreeView_Bootstrap > ul.rtUL > li.rtLI > div.rtOut div.rtIn { cursor: default; background-color: transparent !important; border-color: transparent !important; }

        .RadTreeView_Bootstrap > ul.rtUL > li.rtLI > div.rtOut.rtSelected div.rtIn { background-color: transparent !important; border-color: transparent !important; color: #000; cursor: default;} 
        
        .RadTreeView_Bootstrap > ul.rtUL > li.rtLI > ul.rtUL > li.rtLI > div.rtOut.rtSelected a.rtIn { background-color: #337ab7 !important; border-color: #337ab7 !important; }

        .rtUL .rtLI { padding: 0; }
        .rtUL .rtLI .rtOut a.rtIn { padding: 2px 9px; }
        .rtUL .rtLI .rtOut { height: 25px }
        .rtUL .rtLI .rtOut div.rtIn { font-weight: 600; }

        /*#RAD_SPLITTER_RadSplitter1 {
            border: none;
        }*/

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

        /*.rwTitleBar {
            background-color: #fff;
        }

        .TelerikModalOverlay {
            opacity: 0 !important;
            background-color: unset;
        }

        .RadWindow_Bootstrap {
            border: 1px solid #597189 !important;
            border-radius: 0 !important;
        }
        
        .rwCustomIcon {
            background-size: contain !important;
        }
        .RadWindow_Bootstrap .rwTitleWrapper{*/
            /*background-color: #fff;*/
        /*}
        .RadWindow_Bootstrap .rwContent {
            border-top: none !important;
        }*/
    </style>

</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
         <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <a id="reload_treeview"></a>
                <div style="overflow: hidden; height: 100vh;">
                    <telerik:RadSplitter runat="server" ID="RadSplitter1" SplitBarsSize="4" Width="100%" Height="100%">
                        <telerik:RadPane runat="server" Width="220" Height="100%" MinWidth="150" MaxWidth="550">
                            <div style="overflow-x: hidden; overflow-y: scroll; height: 100%" id="menuLeft">
                                <nav class="sidebar-wrapper" style="position: initial; width: inherit">
                                    <div class="sidebar-menu">
                                        <ul class="text-nowrap" style="padding: 0;">
                                            <li style="border-bottom: 1px solid #ddd; margin-bottom: 4px; margin-top: 12px;">
                                                <h5 class="title">Complex Document</h5>
                                                <telerik:RadGrid ID="radGridComplexDoc" OnNeedDataSource="radGridComplexDoc_NeedDataSource" OnItemCommand="radGridComplexDoc_ItemCommand" CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ShowHeader="false"  ItemStyle-Height="25px" runat="server">
                                                    <MasterTableView DataKeyNames="document_id,model_id,status,url">
                                                        <Columns>
                                                            <telerik:GridTemplateColumn ItemStyle-BorderWidth="0" SortExpression="visible_patient_id" DataField="visible_patient_id" ItemStyle-Height="25px">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton Height="25px" runat="server" CommandName="selectDoc"><%# Eval("status") %>_<%# Eval("model_name") %> 	&nbsp;<%# Eval("created_name_l") %></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true">
                                                        <Selecting AllowRowSelect="True" />
                                                    </ClientSettings>
                                                </telerik:RadGrid>
                                            </li>

                                            <li style="border-bottom: 1px solid #ddd; margin-bottom: 4px;">
                                                <h5 class="title">Form Document</h5>
                                                <asp:HiddenField runat="server" ID="TempDocName" />
                                                <asp:HiddenField runat="server" ID="TempDocId" />
                                                <telerik:RadTreeView OnNodeClick="RadTreeView1_NodeClick" ID="RadTreeView1" runat="server" OnNodeExpand="RadTreeView1_NodeExpand"/>
                                            </li>

                                            <%--END Load Left Menu--%>

                                            <%--Load LAB and IMG Document--%>
                                            <li style="border-bottom: 1px solid #ddd; margin-bottom: 4px;">
                                                <h5 class="title">Clinical Reports</h5>
                                                <telerik:RadTreeView OnNodeClick="RadTreeView2_NodeClick" ID="RadTreeView2" runat="server" OnNodeExpand="RadTreeView2_NodeExpand">
                                                </telerik:RadTreeView>
                                            </li>
                                            <%--End Load LAB and IMG Document--%>

                                            <%--Load Scan Document--%>
                                            <li style="border-bottom: 1px solid #ddd; margin-bottom: 4px;">
                                                <h5 class="title">General Scan</h5>
                                                <telerik:RadTreeView OnNodeClick="RadTreeView3_NodeClick" ID="RadTreeView3" runat="server" OnNodeExpand="RadTreeView3_NodeExpand"/>
                                            </li>

                                            <li style="border-bottom: 1px solid #ddd; margin-bottom: 4px;">
                                                <h5 class="title">Form Scan</h5>
                                                <telerik:RadTreeView OnNodeClick="RadTreeView3_NodeClick" ID="RadTreeView4" runat="server"  OnNodeExpand="RadTreeView4_NodeExpand"/>
                                            </li>
                                            <%--End Load Scan Document--%>
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                        </telerik:RadPane>
                        <telerik:RadSplitBar runat="server" ID="RadSplitBar1" />
                        <telerik:RadPane ID="MainContent" runat="server" />
                    </telerik:RadSplitter>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <%--  --%>
        <telerik:RadWindow RenderMode="Lightweight" Modal="true" ID="rwndUserBlock" Title="" IconUrl="/" runat="server" Width="500" Height="195" VisibleStatusbar="false" Behaviors="Close" Opacity="1">
            <ContentTemplate>
                <div style="display: grid; grid-template-columns: 64px 1fr; gap: 6px">
                    <div><i class="fa fa-exclamation-triangle text-danger" style="font-size:64px;"></i></div>
                    <div>
                        <div class="text-danger">Denied!</div>
                        <label runat="server" id="lblUserBlock" />
                    </div>
                </div>
            </ContentTemplate>
        </telerik:RadWindow>

        <telerik:RadWindow RenderMode="Lightweight" Modal="true" ID="RadWindowError" Title="" IconUrl="/" runat="server" Width="500" Height="195" VisibleStatusbar="false" Behaviors="Move,Close" Opacity="1">
            <ContentTemplate>
                <div style="display: grid; grid-template-columns: 64px 1fr; gap: 6px">
                    <div><i class="fa fa-exclamation-triangle text-danger" style="font-size:64px;"></i></div>
                    <div>
                        <label runat="server" id="lblErrorMessage" />
                    </div>
                </div>
            </ContentTemplate>
        </telerik:RadWindow>
        <%--  --%>
        <telerik:RadWindow IconUrl="../images/getsitelogo.png" ID="rwndDeleteDocument" Title="" runat="server" Width="500" Height="195" Modal="true" VisibleStatusbar="false" Behaviors="Close" Opacity="1" BackColor="#515e7b80">
            <ContentTemplate>
                <asp:UpdatePanel runat="server" ID="uplDeleteDocument" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="rwDialog">
                            <a id="DeleteDocumentTrigger"></a>
                            <asp:HiddenField runat="server" ID="hfdDeleteDocument" />
                            <div style="display: grid; grid-template-columns: auto 1fr">
                                <span class="mr-2"><i class="fa fa-exclamation-triangle" style="font-size:64px; color: #ff8d08"></i></span>
                                <p>Delete document?</p>
                            </div>
                            <div class="rwDialogButtons">
                                <asp:LinkButton runat="server" OnClick="btnDeleteDocument_Click" ID="btnDeleteDocument" CssClass="btn btn-danger">Delete</asp:LinkButton>
                                <div class="btn btn-secondary" onclick="CloseRadWindow('rwndDeleteDocument')">Cancel</div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </telerik:RadWindow>
        <%--  --%>
        <telerik:RadWindow Modal="true" CssClass="NoIconUrl" MinWidth="600px" VisibleStatusbar="false" Behaviors="Close,Move" Opacity="1" BackColor="#515e7b80" ID="rwndLogHistory" Title="Version History" runat="server">
            <ContentTemplate>
                <asp:UpdatePanel runat="server" ID="uplLogHistory" UpdateMode="Conditional">
                    <ContentTemplate>
                        <a id="btnLogHistory"></a>
                        <asp:HiddenField runat="server" ID="PAGE_URL" />
                        <telerik:RadGrid ShowHeader="false" ID="rgdLogHistory" runat="server" AllowSorting="true" OnItemDataBound="rgdLogHistory_ItemDataBound" OnItemCommand="rgdLogHistory_ItemCommand">
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="document_id,document_log_id">
                                <Columns>
                                    <telerik:GridTemplateColumn>
                                        <ItemTemplate>
                                            <div style="display: grid; grid-template-columns: 1fr auto">
                                                <div style="white-space: nowrap"><telerik:RadLabel runat="server" ID="RadLabel1" Text='<%# GetHistoryName(Eval("status"),Eval("created_name_e"), Eval("created_date_time"), Eval("modified_name_e"), Eval("modified_date_time"), Eval("amend_reason")) %>'></telerik:RadLabel></div>
                                                <div><asp:LinkButton CommandName="Open" ToolTip="View Log" runat="server" ID="rlbtnViewLog">[view]</asp:LinkButton></div>
                                            </div>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                            <SelectedItemStyle CssClass="SelectedStyle" />
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </telerik:RadWindow>
        <%--  --%>
        <telerik:RadNotification AutoCloseDelay="3000" RenderMode="Lightweight" ID="RadNotification1" runat="server" EnableRoundedCorners="true" EnableShadow="true" Text="Update success" OffsetX="-20" OffsetY="-20" VisibleTitlebar="false" Title="" TitleIcon="none" Width="300" Height="60"></telerik:RadNotification>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <%--<script src="../scripts/custom.min.js"></script>--%>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script>
        function ConfirmDeleteDocument(args) {
            ShowRadWindow("<%=rwndDeleteDocument.ClientID %>");
            var DeleteDocumentTrigger = document.getElementById("DeleteDocumentTrigger");
            DeleteDocumentTrigger.onclick = () => __doPostBack('delete_document', args);
            DeleteDocumentTrigger.click();
        }
        function ShowBlock(args) {
            var rwndUserBlock = $find("<%=rwndUserBlock.ClientID %>");
            var msg = document.getElementById("<%=lblUserBlock.ClientID %>");
            msg.innerHTML = args;
            rwndUserBlock.show();
        }

        function Error(title, content) {
            var rwndError = $find("<%=RadWindowError.ClientID %>");
            var msg = document.getElementById("<%=lblErrorMessage.ClientID %>");
            msg.innerHTML = "<div class='font-bold'>Something went wrong</div><div>Please contact IT support.</div>";
            rwndError.show();
        }

        function complete_document(url) {
            var notification = $find("<%=RadNotification1.ClientID %>");
            notification.show();
            var reload_treeview = document.getElementById("reload_treeview");
            reload_treeview.onclick = () => __doPostBack('complete_document', url);
            reload_treeview.click();
        }
        function delete_document() {
            ShowRadWindow("<%=RadNotification1.ClientID %>")
            CloseRadWindow("<%=rwndDeleteDocument.ClientID %>");
        }
        function log_history(page_url) {
            var btnLogHistory = document.getElementById("btnLogHistory");
            btnLogHistory.onclick = () => __doPostBack('document_log', page_url);
            btnLogHistory.click();
            var oWnd = $find("<%=rwndLogHistory.ClientID %>");
            oWnd.show();
        }

        function CloseRadWindow(RadWindowClientID) {
            var window = $find(RadWindowClientID);
            window.close();
        }

        function ShowRadWindow(RadWindowClientID) {
            var window = $find(RadWindowClientID);
            window.show();
        }

        function close_window(windowID) {
            var window = $find(windowID);
            window.close();
        }

        function Notification(message) {
            var notification = $find("<%=RadNotification1.ClientID %>");
            notification.show();
        }

        function reload_complex_document(url) {
            __doPostBack("reload_complex_document", url);
        }

        function reload_treeview(url) {
            var reload_treeview = document.getElementById("reload_treeview");
            reload_treeview.onclick = () => __doPostBack('reload_treeview', url);
            reload_treeview.click();
        }

        let _scrollTop;

        function beforeAsyncPostBack() {
            var curtime = new Date();
            _scrollTop = document.querySelector("#menuLeft").scrollTop;
        }

        //let scroll = document.querySelector("#menuLeft");

        function afterAsyncPostBack() {
            $('#DocumentList').modal('show');
            $("#menuLeft").scrollTop(_scrollTop);
        }

        function ClientMouseOut(sender, eventArgs) {
            tooltip1.style.visibility = "hidden";
            tooltip1.style.opacity = 0;
        }

        function ClientMouseOver(sender, eventArgs) {
            var node = eventArgs.get_node();
            var ele = eventArgs.get_domEvent();

            if (node.get_attributes().getAttribute("status")) {
                let RadSplitBar1 = document.getElementById("RadSplitBar1");
                
                tooltip1.style.top = (ele.clientY + 50) + "px";
                tooltip1.style.left = RadSplitBar1.offsetLeft + "px";
                tooltip1.style.visibility = "visible";
                tooltip1.style.opacity = 1;
                tooltip1.querySelector(".title").innerText = "(" + node.get_attributes().getAttribute("status") + ") " + node.get_value();
                tooltip1.querySelector(".category").innerText = node.get_attributes().getAttribute("model_type_rcd");
                tooltip1.querySelector(".author").innerText = node.get_attributes().getAttribute("created_name_l");
                //tooltip1.querySelector(".visit").innerText = item.getAttribute("data-visit");
                tooltip1.querySelector(".lastedUpdated").innerText = node.get_attributes().getAttribute("modified_date_time") + " by " + node.get_attributes().getAttribute("modified_name_l");
            }
        }

        let listItem = document.querySelectorAll(".list-item");
        let tooltip1 = document.getElementById("tooltip__item");

        //document.getElementById("btnRefreshMenu").click();
    </script>
</body>
</html>
