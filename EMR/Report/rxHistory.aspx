<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rxHistory.aspx.cs" Inherits="EMR.Report.rxHistory" %>

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
<div class="card-body" style="padding: 0">
    <asp:RadioButton ID="CheckAll" Text="All visits" AutoPostBack="True" OnCheckedChanged="SelectRadio" CssClass="cssclsNoPrint"
    runat="server" Enabled="true" GroupName="SelectVisit" Visible="false" />
<asp:RadioButton ID="CheckThis" Text="This visit" AutoPostBack="True" OnCheckedChanged="SelectRadio" CssClass="cssclsNoPrint"
    runat="server" Enabled="true" GroupName="SelectVisit" Visible="false"></asp:RadioButton>
<asp:RadioButton ID="CheckLast" Text="Last visit" AutoPostBack="True" OnCheckedChanged="SelectRadio" CssClass="cssclsNoPrint"
    runat="server" Enabled="true" GroupName="SelectVisit" Visible="false"></asp:RadioButton>
    <asp:RadioButton ID="CheckOther" Text="Other visit" AutoPostBack="True" OnCheckedChanged="SelectRadio" CssClass="cssclsNoPrint"
    runat="server" Enabled="true" GroupName="SelectVisit" Visible="false"></asp:RadioButton>
    <asp:CheckBox ID="IPD" Text="IPD" AutoPostBack="True" OnCheckedChanged="SelectChecked" CssClass="cssclsNoPrint"
    runat="server" Enabled="true" />
<asp:CheckBox ID="OPD" Text="OPD" AutoPostBack="True" OnCheckedChanged="SelectChecked" CssClass="cssclsNoPrint"
    runat="server" Enabled="true"></asp:CheckBox>
