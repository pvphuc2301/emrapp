<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="opdpreslist.aspx.cs" Inherits="AIHPortal.Phar.opdpreslist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="Link1" rel="stylesheet" type="text/css" href="phar.css" runat="server" />
</head>
<script src="../click_hover.js" type="text/javascript"></script>      
<%--<body onload="clickMenu('menu')" >--%>
    <body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		<Scripts></Scripts>
	</telerik:RadScriptManager>
<div>
        <telerik:RadGrid ID="RadGrid1" runat="server" Width="100%" OnNeedDataSource="RadGrid1_NeedDataSource" AllowSorting="true"
            AllowPaging="true" AllowFilteringByColumn="false" ItemStyle-Font-Size="8" AlternatingItemStyle-Font-Size="8"
            AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false">
            <MasterTableView DataKeyNames="ph_prescription_id" AllowMultiColumnSorting="False" Width="100%" Name="Master" TableLayout="Fixed" 
                ItemStyle-HorizontalAlign="Left" AlternatingItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="10">
                <Columns>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" DataField="visible_patient_id"
                        UniqueName="visible_patient_id" HeaderText="PID" SortExpression="visible_patient_id" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate> 
                           <a href="#" onclick="javascript:window.open('<%# Eval("urlink") %>','mywin','left=60,top=20,width=1100,height=1000,toolbar=0,resizable=0');return false;" >
                                <%# Eval("visible_patient_id") %>
                            </a> 
                        </ItemTemplate>
                   </telerik:GridTemplateColumn>                               
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "15%" DataField="patient_name"
                        UniqueName="patient_name" HeaderText="Patient name" SortExpression="patient_name" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>                             
                            <a href="#" onclick="javascript:window.open('<%# Eval("urlink") %>','mywin','left=60,top=20,width=1100,height=1000,toolbar=0,resizable=0');return false;" >
                                <%# Eval("patient_name") %>
                            </a>
                        </ItemTemplate>
                   </telerik:GridTemplateColumn>                    
                    <telerik:GridBoundColumn SortExpression="created_date_time" HeaderText="Created Date" HeaderButtonType="TextButton"
                        DataField="created_date_time" HeaderStyle-Width = "10%" DataFormatString="{0:dd/MMM/yyyy hh:mm}" >
                    </telerik:GridBoundColumn>                    
                    <telerik:GridBoundColumn SortExpression="created_by_user_name" HeaderText="Caregiver" HeaderButtonType="TextButton"
                        DataField="created_by_user_name" HeaderStyle-Width = "15%">
                    </telerik:GridBoundColumn>                        
                    <telerik:GridBoundColumn SortExpression="reference_number" HeaderText="Prescription No." HeaderButtonType="TextButton"
                        DataField="reference_number" HeaderStyle-Width = "10%">
                    </telerik:GridBoundColumn>                                   
                </Columns>
            </MasterTableView>
            <ClientSettings EnableRowHoverStyle="true">
            <Selecting AllowRowSelect="True"/>            
            <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true" FrozenColumnsCount="2" />
        </ClientSettings>
        </telerik:RadGrid>
    </div>
    </form>
</body>
</html>
