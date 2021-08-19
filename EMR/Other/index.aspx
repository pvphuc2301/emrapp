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
    <style>
        .RadGrid_Bootstrap .rgRow, .RadGrid_Bootstrap .rgAltRow, .RadGrid_Bootstrap .rgEditRow, .RadGrid_Bootstrap .rgFooter, .RadGrid_Bootstrap .rgGroupHeader{
            height: 2.1em !important;
        }

        .RadGrid_Bootstrap .rgHeader, .RadGrid_Bootstrap th.rgResizeCol {
            padding: 6px 15px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <telerik:RadCodeBlock runat="server" ID="RadCodeBlock1">
            <script>
                function showWindow() {
                    var oWnd = $find("<%=RadWindow1.ClientID%>");
                    oWnd.show();
                }

                function showWindow2() {
                    var oWnd = $find("<%=RadWindow2.ClientID%>");
                    oWnd.show();
                }

                function AddNode(value, url) {

                    //var tree = window.parent.$find("RadTreeView1");

                    //var treeTemp = $find("TreeviewTemp");

                    //var nodeParent = tree.findNodeByText(document.getElementById("lblVisitDate").value);

                    //var node = treeTemp.findNodeByText("New Node");

                    //node.set_text(value);
                    
                    //nodeParent.get_nodes().add(node);

                    //node.select();

                    //tree.findNodeByText(value).select();

                    //tree.commitChanges();

                    let LeftMenu = window.parent.window.document.getElementById("RAD_SPLITTER_PANE_EXT_CONTENT_LeftMenu");

                    window.parent.window.document.getElementById('_TRANSACTION').value = document.getElementById("lblVisitDate").value;

                    var item = {
                        "root": document.getElementById("lblVisitDate").value,
                        "item": value
                    };

                    LeftMenu.src = replaceUrlParam(LeftMenu.src, "item", JSON.stringify(item));
                    
                    //window.location.href = url;
                }

                function replaceUrlParam(url, paramName, paramValue) {
                    if (paramValue == null) {
                        paramValue = '';
                    }
                    var pattern = new RegExp('\\b(' + paramName + '=).*?(&|#|$)');
                    if (url.search(pattern) >= 0) {
                        return url.replace(pattern, '$1' + paramValue + '$2');
                    }
                    url = url.replace(/[?#]$/, '');
                    return url + (url.indexOf('?') > 0 ? '&' : '?') + paramName + '=' + paramValue;
                }
            </script>
        </telerik:RadCodeBlock>

        <div style="overflow-x: hidden; overflow-y: scroll; height: calc(100vh - 16px);">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="row">
                    <div class="col-md-5">
                        <div class="card">
                            <div class="card-body">
                                <div class="row col-12 mb-2">
                                    <h4 class="card-title control-label m-0">
                                        <span class="text-primary">Demographics</span>
                                    </h4>
                                </div>

                                <div class="row col-12">
                                    <div >
                                        <asp:Label Font-Bold="true" runat="server" ID="lbl_demographics_title"></asp:Label>
                                    </div>
                                    <lable class="flex-grow-1" runat="server" id="Lable1"></lable>
                                </div>

                                <div class="row col-12" style="background-color: #337ab7; padding-top: 3px; padding-bottom: 2px; color: #fff;">
                                    Demographics
                                </div>

                                <div class="row col-12">
                                    <div class="w-sm-6 d-flex">
                                        Gender
                                    </div>
                                    <lable class="flex-grow-1" runat="server" id="lblGender"></lable>
                                </div>

                                <div class="row col-12">
                                    <div class="w-sm-6 d-flex">
                                        Date of Birth (Age)
                                    </div>
                                    <div class="flex-grow-1" runat="server" id="lblAge"></div>
                                </div>

                                <div class="row col-12">
                                    <div class="w-sm-6 d-flex">
                                        Address
                                    </div>
                                    <div class="flex-grow-1" runat="server" id="lblAddress"></div>
                                </div>

                                <div class="row col-12">
                                    <div class="w-sm-6 d-flex">
                                        Phone
                                    </div>
                                    <div class="flex-grow-1" runat="server" id="lblPhone"></div>
                                </div>

                                <div class="row col-12" style="background-color: #337ab7; padding-top: 3px; padding-bottom: 2px; color: #fff;">
                                    Next of Kin / Person to Contact
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
                            <telerik:RadTabStrip runat="server" ID="RadTabStrip1"  MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk">
                                <Tabs>
                                    <telerik:RadTab Text="Allergy" Value="Allergy" Width="200px"></telerik:RadTab>
                                    <telerik:RadTab Text="Problem List" Value="ProblemList" Width="200px"></telerik:RadTab>
                                </Tabs>
                            </telerik:RadTabStrip>

                            <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0">
                                <telerik:RadPageView id="Allergy" runat="server">
                                    <telerik:RadGrid CssClass="table mb-2 mt-3" BorderStyle="None" OnNeedDataSource="RadGridAllergy_NeedDataSource" ShowHeaderWhenEmpty="true" ID="RadGridAllergy" AllowSorting="true" runat="server" ShowHeader="true" AutoGenerateColumns="false" AllowPaging="true">
                                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="allergy_id">
                                            <Columns>
                                                <telerik:GridBoundColumn ItemStyle-Width="150px" DataField="allergy_name_e" HeaderText="Allergy name e" />
                                                <telerik:GridBoundColumn ItemStyle-Width="150px" DataField="allergy_name_l" HeaderText="Allergy name l" />
                                                <telerik:GridBoundColumn ItemStyle-Width="150px" DataField="lu_updated" DataFormatString="{0:dd-MMM-yyyy HH:mm}" HeaderText="Last updated" />
                                            </Columns>
                                        </MasterTableView>
                                        <ClientSettings>
                                            <Scrolling AllowScroll="true" ScrollHeight="224" UseStaticHeaders="true" SaveScrollPosition="true"/>
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                    </telerik:RadGrid>
                                </telerik:RadPageView>

                                <telerik:RadPageView id="ProblemList" runat="server">
                                    <telerik:RadGrid CssClass="table mb-2 mt-3" BorderStyle="none" OnNeedDataSource="RadGridPatientProblem_NeedDataSource" ShowHeaderWhenEmpty="true" ID="RadGridPatientProblem" runat="server" ShowHeader="true" AutoGenerateColumns="false" AllowSorting="true" AllowPaging="true">
                                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_problem_id">
                                            <Columns>
                                                <telerik:GridBoundColumn DataFormatString="{0:dd-MMM-yyyy HH:mm}" ItemStyle-Width="150px" DataField="entry_date_time" HeaderText="First data entry Date" />
                                                <telerik:GridBoundColumn DataFormatString="{0:dd-MMM-yyyy}" ItemStyle-Width="150px" DataField="onset_date_time" HeaderText="Onset Time" />

                                                <telerik:GridBoundColumn DataField="description" HeaderText="Description" />

                                                <telerik:GridBoundColumn DataFormatString="{0:dd-MMM-yyyy HH:mm}" ItemStyle-Width="155px" DataField="lu_updated" HeaderText="Last Updated Date" />
                                            </Columns>
                                        </MasterTableView>
                                        <ClientSettings>
                                            <Scrolling AllowScroll="true" ScrollHeight="224" UseStaticHeaders="true" SaveScrollPosition="true"/>
                                            <Selecting AllowRowSelect="true" />
                                        </ClientSettings>
                                    </telerik:RadGrid>
                                </telerik:RadPageView>
                            </telerik:RadMultiPage>
                        </div>
                    </div>
                </div>

                <telerik:RadTreeView Style="display: none;" runat="server" ID="TreeviewTemp" />
                <asp:HiddenField runat="server" ID="lblVisitDate" />

                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header bg-white">
                                <h4 class="card-title control-label m-0">
                                    <span class="text-primary">Encounter History</span>
                                </h4>
                            </div>
                            <div class="card-body p-0">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <telerik:RadGrid OnNeedDataSource="RadGrid1_NeedDataSource" ItemStyle-Height="32px" AllowSorting="true" HeaderStyle-Height="32px" Width="100%" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound" CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True">
                                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_visit_id, visit_type_group_rcd, visit_type_rcd, closure_date_time, closed_date_time, allow_date_time, actual_visit_date_time">
                                                    <Columns>
                                                        <telerik:GridTemplateColumn HeaderText="Action" ItemStyle-Width="120px">
                                                            <ItemTemplate>
                                                                <asp:LinkButton CssClass="btn btn-primary btn-sm" Text="Add New" runat="server" CommandName="addNew" ID="btnAddNew" Width="120" />
                                                            </ItemTemplate>
                                                        </telerik:GridTemplateColumn>

                                                        <telerik:GridBoundColumn DataFormatString="{0:dd-MMM-yyyy HH:mm}" HeaderText="Visit date" DataField="actual_visit_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"/>

                                                        <telerik:GridBoundColumn DataFormatString="{0:dd-MMM-yyyy HH:mm}" HeaderText="Closure date" DataField="closure_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"/>

                                                        <telerik:GridBoundColumn HeaderText="Group" DataField="visit_type_group_rcd" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"/>

                                                        <telerik:GridBoundColumn HeaderText="Visit type" DataField="visit_type_rcd" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"/>

                                                        <telerik:GridBoundColumn HeaderText="Visit code" DataField="visit_code" ItemStyle-Wrap="false" HeaderStyle-Wrap="false"/>

                                                        <telerik:GridTemplateColumn UniqueName="StatusSMS" HeaderText="Request" HeaderStyle-Width = "5%" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Center" DataType="System.Boolean">
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
                                                    <Selecting AllowRowSelect="true" />
                                                </ClientSettings>
                                            </telerik:RadGrid>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    
                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" Height="270">
                <Windows>
                    <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" Title="Update reason" runat="server">
                        <ContentTemplate>

                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="txtUpdateReason" Width="100%" EmptyMessage="Enter reason" TextMode="MultiLine" Height="100px" Resize="None"></telerik:RadTextBox><br />
                            <asp:HiddenField runat="server" ID="sendRequestVmDB" />
                            <telerik:RadButton CssClass="mt-2" RenderMode="Lightweight" ID="btnSendRequest" runat="server"
                        Text="Send" Primary="true" OnClick="btnSendRequest_Click" >

                    </telerik:RadButton>
                        </ContentTemplate>
                    </telerik:RadWindow>

                    <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow2" Title="Add Form" runat="server">
                        <ContentTemplate>
                            <p>
                                <asp:Label runat="server" ID="lblVisitDetails"></asp:Label>
                            </p>
                                
                            <select id="ddlDocList" runat="server" class="custom-select"></select>
                            <div class="d-grid no-block justify-content-end">
                                <asp:LinkButton ValidationGroup="Group1" runat="server" ID="btnSave" OnClick="btnSave_Click" OnClientClick="return ddDocList_select();" CssClass="btn btn-primary mt-4">Save</asp:LinkButton>
                            </div>
                            
                        </ContentTemplate>
                    </telerik:RadWindow>
                </Windows>
            </telerik:RadWindowManager>

                <div id="Div1" runat="server" class="modal fade in" role="dialog" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body">
                                <p>
                                    Form Summary Of Complex Outpatient Case is exist!<asp:Label runat="server" ID="Label1"></asp:Label>
                                </p>
                            </div>
                            <div class="modal-footer">
                                <div data-dismiss="modal" class="btn btn-default waves-effect">Close</div>
                                <asp:LinkButton runat="server"  ID="LinkButton1" OnClick="btnSave_Click" OnClientClick="document.getElementById('btnSave').classList.add('disabled');" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>
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

    <script>

        

        function ddDocList_select() {
            //if (document.getElementById('ddlDocList').value == "") {
            //    document.getElementById('ddlDocList_error').innerText = "Please select form document!";
            //    return false;
            //}
            //document.getElementById('btnSave').classList.add('disabled');
            return true;
        }
    </script>
    </body>
</html>
