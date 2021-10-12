<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="opdpreslist.aspx.cs" Inherits="EMR.Phar.opdpreslist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/style-custom.css" rel="stylesheet" />
</head>
<script src="../click_hover.js" type="text/javascript"></script>      
<%--<body onload="clickMenu('menu')" >--%>
    <body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		<Scripts></Scripts>
	</telerik:RadScriptManager>
<div>
    <asp:CheckBox ID="ShowAll" Text="Show All" runat="server" Font-Bold="true" Enabled="true" AutoPostBack="true" OnCheckedChanged="CheckedRequest" ></asp:CheckBox>

        <telerik:RadGrid ID="RadGrid1" runat="server" Width="100%" OnNeedDataSource="RadGrid1_NeedDataSource" AllowSorting="true" AllowPaging="true" AllowFilteringByColumn="false" AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false">
            <MasterTableView DataKeyNames="ph_prescription_id" AllowMultiColumnSorting="False" Width="100%" Name="Master" TableLayout="Fixed" ItemStyle-HorizontalAlign="Left" AlternatingItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center">
                <Columns>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" DataField="visible_patient_id"
                        UniqueName="visible_patient_id" HeaderText="PID" SortExpression="visible_patient_id" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate> 
                           <a href="#" onclick="javascript:window.open('<%# string.Format("/phar/opdprescription.aspx?pid={0}&vid={1}&phar={2}&pres_type={3}",
                Eval("patient_id"),Eval("patient_visit_id"),Eval("ph_prescription_id"), Eval("pres_type")) %>','mywin','left=60,top=20,width=1300,height=1000,toolbar=0,resizable=0');return false;" >
                                <%# Eval("pid") %>
                            </a> 
                        </ItemTemplate>
                   </telerik:GridTemplateColumn>                               
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "15%" DataField="patient_name"
                        UniqueName="patient_name" HeaderText="Patient name" SortExpression="patient_name" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>     
                            <asp:Label runat="server" Text='<%# Eval("patient_name") %>' />
                            <a href="#" style="display: none;" onclick="javascript:window.open('<%# string.Format("/phar/opdprescription.aspx?pid={0}&vid={1}&phar={2}",
                Eval("patient_id"),Eval("patient_visit_id"),Eval("ph_prescription_id")) %>','mywin','left=60,top=20,width=1300,height=1000,toolbar=0,resizable=0');return false;" >
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