<asp:CheckBox ID="Discharge" Text="Discharge" AutoPostBack="True" OnCheckedChanged="SelectChecked" CssClass="cssclsNoPrint"
    runat="server" Enabled="true"></asp:CheckBox>
    <asp:CheckBox ID="External_Medication" Text="External Medication" AutoPostBack="True" OnCheckedChanged="SelectChecked" CssClass="cssclsNoPrint"
    runat="server" Enabled="true"></asp:CheckBox>

    <div class="table-responsive">
            <telerik:RadGrid ID="RadGrid1" runat="server" Width="150%" AllowSorting="true" OnNeedDataSource="RadGrid1_NeedDataSource"
                OnDetailTableDataBind="RadGrid1_DetailTableDataBind" OnItemDataBound="RadGrid1_ItemDataBound"
                    AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false"             
                    AllowFilteringByColumn="false">
                    <MasterTableView DataKeyNames="patient_id,patient_visit_id" AllowMultiColumnSorting="True" Width="100%" Name="Master" TableLayout="Fixed" 
                        HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Left" AlternatingItemStyle-HorizontalAlign="Left" CssClass="table"
                        ExpandCollapseColumn-HeaderStyle-Width="1%" ExpandCollapseColumn-Display="true">                
                        <DetailTables>
                            <telerik:GridTableView Name="F1" DataKeyNames="patient_id" Width="100%" ShowHeader="false" ShowFooter="false" 
                                TableLayout="Fixed" ItemStyle-HorizontalAlign="Left" AlternatingItemStyle-HorizontalAlign="Left" CssClass="table">
                            <Columns>
                                <telerik:GridBoundColumn SortExpression="name_e" HeaderText="name_e" HeaderButtonType="TextButton"
                                    DataField="name_e" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "30%" UniqueName="name_e"
                                    HeaderStyle-ForeColor="#457"  >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="ph_prescription_order_status_rcd" HeaderText="Status" HeaderButtonType="TextButton"
                                    DataField="ph_prescription_order_status_rcd" HeaderStyle-Width = "5%" >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="instruction_l" HeaderText="Instruction" HeaderButtonType="TextButton"
                                    DataField="instruction_l" HeaderStyle-Width = "10%" UniqueName="instruction_l" >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="qtyUom" HeaderText="qtyUom" HeaderButtonType="TextButton"
                                    DataField="qtyUom" HeaderStyle-Width = "5%" UniqueName="qtyUom">
                                </telerik:GridBoundColumn>                                     
                                <telerik:GridBoundColumn SortExpression="cachdung_l" HeaderText="cachdung_l" HeaderButtonType="TextButton"
                                    DataField="cachdung_l" HeaderStyle-Width = "5%" UniqueName="cachdung_l"  >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="start_date_time" HeaderButtonType="TextButton"
                                    DataField="start_date_time" HeaderStyle-Width = "10%" ItemStyle-HorizontalAlign="Right"
                                    DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" UniqueName="start_date_time">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="stop_date_time" HeaderButtonType="TextButton"
                                    DataField="stop_date_time" HeaderStyle-Width = "10%" ItemStyle-HorizontalAlign="Right"
                                    DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" UniqueName="stop_date_time">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="duration" HeaderText="duration" HeaderButtonType="TextButton"
                                    DataField="duration" HeaderStyle-Width = "5%" UniqueName="duration">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="facility" HeaderText="facility" HeaderButtonType="TextButton"
                                    DataField="facility" HeaderStyle-Width = "5%" UniqueName="facility" Visible="false">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="area_name" HeaderText="area_name" HeaderButtonType="TextButton"
                                    DataField="area_name" HeaderStyle-Width = "10%" UniqueName="area_name" >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="visit_type_rcd" HeaderText="visit_type_rcd" HeaderButtonType="TextButton"
                                    DataField="visit_type_rcd" HeaderStyle-Width = "5%" UniqueName="visit_type_rcd" >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="visit_code" HeaderText="visit_code" HeaderButtonType="TextButton"
                                    DataField="visit_code" HeaderStyle-Width = "5%" UniqueName="visit_code" >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="visit_date_time" HeaderButtonType="TextButton"
                                    DataField="visit_date_time" HeaderStyle-Width = "10%" ItemStyle-HorizontalAlign="Right"
                                    DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" UniqueName="visit_date_time">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="visit_closed_date_time" HeaderButtonType="TextButton"
                                    DataField="visit_closed_date_time" HeaderStyle-Width = "10%" ItemStyle-HorizontalAlign="Right"
                                    DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" UniqueName="visit_closed_date_time">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="display_name_l" HeaderText="display_name_l" HeaderButtonType="TextButton"
                                    DataField="display_name_l" HeaderStyle-Width = "10%" UniqueName="display_name_l" >
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn SortExpression="rx_item" HeaderText="rx_item" HeaderButtonType="TextButton"
                                    DataField="rx_item" HeaderStyle-Width = "5%" UniqueName="rx_item" >
                                </telerik:GridBoundColumn>
                            </Columns>
                            </telerik:GridTableView>
                        </DetailTables>
                        <Columns>           
                            <telerik:GridBoundColumn SortExpression="group_name" HeaderText="Medication" HeaderButtonType="TextButton" Visible="true"
                                DataField="group_name" HeaderStyle-Width = "30%" ItemStyle-Font-Bold="true" HeaderStyle-ForeColor="#457">
                            </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Status" Visible="true"
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457" ItemStyle-Font-Bold="true">
                                    <ItemTemplate>                                           
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Instruction" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Quantity" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Route" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Start date time" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>                    
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Start date time" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>                    
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Duration" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457" UniqueName="oR_rcd" >
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>    
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Facility" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457" Visible="false">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>      
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Ward/Clinic" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Visit type" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Visit No." 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Visit start" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Visit closure" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>  
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Prescriber name" 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>  
                            <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Rx Item No." 
                                HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                                    <ItemTemplate>                            
                                    </ItemTemplate>
                            </telerik:GridTemplateColumn>  
                        </Columns>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                        <Selecting AllowRowSelect="True"/> 
                        <Scrolling AllowScroll="true" ScrollHeight="600" UseStaticHeaders="true" />
                    </ClientSettings>
                </telerik:RadGrid>
    </div>
</div>
    </form>
</body>
</html>
