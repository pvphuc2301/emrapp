<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="patientapp.aspx.cs" Inherits="AIHPortal.OPD.patientapp" 
    MasterPageFile="~/Styles/ReportInfor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript">
		//Put your JavaScript code here.
    </script>
	<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
	</telerik:RadAjaxManager>
    <table style="border-spacing:0; width:100%;">
            <tr>
                <td colspan="5"><div style="text-align:center; font-size:large"><b>
                   <asp:Label ID="lbTitle" runat="server" Visible="true"></asp:Label></b></div></td>
            </tr>
            <tr>
                <td style="width:25%;">
                    <b>Appointment From:</b><telerik:RadDatePicker ID="FromDate" runat="server" Width="120" TabIndex="1" Visible="true"></telerik:RadDatePicker>                    
                </td>
                <td style="width:25%;">
                    <b>Appointment To:</b><telerik:RadDatePicker ID="ToDate" runat="server" Width="120" TabIndex="2" Visible="true"></telerik:RadDatePicker>                    
                </td>
                <td colspan="5">
                    <telerik:RadComboBox ID="ShiftSelection" AllowCustomText="true" runat="server" Width="250px" Filter="Contains" Visible="false"
                        Height="200px" DataSourceID="ShiftDataSource" DataValueField="clinic_name" DataTextField="clinic_name" EmptyMessage="Search..." >
                    </telerik:RadComboBox>
                    <asp:Button runat="server" ID="Button1" Text="Go" OnClick="Button1_Click" Width="50px" />
                    <asp:Linkbutton ID="ExportGroup" CssClass="button" Width="200px" Text="Export appointment" 
                        OnClick="ButtonExport_Click" runat="server" />
                </td>                
            </tr>    
        <tr>
            <td>
                    <b>Created Appointment From:</b><telerik:RadDatePicker ID="CreatedFromDate" runat="server" Width="120" TabIndex="1" Visible="true"></telerik:RadDatePicker>
                <telerik:RadComboBox ID="Fr_Time" runat="server" Width="80">
                        <Items>                                                        
                            <telerik:RadComboBoxItem Text="07:00 AM" Value="07" />
                            <telerik:RadComboBoxItem Text="08:00 AM" Value="08" />
                            <telerik:RadComboBoxItem Text="09:00 AM" Value="09" />
                            <telerik:RadComboBoxItem Text="10:00 AM" Value="10" />
                            <telerik:RadComboBoxItem Text="11:00 AM" Value="11" />
                            <telerik:RadComboBoxItem Text="12:00 PM" Value="12" />
                            <telerik:RadComboBoxItem Text="01:00 PM" Value="13" />
                            <telerik:RadComboBoxItem Text="02:00 PM" Value="14" />
                            <telerik:RadComboBoxItem Text="03:00 PM" Value="15" />
                            <telerik:RadComboBoxItem Text="04:00 PM" Value="16" />
                            <telerik:RadComboBoxItem Text="05:00 PM" Value="17" />                    
                        </Items>
                    </telerik:RadComboBox>
            </td>
            <td>
                    <b>Created Appointment To:</b><telerik:RadDatePicker ID="CreatedToDate" runat="server" Width="120" TabIndex="2" Visible="true"></telerik:RadDatePicker>
                <telerik:RadComboBox ID="To_Time" runat="server" Width="80">
                        <Items>                            
                            <telerik:RadComboBoxItem Text="08:00 AM" Value="08" />
                            <telerik:RadComboBoxItem Text="09:00 AM" Value="09" />
                            <telerik:RadComboBoxItem Text="10:00 AM" Value="10" />
                            <telerik:RadComboBoxItem Text="11:00 AM" Value="11" />
                            <telerik:RadComboBoxItem Text="12:00 PM" Value="12" />
                            <telerik:RadComboBoxItem Text="01:00 PM" Value="13" />
                            <telerik:RadComboBoxItem Text="02:00 PM" Value="14" />
                            <telerik:RadComboBoxItem Text="03:00 PM" Value="15" />
                            <telerik:RadComboBoxItem Text="04:00 PM" Value="16" />
                            <telerik:RadComboBoxItem Text="05:00 PM" Value="17" />                    
                        </Items>
                    </telerik:RadComboBox>
            </td>
            <td>
                <asp:Button runat="server" ID="ButtonCr" Text="Go 2" OnClick="Button2_Click" Width="50px" />
                <asp:Linkbutton ID="Linkbutton1" CssClass="button" Width="200px" Text="Export created appointment" 
                        OnClick="ButtonExportCreated_Click" runat="server" />
            </td>
            <td>                
                <div style="text-align:right"><asp:Button runat="server" ID="DailyReport" Text="Send OPD Appointment" OnClick="ButtonSend_Click" Width="150px" Visible="false" /></div>    
                <div style="text-align:right"><asp:Button runat="server" ID="SurReport" Text="Send Sur Appointment" OnClick="ButtonSendSur_Click" Width="150px" Visible="false" /></div>    
            </td>
            <td>
                <div style="text-align:right">
                    <asp:Button ID="ButtonSMS" runat="server" Text="Send SMS" OnClick="ButtonCheck_Click" Visible="false" /></div>
            </td>
        </tr>       
    </table>        
    <asp:Button ID="Button3" runat="server" Text="Send Link" OnClick="ButtonSendLink_Click" Visible="false" />
    <asp:Button ID="Button2" runat="server" Text="Get infor" OnClick="GetResult" Visible="false" />
    <asp:Label ID="lbInfor" runat="server" Text="" />
        <br />    	                                     
    <telerik:RadGrid ID="RadGrid1" runat="server" Width="100%" OnNeedDataSource="RadGrid1_NeedDataSource" AllowSorting="true"
            OnPreRender="RadGrid1_PreRender" OnItemCreated="RadGrid1_ItemCreated" OnDataBound="RadGrid1_DataBound"
            AutoGenerateColumns="False" AllowMultiRowSelection="False" GridLines="None" EnableLinqExpressions="false" ShowFooter="true"             
            ItemStyle-Font-Size="8" AlternatingItemStyle-Font-Size="8" OnGridExporting="RadGrid1_GridExporting"
            OnExcelExportCellFormatting="RadGrid1_ExportCellFormatting" OnItemDataBound="RadGrid1_ItemDataBound"
            AllowFilteringByColumn="True">
            <MasterTableView DataKeyNames="patient_id" AllowMultiColumnSorting="false" Width="100%" Name="Master" TableLayout="Fixed" 
                HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Right" AlternatingItemStyle-HorizontalAlign="Right"
                HeaderStyle-HorizontalAlign="Center" >                
                <Columns>           
                    <telerik:GridBoundColumn SortExpression="visible_patient_id" HeaderText="PID" HeaderButtonType="TextButton"
                        DataField="visible_patient_id" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn SortExpression="patient_name" HeaderText="Tên khách hàng" HeaderButtonType="TextButton"
                        DataField="patient_name" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "15%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" Visible="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn SortExpression="patient_age" HeaderText="Tuổi" HeaderButtonType="TextButton"
                        DataField="patient_age" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn SortExpression="date_of_birth" HeaderText="Ngày sinh" HeaderButtonType="TextButton"
                        DataField="date_of_birth" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "12%"
                        DataFormatString="{0:dd/MMM/yyyy}" HeaderStyle-ForeColor="#457"
                        FilterControlWidth="80%" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" >
                    </telerik:GridBoundColumn>

                    <telerik:GridTemplateColumn HeaderButtonType="TextButton" HeaderStyle-Width = "25%" DataField="patient_name"
                        UniqueName="patient_name" HeaderText="Customer name" SortExpression="patient_name" HeaderStyle-HorizontalAlign="Center"
                        FilterControlWidth="100%" AutoPostBackOnFilter="false" CurrentFilterFunction="Contains" FilterDelay="4000" 
                        ShowFilterIcon="false" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate> 
                           <asp:HyperLink ID="lbpatient_name" runat="server" NavigateUrl='<%# Eval("urlink") %>' Text='<%# Eval("patient_name") %>' Target="_blank" >
                           </asp:HyperLink> 
                        </ItemTemplate>
                   </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn SortExpression="patient_phone" HeaderText="Patient mobile" HeaderButtonType="TextButton"
                        DataField="patient_phone" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457" Visible="false"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" UniqueName="patient_phone">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="patient_mail" HeaderText="Patient mail" HeaderButtonType="TextButton"
                        DataField="patient_mail" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="lu_updated" HeaderText="Ngày đặt hẹn" HeaderButtonType="TextButton"
                        DataField="lu_updated" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "12%"
                        DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" HeaderStyle-ForeColor="#457"
                        FilterControlWidth="80%" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" >
                    </telerik:GridBoundColumn>  
                    <telerik:GridBoundColumn SortExpression="app_type_e" HeaderText="Phân loại hẹn" HeaderButtonType="TextButton"
                        DataField="app_type_e" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "15%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="appointment_number" HeaderText="Số hẹn" HeaderButtonType="TextButton"
                        DataField="appointment_number" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "5%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>                    
                    <telerik:GridBoundColumn SortExpression="doctor_name_l" HeaderText="Tên bác sỹ" HeaderButtonType="TextButton"
                        DataField="doctor_name_l" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "15%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="resource_start_date_time" HeaderText="Ngày giờ hẹn từ" HeaderButtonType="TextButton"
                        DataField="resource_start_date_time" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "12%"
                        DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" HeaderStyle-ForeColor="#457"
                        FilterControlWidth="80%" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" >
                    </telerik:GridBoundColumn>  
                    <telerik:GridBoundColumn SortExpression="resource_end_date_time" HeaderText="Ngày giờ hẹn đến" HeaderButtonType="TextButton"
                        DataField="resource_end_date_time" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "12%"
                        DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" HeaderStyle-ForeColor="#457"
                        FilterControlWidth="80%" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="sch_event_resource_status_name_e" HeaderText="Status" HeaderButtonType="TextButton"
                        DataField="sch_event_resource_status_name_e" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>  
                    <telerik:GridBoundColumn SortExpression="notify_method" HeaderText="Notify method" HeaderButtonType="TextButton"
                        DataField="notify_method" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" Visible="false">
                    </telerik:GridBoundColumn>  
                    <telerik:GridBoundColumn SortExpression="notify_user" HeaderText="Notify by" HeaderButtonType="TextButton"
                        DataField="notify_user" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" Visible="false">
                    </telerik:GridBoundColumn>  
                    <telerik:GridBoundColumn SortExpression="comment" HeaderText="Notes" HeaderButtonType="TextButton"
                        DataField="comment" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "25%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="email_address" HeaderText="email_address" HeaderButtonType="TextButton"
                        DataField="email_address" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "12%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="MO" HeaderText="Phone" HeaderButtonType="TextButton"
                        DataField="MO" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "12%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" Visible="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="visit_truoc" HeaderText="visit_truoc" HeaderButtonType="TextButton"
                        DataField="visit_truoc" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "5%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="visit_date" HeaderText="Visited date" HeaderButtonType="TextButton"
                        DataField="visit_date" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "12%" UniqueName="visit_date"
                        DataFormatString="{0:dd/MMM/yyyy hh:mm tt}" HeaderStyle-ForeColor="#457"
                        FilterControlWidth="80%" CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="visited_dr" HeaderText="Visited" HeaderButtonType="TextButton"
                        DataField="visited_dr" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false" UniqueName="visited_dr">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="patient_national" HeaderText="National" HeaderButtonType="TextButton"
                        DataField="patient_national" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "12%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="patient_national" HeaderText="Comment" HeaderButtonType="TextButton"
                        DataField="comment" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "12%" FilterControlWidth="80%"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="#457"
                        CurrentFilterFunction="Contains" FilterDelay="4000" ShowFilterIcon="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="StatusSMS" HeaderText="Send SMS" HeaderStyle-Width = "5%" AllowFiltering="false"
                        HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Smaller" Visible="true"
                        ItemStyle-HorizontalAlign="Center" DataType="System.Boolean">
                        <ItemTemplate>
                            <asp:Panel ID="Panel1" runat="server">
                                <asp:CheckBox ID="CheckSMS" runat="server" />
                            </asp:Panel>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="CheckSent" HeaderText="Sent" HeaderStyle-Width = "5%" AllowFiltering="false"
                            HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Panel ID="Panel2" runat="server">
                                        <asp:CheckBox ID="CheckSent" runat="server" Enabled="false" 
                                            Checked ='<%# ConvertNullableBoolToYesNo(Eval("sent_phone"))%>' />
                                    </asp:Panel>
                                </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="lbDrName" Visible="false" HeaderStyle-Width = "5%" AllowFiltering="false"  HeaderStyle-Font-Size="Smaller">
                        <ItemTemplate>
                                <asp:Label ID="lbDrName" runat="server" Text='<%# Eval("doctor_name_l") %>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="lbNgay_Hen" Visible="false" HeaderStyle-Width = "5%" AllowFiltering="false"  HeaderStyle-Font-Size="Smaller">
                        <ItemTemplate>
                                <asp:Label ID="lbNgay_Hen" runat="server" Text='<%# Eval("resource_start_date_time") %>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="lbNational" Visible="false" HeaderStyle-Width = "5%" AllowFiltering="false"  HeaderStyle-Font-Size="Smaller">
                        <ItemTemplate>
                                <asp:Label ID="lbNational" runat="server" Text='<%# Eval("patient_national") %>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="lbPhone" Visible="false" HeaderStyle-Width = "5%" AllowFiltering="false"  HeaderStyle-Font-Size="Smaller">
                        <ItemTemplate>
                                <asp:Label ID="lbPhone" runat="server" Text='<%# Eval("patient_phone") %>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="lbVisibleID" Visible="false" HeaderStyle-Width = "5%" AllowFiltering="false"  HeaderStyle-Font-Size="Smaller">
                        <ItemTemplate>
                                <asp:Label ID="lbVisibleID" runat="server" Text='<%# Eval("visible_patient_id") %>' />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn SortExpression="visit_come" DataField="visit_come" Visible="false" UniqueName="visit_come" >
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
            <ClientSettings EnableRowHoverStyle="true">
            <Selecting AllowRowSelect="True"/>            
            <Scrolling AllowScroll="True" ScrollHeight="380" UseStaticHeaders="True" SaveScrollPosition="true" FrozenColumnsCount="2" />
        </ClientSettings>
        </telerik:RadGrid>    
        <asp:SqlDataSource ID="ShiftDataSource" runat="server" ConnectionString="" /> 
</asp:Content>