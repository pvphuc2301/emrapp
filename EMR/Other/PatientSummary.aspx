<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientSummary.aspx.cs" Inherits="EMR.PatientSummary" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../styles/style-custom.css" rel="stylesheet" />
    <link href="../../styles/telerik-custom.css" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="loader">
                <div class="loader__figure"></div>
                <p class="loader__label">AIH Hospital</p>
            </div>
        </div>

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
                                <lable class="flex-grow-1" runat="server" id="lblGender" ></lable>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Date of Birth (Age)
                                </div>
                                <div class="flex-grow-1" runat="server" id="lblAge" ></div>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Address
                                </div>
                                <div class="flex-grow-1" runat="server" id="lblAddress" ></div>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Phone
                                </div>
                                <div class="flex-grow-1" runat="server" id="lblPhone" ></div>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Name
                                </div>
                                <div class="flex-grow-1" runat="server" id="lblName" ></div>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Relationship
                                </div>
                                <div class="flex-grow-1" runat="server" id="lblRelationship" ></div>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Phone
                                </div>
                                <div class="flex-grow-1" runat="server" id="lblPhoneRel" ></div>
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
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Encounter History</h4>
                        </div>

                        <%--<div class="card-body">--%>
                            <div class="row mt-4">
                                <div class="col-md-12">
                                    <telerik:RadGrid ItemStyle-Height="32px" HeaderStyle-Height="32px" CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" OnNeedDataSource="RadGrid1_NeedDataSource" AllowSorting="true" OnItemDataBound="RadGrid1_ItemDataBound">
                                        <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_visit_id, visit_type_rcd, closure_date_time">
                                            <Columns>
                                                <telerik:GridBoundColumn SortExpression="actual_visit_date_time" HeaderText="actual_visit_date_time" DataField="actual_visit_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn SortExpression="closure_date_time" HeaderText="closure_date_time" DataField="closure_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn SortExpression="visit_type_group_rcd" HeaderText="visit_type_group_rcd" DataField="visit_type_group_rcd" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn SortExpression="visit_type_rcd" HeaderText="visit_type_rcd" DataField="visit_type_rcd" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                </telerik:GridBoundColumn>

                                                <telerik:GridBoundColumn SortExpression="visit_code" HeaderText="visit_code" DataField="visit_code" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                </telerik:GridBoundColumn>
                                            </Columns>
                                        </MasterTableView>
                                        <ClientSettings EnableRowHoverStyle="true" Selecting-AllowRowSelect="true" EnablePostBackOnRowClick="true" >
                                            <Selecting AllowRowSelect="True" />
                                            <ClientEvents />
                                        </ClientSettings>
                                    </telerik:RadGrid>
                                </div>
                            </div>
                        <%--</div>--%>
                    </div>
                </div>
            </div>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Select document</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                    <select runat="server" id="ddlDocList" class="form-control"></select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="btnClose" data-dismiss="modal" class="btn btn-secondary" onserverclick="btnSave_Click" >Close</button>
                    <button runat="server" id="btnSave"  class="btn btn-primary" onserverclick="btnSave_Click" >Save</button>
                </div>
            </div>
            </div>
        </div>

        <div class="modal fade" id="popupConfirm" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <label class="modal-title">Thông báo</label>
                    <button data-dismiss="modal">X</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        Hồ sơ đã tồn tại một bản draft, Nhấn OK để mở bản draft.
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" runat="server" onserverclick="btnOpen_ServerClick" id="btnOpen" >Ok</button>
                    <button class="btn btn-secondary"  data-dismiss="modal">Cancel</button>
                </div>
            </div>
            </div>
        </div>

    </form>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    
    <script>
        
        if ('<%= showPopup %>' == 'True') {
            $("#exampleModalCenter").modal("show");
        }

        if ('<%= isDraft %>' == 'True') {
            $("#popupConfirm").modal("show");
        }

    </script>
</body>
</html>
