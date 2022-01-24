<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedRecForNeoVaccin.aspx.cs" Inherits="EMR.OPD.MedRecForNeoVaccin" ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="Trash" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>
<%@ Register Src="~/icons/ArrowRepeat.ascx" TagPrefix="icon" TagName="ArrowRepeat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print.css" rel="stylesheet" />
    <style>
        .v20:after {
           content: 'Version: 2.0';
            font-size: 10px;
            color: #343a40;
            position: absolute;
            right: 10px;
            bottom: 4px;
        }

        .dg {
            display: grid;
            width: 100%;
        }

        .gtc-1 {
            grid-template-columns: 200px 1fr;
        }

        .gtc-2 {
            grid-template-columns: auto 1fr;
        }

        @media only screen and (max-width: 600px) {
          .dg {
            display: block !important;
          }
        }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="printContent" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info" style="display: flex; align-items: center; height: 80px;">
                                        <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>BỆNH ÁN TIÊM CHỦNG SƠ SINH</h4>
                                            <h5>MEDICAL RECORD FOR NEONATAL VACCINATION</h5>
                                        </div>
                                        <div style="width: 120px; text-align: center">
                                            <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
                                            <asp:Label runat="server" ID="prt_vpid" CssClass="d-block font-bold"></asp:Label>
                                        </div>
                                    </div>
                                    <div style="height: 20px;">
                                        <span style="width: 190px; border-bottom-style: solid; border-bottom-color: #e20e5a; border-bottom-width: 5px; display: inline-block; font-size: 26.6667px;"></span>
                                        <span style="display: inline-block; border-bottom-style: solid; border-bottom-color: #007297; border-bottom-width: 5px; width: calc(100% - 191px); margin-left: -5px;"></span>
                                    </div>
                                </th>
                            </tr>
                        </thead>

                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div style="position: relative;" class="main" runat="server" id="print_content">
                                        <img style="height: 1px" src="../images/logo-opacity.png" />

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="Họ tên người bệnh" SubTitle="Full name:" runat="server" />
                                            <asp:Label runat="server" ID="prt_fullname"></asp:Label>
                                        </div>
                                        <div class="d-grid" style="grid-template-columns: 2fr 1fr">
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="Ngày tháng năm sinh/ " SubTitle="DOB:" runat="server" />
                                                <asp:Label runat="server" ID="prt_dob"></asp:Label>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="Giới tính/ " SubTitle="Gender:" runat="server" />
                                                <asp:Label runat="server" ID="prt_gender"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 2fr 1fr">
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="Ngày khám bệnh/ " SubTitle="Day of visit:" runat="server" />
                                                <asp:Label runat="server" ID="prt_day_of_visit"></asp:Label>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="Mã số người bệnh/ " SubTitle="PID:" runat="server" />
                                                <asp:Label runat="server" ID="prt_pid"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="I." Title="Lý do đến khám/ " SubTitle="Chief complaint:" runat="server" />
                                            <asp:Label runat="server" ID="prt_chief_complaint"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="II." Title="Bệnh sử/ " SubTitle="Medical history" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="1." Title="Bệnh sử hiện tại/ " SubTitle="Current medical history:" runat="server" />
                                            <asp:Label runat="server" ID="prt_cur_med_history"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="❖" Title="Thuốc đang sử dụng/ " SubTitle="Current medications" runat="server" />
                                            <asp:Label runat="server" ID="prt_cur_medications"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="2." Title="Tiền sử bệnh/ " SubTitle="Antecedent medical history:" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="❖" Title="Bản thân/ " SubTitle="Personal:" runat="server" />
                                            <asp:Label runat="server" ID="prt_personal"></asp:Label>
                                        </div>


                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="❖" Title="Gia đình/ " SubTitle="Family:" runat="server" />
                                            <asp:Label runat="server" ID="prt_family"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="❖" Title="Dị ứng/ " SubTitle="Allergy:" runat="server" />
                                            <asp:Label Width="200px" runat="server" ID="prt_allergy"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr" runat="server" id="allergy_note">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" Order="•" CssClass="text-inline" Title="Nếu có, nêu rõ/ " SubTitle="If yes, specify:" runat="server" />
                                            <asp:Label runat="server" ID="prt_allergy_note"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="III." Title="Khám bệnh:" SubTitle="Physical examination" runat="server" />

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="•" Title="Dấu hiệu sinh tồn/ " SubTitle="Vital signs" runat="server" />

                                        <table class="table-bordered table-fixed mb-1 mt-1" style="width: 100%">
                                            <tr>
                                                <td class="p-2">Nhiệt độ/ Temperature (C degree)</td>
                                                <td class="p-2 text-right" style="width: 100px;">
                                                    <asp:Label runat="server" ID="prt_vs_temperature" /></td>
                                                <td class="p-2">Mạch/ Pulse (/min)</td>
                                                <td class="p-2 text-right" style="width: 100px;">
                                                    <asp:Label runat="server" ID="prt_pulse" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Cân nặng/ Weight (Kg)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_weight" /></td>
                                                <td class="p-2">Nhịp thở/ Respiratory Rate (/min)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_respiratory_rate" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chiều cao/Height (cm)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_height" /></td>
                                                <td class="p-2">Huyết áp/Blood pressure (mmHg)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_blood_pressure" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chỉ số khối cơ thể/ BMI (Kg/m2)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_BMI" /></td>
                                                <td class="p-2">Độ bão hòa Oxy/ SpO2 (%)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_spO2" /></td>
                                            </tr>
                                        </table>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="•" Title="Khám sàng lọc trước tiêm chủng/ " SubTitle="Screening before vaccination:" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="" runat="server" ID="prt_scr_before_vacc_1"></asp:Label>

                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="" runat="server" ID="prt_scr_before_vacc_2"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="" runat="server" ID="prt_scr_before_vacc_3"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="" runat="server" ID="prt_scr_before_vacc_4"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="" runat="server" ID="prt_scr_before_vacc_5"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="" runat="server" ID="prt_scr_before_vacc_6"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="" runat="server" ID="prt_scr_before_vacc_7"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="" runat="server" ID="prt_scr_before_vacc_8"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="" runat="server" ID="prt_scr_before_vacc_9"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="IV." Title="Chỉ định và kết quả xét nghiệm/ " SubTitle="Laboratory indications and results" runat="server" />

                                        <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="•" Title="Loại vắc xin tiêm chủng lần này/ " SubTitle="Appointed vaccine" runat="server" />

                                        <table style="width: 721px;" class="table-bordered mt-1 mb-1" runat="server" id="prt_appointed_vaccine">
                                            <tr>
                                                <td style="width: 200px" class="text-center"><b>Tên vaccin</b><br /> <i class="text-primary">Drug names</i></td>
                                                <td style="width: 80px" class="text-center"><b>Hàm lượng</b> <i class="text-primary">Strength</i></td>
                                                <td style="width: 80px" class="text-center"><b>Đường dùng</b><br /> <i class="text-primary">Route</i></td>
                                                <td style="width: 361px" class="text-center"><b>Hướng dẫn bổ sung/ Chỉ định sử <br /> dụng khi cần thiết kèm theo lý do</b><br /> <i class="text-primary">Additional instruction/ PRN order with reason</i></td>
                                            </tr>
                                        </table>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="•" Title="Khảo sát bổ sung khác/ " SubTitle="Additional investigations:" runat="server" />
                                            <asp:Label runat="server" ID="prt_additional_investigations"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="V." Title=" Kết luận/ " SubTitle="Conclusion" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="●" Title="Chẩn đoán ban đầu/ " SubTitle="Initial diagnosis:" runat="server" />
                                            <asp:Label runat="server" ID="prt_initial_diagnosis"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="●" Title="Chẩn đoán phân biệt/ " SubTitle="Differential diagnosis:" runat="server" />
                                            <asp:Label runat="server" ID="prt_differential_diagnosis"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="●" Title="Bệnh kèm theo/ " SubTitle="Associated conditions:" runat="server" />
                                            <asp:Label runat="server" ID="prt_associated_conditions"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 CssClass="text-inline" FixedLeft="5" FontBold="true" Order="●" Title="Điều trị/ " SubTitle="Treatment" runat="server" />
                                            <asp:Label runat="server" ID="prt_treatment"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr" >
                                            <webUI:PrtRowS1 CssClass="text-inline" FontBold="true" Order="❖" Title="Yêu cầu ý kiến chuyên khoa/ " SubTitle="Specialized opinion requested:" runat="server" />
                                            <asp:Label Width="200px" runat="server" ID="prt_spec_opinion_req"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr" id="spec_opinion_req" runat="server" >
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="●" Title="Nếu có, nêu rõ/ " SubTitle="If yes, specify:" runat="server" />
                                            <asp:Label runat="server" ID="prt_spec_opinion_req_text"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="●" Title="Hướng dẫn cụ thể dành cho bệnh nhân/ " SubTitle="Specific education required" runat="server" />
                                        <div class="d-grid" style="grid-template-columns: 20px 1fr">
                                            <div></div>
                                            <asp:Label runat="server" ID="prt_specific_edu_req"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="●" Title="Hẹn lần khám tới/ " SubTitle="Next appointment:" runat="server" />
                                            <asp:Label runat="server" ID="prt_next_appointment"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="VI." Title="Xác nhận của người tiêm chủng/ người giám hộ hợp pháp/ " SubTitle="Confirmation of patient/ legal guardian" runat="server" />

                                        <webUI:PrtRowS1 FixedLeft="5" Order="●" Title="Tôi đã được nghe bác sĩ tư vấn và đồng ý tiêm chủng cho tôi/ người mà tôi làm giám hộ hợp pháp.Tôi đã kiểm tra đúng thuốc tiêm và thuốc còn thời hạn dùng." SubTitle="I have been consulted and agree on vaccination. I checked right medication and medication has still not expired." runat="server" />

                                        <div class="d-grid mt-1" style="grid-template-columns: auto 1fr; page-break-inside: avoid !important">
                                            <webUI:PrtRowS1 FixedLeft="5" Order="●" CssClass="text-inline" Title="Họ tên người tiêm chủng/ người giám hộ/ " SubTitle="Full name of patient/ guardian:" runat="server" />
                                            <div> <hr style="border-bottom: 0.25px solid black"></div>
                                        </div>

                                        <div class="d-grid mb-2" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" Order="●" CssClass="text-inline" Title="Chữ ký người tiêm chủng/ người giám hộ/ " SubTitle="Signature of patient/ guardian:" runat="server" />
                                            <div> <hr style="border-bottom: 0.25px solid black"></div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <div></div>
                                            <div class="text-center avoid-page-break">
                                                <div class="font-bold">Bác sĩ điều trị/ <span class="text-primary">Attending doctor</span></div>
                                                <div class="font-bold">(Họ tên, chữ ký & MSNV)</div>
                                                <div class="font-bold text-primary">(Full name, Signature & ID)</div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell">
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

                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" MaxHeight="400">
                    <Windows>
                        <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" Title="Version History" runat="server">
                            <ContentTemplate>
                                <telerik:RadGrid ShowHeader="false" ID="RadGrid1" runat="server" AllowSorting="true" OnItemCommand="RadGrid1_ItemCommand">
                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="document_id,document_log_id">
                                        <Columns>
                                            <telerik:GridTemplateColumn>
                                                <ItemTemplate>
                                                    <telerik:RadLabel runat="server" ID="RadLabel1" Text='<%# GetHistoryName(Eval("status"),Eval("created_name_e"), Eval("created_date_time"), Eval("modified_name_e"), Eval("modified_date_time"), Eval("amend_reason")) %>'>
        </telerik:RadLabel>
                                           
                                                    <asp:HyperLink CssClass="btn-link" Text="View Log" runat="server" NavigateUrl='<%# GetLogUrl(Eval("document_log_id")) %>'></asp:HyperLink>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <SelectedItemStyle CssClass="SelectedStyle" />
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                </telerik:RadGrid>

                            </ContentTemplate>
                        </telerik:RadWindow>
                        <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow2" Title="Warning" runat="server">
                            <ContentTemplate>
                                <div class="text-center">
                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                    <h4 class="mt-4 mb-4">Delete document?</h4>
                                </div>

                                <div class="d-grid no-block justify-content-end">
                                    <asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="btnDelete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                                </div>
                            </ContentTemplate>
                        </telerik:RadWindow>
                        <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow3" Title="Warning" runat="server">
                            <ContentTemplate>
                                <div class="text-center">
                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                    <h4 class="mt-4">Denied!</h4>
                                    <label runat="server" id="lblUserBlock" />
                                </div>

                                <div class="d-grid no-block justify-content-end">
                                    <%--<asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="LinkButton1" CssClass="btn btn-danger">Delete</asp:LinkButton>--%>
                                </div>
                            </ContentTemplate>
                        </telerik:RadWindow>

                    </Windows>
                </telerik:RadWindowManager>

                <div class="cssclsNoPrint">
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Medical Record For Neonatal Vaccination</li>
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

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                            ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                        </asp:Panel>

                        <div class="row">
                            <div class="col-lg-12" id="accordionExample">
                                <div class="card">
                                    <div class="card-body collapse show" id="collapsePatientInfo" aria-labelledby="headingPatientInfo">
                                        <h5 class="box-title">Thông tin bệnh nhân/ Patient Detail</h5>
                                        <hr style="margin: 8px 0 12px 0;" />
                                        <div class="row">
                                            <div class="col-sm-6" style="display: flex">
                                                <div class="w-5 text-sm-right">
                                                    <label class="control-label text-sm-right mr-3">First Name:</label>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <asp:Label runat="server" ID="lblFirstName" CssClass="control-label text-sm-right"></asp:Label>
                                                </div>
                                            </div>

                                            <!--/span-->
                                            <div class="col-sm-6" style="display: flex">
                                                <div class="w-5 text-sm-right">
                                                    <label class="control-label text-sm-right mr-3">Last Name:</label>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <asp:Label runat="server" ID="lblLastName" CssClass="control-label text-sm-right"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-sm-6" style="display: flex">
                                                <div class="w-5 text-sm-right">
                                                    <label class="control-label text-sm-right mr-3">Gender:</label>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <asp:Label runat="server" ID="lblGender" CssClass="control-label text-sm-right"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6" style="display: flex">
                                                <div class="w-5 text-sm-right">
                                                    <label class="control-label text-sm-right mr-3">Date of Birth:</label>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <asp:Label runat="server" ID="lblDoB" CssClass="control-label text-sm-right"></asp:Label>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-sm-6" style="display: flex">
                                                <div class="w-5 text-sm-right">
                                                    <label class="control-label text-sm-right mr-3">Contact Person:</label>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <asp:Label runat="server" ID="lblContactPerson" CssClass="control-label text-sm-right"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6" style="display: flex">
                                                <div class="w-5 text-sm-right">
                                                    <label class="control-label text-sm-right mr-3">Relationship:</label>

                                                </div>
                                                <div class="flex-grow-1">
                                                    <asp:Label runat="server" ID="lblRelationship" CssClass="control-label text-sm-right"></asp:Label>
                                                </div>
                                            </div>

                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-lg-6 d-sm-flex">
                                                <div class="w-5 text-sm-right">
                                                    <label class="control-label text-sm-right mr-3">Address:</label>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <asp:Label runat="server" ID="lblPatientAddress" CssClass="control-label text-sm-right"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/row-->
                                        <!--/row-->
                                        <!-- Header: Patient Visit Info -->
                                        <h5 class="box-title">Thông tin lần khám/ Visit Detail <span class="text-danger">*</span></h5>
                                        <hr style="margin: 8px 0 12px 0;" />

                                        <div class="row">
                                            <div class="col-sm-6" style="display: flex">
                                                <div class="w-5 text-sm-right">
                                                    <label class="control-label text-sm-right mr-3">Encounter:</label>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <asp:Label runat="server" ID="lblVisitCode" CssClass="control-label text-sm-right"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="col-sm-6" style="display: flex">
                                                <div class="w-5 text-sm-right">
                                                    <label class="control-label text-sm-right mr-3">Admit Date:</label>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <asp:Label runat="server" ID="lblVisitDate" CssClass="control-label text-sm-right"></asp:Label>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div>
                                            <h4 class="text-primary">MEDICAL RECORD FOR NEONATAL VACCINATION</h4>
                                        </div>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-body collapse show" id="collapseOne">

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="currentLog">
                                                        <span class="mr-2">You are viewing an old version of this document</span>
                                                        <asp:HyperLink OnLoad="LinkViewLastestVersion_Load" ID="LinkViewLastestVersion" CssClass="btn-link" Text="View Latest Version" runat="server" />
                                                    </div>

                                                    <div class="alert alert-info d-flex align-items-center">
                                                        <telerik:RadLabel runat="server" ID="RadLabel1" />
                                                        <a class="btn-link" href="javascript:void(0)" onclick="showWindow('RadWindow1')">View History</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h4">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_chief_complaint" />
                                                    <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-12">
                                                    <label class="control-label h4">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">1. Bệnh sử hiện tại/ <span class="text-primary">Current medical history:</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_cur_med_history" />
                                                    <div class="form-group" runat="server" id="cur_med_history_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_cur_med_history" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 d-inline-block ">* Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                    <div class="form-group" runat="server" id="cur_medications_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_cur_medications" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_cur_medications" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Tiền sử bệnh/ <span class="text-primary">Antecedent medical history:</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Bản thân/ <span class="text-primary">Personal:</span></label>
                                                    <div class="form-group" runat="server" id="personal_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_personal" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_personal" />
                                                </div>

                                                <div class="col-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                                    <div class="form-group" runat="server" id="family_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_family" />
                                                    </div>
                                                    <asp:Label runat="server" ID="lbl_family" />
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1 d-block">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                    <asp:Label runat="server" ID="lbl_allergy" />
                                                    <div runat="server" id="allergy_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2 d-inline-block">
                                                            <input type="radio" id="rad_allergy_false" onchange="radioButtonChange(this)" data-target="allergy_note_field" runat="server" name="rad_allergy" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_allergy_false">Không/<span class="text-primary">No</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                            <input disabled-for="allergy_note_field" onchange="radioButtonChange(this)" type="radio" id="rad_allergy_true" runat="server" name="rad_allergy" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare2" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group allergy_note_field mt-2">
                                                            <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <div class="row">
                                                <div class="col-12">
                                                    <label class="control-label h4">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                                </div>
                                            </div>

                                            <div class="mb-1"><label class="control-label">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label></div>

                                            <asp:UpdatePanel ID="updatepnl_vital_sign" runat="server">
                                                <ContentTemplate>
                                                    <div class="dg gtc-1 mb-1">
                                                        <div></div>
                                                        <div>
                                                            <div class="mb-1">
                                                                <asp:LinkButton runat="server" ID="btnUpdateVitalSign" OnClick="btnUpdateVitalSign_Click" CssClass="btn btn-sm btn-secondary waves-effect">Update</asp:LinkButton>
                                                                <asp:LinkButton Visible="false" runat="server" ID="btnVSFreeText" OnClick="btnVSFreeText_Click" CssClass="btn btn-sm btn-secondary waves-effect">New Vital Sign</asp:LinkButton>
                                                                <asp:CheckBox Style="display: none" runat="server" ID="cbVSFreeText" />
                                                            </div>

                                                            <%--<label class="custom-control custom-checkbox d-inline-block mr-2">
                                                                <span class="custom-control-label">Free Text</span>
                                                            </label>--%>

                                                            <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updatepnl_vital_sign">
                                                                <ProgressTemplate>
                                                                    <div class="loader1 ml-2">
                                                                        <div style="width: 28px; height: 28px;" class="loader-wheel"></div>
                                                                    </div>
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>

                                                            <div class="dg gtc-2 mb-1" style="width: 400px">
                                                                <label class="control-label mr-2 mb-1" style="line-height: 31px">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_vs_temperature" style="line-height: 31px"></asp:Label>
                                                                    <div class="form-group" style="width: 120px" runat="server" id="vs_temperature_wrapper">
                                                                        <input data-type="number" runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                                        <span class="append">°C</span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg gtc-2 mb-1" style="width: 400px">
                                                                <label class="control-label mr-2 mb-1" style="line-height: 31px">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_vs_weight" style="line-height: 31px"></asp:Label>
                                                                
                                                                    <div class="form-group" style="width: 120px" runat="server" id="vs_weight_wrapper">
                                                                        <input data-type="number" onchange="CalculateBmi()" runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                                        <span class="append">Kg</span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg gtc-2 mb-1" style="width: 400px">
                                                                <label class="control-label mr-2 mb-1" style="line-height: 31px">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                                <asp:Label runat="server" ID="lbl_vs_height" style="line-height: 31px"></asp:Label>
                                                                <div class="form-group" style="width: 120px" runat="server" id="vs_height_wrapper">
                                                                    <input data-type="number" onchange="CalculateBmi()" id="txt_vs_height" runat="server" class="form-control text-right" />
                                                                    <span class="append">cm</span>
                                                                </div>
                                                            </div>

                                                            <div class="dg gtc-2 mb-1" style="width: 400px">
                                                                <label for="bmi" class="control-label mb-1 mr-2" style="line-height: 31px">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_vs_BMI" style="line-height: 31px"></asp:Label>
                                                                    <div class="form-group" style="width: 150px" runat="server" id="vs_BMI_wrapper">
                                                                        <input runat="server" id="txt_vs_bmi" class="form-control text-right" disabled="disabled" />
                                                                        <span class="append">(Kg/m <sup>2</sup>)</span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div><asp:Label runat="server" ID="bmiStr"></asp:Label></div>

                                                            <div class="dg gtc-2 mb-1" style="width: 400px">
                                                                <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi) <br />
                                                                    <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_vs_pulse" style="line-height: 31px"></asp:Label>
                                                                    <div class="form-group" style="width: 120px" runat="server" id="vs_pulse_wrapper">
                                                                        <input data-type="number" runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                                        <span class="append">cm</span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg gtc-2 mb-1" style="width: 400px">
                                                                <label class="control-label mr-2 mb-1" style="line-height: 31px">Nhịp tim/ <span class="text-primary">Heart rate:</span></label>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_vs_heart_rate" style="line-height: 31px"></asp:Label>
                                                                    <div class="form-group" style="width: 150px" runat="server" id="vs_heart_rate_wrapper">
                                                                        <input data-type="number" runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                                        <span class="append">/phút (m)</span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg gtc-2 mb-1" style="width: 400px">
                                                                <label class="control-label mr-2 mb-1" style="line-height: 31px">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_vs_respiratory_rate" style="line-height: 31px"></asp:Label>
                                                                    <div class="form-group" style="width: 150px" runat="server" id="vs_respiratory_rate_wrapper">
                                                                        <input data-type="number" runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                                        <span class="append">/phút (m)</span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg gtc-2 mb-1" style="width: 400px">
                                                                <label class="control-label mr-2 mb-1" style="line-height: 31px">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_vs_blood_pressure" style="line-height: 31px"></asp:Label>
                                                                    <div class="form-group" style="width: 150px" runat="server" id="vs_blood_pressure_wrapper">
                                                                        <input data-type="number1" id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                                        <span class="append">mmHg</span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="dg gtc-2 mb-1" style="width: 400px">
                                                                <label for="spO2" class="control-label mb-1 mr-2" style="line-height: 31px">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                                <div>
                                                                    <asp:Label runat="server" ID="lbl_vs_spO2" style="line-height: 31px"></asp:Label>
                                                                    <div class="form-group" style="width: 120px" runat="server" id="vs_spO2_wrapper">
                                                                        <input data-type="number" runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                                        <span class="append">%</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Khám sàng lọc trước tiêm chủng/ <span class="text-primary">Screening before vaccination:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">1. Tình trạng sức khỏe chưa ổn định/ <span class="text-primary">Unstable health condition:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label></label>
                                                            <div class="form-group" runat="server" id="scr_before_vacc_1_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_1" />
                                                            </div>
                                                            <asp:Label runat="server" ID="lbl_scr_before_vacc_1" />
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">2. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 37,5°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ <span class="text-primary">Fever / Hypothermia (Fever: temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):</span></label>
                                                        </legend>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label></label>
                                                            <div class="form-group" runat="server" id="scr_before_vacc_2_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_2" />
                                                            </div>
                                                            <asp:Label runat="server" ID="lbl_scr_before_vacc_2" />
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">3. Khóc bé hoặc không khóc/ <span class="text-primary">Cry or unable to cry:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label></label>
                                                            <div class="form-group" runat="server" id="scr_before_vacc_3_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_3" />
                                                            </div>
                                                            <asp:Label runat="server" ID="lbl_scr_before_vacc_3" />
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">4. Da, môi không hồng/ <span class="text-primary">Skin and lips are not pink:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label></label>
                                                            <div class="form-group" runat="server" id="scr_before_vacc_4_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_4" />
                                                            </div>
                                                            <asp:Label runat="server" ID="lbl_scr_before_vacc_4" />
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">5. Bú kém hoặc bỏ bú/ <span class="text-primary">Poor breastfeeding or breastfeeding refusal:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label></label>
                                                            <div class="form-group" runat="server" id="scr_before_vacc_5_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_5" />
                                                            </div>
                                                            <asp:Label runat="server" ID="lbl_scr_before_vacc_5" />
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">6. Tuổi thai < 28 tuần/ <span class="text-primary">Gestational age <28 weeks:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label></label>
                                                            <div class="form-group" runat="server" id="scr_before_vacc_6_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_6" />
                                                            </div>
                                                            <asp:Label runat="server" ID="lbl_scr_before_vacc_6" />
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">7. Trẻ < 34 tuần tuổi/ <span class="text-primary">Children <34 weeks old:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label></label>
                                                            <div class="form-group" runat="server" id="scr_before_vacc_7_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_7" />
                                                            </div>
                                                            <asp:Label runat="server" ID="lbl_scr_before_vacc_7" />
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">8. Cân nặng của trẻ < 2000 g, mẹ có HBsAg (-)/ <span class="text-primary">Child's weight < 2000g, his/her morther HbsAg (-):</span></label>
                                                        </legend>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label></label>
                                                            <div class="form-group" runat="server" id="scr_before_vacc_8_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_8" />
                                                            </div>
                                                            <asp:Label runat="server" ID="lbl_scr_before_vacc_8" />
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">9. Các chống chỉ định khác, nếu có ghi rõ/ <span class="text-primary">Other contraindications, if yes specified:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label></label>
                                                            <div class="form-group" runat="server" id="scr_before_vacc_9_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_9" />
                                                            </div>
                                                            <asp:Label runat="server" ID="lbl_scr_before_vacc_9" />
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </fieldset>

                                            <div class="row">
                                                <div class="col-12">
                                                    <label class="control-label h4">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Loại vắc xin tiêm chủng lần này/ <span class="text-primary">Appointed Vaccine:</span></label>
                                                </legend>

                                                <div class="col-md-12">
                                                    <asp:UpdatePanel ID="updatePanel_appointed_vaccine" runat="server" UpdateMode="Always">
                                                        <ContentTemplate>
                                                            <asp:GridView ShowHeaderWhenEmpty="true" ID="grid_appointed_vaccine" runat="server" OnRowDeleting="grid_appointed_vaccine_RowDeleting" CssClass="table-bordered" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 180px">Tên vaccin/ <span class="text-primary">Drug names</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("drug_name") %>' ID="drug_name" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 130px">Hàm lượng/ <span class="text-primary">Strength</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("strength") %>' ID="strength" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 120px">Đường dùng/ <span class="text-primary">Route</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("router") %>' ID="router" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 300px">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do/ <span class="text-primary">Additional instruction/ PRN order with reason</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("reason") %>' ID="reason" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                            <icon:Trash runat="server"/>
                                                                            </asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <EmptyDataTemplate>There are no items to display.</EmptyDataTemplate>
                                                            </asp:GridView>
                                                            <asp:UpdateProgress ID="updateProgress_appointed_vaccine" runat="server" AssociatedUpdatePanelID="updatePanel_appointed_vaccine">
                                                                <ProgressTemplate>
                                                                    Loading....
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                            <div class="mt-2">
                                                                <asp:LinkButton OnClick="btn_grid_appointed_vaccine_add_Click" runat="server" CssClass="btn btn-sm btn-secondary waves-effect" ID="btn_grid_appointed_vaccine_add">+ Add Row</asp:LinkButton>
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btn_grid_appointed_vaccine_add" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>

                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_additional_investigations" />
                                                    <div class="form-group" runat="server" id="additional_investigations_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_additional_investigations" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1 h4">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis (ICD 10):</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_initial_diagnosis" />
                                                    <div class="form-group" runat="server" id="initial_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis (ICD 10):</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_differential_diagnosis" />
                                                    <div class="form-group" runat="server" id="differential_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_differential_diagnosis" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_associated_conditions" />
                                                    <div class="form-group" runat="server" id="associated_conditions_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Kế hoạch điều trị/ <span class="text-primary">Treatment:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_treatment_desc" />
                                                    <div runat="server" id="treatment_code_wrapper">
                                                    <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_treatment_code_opd" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_treatment_code_opd">
                                                            Ngoại trú/ <span class="text-primary">Ambulatory care</span>
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_treatment_code_ipd" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_treatment_code_ipd">
                                                            Nhập viện/ <span class="text-primary">Admission</span>
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_treatment_code_trf" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_treatment_code_trf">
                                                            Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_treatment_code" onclick="clear_radiobutton(this)">
                                                            <icon:XSquare runat="server" ID="XSquare1" />
                                                        </a>
                                                    </div>
                                                </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_spec_opinion_req" />
                                                    <div runat="server" id="spec_opinion_req_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2 d-inline-block">
                                                            <input type="radio" id="rad_spec_opinion_req_false" onchange="radioButtonChange(this)" data-target="spec_opinion_req_text_field" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_spec_opinion_req_false">Không/<span class="text-primary">No</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                            <input disabled-for="spec_opinion_req_text_field" onchange="radioButtonChange(this)" type="radio" id="rad_spec_opinion_req_true" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_spec_opinion_req_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_spec_opinion_req" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare3" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group par spec_opinion_req_text_field mt-2">
                                                            <webUI:TextField runat="server" ID="txt_spec_opinion_req_text" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_pecific_edu_req" />
                                                    <div runat="server" id="pecific_edu_req_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_pecific_edu_req" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_next_appointment" />
                                                    <div runat="server" id="next_appointment_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_next_appointment" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-actions">
                                                    <asp:LinkButton ValidationGroup="Group1" runat="server"  OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                    <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

                                                    <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>

                                                    <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                    <asp:LinkButton runat="server" OnClientClick="btnPrint_Click(); return false;" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

                                                    <asp:LinkButton runat="server" OnClick="btnCancel_Click" ID="btnCancel" CssClass="btn btn-secondary waves-effect">Cancel</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>

                                        <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                            <ModalBody>
                                                <div class="text-center">
                                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                    <h4 class="mt-4 mb-4">Delete document?</h4>
                                                </div>
                                                <div class="text-right">
                                                    <div class="btn btn-default waves-effect" data-dismiss="modal">Close</div>
                                                    <asp:LinkButton OnClick="btnDelete_Click" OnClientClick="window.removeEventListener('beforeunload',comfirm_leave_page,true);" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
                                                </div>
                                            </ModalBody>
                                        </webUI:PopupModal>
                                            <webUI:PopupShowDelay runat="server" ID="PopupShowDelay" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:LinkButton runat="server" OnClick="clearSession_Click" ID="clearSession"></asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/alertify.js"></script>
    <script type="text/javascript">
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        checkboxRadiobutton_init();
        formGroup_init();
        InputFilter("data-type='number'");
        InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter("data-type='number'");
            InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

        function btnPrint_Click() {
            let printContent = document.querySelector("#printContent");
            printContent.setAttribute("style", "display: block");

            let total = Math.ceil(printContent.offsetHeight / 1096);

            for (let i = 1; i <= total; i++) {
                let div = document.createElement("div");
                div.setAttribute("class", "watermark page");
                div.setAttribute("style", "top: " + (1093 * (i - 1)) + "px;");
                div.setAttribute("data-page", "Page " + i + " of " + total);
                document.getElementById("print_content").append(div);

            }

            setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);
            window.print();
        }

    </script>
</body>
</html>

