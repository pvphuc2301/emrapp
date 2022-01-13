<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderprint.aspx.cs" Inherits="EMR.orderprint" %>

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
                height: 230px;
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
    </style>
    <link id="Link1" rel="stylesheet" type="text/css" href="order.css" runat="server" />
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
                    <asp:Label runat="server" ID="lbError" ForeColor="Red" Text="Vui long Nhap chan doan ban dau" Visible="false"></asp:Label>
        <div id="pageHost" class="" runat="server">
        
        <telerik:RadGrid ID="RadGrid1" GridLines="None" runat="server" AllowAutomaticDeletes="True" Width="100%"
                AutoGenerateColumns="False" ShowFooter="False" OnItemDataBound="RadGrid1_ItemDataBound"
                OnNeedDataSource="RadGrid1_NeedDataSource" ItemStyle-BackColor="White" 
                CssClass="rgview" Skin="" ShowHeader="false">
                <MasterTableView HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Small" 
                    HeaderStyle-ForeColor="Black" ItemStyle-Font-Size="Smaller" AlternatingItemStyle-Font-Size="Smaller"
                    HeaderStyle-Height="50px" Width="100%">
                    <Columns>                        
                        <telerik:GridTemplateColumn HeaderStyle-Width="40%" UniqueName="Medication" Visible="true"
                             ItemStyle-HorizontalAlign="Left" HeaderText="Medication">
                                <ItemTemplate>
                                    <table class="tbRadGrid_Item" style="border-spacing:0; border:0; width:100%; border-collapse:collapse">
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label runat="server" ID="lbMedicine" 
                                                    Text='<%#ReturnOrder_Name(Eval("orderable_e"))%>'></asp:Label>
                                            </td>
                                            <td style="width:25%">
                                                <asp:Label runat="server" ID="lbType" Text='<%#ReturnType_Name(Eval("healthcare_service_type_rcd"))%>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:25%">
                                                <asp:Label runat="server" ID="lbText" Text='<%#ReturnText_Name("1","1")%>'></asp:Label>
                                            </td>
                                            <td style="width:25%">
                                                <asp:Label runat="server" ID="lbPriority" 
                                                    Text='<%#ReturnPriority_Name(Eval("priority_e"),Eval("instructions"),Eval("comments"),"1")%>'></asp:Label>
                                            </td>
                                            <td style="width:25%">
                                                <asp:Label runat="server" ID="lbText3" Text='<%#ReturnText_Name("3","1")%>'></asp:Label>
                                            </td>
                                            <td style="width:25%">
                                                <asp:Label runat="server" ID="lbOrder" 
                                                    Text='<%#ReturnGroup_Name(Eval("placer_order_number"),Eval("additional_information"),"1")%>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>                        
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="PR_No" UniqueName="initDiag_infor" Visible="false">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbinitDiag" Text='<%# Eval("i_diagnosis") %>' ></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>                                                           
                    </Columns>                    
                </MasterTableView>
            
        </telerik:RadGrid>
        </div>
        </td>
        </tr>
            <tr>
                <td><div style="font-style:italic; font-size:small; text-align:right">
                    <br />Ký và ghi rõ họ tên/ Sign with full name
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <header id="pageHeader">
		<div runat="server" id="header_wrapper"></div>
             
        <table style="font-weight:normal; border:0; border-spacing:0; border-collapse:collapse; width:100%">
            <tr>
                <td style="width:30%"><asp:PlaceHolder ID="PID_BarCode" runat="server"></asp:PlaceHolder></td>
                <td><div align="center"><label style="font-size:large;">PHIẾU CHỈ ĐỊNH <br /><b>REQUEST ORDER</b></label></div></td>
                <td style="width:30%"><div align="left"><asp:PlaceHolder ID="LAB_BarCode" runat="server"></asp:PlaceHolder></div></td>
            </tr>
        </table>

        <table class="tblHeader" style="font-weight:normal">            
					<tr>
						<td style="width:20%">Họ và tên/ Full Name:</td>
						<td style="width:30%"><asp:Label ID="lbFullName" runat="server"></asp:Label></td>                        
						<td style="width:25%">Giới tính/ Gender:</td>
                        <td style="width:25%"><asp:Label ID="lbSex" runat="server"></asp:Label></td>
					</tr>					  
					  <tr>
						<td><label>Ngày sinh/ DOB:</label></td>
						<td><asp:Label ID="lbBirthday" runat="server"></asp:Label></td>
						<td><label>Ngày chỉ định/ Ref. Date:</label></td>
                        <td><asp:Label ID="lbRefDate" runat="server"></asp:Label></td>
					  </tr>
					  <tr>
						<td><label>Bác sỹ/ Physician:</label></td>
						<td><asp:Label ID="lbDoctor" runat="server"></asp:Label></td>
                        <td><label>Ngày dự kiến/ Planned date:</label></td>
                        <td><asp:Label ID="lbFutureDate" runat="server"></asp:Label></td>						
					  </tr>
					  <tr>						
