<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormMenu.aspx.cs" Inherits="EMR.Other.FormMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: 0;
            padding: 0;
        }
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

        .RadTreeView_Bootstrap > ul.rtUL > li.rtLI > div.rtOut div.rtIn { cursor: default; background-color: transparent !important; border-color: transparent !important;}

        .RadTreeView_Bootstrap > ul.rtUL > li.rtLI > div.rtOut.rtSelected div.rtIn { background-color: transparent !important; border-color: transparent !important; color: #000; cursor: default;} 
        
        .RadTreeView_Bootstrap > ul.rtUL > li.rtLI > ul.rtUL > li.rtLI > div.rtOut.rtSelected a.rtIn { background-color: #337ab7 !important; border-color: #337ab7 !important; }

        .rtUL .rtLI { padding: 0; }
        .rtUL .rtLI .rtOut a.rtIn { padding: 2px 9px; }
        .rtUL .rtLI .rtOut { height: 25px }
        .rtUL .rtLI .rtOut div.rtIn { font-weight: 600; }

        .title {
            margin: 0;
            padding: 0;
            font-size: 1rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <%--<asp:TextBox  runat="server" ID="_SELECTED_ITEM" />--%>
                <div style="overflow-y: scroll; height: 100vh" id="menuLeft">
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script>

        Sys.Application.add_init(appl_init);

        function appl_init() {
            var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
            pgRegMgr.add_beginRequest(BeginHandler);
            pgRegMgr.add_endRequest(EndHandler);
        }

        function BeginHandler() {
            beforeAsyncPostBack();
        }

        function EndHandler() {
            afterAsyncPostBack();
        }

        let _scrollTop;

        function beforeAsyncPostBack() {
            var curtime = new Date();
            _scrollTop = document.querySelector("#menuLeft").scrollTop;
        }

        //let scroll = document.querySelector("#menuLeft");

        function afterAsyncPostBack() {
            //$('#DocumentList').modal('show');
            //document.getElementById("menuLeft").scrollTop(_scrollTop);
            document.querySelector("#menuLeft").scrollTop = _scrollTop;
            //$("#menuLeft").scrollTop(_scrollTop);
        }

        function FindNode() {
            //var selectedItem = document.getElementById("_SELECTED_ITEM");

            //selectedItem.value = "FINAL_DISCHARGE SUMMARY No Title HIS User Test (13:51)";

            var tree = $find("<%= RadTreeView1.ClientID %>");

            let docValue = window.parent.window.document.getElementById("_TRANSACTION").value;

            console.log("value", docValue);

            var node = tree.findNodeByText(docValue);
            

            //console.log('node', node);
            //console.log('node1', node1);

            if (docValue != null) {
                var node1 = tree.findNodeByText(docValue);
                node1.expand();
            }

            //var nodes = tree.get_allNodes();

            //for (var i = 0; i < nodes.length; i++) {
            //    if (nodes[i].get_level() == 0) {
            //        //console.log(nodes[i]);
            //        //console.log(nodes[i].collapse());
            //        //console.log(nodes[i].get_expanded());
                    
            //        if (nodes[i].get_expanded() == true) {
            //            //console.log(nodes[i]);
            //            console.log(nodes[i]._getChildren());
            //            nodes[i].select();
            //        }
            //    }

            //}

            //console.log('node1', tree.findNodeByText("FINAL_DISCHARGE SUMMARY No Title HIS User Test (18:18)"));

            //console.log('child node', tree.findNodeByText("FINAL_DISCHARGE SUMMARY No Title HIS User Test (18:18)"));

            //let node2 = node1.get_nodes().findNodeByText(docValue);

            //if (node2 != null) {
            //    console.log(node);
                
            //    //node1.get_parent().expand();
            //    node2.select();
            //}
        }

        setTimeout(() => { FindNode(); }, 100);

        
    </script>
</body>
</html>