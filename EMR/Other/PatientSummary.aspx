﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientSummary.aspx.cs" Inherits="EMR.PatientSummary" Async="true" %>

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
    </style>

</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
         <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <%--<div style="overflow: hidden; height: 100vh; margin-top: 15px;">--%>
                <%--<asp:HiddenField runat="server" ID="_TRANSACTION" />--%>
                <input type="hidden" runat="server" id="_TRANSACTION" />
                <%--<asp:TextBox runat="server" ID="_TRANSACTION" />--%>

                <div style="overflow: hidden; height: 100vh;">
                    <telerik:RadSplitter runat="server" ID="RadSplitter1" SplitBarsSize="4" Width="100%" Height="100%">
                        <telerik:RadPane runat="server" Width="220" Height="100%" MinWidth="150" MaxWidth="550">
                            <div style="overflow-x: hidden; overflow-y: scroll; height: 100vh" id="menuLeft">
                                <nav class="sidebar-wrapper" style="position: initial; width: inherit">
                                    <div class="sidebar-menu">
                                        <ul class="text-nowrap" style="padding: 0;">
                                            <li style="border-bottom: 1px solid #ddd; margin-bottom: 4px; margin-top: 12px;">
                                                <h5 class="title">Complex Document</h5>
                                                <telerik:RadGrid OnNeedDataSource="radGridComplexDoc_NeedDataSource" OnItemCommand="radGridComplexDoc_ItemCommand" CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ShowHeader="false"
                                    ID="radGridComplexDoc" ItemStyle-Height="25px" runat="server"
                                        >
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
                                                <telerik:RadTreeView OnNodeClick="RadTreeView2_NodeClick" ID="RadTreeView2" runat="server" OnNodeExpand="RadTreeView2_NodeExpand"/></li>
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

                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" MaxHeight="270">
                <Windows>
                    <telerik:RadWindow RenderMode="Lightweight" Modal="true" ID="RadWindow3" Title="Warning" runat="server">
                        <ContentTemplate>
                            <div class="text-center">
                                <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                <h4 class="mt-4 mb-4">Denied!</h4>
                            </div>

                            <div class="d-grid no-block justify-content-end">
                                <%--<asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="LinkButton1" CssClass="btn btn-danger">Delete</asp:LinkButton>--%>
                            </div>
                        </ContentTemplate>
                    </telerik:RadWindow>

                </Windows>
            </telerik:RadWindowManager>

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

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <%--<script src="../scripts/custom.min.js"></script>--%>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script>
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
