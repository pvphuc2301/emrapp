﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LabReport.ascx.cs" Inherits="EMR.Report.LabReport" %>
    <telerik:RadGrid ID="RadGrid1" runat="server" Width="100%" AllowSorting="true" OnNeedDataSource="RadGrid1_NeedDataSource"
        OnDetailTableDataBind="RadGrid1_DetailTableDataBind" OnItemDataBound="RadGrid1_ItemDataBound"
            AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false"             
            ItemStyle-Font-Size="8" AlternatingItemStyle-Font-Size="8" AllowFilteringByColumn="false">
            <MasterTableView DataKeyNames="lab_orderable_rid" AllowMultiColumnSorting="True" Width="100%" Name="Master" TableLayout="Fixed" 
                HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Left" AlternatingItemStyle-HorizontalAlign="Left" CssClass="table"
                HeaderStyle-Font-Size="9" ExpandCollapseColumn-HeaderStyle-Width="1%" ExpandCollapseColumn-Display="true">                
                <DetailTables>
                    <telerik:GridTableView Name="F1" DataKeyNames="lab_orderable_rid" Width="100%" ShowHeader="false" ShowFooter="false" 
                        TableLayout="Fixed" ItemStyle-HorizontalAlign="Left" AlternatingItemStyle-HorizontalAlign="Left" CssClass="table">
                    <Columns>
                        <telerik:GridBoundColumn SortExpression="No" HeaderText="No." HeaderButtonType="TextButton"
                            DataField="No" HeaderStyle-Width = "3%" UniqueName="No"
                            HeaderStyle-ForeColor="#457">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="lab_process_name_e" HeaderText="Service" HeaderButtonType="TextButton"
                            DataField="lab_process_name_e" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "20%" UniqueName="lab_process_name_e"
                            HeaderStyle-ForeColor="#457">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="CheckLab" HeaderText="Bán" HeaderStyle-Width = "5%" AllowFiltering="false"
                            ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Panel ID="Panel1" runat="server">
                                        <asp:CheckBox ID="CheckLab" runat="server" Checked ='<%# BoolToYesNo(Eval("lab_observation_verify_status_rcd"))%>' />
                                    </asp:Panel>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn SortExpression="lab_observation_verify_status_rcd" HeaderText="Operator" HeaderButtonType="TextButton"
                            DataField="lab_observation_verify_status_rcd" HeaderStyle-Width = "5%" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="lab_observation_operator_rcd" HeaderText="Operator" HeaderButtonType="TextButton"
                            DataField="lab_observation_operator_rcd" HeaderStyle-Width = "5%">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="observed_value" HeaderText="Observed value" HeaderButtonType="TextButton"
                            DataField="observed_value" HeaderStyle-Width = "10%" ItemStyle-HorizontalAlign="Left" UniqueName="observed_value">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="uom_name_e" HeaderText="uom_name_e" HeaderButtonType="TextButton"
                            DataField="uom_name_e" HeaderStyle-Width = "10%" UniqueName="uom_name_e">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="OR_normal_range" HeaderText="Normal range" HeaderButtonType="TextButton"
                            DataField="OR_normal_range" HeaderStyle-Width = "10%" UniqueName="OR_normal_range">
                        </telerik:GridBoundColumn>                                            
                        <telerik:GridBoundColumn SortExpression="oR_rcd" HeaderText="OR_rcd" HeaderButtonType="TextButton"
                            DataField="oR_rcd" HeaderStyle-Width = "5%" UniqueName="oR_rcd" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="created_date_time" HeaderButtonType="TextButton"
                            DataField="created_date_time" HeaderStyle-Width = "10%" ItemStyle-HorizontalAlign="Right"
                            DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" UniqueName="created_date_time">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="observed_result_date_time" HeaderButtonType="TextButton"
                            DataField="observed_result_date_time" HeaderStyle-Width = "10%" ItemStyle-HorizontalAlign="Right"
                            DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" UniqueName="observed_result_date_time">
                        </telerik:GridBoundColumn>
                    </Columns>
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
                    <telerik:GridBoundColumn SortExpression="No" HeaderText="No" HeaderButtonType="TextButton" ItemStyle-Font-Bold="true"
                        DataField="No" HeaderStyle-Width = "3%" HeaderStyle-ForeColor="#457" HeaderStyle-Font-Bold="true" >
                    </telerik:GridBoundColumn>           
                    <telerik:GridBoundColumn SortExpression="lab_orderable_name_e" HeaderText="Service name" HeaderButtonType="TextButton"
                        DataField="lab_orderable_name_e" HeaderStyle-Width = "20%" ItemStyle-Font-Bold="true" HeaderStyle-ForeColor="#457">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Verified" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Operator" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Observed value" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="UOM" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>                    
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Normal range" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>                    
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Indicator" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457" UniqueName="oR_rcd" DataField="oR_rcd" >
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>    
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Created date" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>      
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Observed date" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>    
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Operator" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457" Visible="false" UniqueName="name_e">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn> 
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="CheckLab" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457" UniqueName="CheckLab" Visible="false">
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
