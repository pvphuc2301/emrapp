<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="EMR.Other.index" %>

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
    <%--<link href="../styles/css/fontawesome-all.css" rel="stylesheet" />--%>
    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet" />--%>
    <%--<script type="text/javascript" src="https://example.com/fontawesome/v5.15.4/js/all.js"></script>--%>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/fontawesome.min.css" integrity="sha512-RvQxwf+3zJuNwl4e0sZjQeX7kUa3o82bDETpgVCH2RiwYSZVDdFJ7N/woNigN/ldyOOoKw8584jM4plQdt8bhA==" crossorigin="anonymous" referrerpolicy="no-referrer" />--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/fontawesome.min.js" integrity="sha512-j3gF1rYV2kvAKJ0Jo5CdgLgSYS7QYmBVVUjduXdoeBkc4NFV4aSRTi+Rodkiy9ht7ZYEwF+s09S43Z1Y+ujUkA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        .RadGrid_Bootstrap .rgRow, .RadGrid_Bootstrap .rgAltRow, .RadGrid_Bootstrap .rgEditRow, .RadGrid_Bootstrap .rgFooter, .RadGrid_Bootstrap .rgGroupHeader{
            height: 2.1em !important;
        }

        .RadGrid_Bootstrap .rgHeader, .RadGrid_Bootstrap th.rgResizeCol {
            padding: 6px 15px !important;
        }

        .RadTabStrip_Silk .rtsLevel1 .rtsSelected .rtsLink {
            background-image: none !important;
            background-color: #fff !important;
            color: #337ab7 !important;
        }

        .RadTabStrip_Silk .rtsLevel1 .rtsSelected .rtsLink:before {
            color: #337ab7 !important;
            border-color: #337ab7 !important;
        }

        .RadTabStrip_Silk .rtsLevel1 .rtsLink {
            background-color: #F7F7F7 !important;
            background-image: none !important;
        }

        .RadTabStrip_Silk .rtsLevel1 .rtsHovered .rtsLink {
            background-color: #F0F0F0 !important;
        }

        .rwTitleBar {
            background-color: #fff;
        }

        /*svg {
           width: 8px;
        }*/
        .TelerikModalOverlay {
            opacity: 0 !important;
            background-color: unset;

        }

        .RadWindow_Bootstrap {
            border: 1px solid #597189 !important;
            border-radius: 0 !important;
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
                function show_window(rwndID)
                {
                    var oWnd = $find(rwndID);
                    oWnd.show();
                }
                function showWindow2() {
                    var oWnd = $find("<%= rwndFormDoc.ClientID %>");
                    oWnd.show();
                }

                //function AddNode(value, url) {

                //    //var tree = window.parent.$find("RadTreeView1");

                //    //var treeTemp = $find("TreeviewTemp");

                //    //var nodeParent = tree.findNodeByText(document.getElementById("lblVisitDate").value);

                //    //var node = treeTemp.findNodeByText("New Node");

                //    //node.set_text(value);

                //    //nodeParent.get_nodes().add(node);

                //    //node.select();

                //    //tree.findNodeByText(value).select();

                //    //tree.commitChanges();

                //    let LeftMenu = window.parent.window.document.getElementById("RAD_SPLITTER_PANE_EXT_CONTENT_LeftMenu");

                //    window.parent.window.document.getElementById('_TRANSACTION').value = document.getElementById("lblVisitDate").value;

                //    var item = {
                //        "root": document.getElementById("lblVisitDate").value,
                //        "item": value
                //    };

                //    LeftMenu.src = replaceUrlParam(LeftMenu.src, "item", JSON.stringify(item));

                //    //window.location.href = url;
                //}

                //function replaceUrlParam(url, paramName, paramValue) {
                //    if (paramValue == null) {
                //        paramValue = '';
                //    }
                //    var pattern = new RegExp('\\b(' + paramName + '=).*?(&|#|$)');
                //    if (url.search(pattern) >= 0) {
                //        return url.replace(pattern, '$1' + paramValue + '$2');
                //    }
                //    url = url.replace(/[?#]$/, '');
                //    return url + (url.indexOf('?') > 0 ? '&' : '?') + paramName + '=' + paramValue;
                //}
            </script>
        </telerik:RadCodeBlock>
        <div style="position: fixed; inset: 0; z-index: 4000; display: none;" id="loading">
            <div>Loading...</div>
        </div>
        <div style="overflow-x: hidden; overflow-y: scroll; height: calc(100vh - 16px);">
            <%--Demographics--%>
            <asp:UpdatePanel runat="server" ID="uplDemographics" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-5">
                            <div style="border: 1px solid #d7d7db; margin: 12px; border-radius: 4px;">
                                <div style="padding: 10px 1.25rem; font-size: 18px;">
                                    <span class="text-primary">Demographics</span>
                                </div>

                                <div style="padding: 0 1.25rem;">
                                    <asp:Label Font-Bold="true" runat="server" ID="lbl_demographics_title"/>
                                </div>

                                <div style="padding: 0 1.25rem; background-color: #e9ecef; padding-top: 3px; padding-bottom: 2px; color: #000;">Demographics</div>
                        
                                <div style="padding: 0 1.25rem; display: grid; grid-template-columns: 150px 1fr">
                                    Gender <lable runat="server" id="lblGender" />
                                </div>

                                <div style="padding: 0 1.25rem; display: grid; grid-template-columns: 150px 1fr">
                                    Date of Birth (Age) <lable class="flex-grow-1" runat="server" id="lblAge"/>
                                </div>

                                <div style="padding: 0 1.25rem; display: grid; grid-template-columns: 150px 1fr">
                                    Address <lable runat="server" id="lblAddress"/>
                                </div>
                                
                                <div style="padding: 0 1.25rem; display: grid; grid-template-columns: 150px 1fr">
                                    Phone <div runat="server" id="lblPhone"/>
                                </div>

                                <div style="padding: 0 1.25rem; background-color: #e9ecef; padding-top: 3px; padding-bottom: 2px; color: #000;">
                                    Next of Kin / Person to Contact
                                </div>

                                <div style="padding: 0 1.25rem; display: grid; grid-template-columns: 150px 1fr">
                                    Name <div class="flex-grow-1" runat="server" id="lblName"/>
                                </div>

                                <div style="padding: 0 1.25rem; display: grid; grid-template-columns: 150px 1fr">
                                    Relationship <div runat="server" id="lblRelationship"/>
                                </div>
                                
                                <div style="padding: 0 1.25rem; display: grid; grid-template-columns: 150px 1fr">
                                    Phone <div runat="server" id="lblPhoneRel"/>
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
                                        <telerik:RadGrid CssClass="table mt-3" BorderStyle="None" OnNeedDataSource="RadGridAllergy_NeedDataSource" ShowHeaderWhenEmpty="true" ID="RadGridAllergy" AllowSorting="true" runat="server" ShowHeader="true" AutoGenerateColumns="false" AllowPaging="true">
                                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="allergy_id">
                                                <Columns>
                                                    <telerik:GridBoundColumn DataField="allergy_name_e" HeaderText="Allergy name e" />
                                                    <telerik:GridBoundColumn DataField="allergy_name_l" HeaderText="Allergy name l" />
                                                    <telerik:GridBoundColumn HeaderStyle-Width="170px" DataField="lu_updated" DataFormatString="{0:dd-MMM-yyyy HH:mm}" HeaderText="Last updated" />
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings>
                                                <Scrolling AllowScroll="true" ScrollHeight="224" UseStaticHeaders="true" SaveScrollPosition="true"/>
                                                <Selecting AllowRowSelect="true" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
                                    </telerik:RadPageView>
                                    <telerik:RadPageView id="ProblemList" runat="server">
                                        <telerik:RadGrid CssClass="table mt-3" BorderStyle="none" OnNeedDataSource="RadGridPatientProblem_NeedDataSource" ShowHeaderWhenEmpty="true" ID="RadGridPatientProblem" runat="server" ShowHeader="true" AutoGenerateColumns="false" AllowSorting="true" AllowPaging="true">
                                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_problem_id">
                                                <Columns>
                                                    <telerik:GridBoundColumn HeaderStyle-Width="170px" DataFormatString="{0:dd-MMM-yyyy HH:mm}" DataField="entry_date_time" HeaderText="First data entry Date" />
                                                    <telerik:GridBoundColumn DataFormatString="{0:dd-MMM-yyyy}" HeaderStyle-Width="170px" DataField="onset_date_time" HeaderText="Onset Time" />
                                                    <telerik:GridBoundColumn DataField="description" HeaderText="Description" />
                                                    <telerik:GridBoundColumn DataFormatString="{0:dd-MMM-yyyy HH:mm}" HeaderStyle-Width="170px" DataField="lu_updated" HeaderText="Last Updated Date" />
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
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--Demographics--%>
            <asp:HiddenField runat="server" ID="lblVisitDate" />
            <%--Encounter History--%>
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
                                        <asp:UpdatePanel runat="server" ID="uplEncounterHistory" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <telerik:RadGrid OnNeedDataSource="RadGrid1_NeedDataSource" OnItemCommand="RadGrid1_ItemCommand" OnItemDataBound="RadGrid1_ItemDataBound" ID="RadGrid1" runat="server"
                                                    ItemStyle-Height="32px" AllowSorting="true" HeaderStyle-Height="32px" Width="100%" CssClass="table" BorderWidth="0" AutoGenerateColumns="false" AllowPaging="True">
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
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--Encounter History--%>
            <%--Add Form--%>
            <telerik:RadWindow CssClass="NoIconUrl" ID="rwndFormDoc" Title="Add Form" runat="server" Width="500" Height="195"
                Modal="true" VisibleStatusbar="false" Behaviors="Close,Move" Opacity="1" BackColor="#515e7b80" RenderMode="Lightweight">
                <ContentTemplate>
                    <asp:UpdatePanel runat="server" ID="upl_form_document_items" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="p-2">
                                <asp:HiddenField runat="server" ID="hfdPVID" />
                                <asp:Label runat="server" ID="lblVisitDetails"></asp:Label>
                            </div>
                            <telerik:RadDropDownList ID="rddnFormItems" runat="server" DropDownHeight="180px" Width="477px"
                                DefaultMessage="—— Please select form document ——" DropDownWidth="477px" OnItemDataBound="RadDropDownProducts_ItemDataBound"
                                DataValueField="model_id" DataTextField="model_name">
                            </telerik:RadDropDownList>
                            <%--<select id="ddlDocList" runat="server" class="custom-select"></select>--%>
                            <div class="text-right mt-2">
                                <asp:RequiredFieldValidator ID="rfvSelectedForm" Display="Dynamic" ValidationGroup="vgpSave" runat="server" ControlToValidate="rddnFormItems" ErrorMessage="Please select form document" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:LinkButton ValidationGroup="vgpSave" runat="server" ID="btnSave" OnClientClick="btnSaveClient_Click();" OnClick="btnSave_Click" CssClass="btn btn-primary" Text="Save" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ContentTemplate>
            </telerik:RadWindow>
            <%--Add Form--%>
            <%--Exist Document--%>
            <asp:UpdatePanel runat="server" ID="uplExistDoc" UpdateMode="Conditional">
                <ContentTemplate>
                    <telerik:RadWindow ID="rwndExistDoc" IconUrl="../images/getsitelogo.png" Title="Warning" runat="server" Width="500" MaxHeight="160"
                            Modal="true" VisibleStatusbar="false" Behaviors="Close,Move">
                        <ContentTemplate>
                            <div style="display: grid; grid-template-columns: auto 1fr; gap: 5px;" class="mt-3">
                                <svg xmlns="http://www.w3.org/2000/svg" width="28px" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.2.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. --><path d="M256 512c141.4 0 256-114.6 256-256S397.4 0 256 0S0 114.6 0 256S114.6 512 256 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-144c-17.7 0-32-14.3-32-32s14.3-32 32-32s32 14.3 32 32s-14.3 32-32 32z"/></svg>
                                <p>Form <telerik:RadLabel runat="server" ID="rlblFormName"></telerik:RadLabel> is exist!</p>
                                <asp:HiddenField runat="server" ID="hfdFormUrl" />
                            </div>
                            <div class="d-grid no-block justify-content-end"> <%--OnClientClicked="rbtnOpenExistDoc_Click"  AutoPostBack="false" --%>
                                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <telerik:RadButton Text="Open" runat="server" ID="rbtnOpenExistDoc" OnClick="rbtnOpenExistDoc_Click" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </ContentTemplate>
                    </telerik:RadWindow>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--Exist Document--%>
            <%--Save Document--%>
            <asp:UpdatePanel runat="server" ID="uplSaveForm" UpdateMode="Conditional">
                <ContentTemplate>
                    <telerik:RadWindowManager RenderMode="Lightweight" EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" MaxHeight="270">
                        <Windows>
                            <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" Title="Update reason" runat="server">
                                <ContentTemplate>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="txtUpdateReason" Width="100%" EmptyMessage="Enter reason" TextMode="MultiLine" Height="100px" Resize="None" /><br />
                                    <asp:HiddenField runat="server" ID="sendRequestVmDB" />
                                    <div class="d-grid no-block justify-content-end">
                                        <telerik:RadButton ID="btnSendRequest" runat="server" CssClass="mt-2" Text="Send" Primary="true"
                                                            OnClientClick="return btnSend_Click();"
                                                            OnClick="btnSendRequest_Click" />
                                    </div>
                                </ContentTemplate>
                            </telerik:RadWindow>
                            <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow3" Title="Warning" runat="server">
                                <ContentTemplate>
                                    <div class="text-center">
                                        <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                        <h4>Denied!</h4>
                                        <label runat="server" id="lblUserBlock" />
                                    </div>
                                    <div class="d-grid no-block justify-content-end">
                                        <%--<asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="LinkButton1" CssClass="btn btn-danger">Delete</asp:LinkButton>--%>
                                    </div>
                                </ContentTemplate>
                            </telerik:RadWindow>
                        </Windows>
                    </telerik:RadWindowManager>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--Save Document--%>
        </div>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script>

        function clearSession() {
            let documentid = localStorage.getItem("document_id");
            if (documentid) {
                console.log(documentid);
                __doPostBack('clear_session', documentid);
            }
        }

        Sys.Application.add_init(appl_init);

        function btnSaveClient_Click() {
            document.getElementById("loading").style.display = "unset";
        }

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

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }
        function afterAsyncPostBack() {
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                    document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }
    </script>
    <script>
        function openDialog(url, modal, width, height) {
            if (radopen) { //if not, there is no RadWindowManager on the page, add an else{} block to use window.open() or other logic
                var wnd = radopen(null, url);
                wnd.set_destroyOnClose(true);
                //add checks here in case parameters have not been passed
                wnd.setSize(width, height);
                wnd.center();
                wnd.set_modal(modal);
            }
        }
    </script>

    <script>
        function rbtnOpenExistDoc_Click() {
            var url = document.getElementById('<%= hfdFormUrl.ClientID%>').value;
            window.parent.reload_treeview(url);
        }

        function ddDocList_select() {
            //if (document.getElementById('ddlDocList').value == "") {
            //    document.getElementById('ddlDocList_error').innerText = "Please select form document!";
            //    return false;
            //}
            document.getElementById('RadWindow2_C_btnSave').classList.add('disabled');
            return true;
        }

        function btnSend_Click() {
            //if (document.getElementById('ddlDocList').value == "") {
            //    document.getElementById('ddlDocList_error').innerText = "Please select form document!";
            //    return false;
            //}
            document.getElementById('RadWindow1_C_btnSendRequest').classList.add('disabled');
            return true;
        }

    </script>
    </body>
</html>
