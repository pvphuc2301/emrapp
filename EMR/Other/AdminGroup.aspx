<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminGroup.aspx.cs" Inherits="EMR.Other.AdminGroup" %>

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
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                  <div class="row mt-4">
                                    <div class="col-md-12">
                                        <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip1"  
                                            MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk" 
                                            Width="100%">
                                            <Tabs>
                                                <telerik:RadTab Text="Doctor" Width="180px"></telerik:RadTab>
                                                <telerik:RadTab Text="Nurse" Width="180px"></telerik:RadTab>
                                                <telerik:RadTab Text="Medical Affair" Width="180px"></telerik:RadTab>
                                                <telerik:RadTab Text="Technician" Width="180px"></telerik:RadTab>
                                                <telerik:RadTab Text="CSO" Width="180px"></telerik:RadTab>
                                            </Tabs>
                                        </telerik:RadTabStrip>
                                        <telerik:RadMultiPage runat="server" ID="RadMultiPage1"  SelectedIndex="0" CssClass="outerMultiPage" Width="620px">
                                            <telerik:RadPageView runat="server" ID="RadPageView1">
                                                <telerik:RadGrid ItemStyle-Height="32px" HeaderStyle-Height="32px" CssClass="table" BorderWidth="0" 
                                                    AutoGenerateColumns="false" ID="RadGrid1" runat="server" AllowPaging="True" Width="100%" 
                                                    OnNeedDataSource="RadGrid1_NeedDataSource" AllowSorting="true">
                                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="user_name" AllowFilteringByColumn="true">
                                                        <Columns>
                                                            <telerik:GridBoundColumn SortExpression="user_name" HeaderText="User Name" DataField="user_name" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn UniqueName="created_date_time" SortExpression="created_date_time" 
                                                                HeaderText="created_date_time" DataField="created_date_time" ItemStyle-Wrap="false" 
                                                                HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" 
                                                                FilterDelay="4000" ShowFilterIcon="false">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="active_flag" HeaderText="active_flag" DataField="active_flag" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="site_rcd" HeaderText="site_rcd" DataField="site_rcd" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="lu_updated" HeaderText="lu_updated" DataField="lu_updated" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true">
                                                    </ClientSettings>
                                                </telerik:RadGrid>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView2">
                                                <telerik:RadGrid ItemStyle-Height="32px" HeaderStyle-Height="32px" CssClass="table" BorderWidth="0" 
                                                    AutoGenerateColumns="false" ID="RadGrid2" runat="server" AllowPaging="True" 
                                                    OnNeedDataSource="RadGrid2_NeedDataSource" AllowSorting="true">
                                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="user_name">
                                                        <Columns>
                                                            <telerik:GridBoundColumn SortExpression="user_name" HeaderText="User Name" DataField="user_name" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn UniqueName="created_date_time" SortExpression="created_date_time" 
                                                                HeaderText="created_date_time" DataField="created_date_time" ItemStyle-Wrap="false" 
                                                                HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" 
                                                                FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="active_flag" HeaderText="active_flag" DataField="active_flag" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="site_rcd" HeaderText="site_rcd" DataField="site_rcd" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" >
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="lu_updated" HeaderText="lu_updated" DataField="lu_updated" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true">
                                                    </ClientSettings>
                                                </telerik:RadGrid>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView3" >
                                                <telerik:RadGrid ItemStyle-Height="32px" HeaderStyle-Height="32px" CssClass="table" BorderWidth="0" 
                                                    AutoGenerateColumns="false" ID="RadGrid3" runat="server" AllowPaging="True" 
                                                    OnNeedDataSource="RadGrid3_NeedDataSource" AllowSorting="true">
                                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="user_name">
                                                        <Columns>
                                                            <telerik:GridBoundColumn SortExpression="user_name" HeaderText="User Name" DataField="user_name" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn UniqueName="created_date_time" SortExpression="created_date_time" 
                                                                HeaderText="created_date_time" DataField="created_date_time" ItemStyle-Wrap="false" 
                                                                HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" 
                                                                FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="active_flag" HeaderText="active_flag" DataField="active_flag" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="site_rcd" HeaderText="site_rcd" DataField="site_rcd" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" >
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="lu_updated" HeaderText="lu_updated" DataField="lu_updated" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true">
                                                    </ClientSettings>
                                                </telerik:RadGrid>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView4" >
                                                <telerik:RadGrid ItemStyle-Height="32px" HeaderStyle-Height="32px" CssClass="table" BorderWidth="0" 
                                                    AutoGenerateColumns="false" ID="RadGrid4" runat="server" AllowPaging="True" 
                                                    OnNeedDataSource="RadGrid4_NeedDataSource" AllowSorting="true">
                                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="user_name">
                                                        <Columns>
                                                            <telerik:GridBoundColumn SortExpression="user_name" HeaderText="User Name" DataField="user_name" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn UniqueName="created_date_time" SortExpression="created_date_time" 
                                                                HeaderText="created_date_time" DataField="created_date_time" ItemStyle-Wrap="false" 
                                                                HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" 
                                                                FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="active_flag" HeaderText="active_flag" DataField="active_flag" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="site_rcd" HeaderText="site_rcd" DataField="site_rcd" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" >
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="lu_updated" HeaderText="lu_updated" DataField="lu_updated" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true">
                                                    </ClientSettings>
                                                </telerik:RadGrid>
                                            </telerik:RadPageView>
                                            <telerik:RadPageView runat="server" ID="RadPageView5" >
                                                <telerik:RadGrid ItemStyle-Height="32px" HeaderStyle-Height="32px" CssClass="table" BorderWidth="0" 
                                                    AutoGenerateColumns="false" ID="RadGrid5" runat="server" AllowPaging="True" 
                                                    OnNeedDataSource="RadGrid5_NeedDataSource" AllowSorting="true">
                                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="user_name">
                                                        <Columns>
                                                            <telerik:GridBoundColumn SortExpression="user_name" HeaderText="User Name" DataField="user_name" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn UniqueName="created_date_time" SortExpression="created_date_time" 
                                                                HeaderText="created_date_time" DataField="created_date_time" ItemStyle-Wrap="false" 
                                                                HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" CurrentFilterFunction="Contains" 
                                                                FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="active_flag" HeaderText="active_flag" DataField="active_flag" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="site_rcd" HeaderText="site_rcd" DataField="site_rcd" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true" >
                                                            </telerik:GridBoundColumn>

                                                            <telerik:GridBoundColumn SortExpression="lu_updated" HeaderText="lu_updated" DataField="lu_updated" 
                                                                ItemStyle-Wrap="false" HeaderStyle-Wrap="false" HeaderStyle-ForeColor="#457" 
                                                                CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="true">
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ClientSettings EnableRowHoverStyle="true">
                                                    </ClientSettings>
                                                </telerik:RadGrid>
                                            </telerik:RadPageView>
                                        </telerik:RadMultiPage>                          
                                    </div>
                                   </div>
                                </div>
                        </div>
            </div>
    </form>
</body>
</html>
