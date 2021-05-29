<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="opdprescription.aspx.cs" Inherits="EMR.Print.opdprescription" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>AIH Report</title>
    <style type="text/css">
        body {
                margin: 0px auto;
                width: 100%;
                font-family: Tahoma, Arial, Helvetica, sans-serif;
            }
            .column1 {
                float: left;
                width: 28%;
                text-align: center;
                border: 1pt;
                font-style: italic;
            }
            .column2 {
                float: left;
                width: 72%;
            }
          
            /*Phan Header & Footer*/
            .tblHeader,
            .tblHeader th,
            .tblHeader td {
                border: 1px solid #000;
                font-size: 8px !important;
            }
            .tblHeader th,
            .tblHeader td {
                padding: 4px;
            }

            header,
            .header-space {
                height: 220px;
                font-weight: bold;
                width: 100%;
                background: #ebf1de;
                padding: 10px 0;
            }
            header {
                position: fixed;
                top: 0;
                /*border-bottom: 1px dotted #000;
                border-bottom: 1px solid black;*/
            }
            #header:after {
                content: "";
                clear: both;
                display: table;
            }

            footer,
            .footer-space {
                height: 220px;
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

            .rgview th,
            .rgview td {
                border-top: none !important;
                border-left: none !important;
                border-right: none !important;
                border-bottom: 1px dashed gray !important;
            }

            .tbFooter td {
                border: none !important;
            }			
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
    <script src="../click_hover.js" type="text/javascript"></script>      
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
    <div id="pageHost" class="content" style="width:100%">
        <asp:Label runat="server" ID="lbError" ForeColor="Red" Visible="false"></asp:Label>
        <div class="cssclsNoPrint" style="height:40px;""></div>
        <telerik:RadGrid ID="RadGrid1" GridLines="None" runat="server" AllowAutomaticDeletes="True" AutoGenerateColumns="False" 
            Width="100%" OnNeedDataSource="RadGrid1_NeedDataSource" CssClass="rgview" Skin="" ItemStyle-CssClass="rgview">
                <MasterTableView DataKeyNames="ph_prescription_id" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                    ItemStyle-Font-Size="Smaller" AlternatingItemStyle-Font-Size="Smaller" ShowHeader="true" Width="100%">
                    <Columns>                                                
                        <telerik:GridBoundColumn SortExpression="Number" HeaderText="#" HeaderButtonType="TextButton"
                            DataField="Number" HeaderStyle-Width = "3%" ItemStyle-HorizontalAlign="Left" ItemStyle-Height="80px"
                            ItemStyle-Font-Bold="true" HeaderStyle-ForeColor="Black" >
                        </telerik:GridBoundColumn>                        
                        <telerik:GridTemplateColumn HeaderStyle-Width="67%" UniqueName="Medication" Visible="true"
                             ItemStyle-HorizontalAlign="Left" HeaderText="Tên thuốc/Medication" HeaderStyle-ForeColor="Black">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbMedicine" 
                                        Text='<%#ReturnMedicine_Name(Eval("medicine_name"),Eval("instruction_l"),Eval("instruction_e"),Eval("cachdung_l"),Eval("cachdung_e"))%>'></asp:Label>
                                </ItemTemplate>                        
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderStyle-Width="30%" UniqueName="SL" Visible="true"
                             ItemStyle-HorizontalAlign="Left" HeaderText="SL/Qty." HeaderStyle-ForeColor="Black">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbSL" Text='<%#ReturnSL_Name(Eval("qtyUOM"),Eval("duration"),Eval("refill"))%>'></asp:Label>
                                </ItemTemplate>                        
                        </telerik:GridTemplateColumn>                        
                    </Columns>                    
                </MasterTableView>
        </telerik:RadGrid>

        <telerik:RadGrid ID="RadGrid2" GridLines="None" runat="server" AllowAutomaticDeletes="True" AutoGenerateColumns="False" 
            Width="100%" OnNeedDataSource="RadGrid2_NeedDataSource" CssClass="rgview" Skin=""
            Visible="false">
                <MasterTableView DataKeyNames="ph_prescription_id" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" 
                    ItemStyle-Font-Size="Smaller" AlternatingItemStyle-Font-Size="Smaller" ShowHeader="true" Width="100%">
                    <Columns>                                                
                        <telerik:GridBoundColumn SortExpression="Number" HeaderText="#" HeaderButtonType="TextButton"
                            DataField="Number" HeaderStyle-Width = "3%" ItemStyle-HorizontalAlign="Left" ItemStyle-Height="80px"
                            ItemStyle-Font-Bold="true" HeaderStyle-ForeColor="Black" >
                        </telerik:GridBoundColumn>                        
                        <telerik:GridTemplateColumn HeaderStyle-Width="67%" UniqueName="Medication" Visible="true"
                             ItemStyle-HorizontalAlign="Left" HeaderText="Tên thuốc/Medication" HeaderStyle-ForeColor="Black">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbMedicine" 
                                        Text='<%#ReturnMedicine_Name(Eval("medicine_name"),Eval("instruction_l"),Eval("instruction_e"),Eval("cachdung_l"),Eval("cachdung_e"))%>'></asp:Label>
                                    <asp:Label runat="server" ID="lbMed" Text='<%# Eval("medicine_name") %>' ></asp:Label>
                                </ItemTemplate>                        
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderStyle-Width="30%" UniqueName="SL" Visible="true"
                             ItemStyle-HorizontalAlign="Left" HeaderText="SL/Qty." HeaderStyle-ForeColor="Black">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbSL" Text='<%#ReturnSL_Name(Eval("qtyUOM"),Eval("duration"),Eval("refill"))%>'></asp:Label>
                                </ItemTemplate>                        
                        </telerik:GridTemplateColumn>                        
                    </Columns>                    
                </MasterTableView>
        </telerik:RadGrid>
                    </div>
                </td>
            </tr>
        </tbody>
        <tfoot>
            <tr>
                <td>
                    <div class="footer-space">&nbsp;</div>
                </td>
            </tr>
        </tfoot>
    </table>
    <header id="pageHeader">
        
    <div id="header">
			<div class="row">
				<div class="column1">
					<div>
						<img alt="" src="../images/AIH_PI_FULL.png" style="height: auto; width: 202px;" />
					</div>
					<div style="font-size:smaller; position: relative; top: -20px">
                        <label>06 Bac Nam Street, An Phu Ward, District 2, HCMC</label>						
					</div>
				</div>
			  <div class="column2">
					<table class="tblHeader" style="font-size:12px">
					<tr>
						<td>Họ và tên/ Full Name:</td>
						<td colspan="3">
							<asp:Label ID="lbFullName" runat="server" Font-Bold="true"></asp:Label>                            
						</td>
					</tr>
					  
					  <tr>
						<td style="width:25%"><label>Mã số bệnh nhân/ PID:</label></td>
						<td style="width:25%;"><asp:Label ID="lbPID" runat="server" Font-Bold="true"></asp:Label></td>
						<td style="width:25%">Giới tính/ Sex:</td>
						<td style="width:25%"><asp:Label ID="lbSex" runat="server"></asp:Label></td>
					  </tr>
					  <tr>
						<td><label>Ngày sinh/ Birth of Date:</label></td>
						<td><asp:Label ID="lbBirthday" runat="server"></asp:Label></td>
						<td>Tuổi/ Age:</td>
						<td><asp:Label ID="lbAge" runat="server"></asp:Label></td>
					  </tr>
					  <tr>
						<td><label>Chiều cao/ Height:</label></td>
						<td><asp:Label ID="lbHeight" runat="server"></asp:Label></td>
						<td>Cân nặng/ Weight:</td>
						<td><asp:Label ID="lbWeight" runat="server"></asp:Label></td>
					  </tr>
					  <tr>
						<td><label>Ngày khám/ Exam. Date:</label></td>
						<td><asp:Label ID="lbVisitDate" runat="server"></asp:Label></td>
						<td>Khoa/ Department:</td>
						<td><asp:Label ID="lbSpecialty" runat="server"></asp:Label></td>
					  </tr>
					  <tr>
						<td><label>Bảo hiểm/ Insurance:</label></td>
                          <td></td>
						<td>
                            <asp:label id="lbGuardianText" runat="server" visible="false" Text="Người giám hộ/Guardian:"></asp:label>
						</td>
                          <td>
                              <asp:Label ID="lbGuardian" runat="server" Visible="false"></asp:Label>                              
                          </td>
					</tr>
					<tr>
						<td><label>Địa chỉ/ Address:</label></td>
						<td colspan="3"><asp:Label ID="lbAddress" runat="server"></asp:Label></td>
					</tr>
					</table>
			  </div>
			</div>	
        </div>
<div style="background-color:white">
        <div style="text-align:center">
            <h2 id="lbDT" runat="server" style="margin: 0;" visible="true">ĐƠN THUỐC / PRESCRIPTION</h2>
            <h2 id="lbTV" runat="server" style="margin: 0;" visible="false">PHIẾU TƯ VẤN / CONSULTANCE NOTES</h2>
        </div>
		<div class="row">
			<div style="font-size:small">
					<label>DỊ ỨNG/ ALLERGY:</label>
                <asp:Label ID="lbAllergy" runat="server" Font-Bold="false"></asp:Label>
			</div>
		</div>
		<div class="row">
			<div style="font-size:small">
                <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel1">
                <label>CHẨN ĐOÁN/ DIAGNOSIS:</label>
                <asp:Label ID="lbDianosis" runat="server" Font-Bold="false" Visible="true"></asp:Label>                                
                    <asp:Label ID="Label1" runat="server" Font-Bold="false" Visible="false"></asp:Label>
                    <div class="cssclsNoPrint">
                        <div id="PrevireDiv" runat="server" style="position: relative; float: left; padding-right: 20px;padding-left: 0px;"> 
                        <telerik:RadComboBox ID="rcbMyList1" runat="server" RenderMode="Lightweight" CssClass="cssclsNoPrint" 
                            DataTextField="diagnosis" DataValueField="diagnosis" Width="400" >  
                            <ItemTemplate> 
                                <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Eval("diagnosis") %>' CssClass="cssclsNoPrint" /> 
                            </ItemTemplate> 
                            <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation> 
                        </telerik:RadComboBox>
                        <asp:Button ID="ButtonT" runat="server" Text="GetValues" OnClick="ButtonGetValue_Click" CssClass="cssclsNoPrint" />
                    </div>                
</div>                                                                 
                    </telerik:RadAjaxPanel>
			</div>	
<div id="Div1" runat="server" style="position: relative; float: left; padding-right: 0px;padding-left: 100px;">
                    <button onclick="javascript:window.print()" class="cssclsNoPrint" style="width:150px">Print</button>
                </div>
                <div id="Div2" runat="server" style="position: relative; float: left; padding-right: 0px;padding-left: 60px;">
                    <asp:Button runat="server" ID="PrintDT" Text="Xem đơn thuốc" CssClass="cssclsNoPrint"
                        OnClick="cmd_PrintDT_Click" Width="150px" Visible="false" />                    
                </div>                
                <div id="Div3" runat="server" style="position: relative; float: left; padding-right: 0px;padding-left: 60px;">
                    <asp:Button runat="server" ID="PrintTV" Text="Xem phiếu tư vấn" CssClass="cssclsNoPrint"
                        OnClick="cmd_PrintTV_Click" Width="150px" Visible="false" />
</div>            		
		</div> 
</div>        
    </header>
    <footer id="pageFooter">
        <table class="tbFooter" style="width:100%; font-size:small; border-collapse:collapse" >
            <tr>
                <td style="width:25%; vertical-align:top;">
                    Chữ ký, họ tên bác sĩ<br />
                    <i>Doctor's signature and name</i>
                    <br /><br /><br /><br /><br />
                </td>
                <td style="vertical-align:top;" colspan="2">
                    <b>Ngày tái khám/ <i>Follow up visit:</i></b>                    
                    <asp:Label ID="lbFollow" runat="server" Font-Size="Small" Visible="false"></asp:Label>
                    <br />
                    <b>Lời dặn/ <i>Doctor’s note:</i></b>                    
				    <asp:Label ID="lbInstruction" runat="server" Font-Size="Small" Font-Bold="false"></asp:Label>
                </td>
                <td rowspan="2" style="width:150px;" >
                    <img alt="" src="../images/pharqr.png" style="height: auto; width: 150px;" />
                </td>
            </tr>            
            <tr>
                <td colspan="2">   
                    <asp:Label ID="lbDoctor" runat="server" Font-Size="11pt"></asp:Label><br />
                    <label style="font-size:small; font-weight:normal; font-size: 8px">Vì lý do đảm bảo chất lượng thuốc, thuốc đã cấp phát chỉ được đổi trả trong ngày. (*) <br />
    To ensure medication quality, only medications that are dispensed within a day can be returned or exchanged. (*)<br />
    (*) Thông tin tư vấn thuốc 24/7 và giải đáp các vấn đề liên quan đến thuốc đã cung ứng: 0935 295 818
                    </label>
                    <br />
                    <asp:Label ID="lbPrintDate" runat="server" Font-Size="Smaller" Font-Bold="false" Visible="false"></asp:Label>
                </td> 
                                               
            </tr>                        
        </table>        
    </footer>
        <asp:SqlDataSource ID="DoctorDataSource" runat="server" ConnectionString="" />
    </form>
</body>
   
</html>
