<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookForSurPro.aspx.cs" Inherits="EMR.BookForSurPro" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/DateTime.ascx" TagPrefix="webUI" TagName="DateTime" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="aih" TagName="Line" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label1.ascx" TagPrefix="webUI" TagName="Label1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="aih" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature2.ascx" TagPrefix="aih" TagName="Signature2" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtDate.ascx" TagPrefix="aih" TagName="PrtDate" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>
<%@ Register Src="~/UserControls/UserControlPatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style>
        @page {
            /*margin-left: 65px; 
	        margin-right: 20px;*/

/*            margin-left: 1.8cm; 
	        margin-right: 1.5cm;*/
        }
        .cursor-wait {
            pointer-events: none;
            background-color: #007bff;
            border-color: #007bff;
            opacity: .65;
        }
        #print_content {
		    line-height: initial !important;
	    }
    </style>
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <style>
        .subtitle {
            color: #0070c0 !important;
            font-style: italic;
        }
        .font-9 {
            font-size: 9pt;
        }
        .font-10 {
            font-size: 10pt;
        }
        .font-12 {
            font-size: 12pt !important;
        }

        .font-11 {
            font-size: 11pt !important;
        }

        .font-10 {
            font-size: 10pt  !important;
        }
        #print_content {
            margin-left: 1.5cm !important;
        }
        #print_header {
            width: 210mm;
            height: 2cm !important;
        }
        #print_content {
		    line-height: initial !important;
	    }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <%-- Print page --%>
        <asp:UpdatePanel runat="server" ID="uplPrintPage">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="print_page" runat="server" style="font-family: 'Times New Roman' !important; width: 210mm; overflow: hidden">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div runat="server" id="print_header">
                                        <div style="display: flex; align-items: center; padding: 0 18px">
                                            <img style="width: 180px" src="../images/AIH_PI_FULL.png" />
                                            <div style="text-align: center; align-self: center; flex-grow: 1">
                                                <div><span style="font-size: 12pt; font-weight: bold">PHIẾU ĐẶT PHẪU THUẬT/THỦ THUẬT</span></div>
                                                <div class="subtitle font-10"><span style="font-weight: bold">BOOKING FOR SURGERY/PROCEDURE</span></div>
                                            </div>
                                            <div style="width: 150px; text-align: center; font-size: 11px"></div>
                                        </div>
                                        <div style="height: 12px; position: relative; margin-top: -4px">
                                            <span style="position:absolute; left: 0; top: 50%; width: 190px; border: 2px solid #e20e5a; display: inline-block;"></span>
                                            <span style="position:absolute; left: 190px; top: 50%; right: 0; border: 2px solid #007297; display: inline-block;"></span>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                        </thead>

                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div class="main" runat="server" id="print_content" style="font-size: 11pt; margin: 0 1.5cm 0 2cm; line-height: 1;">
                                        
                                        <div style="display: grid; grid-template-columns: auto 1fr;">
                                            <div>
                                                <div class="font-10 pl-2 pr-2" style="border: 1px dashed #000; line-height: 2; margin-right: 20px; width: 260px">
                                                    <div>Họ tên: <asp:Label runat="server" ID="prt_patient_name"/></div>
                                                    <div>Ngày sinh: <asp:Label runat="server" ID="prt_dob"/></div>
                                                    <div>Giới tính: <asp:Label runat="server" ID="prt_gender"/></div>
                                                    <div>PID: <asp:Label runat="server" ID="prt_pid"/></div>
                                                </div>
                                            </div>
                                            <div style="line-height: 1.5">
                                                <div>
                                                    <span style="font-weight: bold">Chẩn đoán trước phẫu thuật</span>/ <span class="subtitle font-10">Preoperative diagnosis: </span>
                                                    <asp:Label runat="server" ID="prt_preoperative_diagnosis"/>
                                                </div>
                                                <div>
                                                <span style="font-weight: bold">Phẫu thuật viên chính</span>/ <span class="subtitle font-10">Surgeon: </span>
                                                    <asp:Label runat="server" ID="prt_surgeon"/>
                                                </div>

                                                <div>
                                                    <span style="font-weight: bold">Phẫu thuật viên phụ</span>/ <span class="subtitle font-10">Assistant surgeon: </span>
                                                    <asp:Label runat="server" ID="prt_assistant_surgeon"/>
                                                </div>

                                                <div>
                                                    <span style="font-weight: bold">Phương pháp mổ</span>/ <span class="subtitle font-10">Performance method: </span>
                                                    <asp:Label runat="server" ID="prt_performance_method"/>
                                                </div>
                                        
                                                <div>
                                                    <span style="font-weight: bold">Tên gói mổ</span>/ <span class="subtitle font-10">Package name: </span>
                                                    <asp:Label runat="server" ID="prt_package_name"/>
                                                </div>

                                                <div>
                                                    <span style="font-weight: bold">Mã gói mổ</span>/ <span class="subtitle font-10">Package Code: </span>
                                                    <asp:Label runat="server" ID="prt_package_code"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div><span style="font-weight: bold">Hình thức nhập viện</span>/ <span class="subtitle font-10">Admitted to: </span></div>
                                        
                                        <div style="display: grid; grid-template-columns: 1fr 1fr; margin-left: 100px">
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_admitted_code_day" Text="❏"></asp:Label>
                                                <div>
                                                    <div>Khoa điều trị trong ngày</div>
                                                    <div><span class="subtitle font-10">Dayward</span></div>
                                                </div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px auto 1fr">
                                                <asp:Label runat="server" ID="prt_admitted_code_ipd" Text="❏"></asp:Label>
                                                <div>
                                                    <div>Khoa Nội trú, ghi rõ:&nbsp;</div>
                                                    <div><span class="subtitle font-10">IPD, specify</span></div>
                                                </div>
                                                <asp:Label runat="server" ID="prt_admitted_specify"/>
                                            </div>
                                        </div>

                                        <div><span style="font-weight: bold">Thời gian mổ (dự kiến)</span>/ <span class="subtitle font-10">Surgery time (expected):</span> <asp:Label runat="server" ID="prt_performance_date_time"/></div>

                                        <div><span style="font-weight: bold">Thời gian dự kiến sử dụng phòng mổ</span>/ <span class="subtitle font-10">Duration of using OT room: </span></div>

                                        <div style="display: grid; grid-template-columns: 1fr 1fr auto 1fr auto">
                                            <div>
                                                <div>Chuẩn bị tiền mê: <span style="font-weight: bold">15 phút</span> + </div>
                                                <div><span class="subtitle font-10">Premedication: 15mins</span></div>
                                            </div>
                                            <div>
                                                <div>Thời gian phẫu thuật</div>
                                                <div><span class="subtitle font-10">Surgical time</span></div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_surgical_time"/><span style="font-weight: bold"> phút</span> + </div>
                                                <div><span class="subtitle font-10">mins</span></div>
                                            </div>
                                            <div>
                                                <div>Thời gian thoát mê <span style="font-weight: bold">15 phút</span> = </div>
                                                <div><span class="subtitle font-10">Emergence 15 mins</span></div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_duration_using_room"/> phút.</div>
                                                <div><span class="subtitle font-10">mins</span></div>
                                            </div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: 220px 100px 1fr">
                                            <div><span style="font-weight: bold">Mổ nhiểm khuẩn</span>/ <span class="subtitle font-10">Infected case:</span></div>
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_infected_case_code_y" Text="❏"></asp:Label>
                                                <div>Có/ <span class="subtitle font-10">Yes</span></div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_infected_case_code_n" Text="❏"></asp:Label>
                                                <div>Không/ <span class="subtitle font-10">No</span></div>
                                            </div>
                                        </div>
                                        
                                        <div><span style="font-weight: bold">Các cấy ghép / vật tư / dụng cụ đặc biệt/ </span><span class="subtitle font-10">Implants/consumables/special equipment</span></div>

                                        <table class="table-bordered" style="width: calc(210mm - 2.8cm)">
                                            <tr>
                                                <td>
                                                    Dụng cụ đặc biệt/<span class="subtitle font-10">Special Equipment: </span>
                                                    <asp:Label runat="server" ID="prt_special_equipment"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Cấy ghép/ <span class="subtitle font-10">Implant: </span>
                                                    <asp:Label runat="server" ID="prt_implant"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Vật tư tiêu hao đặc biệt/ <span class="subtitle font-10">Special Consumable: </span>
                                                    <asp:Label runat="server" ID="prt_special_consumable"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Sinh thiết tức thì/ <span class="subtitle font-10">Frozen section: </span>
                                                    <asp:Label runat="server" ID="prt_frozen_section"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Giải phẫu bệnh/ <span class="subtitle font-10">Anatomical pathology: </span>
                                                    <asp:Label runat="server" ID="prt_anatomical_pathology"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Khác, xin nêu rõ/ <span class="subtitle font-10">Other, please specify: </span>
                                                    <asp:Label runat="server" ID="prt_other_please_specify"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>

                                        <div style="display: grid;grid-template-columns: 100px 180px 1fr">
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_surgical_equipment_code_car" Text="❏"></asp:Label>
                                                <div style="font-weight: bold">C-arm:</div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_surgical_equipment_code_end" Text="❏"></asp:Label>
                                                <div><span style="font-weight: bold">Giàn nội soi</span>/ <span class="subtitle font-10">Endo cart</span></div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_surgical_equipment_code_oth" Text="❏"></asp:Label>
                                                <div>
                                                    <div><span style="font-weight: bold">Khác</span>/ <span class="subtitle font-10">Other: </span><asp:Label runat="server" ID="prt_surgical_equipment_note"></asp:Label></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: 150px 180px 120px 1fr">
                                            <div>
                                                <div><span style="font-weight: bold">Tư thế bệnh nhân:</span></div>
                                                <div><span class="subtitle font-10">Position of patient</span></div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_position_patient_code_sup" Text="❏"></asp:Label>
                                                <div>
                                                    <div>Nằm ngửa</div>
                                                    <div><span class="subtitle font-10">Supine</span></div>
                                                </div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_position_patient_code_pro" Text="❏"></asp:Label>
                                                <div>
                                                    <div>Nằm sấp</div>
                                                    <div><span class="subtitle font-10">Prone</span></div>
                                                </div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_position_patient_code_lit" Text="❏"></asp:Label>
                                                <div>
                                                    <div>Tư thế phụ khoa </div>
                                                    <div><span class="subtitle font-10">Lithotomy</span></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: 150px 180px 120px 1fr">
                                            <div></div>
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_position_patient_code_lat" Text="❏"></asp:Label>
                                                <div>Nằm nghiêng/<span class="subtitle font-10">Lateral</span></div>
                                            </div>
                                            <div>
                                                <div style="display: grid;grid-template-columns: 15px 1fr">
                                                    <asp:Label runat="server" ID="prt_lateral_specify_left" Text="❏"></asp:Label>
                                                    <div>Trái/<span class="subtitle font-10">Left</span></div>
                                                </div>
                                                <div style="display: grid;grid-template-columns: 15px 1fr">
                                                    <asp:Label runat="server" ID="prt_lateral_specify_right" Text="❏"></asp:Label>
                                                    <div>Phải/<span class="subtitle font-10">Right</span></div>
                                                </div>
                                            </div>
                                            <div>
                                                <div style="display: grid;grid-template-columns: 15px auto 1fr">
                                                    <asp:Label runat="server" ID="prt_position_patient_code_oth" Text="❏"></asp:Label>
                                                    <div>
                                                        <div>Khác, ghi rõ:</div>
                                                        <div><span class="subtitle font-10">Others, specify</span></div>
                                                    </div>
                                                    <asp:Label runat="server" ID="prt_position_patient_specify"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: 160px 140px 140px 1fr">
                                            <div>
                                                <div><span style="font-weight: bold">Phương pháp vô cảm</span></div>
                                                <div><span class="subtitle font-10">Type of Anaesthesia</span></div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_type_anaesthesia_code_gen" Text="❏"></asp:Label>
                                                <div>
                                                    <div>Gây mê</div>
                                                    <div><span class="subtitle font-10">General</span></div>
                                                </div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_type_anaesthesia_code_reg" Text="❏"></asp:Label>
                                                <div>
                                                    <div>Gây tê vùng</div>
                                                    <div><span class="subtitle font-10">Regional block </span></div>
                                                </div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px auto 1fr">
                                                <asp:Label runat="server" ID="prt_type_anaesthesia_code_oth" Text="❏"></asp:Label>
                                                <div>
                                                    <div>Khác, ghi rõ:</div>
                                                    <div><span class="subtitle font-10">Others, specify</span></div>
                                                </div>
                                                <div><asp:Label runat="server" ID="prt_type_anaesthesia_note"></asp:Label></div>
                                            </div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: 280px 1fr">
                                            <div><span style="font-weight: bold">Chuẩn bị tiền phẫu/ </span><span class="subtitle font-10">Preoperative preparation</span></div>
                                            <div>
                                                <asp:Label runat="server" ID="prt_preoperative_preparation_code_no" Text="❏"/> Không/ <span class="subtitle font-10">No</span>
                                            </div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: 240px 220px 1fr">
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_preoperative_preparation_code_gic" Text="❏"></asp:Label>
                                                <div>
                                                    <div>Thụt tháo (Tại khoa)</div>
                                                    <div><span class="subtitle font-10">Gastro-Intestinal cleaning (In ward)</span></div>
                                                </div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px 1fr">
                                                <asp:Label runat="server" ID="prt_preoperative_preparation_code_cat" Text="❏"></asp:Label>
                                                <div>
                                                    <div>Đặt thông tiểu (tại phòng mổ)</div>
                                                    <div><span class="subtitle font-10">Catheterization (in OT )</span></div>
                                                </div>
                                            </div>
                                            <div style="display: grid;grid-template-columns: 15px auto 1fr">
                                                <asp:Label runat="server" ID="prt_preoperative_preparation_code_oth" Text="❏"></asp:Label>
                                                <div>
                                                    <div>Khác, ghi rõ:</div>
                                                    <div><span class="subtitle font-10">Others, specify</span></div>
                                                </div>
                                                <asp:Label runat="server" ID="prt_preoperative_preparation_note"/>
                                            </div>
                                        </div>

                                        <div style="display: grid;grid-template-columns: auto 1fr">
                                            <img src="" runat="server" id="prt_hair_removal_diagram" width="200" />
                                            <div>
                                                <div style="display: grid;grid-template-columns: 240px 1fr 1fr">
                                                    <div><span style="font-weight: bold">Cạo tóc (lông)</span>/ <span class="subtitle font-10">Hair removal</span></div>
                                                    <div style="display: grid;grid-template-columns: 15px 1fr">
                                                        <asp:Label runat="server" ID="prt_hair_removal_code_n" Text="❏"></asp:Label>
                                                        <div>Không/<span class="subtitle font-10">No</span></div>
                                                    </div>
                                                    <div style="display: grid;grid-template-columns: 15px 1fr">
                                                        <asp:Label runat="server" ID="prt_hair_removal_code_y" Text="❏"></asp:Label>
                                                        <div>Có/<span class="subtitle font-10">Yes</span></div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div>Sơ đồ cắt tóc/cạo lông (xin đánh dấu những chỗ cần cắt tóc/cạo lông)</div>
                                                    <div><span class="subtitle font-10">Hair removal diagram (please shade the areas to be prepared)</span></div>
                                                </div>
                                                <div class="text-center">
                                                    <div>Thời gian đặt lịch/<span class="subtitle font-10">Booking Time: </span><asp:Label runat="server" ID="prt_booking_time"></asp:Label></div>
                                                    <div class="font-bold">Bác sĩ chỉ định / Requested by:</div>
                                                    <div>(Họ tên, chữ ký, MSNV/<span class="subtitle font-10">Name, signature & ID)</span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell" runat="server" id="print_footer">
                                    <div style="margin-left: -18px"><img style="width: 210mm" src="../images/ExcellentCare.png" /></div>
                                    <div class="footer-info" style="padding: 0 18px">
                                        <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                                        <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Tp. Thủ Đức, Tp.HCM</div>
                                        <div>Tel: 028 3910 9999</div>
                                        <div>www.aih.com.vn</div>
                                    </div>
                                </td>
                                <td class="report-footer-space" runat="server" id="print_footer_space"></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <%-- Select print language --%>
        <%--<telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" MaxHeight="400">
            <Windows>
                <telerik:RadWindow CssClass="NoIconUrl" Height="130px" VisibleStatusbar="false" Width="220px" RenderMode="Lightweight" ID="rwndPrint" Title="Chọn ngôn ngữ" runat="server">
                    <ContentTemplate>
                        <div class="text-center" style="margin-top: 20px">
                            <asp:LinkButton runat="server" OnClientClick="printForm(true); return false;" ID="LinkButton1" CssClass="btn btn-secondary">Tiếng Việt</asp:LinkButton>
                            <asp:LinkButton runat="server" OnClientClick="printForm(false); return false;" ID="LinkButton2" CssClass="btn btn-secondary">Song ngữ</asp:LinkButton>
                        </div>
                    </ContentTemplate>
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>--%>

        <div class="cssclsNoPrint" >
            <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd;border-radius:0;">
                <li><asp:LinkButton runat="server" ID="btnHome" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                <li>BOOKING FOR SURGERY/PROCEDURE</li>
            </ul>
            <div style="overflow: scroll; height: calc(100vh - 43px); overflow-x: hidden;">
                <asp:HiddenField runat="server" ID="DataObj" />
                <asp:Panel runat="server" ID="messagePlaceHolder">
                    <div class="card" runat="server" id="amendReasonWraper">
                        <div class="card-body">
                            <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span>
                                <br />
                                <span class="text-danger">* </span><small>Nội dung lý do thay đổi phải trên 3 ký tự</small></h5>
                            <div class="form-group mb-2">

                                <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_amend_reason" CssClass="form-control" />

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                    ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                </asp:Panel>
                <%-- Patient Info --%>
                <webUI:PatientInfo runat="server" ID="uc_patientInfo"></webUI:PatientInfo>
                <div class="card">
                    <div class="card-header">
                        <h4 class="text-primary">BOOKING FOR SURGERY/PROCEDURE</h4>
                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                    </div>
                    <div class="card-body collapse show" id="collapseOne">
                        <div class="form-body">
                            <%-- Update 08/10/2022 --%>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="LastestVersion">
                                        <span class="mr-2"><i class="fa fa-exclamation-triangle" style="font-size:24px"></i></span>
                                        <span class="mr-2">You are viewing an old version of this document</span>
                                        <asp:LinkButton OnClick="GoToLastestVersion" ID="hlkLastestVersion" Text="[View latest version]" runat="server"></asp:LinkButton>
                                    </div>
                                    <div class="alert alert-info d-flex align-items-center">
                                        <span class="mr-2"><i style="font-size: 24px;" class="fa fa-exclamation-circle"></i></span>
                                        <telerik:RadLabel runat="server" ID="rlblLogHistory" />
                                        <asp:UpdatePanel runat="server" ID="uplViewHistory">
                                            <ContentTemplate>
                                                <asp:LinkButton OnClick="ViewHistory" runat="server" ID="lbtnViewHistory" Text="[View History]"></asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                            <div>Chẩn đoán trước phẫu thuật/<span class="text-primary">Preoperative diagnosis:</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_preoperative_diagnosis" />
                                <aih:TextField runat="server" ID="txt_preoperative_diagnosis" />
                            </div>
                            <div>Phẫu thuật viên chính/<span class="text-primary">Surgeon</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_surgeon" />
                                <aih:TextField runat="server" ID="txt_surgeon" />
                            </div>
                            <div>Phẫu thuật viên phụ/<span class="text-primary">Assistant surgeon</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_assistant_surgeon" />
                                <aih:TextField runat="server" ID="txt_assistant_surgeon" />
                            </div>
                            <div>Phương pháp mổ/<span class="text-primary">Performance method</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_performance_method" />
                                <aih:TextField runat="server" ID="txt_performance_method" />
                            </div>
                            <div>Tên gói mổ/<span class="text-primary">Package name</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_package_name" />
                                <aih:TextField runat="server" ID="txt_package_name" />
                            </div>
                            <div>Mã gói mổ/<span class="text-primary">Package Code</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_package_code" />
                                <aih:TextField runat="server" ID="txt_package_code" />
                            </div>
                            <div>Hình thức nhập viện/<span class="text-primary">Admitted to</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_admitted_code" />
                                <div runat="server" id="admitted_wrapper">
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" onchange="__doPostBack('admitted_code','DAY')" runat="server" id="rad_admitted_code_day" name="rad_admitted_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_admitted_code_day">Khoa điều trị trong ngày/ <span class="text-primary">Dayward</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('admitted_code','IPD')" type="radio" runat="server" id="rad_admitted_code_ipd" name="rad_admitted_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_admitted_code_ipd">Khoa Nội trú, ghi rõ/ <span class="text-primary">IPD, specify</span></label>
                                            </div>
                                            <aih:TextField runat="server" ID="txt_admitted_specify" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div>Thời gian mổ (dự kiến)/ <span class="text-primary">Surgery time (expected)</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_performance_date_time" />
                                <telerik:RadDateTimePicker Width="180px" ID="dtpk_performance_date_time" runat="server" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                            </div>
                            <div>Thời gian dự kiến sử dụng phòng mổ/<span class="text-primary">Duration of using OT room</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <div>
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                    <div>Chuẩn bị tiền mê 15 phút / <span class="text-primary">Premedication: 15 mins</span></div>
                                    
                                    <div>
                                        + Thời gian phẫu thuật / <span class="text-primary">Surgical time</span>
                                        <asp:Label runat="server" ID="lbl_surgical_time" />
                                        <asp:TextBox AutoPostBack="true" runat="server" ID="txt_surgical_time" Width="120px" OnTextChanged="txt_surgical_time_TextChanged" TextMode="Number"></asp:TextBox><span class="text-primary">mins</span>
                                    </div>
                                    
                                    <div>
                                        + Thời gian thoát mê 15 phút / <span class="text-primary">Emergence 15 mins</span>
                                    </div>
                                    <div>
                                        = <asp:Label runat="server" ID="lbl_duration_using_room" /><span class="text-primary">mins</span>
                                    </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                </div>
                            </div>
                            <div>Mổ nhiểm khuẩn/ <span class="text-primary">Infected case</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_infected_case_code" />
                                <div runat="server" id="infected_case_wrapper">
                                    <div class="custom-control custom-radio d-inline-block">
                                        <input type="radio" onchange="radioButtonChange(this)" runat="server" id="rad_infected_case_code_y" name="rad_infected_case_code" class="custom-control-input" />
                                        <label class="custom-control-label" for="rad_infected_case_code_y">Có/ <span class="text-primary">Yes</span></label>
                                    </div>
                                    <div class="custom-control custom-radio d-inline-block">
                                        <input onchange="radioButtonChange(this)" type="radio" runat="server" id="rad_infected_case_code_n" name="rad_infected_case_code" class="custom-control-input" />
                                        <label class="custom-control-label" for="rad_infected_case_code_n">Không/ <span class="text-primary">No</span></label>
                                    </div>
                                </div>
                            </div>
                            <div>Các cấy ghép / vật tư / dụng cụ đặc biệt/ <span class="text-primary">InfectedImplants/consumables/special equipment</span></div>
                            <div>Dụng cụ đặc biệt/<span class="text-primary">Special Equipment</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_special_equipment" />
                                <aih:TextField runat="server" ID="txt_special_equipment" />
                            </div>
                            <div>Cấy ghép/<span class="text-primary">Implant</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_implant" />
                                <aih:TextField runat="server" ID="txt_implant" />
                            </div>
                            <div>Vật tư tiêu hao đặc biệt/<span class="text-primary">Special Consumable</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_special_consumable" />
                                <aih:TextField runat="server" ID="txt_special_consumable" />
                            </div>
                            <div>Sinh thiết tức thì/<span class="text-primary">Frozen section</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_frozen_section" />
                                <aih:TextField runat="server" ID="txt_frozen_section" />
                            </div>
                            <div>Giải phẫu bệnh/ <span class="text-primary">Anatomical pathology</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_anatomical_pathology" />
                                <aih:TextField runat="server" ID="txt_anatomical_pathology" />
                            </div>
                            <div>Khác, xin nêu rõ/<span class="text-primary">Other, please specify</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_other_please_specify" />
                                <aih:TextField runat="server" ID="txt_other_please_specify" />
                            </div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_surgical_equipment_code" />
                                <div runat="server" id="surgical_equipment_wrapper">
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('surgical_equipment_code','CAR')" type="radio" runat="server" id="rad_surgical_equipment_code_car" name="rad_surgical_equipment_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_surgical_equipment_code_car">C-arm</label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('surgical_equipment_code','END')" type="radio" runat="server" id="rad_surgical_equipment_code_end" name="rad_surgical_equipment_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_surgical_equipment_code_end">Giàn nội soi/ <span class="text-primary">Endo cart</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('surgical_equipment_code','OTH')" type="radio" runat="server" id="rad_surgical_equipment_code_oth" name="rad_surgical_equipment_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_surgical_equipment_code_oth">Khác/ <span class="text-primary">Other</span></label>
                                            </div>
                                            <aih:TextField runat="server" ID="txt_surgical_equipment_note" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div>Tư thế bệnh nhân/ <span class="text-primary">Position of patient</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_position_patient_code" />
                                <div runat="server" id="position_patient_wrapper">
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="custom-control custom-radio">
                                                <input onchange="__doPostBack('position_patient_code','SUP')" type="radio" runat="server" id="rad_position_patient_code_sup" name="rad_position_patient_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_position_patient_code_sup">Nằm ngửa/ <span class="text-primary">Supine</span></label>
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input onchange="__doPostBack('position_patient_code','PRO')" type="radio" runat="server" id="rad_position_patient_code_pro" name="rad_position_patient_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_position_patient_code_pro">Nằm sấp/ <span class="text-primary">Prone</span></label>
                                            </div>
                                            <div>
                                                <div class="custom-control custom-radio d-inline-block">
                                                    <input onchange="__doPostBack('position_patient_code','LAT')" type="radio" runat="server" id="rad_position_patient_code_lat" name="rad_position_patient_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_position_patient_code_lat">Nằm nghiêng/ <span class="text-primary">Lateral</span></label>
                                                </div>
                                                <div runat="server" id="lateral_specify_wrapper" class="d-inline-block">
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" runat="server" id="rad_lateral_specify_left" name="rad_lateral_specify" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_lateral_specify_left">Trái/ <span class="text-primary">Left</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" runat="server" id="rad_lateral_specify_right" name="rad_lateral_specify" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_lateral_specify_right">Phải/ <span class="text-primary">Right</span></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input onchange="__doPostBack('position_patient_code','LIT')" type="radio" runat="server" id="rad_position_patient_code_lit" name="rad_position_patient_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_position_patient_code_lit">Tư thế phụ khoa/ <span class="text-primary">Lithotomy</span></label>
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input onchange="__doPostBack('position_patient_code','OTH')" type="radio" runat="server" id="rad_position_patient_code_oth" name="rad_position_patient_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_position_patient_code_oth">Khác, ghi rõ/ <span class="text-primary">Others, specify</span></label>
                                            </div>
                                            <aih:TextField runat="server" ID="txt_position_patient_specify" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div>Phương pháp vô cảm/ <span class="text-primary">Type of Anaesthesia</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_type_anaesthesia_code" />
                                <div runat="server" id="type_anaesthesia_wrapper">
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('type_anaesthesia_code','GEN')" type="radio" runat="server" id="rad_type_anaesthesia_code_gen" name="rad_type_anaesthesia_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_type_anaesthesia_code_gen">Gây mê/ <span class="text-primary">General</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('type_anaesthesia_code','REG')" type="radio" runat="server" id="rad_type_anaesthesia_code_reg" name="rad_type_anaesthesia_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_type_anaesthesia_code_reg">Gây tê vùng/ <span class="text-primary">Regional block</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('type_anaesthesia_code','OTH')" type="radio" runat="server" id="rad_type_anaesthesia_code_oth" name="rad_type_anaesthesia_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_type_anaesthesia_code_oth">Khác, ghi rõ/ <span class="text-primary">Others, specify</span></label>
                                            </div>
                                            <aih:TextField runat="server" ID="txt_type_anaesthesia_note" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div>Chuẩn bị tiền phẫu/ <span class="text-primary">Preoperative preparation</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <asp:Label runat="server" ID="lbl_preoperative_preparation_code" />
                                <div runat="server" id="preoperative_preparation_wrapper">
                                    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('preoperative_preparation_code','NO')" type="radio" runat="server" id="rad_preoperative_preparation_code_no" name="rad_preoperative_preparation_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_preoperative_preparation_code_no">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('preoperative_preparation_code','GIC')" type="radio" runat="server" id="rad_preoperative_preparation_code_gic" name="rad_preoperative_preparation_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_preoperative_preparation_code_gic">Thụt tháo (Tại khoa)/ <span class="text-primary">Gastro-Intestinal cleaning (In ward)</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('preoperative_preparation_code','CAT')" type="radio" runat="server" id="rad_preoperative_preparation_code_cat" name="rad_preoperative_preparation_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_preoperative_preparation_code_cat">Đặt thông tiểu (tại phòng mổ)/<span class="text-primary">Catheterization (in OT )</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input onchange="__doPostBack('preoperative_preparation_code','OTH')" type="radio" runat="server" id="rad_preoperative_preparation_code_oth" name="rad_preoperative_preparation_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_preoperative_preparation_code_oth">Khác, ghi rõ/ <span class="text-primary">Others, specify</span></label>
                                            </div>
                                            <aih:TextField runat="server" ID="txt_preoperative_preparation_note" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div>Cạo tóc (lông)/ <span class="text-primary">Hair removal</span></div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_hair_removal" />
                                    <div runat="server" id="hair_removal_wrapper">
                                        <div class="custom-control custom-radio d-inline-block">
                                            <input type="radio" runat="server" id="rad_hair_removal_code_n" name="rad_hair_removal_code" class="custom-control-input" />
                                            <label class="custom-control-label" for="rad_hair_removal_code_n">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                        <div class="custom-control custom-radio d-inline-block">
                                            <input type="radio" runat="server" id="rad_hair_removal_code_y" name="rad_hair_removal_code" class="custom-control-input" />
                                            <label class="custom-control-label" for="rad_hair_removal_code_y">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div>
                                        <img src="" id="image1" runat="server" class="cssclsNoScreen" />
                                        <asp:HiddenField runat="server" ID="hair_removal_diagram_data_base64" />

                                        <%--<img width="320" src="../images/booking_for_surgery_procedure_1.jpg" />--%>

                                        <div style="width: 500px;">
                                            <div runat="server" id="imgage_editer_tool" style="padding: 4px; background-color: #ddd;">
                                                <span runat="server" class="controller btn btn-secondary" id="undo">undo</span>
                                                <span runat="server" class="controller btn btn-secondary" id="redo">redo</span>
                                                <div runat="server" id="pencilWrapper"  class="btn btn-secondary">
                                                    <svg id="pencil" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                                    </svg>
                                                </div>
                                                <span class="controller btn btn-secondary d-none" id="note">note</span>
                                            </div>
                                            <canvas style="border: 1px solid #ddd;" id="canvas" runat="server"></canvas>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div style="display: grid; grid-template-columns: 200px 1fr">
                                <div></div>
                                <div>Sơ đồ cắt tóc/cạo lông (xin đánh dấu những chỗ cần cắt tóc/cạo lông)/ <span class="text-primary">Hair removal diagram (please shade the areas to be prepared)</span></div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-md-12">
                                    <div class="form-actions" style="display: flex; gap: 6px">
                                        <%--<asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                            <ContentTemplate>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                        <asp:LinkButton OnClick="CompleteDocument" ValidationGroup="Group2" runat="server"  ID="btnComplete" CssClass="btn btn-primary">Complete</asp:LinkButton>
                                        <asp:LinkButton OnClick="SaveDocument" ValidationGroup="Group1"  ID="btnSave" runat="server" CssClass="btn btn-primary">Save</asp:LinkButton>
                                        <asp:UpdatePanel runat="server" ID="uplPrintDocument">
                                            <ContentTemplate>
                                                <asp:LinkButton OnClick="DeleteDocument" runat="server"  ID="btnDelete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:LinkButton OnClick="AmendDocument" runat="server"  ID="btnAmend" CssClass="btn btn-secondary">Amend</asp:LinkButton>
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                            <ContentTemplate>
                                                <asp:LinkButton runat="server" OnClick="PrintDocument" ID="btnPrint" CssClass="btn btn-secondary">Print</asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:LinkButton OnClick="CancelAmendDocument" runat="server"  ID="btnCancel" CssClass="btn btn-secondary">Cancel</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>
    <script src="../scripts/image-editor.js"></script>
    <script type="text/javascript">
        
        ImageEditor("hair_removal_diagram_data_base64");

        function show_window(rwndID) {
            var oWnd = $find(rwndID);
            oWnd.show();
        }
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }
        function print_document() {
            let print_page = document.querySelector("#print_page");
            print_page.style.display = "block";
            setTimeout(() => {
                print_page.style.display = "none";
            }, 100);
            window.print();
        }
        <%--function select_print_language() {
            var rwndPrint = $find("<%=rwndPrint.ClientID %>");
            rwndPrint.show();
        }--%>

        <%--function printForm(isLocal) {
            let StyleDisplay = isLocal ? "none" : "";

            document.getElementById("prt_patient_name_e").style.display = StyleDisplay;
            document.getElementById("prt_gender_e").style.display = StyleDisplay;
            document.getElementById("prt_nationality_e").style.display = StyleDisplay;
            document.getElementById("prt_occupation_e").style.display = StyleDisplay;
            document.getElementById("prt_address_e").style.display = StyleDisplay;

            let lbl_signature_date = document.getElementById("lbl_signature_date").innerText;
            
            var date = new Date(lbl_signature_date);
            let day = date.getDate();
            let month = String(date.getMonth() + 1);
            let year = date.getFullYear();

            if (month.length <= 1) {
                month = "0" + month;
            }

            document.getElementById("prt_date_prt_day").innerHTML += day;
            document.getElementById("prt_date_prt_month").innerHTML += month;
            document.getElementById("prt_date_prt_year").innerHTML += year;

            document.getElementById("prt_date1_prt_day").innerHTML += day;
            document.getElementById("prt_date1_prt_month").innerHTML += month;
            document.getElementById("prt_date1_prt_year").innerHTML += year;

            var radWindow = $find('<%=rwndPrint.ClientID %>');
            radWindow.close();

            window.print();
        }--%>
    </script>
</body>
</html>
