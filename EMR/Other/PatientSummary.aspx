<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientSummary.aspx.cs" Inherits="EMR.PatientSummary" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

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
        .RadTreeView_Bootstrap .rtOut.rtHover div.rtIn, 
        .RadTreeView_Bootstrap .rtOut.rtSelected div.rtIn { background-color: transparent !important; border-color: transparent !important; }
        .rtUL .rtLI { padding: 0; }
        .rtUL .rtLI .rtOut a.rtIn { padding: 2px 9px; }
        .rtUL .rtLI .rtOut { height: 25px }

    </style>

</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div style="overflow: hidden; height: 100vh;">
            
            <telerik:RadSplitter runat="server" ID="RadSplitter1" CssClass="border-top border-default" SplitBarsSize="2" 
    Orientation="Vertical" Width="100%" Height="100%">
    <telerik:RadPane runat="server" ID="TopPane" Width="220" MinWidth="150" MaxWidth="550">
        <!-- Sidebar scroll-->
        <%--<asp:LinkButton CssClass="btn btn-outline-light waves-effect position-sticky waves-secondary text-dark w-100" ID="btnPatientSummary" OnClick="btnPatientSummary_Click" runat="server">Patient Summary</asp:LinkButton>--%>
                
        <div style="overflow-x: hidden; height: 100vh">
            <nav class="sidebar-wrapper" style="position: initial; width: inherit">
                <div class="sidebar-menu">
                            
                    <ul class="text-nowrap">
                        <li><telerik:RadTreeView OnNodeClick="RadTreeView1_NodeClick" ID="RadTreeView1" runat="server" OnNodeExpand="RadTreeView1_NodeExpand"/></li>
                        <%--END Load Left Menu--%>

                        <%--Load LAB and IMG Document--%>
                        <li><telerik:RadTreeView OnNodeClick="RadTreeView2_NodeClick" ID="RadTreeView2" runat="server" OnNodeExpand="RadTreeView2_NodeExpand"/></li>
                        <%--End Load LAB and IMG Document--%>

                        <%--Load Scan Document--%>
                        <asp:LinkButton CssClass="btn btn-outline-light waves-effect waves-secondary text-dark w-100" ID="LinkButton2" runat="server" >Scan Document</asp:LinkButton>
                        <li>
                            <telerik:RadTreeView OnNodeClick="RadTreeView3_NodeClick" ID="RadTreeView3" runat="server" OnNodeExpand="RadTreeView3_NodeExpand"/>
                        </li>
                        <%--End Load Scan Document--%>
                    </ul>
                                
                </div>
            </nav>
        </div>
    </telerik:RadPane>
    <telerik:RadSplitBar CollapseMode="none" Visible="true" runat="server" ID="RadSplitBar1" ResizeStep="3" />

    <telerik:RadPane ID="MainContent" runat="server" OnUnload="MainContent_Unload" OnPreRender="MainContent_PreRender" align="center"></telerik:RadPane>
    </telerik:RadSplitter>

        </div>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <%--<script src="../scripts/custom.min.js"></script>--%>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script>

        function beforeAsyncPostBack() {
            var curtime = new Date();
            console.log(curtime);
        }

        function afterAsyncPostBack() {
            $('#DocumentList').modal('show');
        }

    </script>

</body>
</html>
