<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedRecForVac.aspx.cs" Inherits="EMR.OPD.MedRecForVac" ValidateRequest="false" EnableEventValidation="false" %>

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
    <title>Medical Record For Vaccination</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <style type="text/css">
        table { page-break-after:auto }
        tr    { page-break-inside:avoid; page-break-after:auto }
        td    { page-break-inside:avoid; page-break-after:auto }
        thead { display:table-header-group }
        tfoot { display:table-footer-group }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info">
                                        <img src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>BỆNH ÁN TIÊM CHỦNG</h4>
                                            <h5>MEDICAL RECORD FOR VACCINATION</h5>
                                            <div class="text-primary" style="font-size: 12.5px;">(Áp dụng cho các đối tượng ≥1 tháng tuổi/ For person ≥ 1 month old)</div>
                                        </div>
                                        <div style="width: 140px" class="text-center">
                                            <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
                                            <asp:Label runat="server" ID="prt_vpid" CssClass="d-block font-bold"></asp:Label>
                                        </div>
                                    </div>
                                    <webUI:Line runat="server" />
                                </th>
                            </tr>
                        </thead>

                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div class="main" runat="server" id="print_content">
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

                                        <div runat="server" id="prt_allergy_note_wrapper" class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" Order="•" CssClass="text-inline" Title="Nếu có, nêu rõ/ " SubTitle="If yes, specify:" runat="server" />
                                            <asp:Label runat="server" ID="prt_allergy_note"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="III." Title="Khám bệnh:" SubTitle="Physical examination" runat="server" />

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="•" Title="Dấu hiệu sinh tồn/ " SubTitle="Vital signs" runat="server" />

                                        <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%;">
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
                                            <asp:Label Text="1. Sốc, phản ứng nặng sau lần tiêm chủng trước/<span class='text-primary'>Shock, severe reaction after previous vaccination: </span>" runat="server" ID="prt_scr_before_vacc_1"></asp:Label>

                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="2. Đang mắc bệnh cấp tính hoặc bệnh mạn tính tiến triển/ <span class='text-primary'>Are suffering from an acute or progressive chronic disease</span>: " runat="server" ID="prt_scr_before_vacc_2"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="3. Đang hoặc mới kết thúc đợt điều trị corticoid liều cao (prednison > 2mg/kg/ngày), hóa trị, xạ trị, dùng gammaglobulin/ <span class='text-primary'>At or just after a high-dose corticosteroid treatment (prednison > 2mg / kg / day), chemotherapy, radiationand gammaglobulin:</span> " runat="server" ID="prt_scr_before_vacc_3"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="4. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 38°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ <span class='text-primary'>Fever / Hypothermia (Fever:temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):</span> " runat="server" ID="prt_scr_before_vacc_4"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="5. Nghe tim bất thường/ <span class='text-primary'>Hearing abnormalities:</span> " runat="server" ID="prt_scr_before_vacc_5"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="6. Nhịp thở, nghe phổi bất thường/ <span class='text-primary'>Abnormal breathing, pulmonary listening:</span> " runat="server" ID="prt_scr_before_vacc_6"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="7. Tri giác bất thường (li bì hoặc kích thích)/ <span class='text-primary'>Abnormal perception (li or stimulation):</span> " runat="server" ID="prt_scr_before_vacc_7"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <div></div>
                                            <asp:Label Text="8. Các chống chỉ định khác, nếu có ghi rõ/ <span class='text-primary'>Other contraindications, if yes specified:</span> " runat="server" ID="prt_scr_before_vacc_8"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="IV." Title="Chỉ định và kết quả xét nghiệm/ " SubTitle="Laboratory indications and results" runat="server" />

                                        <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="•" Title="Loại vắc xin tiêm chủng lần này/ " SubTitle="Appointed vaccine" runat="server" />

                                        <asp:GridView ShowHeaderWhenEmpty="true" ID="prt_appointed_vaccine" runat="server" CssClass="table-bordered" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <div style="width: 180px">Tên vaccin/ <span class="text-primary">Drug names</span></div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("drug_name") %>' ID="drug_name"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <div style="width: 130px">Hàm lượng/ <span class="text-primary">Strength</span></div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("strength") %>' ID="strength"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <div style="width: 120px">Đường dùng/ <span class="text-primary">Route</span></div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("router") %>' ID="router"></asp:Label>
                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <div style="width: 300px">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do/ <span class="text-primary">Additional instruction/ PRN order with reason</span></div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%#Eval("reason") %>' ID="reason"></asp:Label>
                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="•" Title="Khảo sát bổ sung khác/ " SubTitle="Additional investigations:" runat="server" />
                                            <asp:Label runat="server" ID="prt_additional_investigations"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="V." Title="Kết luận/ " SubTitle="Conclusion" runat="server" />

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

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 CssClass="text-inline" FontBold="true" Order="❖" Title="Yêu cầu ý kiến chuyên khoa/ " SubTitle="Specialized opinion requested:" runat="server" />
                                            <asp:Label Width="200px" runat="server" ID="prt_spec_opinion_req"></asp:Label>
                                        </div>

                                        <div runat="server" id="prt_spec_opinion_req_wrapper" class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="●" Title="Nếu có, nêu rõ/ " SubTitle="If yes, specify:" runat="server" />
                                            <asp:Label runat="server" ID="prt_spec_opinion_req_text"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FixedLeft="5" FontBold="true" CssClass="text-inline" Order="●" Title="Hướng dẫn cụ thể dành cho bệnh nhân/ " SubTitle="Specific education required" runat="server" />
                                        <div class="d-grid" style="grid-template-columns: 20px 1fr">
                                            <div></div>
                                            <asp:Label runat="server" ID="prt_specific_edu_req"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <%--<webUI:PrtRowS1 FixedLeft="5" ID="prt_next_appointment" FontBold="true" Order="●" Title="Hẹn lần khám tới/ " SubTitle="Next appointment:" runat="server" />--%>
                                            <asp:Label runat="server" ID="prt_next_appointment"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="VI." Title="Xác nhận của người tiêm chủng/ người giám hộ hợp pháp/ " SubTitle="Confirmation of patient/ legal guardian" runat="server" />

                                        <webUI:PrtRowS1 FixedLeft="5" Order="●" Title="Tôi đã được nghe bác sĩ tư vấn và đồng ý tiêm chủng cho tôi/ người mà tôi làm giám hộ hợp pháp.Tôi đã kiểm tra đúng thuốc tiêm và thuốc còn thời hạn dùng." SubTitle="I have been consulted and agree on vaccination. I checked right medication and medication has still not expired." runat="server" />

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" Order="●" CssClass="text-inline" Title="Họ tên người tiêm chủng/ người giám hộ/ " SubTitle="Full name of patient/ guardian:" runat="server" />
                                            <div style="line-height: 15px; height: 15px;" class="prt-line-solid"></div>
                                        </div>

                                        <div class="d-grid mb-2" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FixedLeft="5" Order="●" CssClass="text-inline" Title="Chữ ký người tiêm chủng/ người giám hộ/ " SubTitle="Signature of patient/ guardian:" runat="server" />
                                            <div style="line-height: 15px; height: 15px;" class="prt-line-solid"></div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <div></div>
                                            <div class="text-center avoid-page-break">
                                                <div class="font-bold">Bác sĩ điều trị/ <span class="text-primary">Attending doctor</span></div>
                                                <div class="font-bold">(Họ tên, chữ ký & MSNV)</div>
                                                <div class="font-bold text-primary">(Full name, Signature & ID)</div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_signature1"></asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell">
                                    <img style="width: 100%" src="../images/bottomline.png" />
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
                                    <h4 class="mt-4 mb-4">Denied!</h4>
                                </div>

                                <div class="d-grid no-block justify-content-end">
                                    <%--<asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="LinkButton1" CssClass="btn btn-danger">Delete</asp:LinkButton>--%>
                                </div>
                            </ContentTemplate>
                        </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>

                <div class="cssclsNoPrint">
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0; border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Medical Record For Vaccination</li>
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
                                        <h4 class="text-primary">MEDICAL RECORD FOR VACCINATION</h4>
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

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                            </legend>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <div class="mb-2">
                                                                <asp:LinkButton OnClick="btnUpdateVitalSigns_Click" runat="server" CssClass="btn btn-sm btn-secondary waves-effect" ID="btnUpdateVitalSigns">Update</asp:LinkButton>
                                                            </div>
                                                            <div>
                                                                <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                                <asp:Label runat="server" ID="vs_temperature" />&nbsp;°C
                                                            </div>

                                                            <div>
                                                                <label class="control-label mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                                <asp:Label runat="server" ID="vs_weight" />&nbsp;Kg
                                                            </div>

                                                            <div>
                                                                <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                                <asp:Label runat="server" ID="vs_height" />&nbsp;cm
                                                            </div>

                                                            <div>
                                                                <label for="bmi" class="control-label mb-1 mr-2">Chỉ số cơ thể/ <span class="text-primary">BMI</span></label>
                                                                <asp:Label runat="server" ID="vs_BMI" />
                                                            </div>

                                                            <div>
                                                                <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                                <asp:Label runat="server" ID="vs_pulse" />&nbsp;cm
                                                            </div>

                                                            <div>
                                                                <label class="control-label mb-1 mr-2">Nhịp tim/ <span class="text-primary">Heart rate:</span></label>
                                                                <asp:Label runat="server" ID="vs_heart_rate" />&nbsp;/phút (m)
                                                            </div>

                                                            <div>
                                                                <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                                <asp:Label runat="server" ID="vs_respiratory_rate" />&nbsp;/phút (m)
                                                            </div>

                                                            <div>
                                                                <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                                <asp:Label runat="server" ID="vs_blood_pressure" />&nbsp;mmHg
                                                            </div>

                                                            <div>
                                                                <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                                <asp:Label runat="server" ID="vs_spO2" />&nbsp;%
                                                            </div>

                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Khám sàng lọc trước tiêm chủng/ <span class="text-primary">Screening before vaccination:</span></label>
                                            </legend>

                                            <div class="col-12 mb-2">
                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label">1. Sốc, phản ứng nặng sau lần tiêm chủng trước/ <span class="text-primary">Shock, severe reaction after previous vaccination:</span></label>
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
                                                        <label class="control-label">2. Đang mắc bệnh cấp tính hoặc bệnh mạn tính tiến triển/ <span class="text-primary">Are suffering from an acute or progressive chronic disease:</span></label>
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
                                                        <label class="control-label">3. Đang hoặc mới kết thúc đợt điều trị corticoid liều cao (prednison >2mg/kg/ngày), hóa trị, xạ trị, dùng gammaglobulin/ <span class="text-primary">At or just after a high-dose corticosteroid treatment (prednison> 2mg / kg / day), chemotherapy, radiation and gammaglobulin:</span></label>
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
                                                        <label class="control-label">4. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 38°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ Fever/ <span class="text-primary">Hypothermia (Fever: temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):</span></label>
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
                                                        <label class="control-label">5. Nghe tim bất thường/ <span class="text-primary">Hearing abnormalities:</span></label>
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
                                                        <label class="control-label">6. Nhịp thở, nghe phổi bất thường/ <span class="text-primary">Abnormal breathing, pulmonary listening:</span></label>
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
                                                        <label class="control-label">7. Tri giác bất thường (li bì hoặc kích thích)/ <span class="text-primary">Abnormal perception (li or stimulation):</span></label>
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
                                                        <label class="control-label">8. Các chống chỉ định khác, nếu có ghi rõ/ <span class="text-primary">Other contraindications, if yes specified:</span></label>
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
                                                                        <webUI:TextField Value='<%#Eval("drug_name") %>' ID="drug_name" runat="server" TextMode="SingleLine" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 130px">Hàm lượng/ <span class="text-primary">Strength</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField Value='<%#Eval("strength") %>' ID="strength" runat="server" TextMode="SingleLine" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 120px">Đường dùng/ <span class="text-primary">Route</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField Value='<%#Eval("router") %>' ID="router" runat="server" TextMode="SingleLine" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do/ <span class="text-primary">Additional instruction/ PRN order with reason</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField Value='<%#Eval("reason") %>' ID="reason" runat="server" TextMode="SingleLine" />
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
                                                <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

                                                <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>


                                                <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                <asp:LinkButton runat="server" OnClientClick="window.print(); return false;" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

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
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>
    <script type="text/javascript">



        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);
        $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });
        checkboxRadiobutton_init();
        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            checkboxRadiobutton_init();
            $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });
            setTimeout(function () {
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

    </script>
</body>
</html>