<td colspan="4">Chẩn đoán/ initial Diagnosis:
                            <asp:Label ID="lbInitDiag" runat="server"></asp:Label>
                            <asp:TextBox runat="server" ID="initDiag" Width="420px" Visible="false" CssClass="cssclsNoPrint"></asp:TextBox>
<div id="Div2" runat="server" style="position: relative; float: right;
    padding-right: 150px;padding-left: 0px;"> 
        <asp:Button ID="Button1" runat="server" Text="Print" OnClick="PrintButton_Click" Width="60px" CssClass="cssclsNoPrint" />
</div>
                <span style="color: Red">                                            
                    <asp:RequiredFieldValidator ID="RequiredField" ControlToValidate="initDiag" 
                        ErrorMessage="Vui long Nhap chan doan ban dau" runat="server" Enabled="false">
                    </asp:RequiredFieldValidator>
                </span>
<asp:CheckBox ID="CheckAll" Text="Print All" AutoPostBack="True" OnCheckedChanged="ShowAllChecked" CssClass="cssclsNoPrint"
    runat="server" Enabled="true" Visible="false"></asp:CheckBox>
<asp:CheckBox ID="CheckLAB" Text="LAB" AutoPostBack="True" OnCheckedChanged="LABChecked" CssClass="cssclsNoPrint"
    runat="server" Enabled="true"></asp:CheckBox>
<asp:CheckBox ID="CheckRAD" Text="RAD" AutoPostBack="True" OnCheckedChanged="RADChecked" CssClass="cssclsNoPrint"
    runat="server" Enabled="true"></asp:CheckBox>
<asp:CheckBox ID="CheckOther" Text="Others" AutoPostBack="True" OnCheckedChanged="OtherChecked" CssClass="cssclsNoPrint"
    runat="server" Enabled="true"></asp:CheckBox>
                            <asp:Label ID="lbProblem" runat="server" Visible="false"></asp:Label>
                            <div class="cssclsNoPrint">                                                        
                                <div id="PrevireDiv" runat="server" style="position: relative; float: left; padding-right: 20px;padding-left: 0px;"> 
                                <telerik:RadComboBox ID="rcbMyList1" runat="server" RenderMode="Lightweight" CssClass="cssclsNoPrint" 
                                    DataTextField="problem" DataValueField="problem" Width="400" Visible="false">  
                                    <ItemTemplate> 
                                        <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Eval("problem") %>' CssClass="cssclsNoPrint" /> 
                                    </ItemTemplate> 
                                    <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation> 
                                </telerik:RadComboBox>                                    
                                <asp:Button ID="ButtonT" runat="server" Text="GetValues" OnClick="ButtonGetValue_Click" CssClass="cssclsNoPrint" Visible="false" />
                                </div> 
                                <div id="Div1" runat="server" style="position: relative; float: right;
                                padding-right: 50px;padding-left: 0px;" visible="false"> 
                                <button onclick="javascript:window.print()" class="cssclsNoPrint">Print</button>            
                                </div>                           
						    </div>
						</td>                          						
					  </tr>
					  <tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					  </tr>
					  <tr>
						<td></td>
						<td></td>
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
        <asp:SqlDataSource ID="DoctorDataSource" runat="server" ConnectionString=""
        SelectCommand="SELECT employee_nr, display_name_l AS employee_name, display_name_e 
                FROM employee_formatted_name_iview_nl_view
                WHERE display_name_e LIKE 'Dr%' " />    
    </form>
</body>
   
</html>