<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderlist.aspx.cs" Inherits="EMR.orderlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link id="Link1" rel="stylesheet" type="text/css" href="order.css" runat="server" />--%>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		<Scripts></Scripts>
	</telerik:RadScriptManager>
        <div style="overflow: scroll; overflow-x: hidden; height: 100vh; padding: 20px 10px;">
        <telerik:RadGrid ID="RadGrid1" runat="server" Width="100%" OnNeedDataSource="RadGrid1_NeedDataSource" AllowSorting="true"
            AllowPaging="true" AllowFilteringByColumn="false" 
            AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false">
            <MasterTableView AllowMultiColumnSorting="False" Width="100%" Name="Master" TableLayout="Fixed" 
                ItemStyle-HorizontalAlign="Left" AlternatingItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center">
                <Columns>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "15%" DataField="creation_date_time"
                        UniqueName="creation_date_time" HeaderText="Creation Date" SortExpression="creation_date_time" HeaderStyle-HorizontalAlign="Left"
                        FilterControlWidth="100%" AutoPostBackOnFilter="false" CurrentFilterFunction="Contains" FilterDelay="4000" 
                        ShowFilterIcon="false" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                        <ItemTemplate> 
                           <asp:HyperLink ID="lbcreation_date_time" runat="server" NavigateUrl='<%# Eval("urlink","{0:dd/MMM/yyyy hh:mm}") %>' 
                               Text='<%# Eval("creation_date_time") %>' Target="_blank" Visible="false" >
                           </asp:HyperLink> 
                            <a href="#" onclick="javascript:window.open('<%# Eval("urlink") %>','mywin','left=60,top=20,width=1300,height=1000,toolbar=0,resizable=0');return false;" >
                                <%# Eval("creation_date_time") %>
                            </a> 
                        </ItemTemplate>
                   </telerik:GridTemplateColumn>                                                         
                    <telerik:GridBoundColumn SortExpression="visit_code" HeaderText="Visit No." HeaderButtonType="TextButton"
                        DataField="visit_code" HeaderStyle-Width = "5%"
                        ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="visit_type_rcd" HeaderText="Visit Type" HeaderButtonType="TextButton"
                        DataField="visit_type_rcd" HeaderStyle-Width = "5%"
                        ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        FilterControlWidth="80%" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="visit_date_time" HeaderText="Visit Date" HeaderButtonType="TextButton"
                        DataField="visit_date_time" HeaderStyle-Width = "10%"
                        DataFormatString="{0:dd/MMM/yyyy hh:mm}" HeaderStyle-ForeColor="#457"
                        FilterControlWidth="80%" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="order_owner_name_e" HeaderText="Doctor Name" HeaderButtonType="TextButton"
                        DataField="order_owner_name_e" HeaderStyle-Width = "10%"
                        ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>                                        
                </Columns>
            </MasterTableView>
            <ClientSettings EnableRowHoverStyle="true">
            <Selecting AllowRowSelect="True"/>
            <Scrolling AllowScroll="True" ScrollHeight="400" UseStaticHeaders="True" SaveScrollPosition="true" FrozenColumnsCount="2" />
        </ClientSettings>
        </telerik:RadGrid>    
            </div>
        <asp:SqlDataSource ID="ShiftDataSource" runat="server" ConnectionString=""
        SelectCommand="SELECT pphuv.visible_patient_id, pname.first_name_e, pname.last_name_e, 
            pphuv.visible_patient_id + ' ' + pname.first_name_e + ' ' + pname.last_name_e AS full_name
            FROM dbo.patient_primary_hospital_usage_view AS pphuv INNER JOIN
                 dbo.person_name_iview_nl_view AS pname ON pphuv.patient_id = pname.person_id
            ORDER BY pphuv.visible_patient_id DESC" />
    </form>
</body>
</html>
