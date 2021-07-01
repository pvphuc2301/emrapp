<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EMR.Other.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="row">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header bg-white">
                                <h4 class="card-title control-label m-0">
                                    <span class="text-primary">Demographics</span>
                                </h4>
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

                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header bg-white">
                                <h4 class="card-title control-label m-0">
                                    <span class="text-primary">Encounter History</span>
                                </h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">

                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <telerik:RadGrid OnNeedDataSource="RadGrid1_NeedDataSource" ItemStyle-Height="32px" HeaderStyle-Height="32px" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound" CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True">
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

                                                <telerik:GridBoundColumn HeaderText="visit date" DataField="actual_visit_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"/>

                                                <telerik:GridBoundColumn HeaderText="closure date" DataField="closure_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"/>

                                                <telerik:GridBoundColumn HeaderText="group" DataField="visit_type_group_rcd" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"/>

                                                <telerik:GridBoundColumn HeaderText="visit type" DataField="visit_type_rcd" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"/>

                                                <telerik:GridBoundColumn HeaderText="visit code" DataField="visit_code" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"/>

                                            </Columns>
                                        </MasterTableView>
                                        <ClientSettings EnableRowHoverStyle="true">
                                        </ClientSettings>
                                    </telerik:RadGrid>
                                </div>
                            </div>
                                    </div>
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
</body>
</html>
