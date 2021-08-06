<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllowUpdateEMR.aspx.cs" Inherits="EMR.Report.AllowUpdateEMR" %>

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
        <br /><br />
    <telerik:RadGrid OnNeedDataSource="RadGrid1_NeedDataSource" ItemStyle-Height="32px" HeaderStyle-Height="32px" CssClass="table" 
                                            BorderWidth="0" AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True" OnItemCommand="RadGrid1_ItemCommand" 
                                            OnItemDataBound="RadGrid1_ItemDataBound">
                                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="patient_visit_id, visit_type_rcd, closure_date_time, allow_date_time">
                                                <Columns>
                                                    <telerik:GridTemplateColumn ItemStyle-Width="100px">
                                                        <HeaderTemplate>
                                                            <div>Allow</div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" CommandName="sendAllow" ID="btnAllow" CssClass="btn btn-sm btn-primary waves-effect" Width="66px">Allow</asp:LinkButton>                                                                                                                        
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ItemStyle-Width="100px">
                                                        <HeaderTemplate>
                                                            <div>Deny</div>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>                                                            
                                                            <asp:LinkButton runat="server" CommandName="sendDeny" ID="btnDeny" CssClass="btn btn-sm btn-primary waves-effect" Width="66px">Deny</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridBoundColumn SortExpression="visible_patient_id" HeaderText="PID" DataField="visible_patient_id" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn SortExpression="patient_name" HeaderText="Name" DataField="patient_name" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn SortExpression="actual_visit_date_time" HeaderText="actual_visit_date_time" DataField="actual_visit_date_time" 
                                                        ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" 
                                                        FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true" DataFormatString="{0:dd/MMM/yyyy}">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn UniqueName="closure_date_time" SortExpression="closure_date_time" HeaderText="closure_date_time" 
                                                        DataField="closure_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" DataFormatString="{0:dd/MMM/yyyy}"
                                                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn SortExpression="visit_type_group_rcd" HeaderText="visit_type_group_rcd" DataField="visit_type_group_rcd" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true" Visible="false">
                                                    </telerik:GridBoundColumn>

                                                    <telerik:GridBoundColumn SortExpression="visit_type_rcd" HeaderText="visit_type_rcd" DataField="visit_type_rcd" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn SortExpression="visit_code" HeaderText="visit_code" DataField="visit_code" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn SortExpression="request_full_name" HeaderText="request_full_name" DataField="request_full_name" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn SortExpression="request_date_time" HeaderText="request_date_time" DataField="request_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn SortExpression="allow_date_time" HeaderText="allow_date_time" DataField="allow_date_time" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" FooterStyle-Font-Bold="true">
                                                    </telerik:GridBoundColumn>
                                                    <telerik:GridTemplateColumn UniqueName="StatusSMS" HeaderText="Request" HeaderStyle-Width = "5%" AllowFiltering="false"
                                                        Visible="false" ItemStyle-HorizontalAlign="Center" DataType="System.Boolean">
                                                        <ItemTemplate>
                                                            <asp:Panel ID="Panel1" runat="server">
                                                                <asp:CheckBox ID="CheckRequest" runat="server" Checked='<%# Eval("checked_send") %>' Enabled="false" />
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
                                <asp:Label runat="server" ID="lbRequest_email" Text='<%# Eval("request_email") %>' ></asp:Label>
                                <asp:Label runat="server" ID="lbClosed_date_time" Text='<%# Eval("closed_date_time") %>' ></asp:Label>
                                <asp:Label runat="server" ID="lbDenied_date_time" Text='<%# Eval("denied_date_time") %>' ></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings EnableRowHoverStyle="true">
                                                <Selecting AllowRowSelect="True"/>
                                                <Scrolling AllowScroll="True" ScrollHeight="380" UseStaticHeaders="True" SaveScrollPosition="true" FrozenColumnsCount="2" />
                                            </ClientSettings>
                                        </telerik:RadGrid>
    </form>
</body>
</html>
