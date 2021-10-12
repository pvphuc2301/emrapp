<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="medicalAdRec.aspx.cs" Inherits="EMR.Phar.medicalAdRec" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print.css" rel="stylesheet" />
    <style>
        .border { border: .5px solid #000 !important; }

        #RadGrid2_ctl00 {
            border: 1px solid #000 !important;
        }

        .watermark {
            background-image: none !important;
            height: 790px;/*
            border: 1px solid #000;*/
        }

        .cssclsNoScreen .header-info {
            display: flex;
            align-items: center;
            height: 80px;
        }

            .cssclsNoScreen .header-info img {
                width: 200px;
            }

            .cssclsNoScreen .header-info .header-info-title {
                flex-grow: 1;
                text-align: center;
            }

                .cssclsNoScreen .header-info .header-info-title h4 {
                    color: #007297;
                    font-size: 20.6963px;
                    font-weight: bold;
                    margin-bottom: 4px;
                }

        .cssclsNoScreen .text-primary {
            color: #007297 !important;
        }

        .header-info .header-info-title h5 {
            color: #e20e5a;
            font-size: 14.6667px;
            margin-bottom: 0;
        }

        .page:after {
            content: attr(data-page);
            position: absolute;
            bottom: 3px;
            left: 0;
            right: 0;
            text-align: center;
        }

        .report-footer-space {
            height: 200px;
            /*border: 1px solid #000;*/
        }

        thead { display: table-header-group; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <div class="cssclsNoScreen" id="printContent" style="display: block">
            <table class="report-container" style="width: 100%">
                <thead class="report-header">
                    <tr>
                        <th class="report-header-cell" style="padding-bottom: 5px;">
                            <div class="header-info d-grid" style="grid-template-columns: auto 1fr auto;">
                                <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                                <div class="header-info-title">
                                    <h4>Y LỆNH THUỐC NỘI TRÚ</h4>
                                    <h5>MEDICATION ADMINISTRATION RECORD</h5>
                                </div>
                                <div style="width: 120px">
                                </div>
                            </div>

                            <div style="height: 10px; padding-bottom: 4px;" class="mb-2">
                                <span style="width: 190px; border-bottom-style: solid; border-bottom-color: #e20e5a; border-bottom-width: 5px; display: inline-block; font-size: 26.6667px;"></span>
                                <span style="display: inline-block; border-bottom-style: solid; border-bottom-color: #007297; border-bottom-width: 5px; width: calc(100% - 191px); margin-left: -5px;"></span>
                            </div>

                            <div class="border p-1" style="overflow: hidden;" id="prt_info">
                                
                                <div style="line-height: 15px;">
                                    <div class="d-grid" style="grid-template-columns: 1fr 1fr;">
                                        <div class="d-grid m-0 p-0" style="grid-template-columns: auto 1fr;">
                                            <div>Họ và tên/ <i class="text-primary">Fullname</i>:&nbsp;</div>
                                            <asp:Label runat="server" ID="lbFullName" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>MAS:&nbsp;</div>
                                            <div>
                                                <div class="cssclsNoPrint">
                                                    From:&nbsp;<telerik:RadDatePicker  ID="FromDate" runat="server" Width="180" TabIndex="2"></telerik:RadDatePicker>
                                                </div>
                                                <asp:Label ID="lbMASFromTo" runat="server" CssClass="cssclsNoScreen"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: 1fr 1fr;">
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                Mã số người bệnh/ <i class="text-primary">PID</i>:&nbsp;
                                            </div>
                                            <div>
                                                <asp:TextBox ID="PatientID" runat="server" AutoPostBack="false" TabIndex="1" Width="180px" CssClass="cssclsNoPrint" Visible="false"/>
                                                <asp:Label runat="server" ID="lbPID" />
                                            </div>
                                        </div>

                                        <div>
                                            Chiều cao/ <i class="text-primary">Height</i>: <asp:Label runat="server" ID="lblHeight" /> cm; Cân nặng/ <i class="text-primary">Weight</i>: <asp:Label runat="server" ID="lblWeight" /> kg 
                                        </div>
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: 1fr 1fr;">
                                        <div class="d-grid" style="grid-template-columns: 1fr 120px">
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <div>
                                                    Ngày sinh/ <i class="text-primary">DOB</i>:&nbsp;
                                                </div>
                                                <asp:Label runat="server" ID="lbBirthday" /> 
                                            </div>
                                            <div>
                                                Tuổi/ <i class="text-primary">Age</i>: <asp:Label runat="server" ID="lbAge" />
                                            </div>
                                        </div>

                                        <div>Dị ứng/ <i class="text-primary">Allery</i>: <asp:Label runat="server" ID="lbAllergy" /></div>
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: 1fr 1fr;">
                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                Giới tính/ <i class="text-primary">Gender</i>:&nbsp;
                                            </div>
                                            <asp:Label runat="server" ID="lbSex" /> 
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <div>
                                                Phòng/ <i class="text-primary">Room</i>:&nbsp;
                                            </div>
                                            <asp:Label runat="server" ID="lbRoom" />
                                        </div>
                                    </div>

                                    <div class="d-grid cssclsNoPrint" style="grid-template-columns: auto 1fr">
                                        <div>
                                            Bác sỹ/ <i class="text-primary">Physician</i>:&nbsp;
                                        </div>
                                        <div>
                                            <telerik:RadComboBox ID="DrOrderCombobox" runat="server" RenderMode="Lightweight" DataTextField="combo_code" DataValueField="order_code" Width="60%"/>
                                            <asp:CheckBox ID="PrintAll" Text="Print All" runat="server" Font-Bold="true" Enabled="true"/>
                                            <asp:CheckBox ID="AllDoctor" Text="All Doctor" runat="server" Font-Bold="true" Enabled="true"/>
                                            <asp:Label ID="lbDoctor" runat="server" CssClass="cssclsNoScreen" Visible="false"/>
                                        </div>
                                    </div>

                                    <div class="d-grid" style="grid-template-columns: auto 1fr">
                                        <div>
                                            Chẩn đoán/ <i class="text-primary">Diagnosis</i>:&nbsp;
                                        </div>
                                        <div>
                                            <asp:Label runat="server" ID="lbProblem" />
                                            <asp:Label ID="Label1" runat="server" Font-Bold="false" Visible="false"></asp:Label>
                                            <div class="cssclsNoPrint">
                                                <telerik:RadComboBox ID="rcbMyList1" runat="server" RenderMode="Lightweight" Visible="true"
                                                    DataTextField="patientDianosis" DataValueField="patientDianosis" Width="400px" >  
                                                    <ItemTemplate> 
                                                        <asp:CheckBox ID="CheckBox1" runat="server" Text='<%# Eval("patientDianosis") %>' /> 
                                                    </ItemTemplate> 
                                                    <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation> 
                                                </telerik:RadComboBox>
                                                <asp:Button ID="ButtonT" runat="server" Text="GetValues" OnClick="ButtonGetValue_Click" Visible="true" />
                                            </div>
                                        </div>
                                    </div> 

                                    <div class="d-grid cssclsNoPrint" style="grid-template-columns: 150px 1fr">
                                        <div></div>
                                        <div>
                                            <asp:Button runat="server" ID="Button1" Text="Preview" OnClick="ButtonPreview_Click" Width="80px" CssClass="cssclsNoPrint btn btn-secondary" />
                                            <div onclick="btnPrint_Click()" class="btn btn-secondary d-inline-block">Print</div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </th>
                    </tr>
                </thead>

                <tbody class="report-content">
                    <tr>
                        <td class="report-content-cell">
                            <div style="position: relative;" class="main" runat="server" id="print_content">
                                <div id="custom_page" hidden="hidden" runat="server"></div>
                                <asp:Label runat="server" ID="lbError" ForeColor="Red" Visible="false"/>
                                <asp:Label ID="lbNoReviewed" runat="server" Font-Bold="true" ForeColor="Red"/>
                                
                                <div class="" id="listMedicine" runat="server">
                                    <asp:HiddenField runat="server" ID="lbl_lst" />

                                    <%--<div style="border: 1px solid #000; height: 200px; width: 100%; box-sizing: border-box; page-break-inside: avoid">1</div>
                                    <div style="border: 1px solid #000; height: 437px; width: 100%; box-sizing: border-box; page-break-inside: avoid">2</div>
                                    <div style="border: 1px solid #000; height: 432px; width: 100%; box-sizing: border-box; page-break-inside: avoid">3</div>--%>
                                    

                                    <telerik:RadGrid ID="RadGrid2" GridLines="None" runat="server" AllowAutomaticDeletes="True" AutoGenerateColumns="False" ShowFooter="False" OnItemDataBound="RadGrid1_ItemDataBound" OnNeedDataSource="RadGrid1_NeedDataSource" ItemStyle-BackColor="White" CssClass="rgview" Skin="">
                                        <MasterTableView HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Small" 
                                            HeaderStyle-ForeColor="Black" ItemStyle-Font-Size="Smaller" AlternatingItemStyle-Font-Size="Smaller"
                                            HeaderStyle-Height="50px">
                                            <ColumnGroups>
                                                <telerik:GridColumnGroup Name="AdministrationRecord" HeaderText="Ghi chép việc sử dụng <br /><i class='text-primary'>Administration record</i>"
                                                        HeaderStyle-HorizontalAlign="Center"/>
                                            </ColumnGroups>
                                            <Columns>
                                                <telerik:GridBoundColumn HeaderText="Drug Name" HeaderButtonType="TextButton" UniqueName="drug_name_l"
                                                    HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10" ItemStyle-Font-Bold="true" Visible="true"
                                                    DataField="name_l">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn SortExpression="start_stop_date_time" HeaderText="Bắt đầu/ Kết thúc <br /> <i class='text-primary'>Start/ Stop</i>" HeaderButtonType="TextButton" DataField="start_stop_date_time" HeaderStyle-CssClass="border-right border-dark" HeaderStyle-Width = "14%" ItemStyle-CssClass="border border-dark" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd/MMM/yyyy hh:mm}" UniqueName="start_stop_date_time">
                                                </telerik:GridBoundColumn> 
                                                <telerik:GridTemplateColumn ItemStyle-CssClass="border border-dark" HeaderStyle-Width="26%" UniqueName="Medication" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="border-right border-dark" HeaderText="Tên thuốc <br/> <i class='text-primary'>Medication</i>">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lbMedicine" Text='<%#ReturnMedicine_Name(Eval("drug_name"),Eval("dosage_instruction"),Eval("note"))%>'></asp:Label>
                                                        </ItemTemplate>                        
                                                </telerik:GridTemplateColumn>
                                                <telerik:GridBoundColumn ItemStyle-CssClass="border border-dark" ColumnGroupName="AdministrationRecord" SortExpression="scheduled_time" HeaderText="Ngày <br/> <i class='text-primary'>Date</i>" HeaderButtonType="TextButton" HeaderStyle-CssClass="border-right border-dark" DataField="scheduled_time" HeaderStyle-Font-Bold="true" HeaderStyle-Width="7%"
                                                    ItemStyle-HorizontalAlign="Right" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                                                </telerik:GridBoundColumn> 
                                                <telerik:GridBoundColumn ItemStyle-CssClass="border border-dark" ColumnGroupName="AdministrationRecord" SortExpression="administration_time" HeaderText="Giờ <br/><i class='text-primary'>Time</i>" HeaderButtonType="TextButton" HeaderStyle-CssClass="border-right border-dark" DataField="administration_time" HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" 
                                                    ItemStyle-HorizontalAlign="Right">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridTemplateColumn ItemStyle-CssClass="border border-dark" ColumnGroupName="AdministrationRecord" HeaderStyle-Width="17%" UniqueName="Signature" Visible="true"
                                                     ItemStyle-HorizontalAlign="Left" HeaderText="Họ tên, chữ ký, MSNV <br/> của Điều dưỡng <br/> <i class='text-primary'>Nurse's full name, signature, ID</i>">
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

                                    <telerik:RadGrid ID="RadGrid1" GridLines="None" runat="server" AllowAutomaticDeletes="True" Width="100%"
                AutoGenerateColumns="False" Style="display: none;" ShowFooter="False" OnItemDataBound="RadGrid1_ItemDataBound" OnPreRender="RadGrid1_PreRender"
                OnNeedDataSource="RadGrid1_NeedDataSource" ItemStyle-BackColor="White" 
                CssClass="rgview cssclsNoPrint" Skin="">
                <MasterTableView HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-Font-Size="Small" 
                    HeaderStyle-ForeColor="Black" ItemStyle-Font-Size="Smaller" AlternatingItemStyle-Font-Size="Smaller"
                    HeaderStyle-Height="50px">
                    <ColumnGroups>
                        <telerik:GridColumnGroup Name="AdministrationRecord" HeaderText="Ghi chép việc sử dụng <br /><i class='text-primary'>Administration record</i>"
                                HeaderStyle-HorizontalAlign="Center"/>
                    </ColumnGroups>
                    <Columns>
                        <telerik:GridBoundColumn HeaderText="Drug Name" HeaderButtonType="TextButton" UniqueName="drug_name_l"
                            HeaderStyle-Font-Bold="true" HeaderStyle-Width = "10" ItemStyle-Font-Bold="true" Visible="true"
                            DataField="name_l">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="start_stop_date_time" HeaderText="Bắt đầu/ Kết thúc <br /> <i class='text-primary'>Start/ Stop</i>" HeaderButtonType="TextButton" DataField="start_stop_date_time" HeaderStyle-CssClass="border-right border-dark" HeaderStyle-Width = "12%" ItemStyle-CssClass="border border-dark" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd/MMM/yyyy hh:mm}" UniqueName="start_stop_date_time">
                        </telerik:GridBoundColumn> 
                        <telerik:GridTemplateColumn ItemStyle-CssClass="border border-dark" HeaderStyle-Width="28%" UniqueName="Medication" Visible="true" ItemStyle-HorizontalAlign="Left" HeaderStyle-CssClass="border-right border-dark" HeaderText="Tên thuốc <br/> <i class='text-primary'>Medication</i>">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lbMedicine" Text='<%#ReturnMedicine_Name(Eval("drug_name"),Eval("dosage_instruction"),Eval("note"))%>'></asp:Label>
                                </ItemTemplate>                        
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn ItemStyle-CssClass="border border-dark" ColumnGroupName="AdministrationRecord" SortExpression="scheduled_time" HeaderText="Ngày <br/> <i class='text-primary'>Date</i>" HeaderButtonType="TextButton" HeaderStyle-CssClass="border-right border-dark" DataField="scheduled_time" HeaderStyle-Font-Bold="true" HeaderStyle-Width="7%"
                            ItemStyle-HorizontalAlign="Right" DataFormatString="{0:dd/MMM/yyyy HH:mm}">
                        </telerik:GridBoundColumn> 
                        <telerik:GridBoundColumn ItemStyle-CssClass="border border-dark" ColumnGroupName="AdministrationRecord" SortExpression="administration_time" HeaderText="Giờ <br/><i class='text-primary'>Time</i>" HeaderButtonType="TextButton" HeaderStyle-CssClass="border-right border-dark" DataField="administration_time" HeaderStyle-Font-Bold="true" HeaderStyle-Width="6%" 
                            ItemStyle-HorizontalAlign="Right">
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn ItemStyle-CssClass="border border-dark" ColumnGroupName="AdministrationRecord" HeaderStyle-Width="17%" UniqueName="Signature" Visible="true"
                             ItemStyle-HorizontalAlign="Left" HeaderText="Họ tên, chữ ký, MSNV <br/> của Điều dưỡng <br/> <i class='text-primary'>Nurse's full name, signature, ID</i>">
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

                <tfoot class="report-footer cssclsNoScreen">
                    <tr>
                        <td class="report-footer-cell">
                            <div class="d-grid mt-2" style="grid-template-columns: 1fr 1fr; grid-gap: 5px; margin-bottom: 110px">
                                <div></div>
                                <div class="text-center" style="break-inside: avoid !important; page-break-inside: avoid !important">
                                    <div><span style="font-size: 14.5px; font-family: Tahoma" class="font-bold">Họ tên, chữ ký & MSNV của Bác sĩ</span></div>
                                    <div><span style="font-size: 14.5px; font-family: Tahoma" class="text-primary"><i>Doctor’s full name, signature & ID</i></span></div>
                                </div>
                            </div>
                            <img style="width: 100%" src="../images/ExcellentCare.png" />
                            <div class="footer-info">
                                <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                                <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Quận 2, Tp.HCM</div>
                                <div>Tel: 028 3910 9999</div>
                                <div>www.aih.com.vn</div>
                            </div>
                        </td>
                        <td class="report-footer-space"></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </form>

    <script>
        function FormatGrid() {
            document.getElementById("print_content").style.height = "407px";
            document.getElementById("print_content").style.overflowY = "scroll";

            let lbl_lst = JSON.parse(document.getElementById("lbl_lst").value);
            var prt_table = document.getElementById("RadGrid2_ctl00");

            for (let i = 0; i < lbl_lst.length; i++) {
                prt_table.rows[lbl_lst[i] + 1].cells[1].setAttribute("style", "border-bottom: none !important;");
                prt_table.rows[lbl_lst[i] + 2].cells[1].setAttribute("style", "border-top: none !important;border-bottom: none !important;");
                prt_table.rows[lbl_lst[i] + 2].cells[1].innerHTML = "";
                prt_table.rows[lbl_lst[i] + 1].cells[2].setAttribute("style", "border-bottom: none !important;");
                prt_table.rows[lbl_lst[i] + 2].cells[2].setAttribute("style", "border-top: none !important;border-bottom: none !important;");
                prt_table.rows[lbl_lst[i] + 2].cells[2].innerHTML = "";
            }
        }

        let w = window.innerWidth;
        let h = window.innerHeight;

        function getTotalPages() {
            let totalHeight = 0;
            let step = 581;
            let totalPage = 1;
            var prt_table = document.getElementById("RadGrid2_ctl00");
            for (let i = 0; i < prt_table.rows.length; i++) {
                //console.log(totalHeight, " + ", prt_table.rows[i].offsetHeight, "=", totalHeight + prt_table.rows[i].offsetHeight);
                totalHeight += prt_table.rows[i].offsetHeight;
                if (totalHeight > step) {
                    //console.log('-----------------------');
                    totalPage++;
                    totalHeight = 0;
                }
            }
            return totalPage;
        }

        function btnPrint_Click() {
            let totalPage = 1;

            let customPage = document.getElementById('custom_page');

            document.getElementById("prt_info").style.height = "150px";
            document.getElementById("RadGrid2_ctl00").style.width = "720px";

            document.getElementById("print_content").style.height = "";
            document.getElementById("print_content").style.overflowY = "";

            //let printContent = document.querySelector("#printContent");

            //console.log(customPage.innerText);

            if (customPage.innerText == '') {
                totalPage = getTotalPages();
            } else {
                totalPage = customPage.innerText;
            }

            for (let i = 1; i <= totalPage; i++) {
                let div = document.createElement("div");
                div.setAttribute("class", "watermark page");
                div.setAttribute("style", "top: " + (1093 * (i - 1)) + "px;");
                div.setAttribute("data-page", "Page " + i + " of " + totalPage);
                document.getElementById("print_content").append(div);
            }

            //console.log('offsetHeight', document.getElementById("prt_info").offsetHeight);

            setTimeout(() => {
                document.getElementById("prt_info").style.height = "";
                document.getElementById("RadGrid2_ctl00").style.width = "100%";
                document.getElementById("print_content").style.height = h - 357 + "px";
                document.getElementById("print_content").style.overflowY = "scroll";
                removeElementsByClass("watermark");
            }, 100);
            window.print();
        }

        function removeElementsByClass(className) {
            var elements = document.getElementsByClassName(className);
            while (elements.length > 0) {
                elements[0].parentNode.removeChild(elements[0]);
            }
        }
    </script>
</body>
</html>
