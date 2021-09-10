<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="marprinting.aspx.cs" Inherits="EMR.Print.marprinting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PORTAL</title>    
<style type="text/css">
        body{
            margin:0px auto;
            width:100%;            
        }
        header, .header-space
            {
                height: 220px;
                font-weight: bold;
                width: 100%;                
                background: #ebf1de;
                padding: 10px 0;
                
            }
            header {
                position: fixed;
                top: 0;
                /*border-bottom: 1px solid black;*/
            }
            footer, .footer-space {
                height: 150px;
                font-weight: bold;
                width: 100%;                
                background: #ebf1de;
                padding: 10px 0;
                
            }
            footer {
                position: fixed;
                bottom: 0;
                /*border-top: 1px solid black;*/
            }		
    /*table { page-break-inside:auto }
    div   { page-break-inside:avoid; }  
    thead { display:table-header-group }
    tfoot { display:table-footer-group }	          */      
    </style>
    <link id="Link1" rel="stylesheet" type="text/css" href="phar.css" runat="server" />
</head>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#lnkPrint').click(function () {
                window.print();
            });
        });
    </script>      
<body>
    <form id="form1" runat="server">        
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		<Scripts></Scripts>
	</telerik:RadScriptManager>            
    <table style="border-spacing:0; width:100%;">
        <thead>
            <tr>
                <td>                    
                    <div class="header-space">&nbsp;</div>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
    <div id="pageHost" class="content">
        <asp:Label runat="server" ID="lbError" ForeColor="Red" Visible="false"></asp:Label>
        <asp:Label ID="lbNoReviewed" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
        <div class="cssclsNoPrint" style="height:70px;""></div>    
<div class="" id="listMedicine" runat="server">
        <telerik:RadGrid ID="RadGrid1" GridLines="None" runat="server" AllowAutomaticDeletes="True" Width="100%"
                AutoGenerateColumns="False" ShowFooter="False" OnItemDataBound="RadGrid1_ItemDataBound" OnPreRender="RadGrid1_PreRender"
                OnNeedDataSource="RadGrid1_NeedDataSource" ItemStyle-BackColor="White" 
                CssClass="rgview" Skin="">
                <MasterTableView HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Small" 
                    HeaderStyle-ForeColor="Black" ItemStyle-Font-Size="Smaller" AlternatingItemStyle-Font-Size="Smaller"
                    HeaderStyle-Height="50px">
                    <Columns>
                        <telerik:GridBoundColumn HeaderText="Drug Name" HeaderButtonType="TextButton" UniqueName="drug_name_l"
                            HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10" ItemStyle-Font-Bold="true" Visible="true"
                            DataField="name_l">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="start_stop_date_time" HeaderText="Start/ Stop" HeaderButtonType="TextButton"
                            DataField="start_stop_date_time" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "5%"
                            ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd/MMM/yyyy hh:mm}" UniqueName="start_stop_date_time">
                        </telerik:GridBoundColumn> 
                        <telerik:GridTemplateColumn HeaderStyle-Width="40%" UniqueName="Medication" Visible="true"
                             ItemStyle-HorizontalAlign="Left" HeaderText="Medication">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbMedicine" Text='<%#ReturnMedicine_Name(Eval("drug_name"),Eval("dosage_instruction"),Eval("note"))%>'></asp:Label>
                                </ItemTemplate>                        
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn SortExpression="scheduled_time" HeaderText="Scheduled time" HeaderButtonType="TextButton"
                            DataField="scheduled_time" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "15%"
                            ItemStyle-HorizontalAlign="Right" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn> 
                        <telerik:GridBoundColumn SortExpression="administration_time" HeaderText="Administration time" HeaderButtonType="TextButton"
                            DataField="administration_time" HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10%" 
                            ItemStyle-HorizontalAlign="Right">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderStyle-Width="5%" UniqueName="Signature" Visible="true"
                             ItemStyle-HorizontalAlign="Left" HeaderText="Nurse Signature">
                                <ItemTemplate></ItemTemplate>                        
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="Room" HeaderButtonType="TextButton" UniqueName="PatientAreaID"
                            HeaderStyle-Font-Bold="true" HeaderStyle-Width = "5%" DataField="PatientAreaID" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="PatientInfor" HeaderStyle-Width="2%" UniqueName="PatientInfor" Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbpatient_name" Text='<%# Eval("patient_name") %>' ></asp:Label>
                                <asp:Label runat="server" ID="lbPID" Text='<%# Eval("PID") %>' ></asp:Label>
                                <asp:Label runat="server" ID="lbgender" Text='<%# Eval("gender") %>' ></asp:Label>
                                <asp:Label runat="server" ID="lbdate_of_birth" Text='<%# Eval("date_of_birth","{0:dd/MMM/yyyy}") %>' ></asp:Label>
                                <asp:Label runat="server" ID="lbpatient_age" Text='<%# Eval("patient_age") %>' ></asp:Label>                                
                                <asp:Label runat="server" ID="lbPatientAreaID" Text='<%# Eval("PatientAreaID") %>' ></asp:Label>
                                <asp:Label runat="server" ID="lbDiag" Text='<%# Eval("patientDianosis") %>' ></asp:Label>
                                <asp:Label runat="server" ID="lbVisitID" Text='<%# Eval("patient_visit_id") %>' ></asp:Label>
                                <asp:Label runat="server" ID="lbReviewed" Text='<%# Eval("reviewed_status") %>' ></asp:Label>
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn HeaderText="dosage_instruction" HeaderButtonType="TextButton" UniqueName="dosage_instruction"
                            HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10" ItemStyle-Font-Bold="true" Visible="true"
                            DataField="dosage_instruction">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="note" HeaderButtonType="TextButton" UniqueName="note"
                            HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10" ItemStyle-Font-Bold="true" Visible="true"
                            DataField="note">
                        </telerik:GridBoundColumn>
                    </Columns>                    
                </MasterTableView>
            
        </telerik:RadGrid>
