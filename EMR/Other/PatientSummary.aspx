<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientSummary.aspx.cs" Inherits="EMR.PatientSummary" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />--%>
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="h-100 w-100" style="overflow: scroll">
            <%--<asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>

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
                            <div class="card">
                                <div class="card-header">
                                    <h4>Indicator</h4>
                                </div>

                                <div class="card-body">
                                    <div class="row col-12">
                                        <div class="w-sm-6 d-flex">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                    <%--<div class="card-body">--%>
                            <div class="row col-12">                                
                                    <div class="demo-container no-bg">
                                        <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip1"  MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk" 
                                            Width="100%">
                                            <Tabs>
                                                <telerik:RadTab Text="Order Printing" Width="180px"></telerik:RadTab>
                                                <telerik:RadTab Text="MAR Printing" Width="180px"></telerik:RadTab>
                                                <telerik:RadTab Text="OPD Prescription" Width="180px"></telerik:RadTab>
                                            </Tabs>
                                        </telerik:RadTabStrip>
                                        <telerik:RadMultiPage runat="server" ID="RadMultiPage1"  SelectedIndex="0" CssClass="outerMultiPage" Width="620px">
                                            <telerik:RadPageView runat="server" ID="RadPageView1">
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView2" ContentUrl="~/phar/marprinting.aspx">
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView3" >
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
                                        <%--<asp:UpdatePanel ID="Upd" runat="server" OnLoad="Upd_Load" UpdateMode="Conditional">
                                            <ContentTemplate>--%>
                                                <telerik:RadGrid ItemStyle-Height="32px" HeaderStyle-Height="32px" CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True" OnNeedDataSource="RadGrid1_NeedDataSource" AllowSorting="true" OnItemDataBound="RadGrid1_ItemDataBound">
                                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_visit_id, visit_type_rcd, closure_date_time, allow_date_time">
                                                        <Columns>
                                                            <telerik:GridTemplateColumn ItemStyle-Width="100px">
                                                                <HeaderTemplate>
                                                                    <div>Action</div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Button OnClick="btnAction_Click" Enabled="true" CssClass="btn btn-primary" ID="btnAction" Text="Add new" Width="82px" runat="server" />
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
                                            <%--</ContentTemplate>    
                                        </asp:UpdatePanel>--%>

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

                    <div id="exampleModalCenter" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Select document</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <select id="ddlDocList" runat="server" class="custom-select"></select>
                                </div>
                                <div class="modal-footer">
                                    <button id="btnClose" data-dismiss="modal" class="btn btn-white">Close</button>
                                    <asp:Button runat="server" OnClick="btnSave_Click" ID="btnSave" class="btn btn-primary" Text="Save"/>
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
                                    <asp:Button runat="server" OnClick="btnOpen_Click" ID="btnOpen" class="btn btn-primary" Text="Ok"/>
                                </div>
                            </div>
                        </div>
                    </div>

                <%--</ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnAction" />
                    <asp:PostBackTrigger ControlID="btnSave" />
                    <asp:PostBackTrigger ControlID="btnComplete" />
                </Triggers>
            </asp:UpdatePanel>--%>
        </div>
    </form>
    
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>

    <script>

        //function btnAction_Click(sender) {

        //    let data = {
        //        pvid: String(sender.getAttribute("data-pvid")),
        //        visitType: String(sender.getAttribute("data-visittype"))
        //    }

        //    POST("PatientSummary.aspx/AddForm", JSON.stringify(data), (res) => {

        //        let ddlDocList = document.getElementById("ddlDocList");

        //        JSON.parse(res.d).forEach((item) => {
        //            let option = document.createElement("option");
        //            option.value = `${item.model_id}|${item.url}|${item.pvid}`;
        //            option.text = item.model_name;

        //            ddlDocList.appendChild(option);
        //        });

        //        $("#exampleModalCenter").modal("show");
        //    });
        //}

        //function POST(url, data, callback) {
        //    $.ajax({
        //        type: "POST",
        //        url: url,
        //        data: data,
        //        contentType: 'application/json; charset=utf-8',
        //        dataType: 'json',
        //        success: function (msg) {
        //            callback(msg);
        //        }
        //    });
        //}

        if ('<%= showPopup %>' == 'True') {
            $("#exampleModalCenter").modal("show");
        }

        if ('<%= isDraft %>' == 'True') {
            $("#popupConfirm").modal("show");
        }
    </script>

</body>
</html>
