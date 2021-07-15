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
        <div class="scroll-effect" style="overflow: hidden; height: 100vh;">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="row">
                    <div class="col-md-5">
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
                    <div class="col-md-7">
                        <div class="card">
                            <telerik:RadTabStrip runat="server" ID="RadTabStrip1"  MultiPageID="RadMultiPage1" SelectedIndex="0"
                  Skin="Silk" >
                                <Tabs>
                                    <telerik:RadTab Text="Allergy" Value="Allergy" Width="200px"></telerik:RadTab>
                                    <%--<telerik:RadTab Text="Vital Signs" Value="VitalSigns" Width="200px"></telerik:RadTab>--%>
                                    <telerik:RadTab Text="Problem List" Value="ProblemList" Width="200px"></telerik:RadTab>
                                </Tabs>
                            </telerik:RadTabStrip>
                            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0">
                                <telerik:RadPageView id="Allergy" runat="server">
                                    <telerik:RadGrid CssClass="mb-2 mt-3" OnNeedDataSource="RadGridAllergy_NeedDataSource" ShowHeaderWhenEmpty="true" ID="RadGridAllergy" runat="server" ShowHeader="true" AutoGenerateColumns="false" Height="180px" AllowPaging="true">
                                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="allergy_id">
                                            <Columns>
                                                <telerik:GridBoundColumn ItemStyle-Width="150px" DataField="allergy_name_e" HeaderText="allergy name e" />
                                                <telerik:GridBoundColumn ItemStyle-Width="150px" DataField="allergy_name_l" HeaderText="allergy name l" />
                                                <telerik:GridBoundColumn ItemStyle-Width="150px" DataField="lu_updated" HeaderText="last updated" />
                                            </Columns>
                                        </MasterTableView>
                                        <ClientSettings>
                                            <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true"/>
                                        </ClientSettings>
                                    </telerik:RadGrid>
                                </telerik:RadPageView>
                                <telerik:RadPageView id="VitalSigns" runat="server">
                                    <telerik:RadGrid CssClass="mb-2 mt-3" ShowHeaderWhenEmpty="true" ID="gridViewVitalSign" runat="server" ShowHeader="true" AutoGenerateColumns="false" Height="180px" AllowPaging="true">
                                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_visit_id, visit_type_rcd, closure_date_time, allow_date_time">
                                            <Columns>
                                                <telerik:GridBoundColumn ItemStyle-Width="150px" DataField="actual_visit_date_time" HeaderText="Date" />
                                                <telerik:GridBoundColumn ItemStyle-Width="150px" DataField="actual_visit_date_time" HeaderText="Item" />
                                                <telerik:GridBoundColumn ItemStyle-Width="150px" DataField="actual_visit_date_time" HeaderText="Value" />
                                            </Columns>
                                        </MasterTableView>
                                        <ClientSettings>
                                            <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true"/>
                                        </ClientSettings>
                                    </telerik:RadGrid>
                                </telerik:RadPageView>
                                <telerik:RadPageView id="ProblemList" runat="server">
                                    <telerik:RadGrid CssClass="mb-2 mt-3" OnNeedDataSource="RadGridPatientProblem_NeedDataSource" ShowHeaderWhenEmpty="true" ID="RadGridPatientProblem" runat="server" ShowHeader="true" AutoGenerateColumns="false" Height="180px" AllowPaging="true">
                                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_problem_id">
                                            <Columns>
                                                <telerik:GridBoundColumn DataFormatString="{0:dd/MM/yyyy HH:mm}" ItemStyle-Width="150px" DataField="entry_date_time" HeaderText="First data entry Date" />
                                                <telerik:GridBoundColumn DataFormatString="{0:dd/MM/yyyy}" ItemStyle-Width="150px" DataField="onset_date_time" HeaderText="Onset Time" />
                                                <telerik:GridBoundColumn DataField="description" HeaderText="Description" />
                                                <%--<telerik:GridBoundColumn ItemStyle-Width="150px" DataField="actual_visit_date_time" HeaderText="Status" />--%>
                                                <telerik:GridBoundColumn DataFormatString="{0:dd/MM/yyyy HH:mm}" ItemStyle-Width="150px" DataField="lu_updated" HeaderText="Last Updated Date" />
                                            </Columns>
                                        </MasterTableView>
                                        <ClientSettings>
                                            <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true"/>
                                        </ClientSettings>
                                    </telerik:RadGrid>
                                </telerik:RadPageView>
                            </telerik:RadMultiPage>
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
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <telerik:RadGrid OnNeedDataSource="RadGrid1_NeedDataSource" ItemStyle-Height="32px" HeaderStyle-Height="32px" Width="100%" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound" CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True">
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
                                                        <telerik:GridTemplateColumn UniqueName="StatusSMS" HeaderText="Request" HeaderStyle-Width = "5%" AllowFiltering="false"
                                                        Visible="true" ItemStyle-HorizontalAlign="Center" DataType="System.Boolean">
                                                        <ItemTemplate>
                                                            <asp:Panel ID="Panel1" runat="server">
                                                                <asp:CheckBox ID="CheckRequest" runat="server" AutoPostBack="true" OnCheckedChanged="CheckedRequest" Checked='<%# Eval("checked_send") %>' />
                                                            </asp:Panel>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn HeaderText="PatientInfor" HeaderStyle-Width="2%" UniqueName="PatientInfor" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbPatient_visit_id" Text='<%# Eval("patient_visit_id") %>' ></asp:Label>
                                                            <asp:Label runat="server" ID="lbActual_visit_date_time" Text='<%# Eval("actual_visit_date_time") %>' ></asp:Label>
                                                            <asp:Label runat="server" ID="lbVisit_code" Text='<%# Eval("visit_code") %>' ></asp:Label>
                                                            <asp:Label runat="server" ID="lbRequest_date_time" Text='<%# Eval("request_date_time") %>' ></asp:Label>
                                                            <asp:Label runat="server" ID="lbCheckSend" Text='<%# Eval("checked_send") %>' ></asp:Label>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    </Columns>
                                                </MasterTableView>
                                                <ClientSettings EnableRowHoverStyle="false">
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
                                <p>
                                    Visit type <asp:Label runat="server" ID="lbl_visit_type"></asp:Label>
                                </p>
                                <select id="ddlDocList" runat="server" class="custom-select"></select>
                            </div>
                            <div class="modal-footer">
                                <div id="btnClose" data-dismiss="modal" class="btn btn-default waves-effect">Close</div>
                                <asp:LinkButton runat="server" ID="btnSave" OnClick="btnSave_Click" OnClientClick="document.getElementById('btnSave').classList.add('disabled');" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
</body>
</html>