</div>     
                    </div>
                </td>
            </tr>
        </tbody>
        <tfoot class="cssclsNoScreen">
            <tr>
                <td>
                    <div class="footer-space">&nbsp;</div>
                </td>
            </tr>
        </tfoot>
    </table>

<div id="headerView" runat="server">    
    <header id="pageHeader">
        <table style="width:100%; border-collapse:collapse" >
            <tr style="text-align:center">
                <td>                   
                    <label style="font-size:larger">BỆNH VIỆN QUỐC TẾ MỸ<br />AMERICAN INTERNATIONAL HOSPITAL</label>
                    <br /><label style="font-weight:normal; font-size:smaller">Địa chỉ/ Add: Số 06 đường Bắc Nam 3, Phường An Phú, Quận 2, Tp.HCM, Việt Nam
                    <br />Điện thoại/ Tel: (028) 3910 9999 Fax: (028) 3910 9999 Hotline: (028) 3910 9999 Emergency: (028) 3910 9999</label> 
                    <br /><label style="font-size:larger">MEDICAL ADMINISTRATION RECORD/ Y LỆNH NỘI TRÚ</label><br />
                </td>
            </tr>              
        </table>

        <table class="tblHeader" style="font-weight:normal">
					<tr>
						<td style="width:20%">Họ và tên/ Full Name:</td>
						<td style="width:30%"><asp:Label ID="lbFullName" runat="server"></asp:Label></td>                        
						<td style="width:15%">MAS Schedule</td>
                        <td style="width:35%"></td>
					</tr>					  
					  <tr>
						<td><label>Mã số bệnh nhân/ PID:</label></td>
						<td><asp:TextBox ID="PatientID" runat="server" AutoPostBack="false" TabIndex="1" Width="180px" 
                            CssClass="cssclsNoPrint" Visible="false">
                        </asp:TextBox>
                            <asp:Label ID="lbPID" runat="server"></asp:Label></td>
						<td colspan="2"><div class="cssclsNoPrint">
                            From: <telerik:RadDatePicker ID="FromDate" runat="server" Width="180" TabIndex="2"></telerik:RadDatePicker>
