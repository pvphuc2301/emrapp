<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LabReport.ascx.cs" Inherits="EMR.Report.LabReport" %>

<div id="SelectDate" runat="server" visible="false">
    From Date: <telerik:RadDatePicker runat="server" ID="from_date" Width="200px" Visible="true" />
    To Date: <telerik:RadDatePicker runat="server" ID="to_date" Width="200px" Visible="true" />
    <asp:Button OnClick="btnComplete_Click" Enabled="true" CssClass="btn btn-primary" 
        ID="btnAction" Text="Go" Width="100px" runat="server" />
</div>
<div class="card-body" style="padding: 0">
    <div class="table-responsive">
    <telerik:RadGrid ID="RadGrid1" runat="server" Width="100%" AllowSorting="true" OnNeedDataSource="RadGrid1_NeedDataSource"
        OnDetailTableDataBind="RadGrid1_DetailTableDataBind" OnItemDataBound="RadGrid1_ItemDataBound"
            AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="false"             
            ItemStyle-Font-Size="9" AlternatingItemStyle-Font-Size="9" AllowFilteringByColumn="false">
            <MasterTableView DataKeyNames="specimen_id,lab_orderable_rid" AllowMultiColumnSorting="True" Width="100%" Name="Master" TableLayout="Fixed" 
                HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Left" AlternatingItemStyle-HorizontalAlign="Left" CssClass="table"
                HeaderStyle-Font-Size="9" ExpandCollapseColumn-HeaderStyle-Width="1%" ExpandCollapseColumn-Display="true">                
                <DetailTables>
                    <telerik:GridTableView Name="F1" DataKeyNames="lab_orderable_rid" Width="100%" ShowHeader="false" ShowFooter="false" 
                        TableLayout="Fixed" ItemStyle-HorizontalAlign="Right" AlternatingItemStyle-HorizontalAlign="Right" CssClass="table">
                    <Columns>
                        <telerik:GridBoundColumn SortExpression="No" HeaderText="No." HeaderButtonType="TextButton" Visible="false"
                            DataField="No" HeaderStyle-Width = "3%" UniqueName="No" HeaderStyle-ForeColor="#457">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="lab_process_name_e" HeaderText="Service" HeaderButtonType="TextButton"
                            DataField="lab_process_name_e" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "30%" UniqueName="lab_process_name_e"
                            HeaderStyle-ForeColor="#457" ItemStyle-HorizontalAlign="Left" >
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn UniqueName="CheckLab" HeaderText="Verify" HeaderStyle-Width = "5%" AllowFiltering="false"
                            ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                        <asp:CheckBox ID="CheckLab" runat="server" Checked ='<%# BoolToYesNo(Eval("lab_observation_verify_status_rcd"))%>' />
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn SortExpression="lab_observation_operator_rcd" HeaderText="Operator" HeaderButtonType="TextButton"
                            DataField="lab_observation_operator_rcd" HeaderStyle-Width = "7%" ItemStyle-HorizontalAlign="Center">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="observed_value" HeaderText="Observed value" HeaderButtonType="TextButton"
                            DataField="observed_value" HeaderStyle-Width = "10%" UniqueName="observed_value">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="uom_name_e" HeaderText="uom_name_e" HeaderButtonType="TextButton"
                            DataField="uom_name_e" HeaderStyle-Width = "6%" UniqueName="uom_name_e">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="OR_normal_range" HeaderText="Normal range" HeaderButtonType="TextButton"
                            DataField="OR_normal_range" HeaderStyle-Width = "10%" UniqueName="OR_normal_range">
                        </telerik:GridBoundColumn>                                            
                        <telerik:GridBoundColumn SortExpression="oR_rcd" HeaderText="OR_rcd" HeaderButtonType="TextButton"
                            DataField="oR_rcd" HeaderStyle-Width = "7%" UniqueName="oR_rcd" ItemStyle-HorizontalAlign="Center" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="created_date_time" HeaderButtonType="TextButton"
                            DataField="created_date_time" HeaderStyle-Width = "12%" ItemStyle-HorizontalAlign="Right"
                            DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" UniqueName="created_date_time">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="observed_result_date_time" HeaderButtonType="TextButton"
                            DataField="observed_result_date_time" HeaderStyle-Width = "12%" ItemStyle-HorizontalAlign="Right"
                            DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" UniqueName="observed_result_date_time">
                        </telerik:GridBoundColumn>
                    </Columns>
                    </telerik:GridTableView>
                </DetailTables>
                <Columns>
                    <telerik:GridBoundColumn SortExpression="No" HeaderText="No" HeaderButtonType="TextButton" ItemStyle-Font-Bold="true"
                        DataField="No" HeaderStyle-Width = "3%" HeaderStyle-ForeColor="#457" HeaderStyle-Font-Bold="true" Visible="false">
                    </telerik:GridBoundColumn>           
                    <telerik:GridBoundColumn SortExpression="lab_orderable_name_e" HeaderText="Service name" HeaderButtonType="TextButton" Visible="false"
                        DataField="lab_orderable_name_e" HeaderStyle-Width = "20%" ItemStyle-Font-Bold="true" HeaderStyle-ForeColor="#457">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "30%" HeaderText="Service name" Visible="true"
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457" ItemStyle-Font-Bold="true">
                            <ItemTemplate>   
                                <asp:Label runat="server" ID="lbService" Text='<%#ReturnService_Name(Eval("lab_orderable_name_e"), Eval("specimen_number"))%>'></asp:Label>
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "5%" HeaderText="Verified" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "7%" HeaderText="Operator" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Observed value" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "6%" HeaderText="UOM" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>                    
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "10%" HeaderText="Normal range" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>                    
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "7%" HeaderText="Indicator" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457" UniqueName="oR_rcd" DataField="oR_rcd" >
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>    
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "12%" HeaderText="Created date" 
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457">
                            <ItemTemplate>                            
                            </ItemTemplate>
                    </telerik:GridTemplateColumn>      
                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "12%" HeaderText="Observed date" 
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
<
