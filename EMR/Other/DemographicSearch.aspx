﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemographicSearch.aspx.cs" Inherits="EMR.Other.DemographicSearch" Async="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="images/aih.ico"/>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
    <%--<link href="../styles/telerik-custom.css" rel="stylesheet" />--%>
    <style>
        .RadGrid_Bootstrap .rgRow, .RadGrid_Bootstrap .rgAltRow, .RadGrid_Bootstrap .rgEditRow, .RadGrid_Bootstrap .rgFooter, .RadGrid_Bootstrap .rgGroupHeader{
            height: 2.1em !important;
        }

        .RadGrid_Bootstrap .rgHeader, .RadGrid_Bootstrap th.rgResizeCol {
            padding: 6px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="updatePanel_demographicSearch" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <div class="card">
                    <div class="card-header bg-white">
                        <h4 class="card-title control-label m-0">
                            <span class="text-primary">Demographic Search</span>
                        </h4>
                    </div>
                    <div class="card-body">
                        <div class="input-group mb-1">
                            <input type="text" maxlength="9" data-type="number" class="form-control" placeholder="Search for PID" aria-label="Search for PID" aria-describedby="basic-addon2" style="max-width: 240px;" runat="server" id="txt_pid" />

                            <div class="input-group-append">
                                <asp:LinkButton CssClass="btn btn-outline-secondary waves-effect form-edit" runat="server" ID="btnSearch" OnClick="btnSearch_Click">Search</asp:LinkButton>
                            </div>

                            <asp:UpdateProgress ID="updateProgress_demographicSearch" runat="server" AssociatedUpdatePanelID="updatePanel_demographicSearch">
                                <ProgressTemplate>
                                    <div class="loader1 ml-2">
                                        <div class="loader-wheel"></div>
                                        <%--<div class="loader-text"></div>--%>
                                    </div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </div>

                        <asp:CustomValidator runat="server" id="cusCustom" controltovalidate="txt_pid" onservervalidate="txt_pid_ServerValidate" CssClass="text-danger" errormessage="Minimum pid length is 5" />
                        <div class="table-responsive">
                            <telerik:RadGrid CssClass="table" OnItemCommand="RadGrid5_ItemCommand" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid5" runat="server" AllowPaging="false" AllowSorting="false">
                                <ClientSettings>
                                    <ClientEvents OnRowDblClick="RowDblClick" />
                                </ClientSettings>
                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_id, visible_patient_id" ClientDataKeyNames="patient_id">
                                    <Columns>
                                        <telerik:GridTemplateColumn Display="false" HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-Wrap="false">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkOpen" runat="server" CommandArgument='<%#Eval("patient_id") %>' CommandName="Open" Text=""></asp:LinkButton>
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>

                                        <telerik:GridHyperLinkColumn SortExpression="visible_patient_id" HeaderText="Patient ID" DataTextField="visible_patient_id"  ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" />
                                        <%--<telerik:GridBoundColumn SortExpression="visible_patient_id" HeaderText="Patient ID" DataField="visible_patient_id" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                        </telerik:GridBoundColumn>--%>
                                        <telerik:GridBoundColumn SortExpression="patient_name_l" HeaderText="Name" DataField="patient_name_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="date_of_birth" HeaderText="Age" DataField="date_of_birth" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="gender_e" HeaderText="Gender" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="gender_e" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="work_queue_l" HeaderText="Work Queue" DataField="work_queue_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="adtending_doctor_l" HeaderText="Attending Doctor" DataField="adtending_doctor_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn SortExpression="start_date_time" HeaderText="Visit Date" DataField="start_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                            </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSearch" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="card">
            <div class="card-header bg-white">
                <div style="width: 100%; display: grid; grid-template-columns: 1fr 1fr">
                    <h4 class="card-title control-label m-0">
                        <span class="text-primary">My Outpatient for Today</span>
                    </h4>
                    <h4>
                        <a href="#" onclick="javascript:window.open('../report/CompleteVisitReport.aspx?view=','mywin','left=60,top=20,width=1300,height=1000,toolbar=0,resizable=0');return false;">My Completed Outpatient for Today</a>
                    </h4>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <telerik:RadGrid CssClass="table" BorderWidth="0"
                        AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True" OnItemDataBound="RadGrid1_ItemDataBound"
                        AllowSorting="true" OnItemCommand="RadGrid5_ItemCommand" OnNeedDataSource="RadGrid1_NeedDataSource">
                        <ClientSettings>
                            <ClientEvents OnRowDblClick="RowDblClick1" />
                        </ClientSettings>
                        <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="patient_id, visible_patient_id,patient_visit_id">
                            <Columns>
                                <telerik:GridTemplateColumn Display="false" HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkOpen" runat="server" CommandArgument='<%#Eval("patient_id") %>' CommandName="Open" Text=""></asp:LinkButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridBoundColumn
                                    SortExpression="visible_patient_id" HeaderText="Patient ID" DataField="visible_patient_id" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn
                                    SortExpression="patient_name_l" HeaderText="Name" DataField="patient_name_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn
                                    SortExpression="date_of_birth" HeaderText="Age" DataField="date_of_birth" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn
                                    SortExpression="gender_e" HeaderText="Gender" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="gender_e" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn
                                    SortExpression="work_queue_l" HeaderText="Work Queue" DataField="work_queue_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn
                                    SortExpression="adtending_doctor_l" HeaderText="Attending Doctor" DataField="adtending_doctor_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn
                                    SortExpression="start_date_time" HeaderText="Visit Date" DataField="start_date_time" DataFormatString="{0:dd/MM/yyyy hh:mm tt}" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn HeaderButtonType="TextButton" ItemStyle-Wrap="false" Visible="true"
                                    HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457"
                                    UniqueName="completed" HeaderText="Consult date" SortExpression="visible_patient_id" HeaderStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:Panel ID="panel1" runat="server">
                                            <asp:Button CommandName="btnComplete" Enabled="true" CssClass="btn btn-sm btn-primary"
                                                ID="btnAction" Text="Completed" Width="100%" runat="server" Visible="false" />
                                        </asp:Panel>
                                        <asp:Label ID="lbCompleted_Date" runat="server" Text='<%#Eval("completed_date_time","{0:dd/MMM/yyyy hh:mm}")%>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                            <CommandItemSettings ShowAddNewRecordButton="false" />
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="true">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                    </telerik:RadGrid>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header bg-white">
                <h4 class="card-title control-label m-0">
                    <span class="text-primary">My Appointments for Today</span>
                </h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                        <telerik:RadGrid CssClass="table" BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid2" runat="server" AllowPaging="True"
                            ShowHeader="true"  OnItemCommand="RadGrid5_ItemCommand"
                            OnItemDataBound="RadGrid2_ItemDataBound" AllowSorting="true" OnNeedDataSource="RadGrid2_NeedDataSource">
                            <ClientSettings>
                                    <ClientEvents OnRowDblClick="RowDblClick2" />
                                </ClientSettings>
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_id, visible_patient_id">
                                <Columns>
                                    <telerik:GridTemplateColumn Display="false" HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkOpen" runat="server" CommandArgument='<%#Eval("patient_id") %>' CommandName="Open" Text=""></asp:LinkButton>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn
                                        SortExpression="visible_patient_id" HeaderText="Patient ID" DataField="visible_patient_id" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" Visible="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" DataField="visible_patient_id" ItemStyle-Wrap="false"
                                        HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457"
                                        UniqueName="visible_patient_id" HeaderText="Patient ID" SortExpression="visible_patient_id" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="LinkHD" runat="server" NavigateUrl='<%# string.Format("/emr/emrinfor.aspx?pid={0}&vbid={1}&action=view",
            Eval("patient_id"),Eval("visible_patient_id")) %>'
                                                Text='<%# Eval("visible_patient_id") %>'>  
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn
                                        SortExpression="patient_name_l" HeaderText="Name" DataField="patient_name_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn
                                        SortExpression="date_of_birth" HeaderText="Age" DataField="date_of_birth" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn
                                        SortExpression="gender_e" HeaderText="Gender" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="gender_e" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn
                                        SortExpression="specialty_name_l" HeaderText="Specialty" DataField="specialty_name_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn
                                        SortExpression="employee_name_l" HeaderText="Attending Doctor" DataField="employee_name_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn
                                        SortExpression="appointment_date" HeaderText="Appointment Date" DataField="appointment_date" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataFormatString="{0:dd/MM/yyyy hh:mm tt}" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn
                                        SortExpression="visit_date" DataFormatString="{0:dd/MM/yyyy hh:mm tt}" HeaderText="Visit Date" DataField="visit_date" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                            <ClientSettings EnableRowHoverStyle="true">
                                <Selecting AllowRowSelect="True" />
                            </ClientSettings>
                        </telerik:RadGrid>
                    </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header bg-white">
                <div style="width: 100%; display: grid; grid-template-columns: 1fr 1fr">
                    <h4 class="card-title control-label m-0">
                        <span class="text-primary">
                            <asp:LinkButton ID="btn_my_hc" runat="server" Text="My Health Check-up for Today" OnClick="cmd_refresh_hc"></asp:LinkButton>
                        </span>
                    </h4>
                    <h4>
                        <a href="#" onclick="javascript:window.open('../report/CompleteVisitReport.aspx?view=hc','mywin','left=60,top=20,width=1300,height=1000,toolbar=0,resizable=0');return false;">My Completed Health Check-up List</a>
                    </h4>
                </div>
            </div>
            <div class="card-body" style="padding: 0">
                <div class="table-responsive">
                    <telerik:RadGrid ID="RadGridHC" runat="server" Width="100%" OnNeedDataSource="RadGridHC_NeedDataSource"
                        AllowSorting="true" AllowFilteringByColumn="false" CssClass="table" BorderWidth="0"
                        AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false">
                        <MasterTableView DataKeyNames="visible_patient_id" AllowMultiColumnSorting="True" Width="100%" Name="Master" TableLayout="Fixed"
                            HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <Columns>
                                <telerik:GridTemplateColumn SortExpression="visible_patient_id" HeaderText="PID" HeaderButtonType="TextButton"
                                    DataField="visible_patient_id" ShowFilterIcon="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbvisible_patient_id" runat="server" Text='<%# Eval("visible_patient_id") %>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn SortExpression="patient_name" HeaderText="Last Name" HeaderButtonType="TextButton"
                                    DataField="patient_name" ShowFilterIcon="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lbpatient_name" runat="server" Text='<%# Eval("patient_name") %>' />
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn SortExpression="checkin_date" HeaderText="Check-in date" DataField="checkin_date"
                                    ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457">
                                </telerik:GridBoundColumn>
                            </Columns>
                            <CommandItemSettings ShowAddNewRecordButton="false" />
                        </MasterTableView>
                        <ClientSettings EnableRowHoverStyle="true">
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                    </telerik:RadGrid>
                </div>
            </div>
            <div class="card-footer bg-white py-4"></div>
        </div>

        <div class="row" id="last_customer" runat="server" visible="false">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-white">
                        <h4 class="card-title control-label m-0">
                            <span class="text-primary">Last 1 Week</span>
                        </h4>
                    </div>
                    <div class="card-body" style="padding: 0">
                        <div class="table-responsive">
                            <telerik:RadGrid CssClass="table" BorderWidth="0" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged"
                                AutoGenerateColumns="false" ID="RadGrid3" runat="server" AllowPaging="True"
                                OnItemDataBound="RadGrid2_ItemDataBound" AllowSorting="true">
                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_id">
                                    <Columns>
                                        <telerik:GridBoundColumn
                                            SortExpression="visible_patient_id" HeaderText="Patient ID" DataField="visible_patient_id" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn
                                            SortExpression="patient_name_l" HeaderText="Name" DataField="patient_name_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn
                                            SortExpression="date_of_birth" HeaderText="Age" DataField="date_of_birth" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn
                                            SortExpression="gender_e" HeaderText="Gender" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="gender_e" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                            </telerik:RadGrid>
                        </div>
                    </div>
                    <div class="card-footer bg-white py-4"></div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-white">
                        <h4 class="card-title control-label m-0">
                            <span class="text-primary">Last 1 Month</span>
                        </h4>
                    </div>
                    <div class="card-body" style="padding: 0">
                        <div class="table-responsive">
                            <telerik:RadGrid CssClass="table" BorderWidth="0" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged" AutoGenerateColumns="false"
                                ID="RadGrid4" runat="server" AllowPaging="True" OnItemDataBound="RadGrid2_ItemDataBound"
                                AllowSorting="true" >
                                <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_id">
                                    <Columns>
                                        <telerik:GridBoundColumn
                                            SortExpression="visible_patient_id" HeaderText="Patient ID" DataField="visible_patient_id" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" ItemStyle-Font-Bold="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn
                                            SortExpression="patient_name_l" HeaderText="Name" DataField="patient_name_l" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn
                                            SortExpression="date_of_birth" HeaderText="Age" DataField="date_of_birth" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn
                                            SortExpression="gender_e" HeaderText="Gender" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="gender_e" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings EnableRowHoverStyle="true">
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                            </telerik:RadGrid>
                        </div>
                    </div>
                    <div class="card-footer bg-white py-4"></div>
                </div>
            </div>
        </div>
    </form>
    <script src="../scripts/myScript.js"></script>
    <script>
        InputFilter("data-type='number'");

        function beforeAsyncPostBack() {
            var curtime = new Date();
            console.log(curtime);
        }

        function afterAsyncPostBack() {
            InputFilter("data-type='number'");
        }

       function RowDblClick(sender, eventArgs) {
           var grid = $find("<%=  RadGrid5.ClientID %>");
           var masterTable = grid.get_masterTableView();
           var item = eventArgs.get_itemIndexHierarchical();

           var row = masterTable.get_dataItems()[item];

           var button = row.findElement("lnkOpen");
           button.click();

           //console.log(row);
        }

        function RowDblClick1(sender, eventArgs) {
            var grid = $find("<%=  RadGrid1.ClientID %>");
            var masterTable = grid.get_masterTableView();
            var item = eventArgs.get_itemIndexHierarchical();

            var row = masterTable.get_dataItems()[item];

            var button = row.findElement("lnkOpen");
            button.click();

            //console.log(row);
        }

        function RowDblClick2(sender, eventArgs) {
            var grid = $find("<%=  RadGrid2.ClientID %>");
            var masterTable = grid.get_masterTableView();
            var item = eventArgs.get_itemIndexHierarchical();

            var row = masterTable.get_dataItems()[item];

            var button = row.findElement("lnkOpen");
            button.click();

            //console.log(row);
        }
        
        function funfordefautenterkey1(btn, event) {
            
            if (event.keyCode == 13) {
                console.log('sfsfd');
                event.returnValue = false;
                event.cancel = true;
                btn.click();
            }
        } 
    </script>

</body>
</html>