<%--                            To: <telerik:RadDatePicker ID="ToDate" runat="server" Width="180" TabIndex="3"></telerik:RadDatePicker>                            --%>
                            </div><asp:Label ID="lbMASFromTo" runat="server" CssClass="cssclsNoScreen"></asp:Label>                            
                            </td>
					  </tr>
					  <tr>
						<td><label>Ngày sinh/Date of Birth:</label></td>
						<td><asp:Label ID="lbBirthday" runat="server"></asp:Label></td>
						<td>Giới tính/ Sex:</td>
						<td><asp:Label ID="lbSex" runat="server"></asp:Label></td>
					  </tr>
					  <tr>
						<td><label>Phòng/ Room:</label></td>
						<td><asp:Label ID="lbRoom" runat="server"></asp:Label></td>
						<td>Tuổi/ Age:</td>
						<td><asp:Label ID="lbAge" runat="server"></asp:Label></td>
					  </tr>            
					  <tr class="cssclsNoPrint">
						<td style="vertical-align:text-top"><label>Bác sỹ/ Physician:</label></td>
						<td style="vertical-align:text-top">                                                        
                            <telerik:RadComboBox ID="DrOrderCombobox" runat="server" RenderMode="Lightweight" 
                                DataTextField="combo_code" DataValueField="order_code" Width="60%">
                            </telerik:RadComboBox>
                            <asp:CheckBox ID="PrintAll" Text="Print All" runat="server" Font-Bold="true" Enabled="true"></asp:CheckBox>
                            <asp:CheckBox ID="AllDoctor" Text="All Doctor" runat="server" Font-Bold="true" Enabled="true"></asp:CheckBox>						    
                            <asp:Label ID="lbDoctor" runat="server" CssClass="cssclsNoScreen" Visible="false"></asp:Label></td>
						<td></td>
                          <td></td>
					  </tr>
            <tr>
                <td style="vertical-align:text-top">Chẩn đoán/ Diagnosis:</td>
						<td colspan="3"><asp:Label ID="lbProblem" runat="server" Visible="true"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Font-Bold="false" Visible="false"></asp:Label>
                            <div class="cssclsNoPrint">
                            <telerik:RadComboBox ID="rcbMyList1" runat="server" RenderMode="Lightweight" Visible="true"
                                DataTextField="patientDianosis" DataValueField="patientDianosis" Width="500px" >  
                            <ItemTemplate> 
                                <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Eval("patientDianosis") %>' /> 
                            </ItemTemplate> 
                            <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation> 
                        </telerik:RadComboBox>
                            <asp:Button ID="ButtonT" runat="server" Text="GetValues" OnClick="ButtonGetValue_Click" Visible="true" />                            
                                </div>
						</td>
            </tr>
					  <tr>
						<td></td>
						<td><div id="PrevireDiv" runat="server" style="position:relative; float:left;
                            padding-right:20px;padding-left: 0px;">
                                <asp:Button runat="server" ID="Button1" Text="Preview" OnClick="ButtonPreview_Click" 
                                Width="80px" CssClass="cssclsNoPrint" />
						    </div>
                            <div id="Div1" runat="server" style="position:relative; float:left;padding-right: 0px;padding-left: 40px;"> 
                                <button onclick="javascript:window.print()" class="cssclsNoPrint">Print</button>
                            </div>
                        </td>
                        <td></td>
                        <td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
                        <td></td>
						<td></td>
					</tr>
					</table>

    </header>
    <footer id="pageFooter" class="cssclsNoScreen">
        <table class="tbFooter" style="width:100%; font-size:small; border-collapse:collapse" >
            <tr>
                <td>Doctor (Full name and Signature)</td>
                <td>Nurse Signature/ Initials</td>
            </tr>
            <tr>
                <td style="height:90px"></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lbPrintDate" runat="server" Font-Bold="false"></asp:Label></td>
            </tr>
        </table>        
    </footer>
</div>        
    </form>
</body>
   
</html>
