<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientSummary.aspx.cs" Inherits="EMR.PatientSummary" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div style="overflow-y: scroll; overflow-x: hidden; height: calc(100vh - 51px);">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <!-- ============================================================== -->
                    <!-- Main wrapper - style you can find in pages.scss -->
                    <!-- ============================================================== -->
                    <!-- Row -->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Demographics</h4>
                                </div>

                                <div class="card-body">
                                    <div class="row col-12">
                                        <div class=" w-sm-6 d-flex">
                                            Gender
                                        </div>
                                        <lable class="flex-grow-1" runat="server" id="lblGender"></lable>
                                    </div>

                                    <div class="row col-12">
                                        <div class=" w-sm-6 d-flex">
                                            Date of Birth (Age)
                                        </div>
                                        <div class="flex-grow-1" runat="server" id="lblAge"></div>
                                    </div>

                                    <div class="row col-12">
                                        <div class=" w-sm-6 d-flex">
                                            Address
                                        </div>
                                        <div class="flex-grow-1" runat="server" id="lblAddress"></div>
                                    </div>

                                    <div class="row col-12">
                                        <div class=" w-sm-6 d-flex">
                                            Phone
                                        </div>
                                        <div class="flex-grow-1" runat="server" id="lblPhone"></div>
                                    </div>

                                    <div class="row col-12">
                                        <div class=" w-sm-6 d-flex">
                                            Name
                                        </div>
                                        <div class="flex-grow-1" runat="server" id="lblName"></div>
                                    </div>

                                    <div class="row col-12">
                                        <div class=" w-sm-6 d-flex">
                                            Relationship
                                        </div>
                                        <div class="flex-grow-1" runat="server" id="lblRelationship"></div>
                                    </div>

                                    <div class="row col-12">
                                        <div class=" w-sm-6 d-flex">
                                            Phone
                                        </div>
                                        <div class="flex-grow-1" runat="server" id="lblPhoneRel"></div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <%--<div class="card">
                                <div class="card-header">
                                    <h4>Indicator</h4>
                                </div>

                                <div class="card-body">
                                    <div class="row col-12">
                                        <div class="w-sm-6 d-flex">
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="card">
                                <%--<div class="card-body">--%>
                                <div class="row col-12">
                                    <div class="demo-container no-bg">
                                        <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk"
                                            Width="100%">
                                            <Tabs>
                                                <telerik:RadTab Text="Order Printing" Width="180px"></telerik:RadTab>
                                                <telerik:RadTab Text="MAR Printing" Width="180px"></telerik:RadTab>
                                                <telerik:RadTab Text="OPD Prescription" Width="180px"></telerik:RadTab>
                                            </Tabs>
                                        </telerik:RadTabStrip>
                                        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage" Width="620px">
                                            <telerik:RadPageView runat="server" ID="RadPageView1">
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView2" ContentUrl="~/phar/marprinting.aspx">
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView3">
                                            </telerik:RadPageView>
                                        </telerik:RadMultiPage>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Encounter History</h4>
                                </div>

                                <div class="row mt-4">
                                    <div class="col-md-12">
                                        <telerik:RadGrid OnNeedDataSource="RadGrid1_NeedDataSource" ItemStyle-Height="32px" HeaderStyle-Height="32px" CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound">
                                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_visit_id, visit_type_rcd, closure_date_time, allow_date_time">
                                                <Columns>
                                                    <telerik:GridTemplateColumn ItemStyle-Width="100px">
                                                        <HeaderTemplate>
                                                            <div>Action</div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" CommandName="addNew" ID="btnAddNew" CssClass="btn btn-sm btn-primary waves-effect" Width="66px">Add new</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="actual_visit_date_time" HeaderText="actual_visit_date_time" DataField="actual_visit_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn UniqueName="closure_date_time" SortExpression="closure_date_time" HeaderText="closure_date_time" DataField="closure_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn SortExpression="visit_type_group_rcd" HeaderText="visit_type_group_rcd" DataField="visit_type_group_rcd" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn SortExpression="visit_type_rcd" HeaderText="visit_type_rcd" DataField="visit_type_rcd" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn SortExpression="visit_code" HeaderText="visit_code" DataField="visit_code" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true">
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                    </div>
                                </div>

                                <div class="card-footer bg-white py-4">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination" runat="server" id="pagination1">
                                        </ul>
                                        <script>
                                            function goToPage(varPID, pageIndex, pageSize, userName) {

                                                let pageInfo = {
                                                    varPID: varPID,
                                                    pageIndex: pageIndex,
                                                    pageSize: pageSize,
                                                    userName: userName
                                                }

                                                __doPostBack('goToPage', JSON.stringify(pageInfo));
                                            }
                                        </script>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="DocumentList" runat="server" class="modal fade in" role="dialog" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Select document</h5>
                                    <div class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </div>
                                </div>
                                <div class="modal-body">
                                    <select id="ddlDocList" runat="server" class="custom-select"></select>
                                </div>
                                <div class="modal-footer">
                                    <div id="btnClose" data-dismiss="modal" class="btn btn-default waves-effect">Close</div>
                                    <asp:LinkButton runat="server" ID="btnSave" OnClick="btnSave_Click" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="popupConfirm" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <label class="modal-title">Thông báo</label>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        Hồ sơ đã tồn tại một bản draft, Nhấn OK để mở bản draft.
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button data-dismiss="modal" class="btn btn-white">Close</button>
                                    <asp:Button runat="server" OnClick="btnOpen_Click" ID="btnOpen" class="btn btn-primary" Text="Ok" />
                                </div>
                            </div>
                        </div>
                    </div>

                </ContentTemplate>
                <Triggers>
                    <%--<asp:PostBackTrigger ControlID="btnAction" />--%>
                    <%--<asp:PostBackTrigger ControlID="btnSave" />
                    <asp:PostBackTrigger ControlID="btnComplete" />--%>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" />
                </Triggers>
            </asp:UpdatePanel>
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
    </script>

</body>
</html>
