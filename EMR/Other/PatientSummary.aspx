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
        <div class="scroll-sidebar h-100 w-100">
            <!-- Row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">Demographics</div>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Gender
                                </div>
                                <telerik:RadLabel runat="server" ID="lblGender" class="flex-grow-1"></telerik:RadLabel>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Date of Birth (Age)
                                </div>
                                <telerik:RadLabel runat="server" ID="lblAge" class="flex-grow-1"></telerik:RadLabel>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Address
                                </div>
                                <telerik:RadLabel runat="server" ID="lblAddress" class="flex-grow-1"></telerik:RadLabel>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Phone
                                </div>
                                <telerik:RadLabel runat="server" ID="lblPhone1" class="flex-grow-1"></telerik:RadLabel>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Name
                                </div>
                                <telerik:RadLabel runat="server" ID="lblName" class="flex-grow-1"></telerik:RadLabel>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Relationship
                                </div>
                                <telerik:RadLabel runat="server" ID="lblRelationship" class="flex-grow-1"></telerik:RadLabel>
                            </div>

                            <div class="row col-12">
                                <div class=" w-sm-6 d-flex">
                                    Phone
                                </div>
                                <telerik:RadLabel runat="server" ID="lblPhone2" class="flex-grow-1"></telerik:RadLabel>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">Demographics</div>
                            </div>

                            <div class="row col-12">
                                <div class="w-sm-6 d-flex">
                                    Date of Birth (Age)
                                </div>
                                <telerik:RadLabel runat="server" ID="RadLabel1" class="flex-grow-1"></telerik:RadLabel>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    Encounter History
                </div>
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

                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                              <asp:UpdatePanel runat="server">
                                  <ContentTemplate>
                                    <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="ddlDocList_SelectedIndexChanged" runat="server" ID="ddlDocList"></asp:DropDownList>
                                  </ContentTemplate>
                              </asp:UpdatePanel>
                          </div>
                          <div class="modal-footer">
                              <asp:Button runat="server"  class="btn btn-secondary"  data-dismiss="modal"  Text="Close" ID="btnClose"/>
                              <asp:Button runat="server"  class="btn btn-primary"  Text="Save" OnClick="btnSave_Click" ID="btnSave"/>
                          </div>
                        </div>
                      </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Row -->

        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
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

    </script>
</body>
</html>
