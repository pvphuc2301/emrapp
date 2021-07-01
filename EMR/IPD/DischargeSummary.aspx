<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DischargeSummary.aspx.cs" Inherits="EMR.DischargeSummary" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="aih" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label1.ascx" TagPrefix="webUI" TagName="Label1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtDate.ascx" TagPrefix="webUI" TagName="PrtDate" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Discharge Summary</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManage" />
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
                                            <h4>TÓM TẮT XUẤT VIỆN</h4>
                                            <h5>DISCHARGE SUMMARY</h5>
                                        </div>
                                        <div style="width: 175px;">
                                            <div runat="server" id="prt_fullname"></div>
                                            <div runat="server" id="prt_gender"></div>
                                            <div class="d-block font-bold" runat="server" id="prt_DOB"></div>
                                            <div runat="server" id="prt_vpid" class="d-block"></div>
                                            <webUI:Barcode runat="server" ID="prt_barcode" Width="120" Height="22" />
                                        </div>
                                    </div>
                                    <webUI:Line runat="server" ID="Line" />
                                </th>
                            </tr>
                        </thead>

                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div class="main">
                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <div class="d-grid" style="grid-template-columns: 120px auto">
                                                <webUI:PrtRowS1 FontBold="true" FixedLeft="10" FixedWidth="120" Title="Ngày nhập viện" SubTitle="Day of visit" runat="server" />
                                                <asp:Label runat="server" ID="prt_date_of_hospital"></asp:Label>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 120px auto">
                                                <webUI:PrtRowS1 FontBold="true" FixedWidth="120" Title="Ngày xuất viện" SubTitle="Date of Discharge" runat="server" />
                                                <asp:Label runat="server" ID="prt_date_of_discharge"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 200px auto; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" Order="1." Title="Lý do nhập viện:" SubTitle="Reason for admission" runat="server" />
                                            <asp:Label runat="server" ID="prt_admission_reason"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="2." Title="Chẩn đoán:" SubTitle="Diagnosis" runat="server" />
                                            <asp:Label runat="server" ID="prt_icd10_diagnosis"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="3." Title="Bệnh sử:" SubTitle="Medical History" runat="server" />
                                            <asp:Label runat="server" ID="prt_cur_med_history"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="4." Title="Khám lâm sàng:" SubTitle="Physical findings on admission" runat="server" />
                                            <asp:Label runat="server" ID="prt_physical_finding"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="5." Title="Kết quả xét nghiệm:" SubTitle="Laboratory investigation results" runat="server" />
                                            <asp:Label runat="server" ID="prt_lab_result"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="6." Title="Các quy trình đã được thực hiện:" SubTitle="Procedures performed" runat="server" />
                                            <asp:Label runat="server" ID="prt_proce_performed"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="7." Title="Điều trị trong quá trình nằm viện:" SubTitle="Treatment during hospitalization" runat="server" />
                                            <asp:Label runat="server" ID="prt_treatment"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="8." Title="Diễn tiến trong quá trình nằm viện:" SubTitle="Evolution during hospitalization" runat="server" />
                                            <asp:Label runat="server" ID="prt_evolution"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="9." Title="Tình trạng của bệnh nhân khi xuất viện:" SubTitle="Patient’s condition on discharge" runat="server" />
                                            <asp:Label runat="server" ID="prt_disc_condition"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="10." Title="Thuốc khi xuất viện:" SubTitle="Discharge medications" runat="server" ID="prt_disc_medication_title" />
                                            <asp:Label runat="server" ID="prt_disc_medication"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="10." Title="Xuất viện trái lời khuyên bác sỹ:" SubTitle="Discharge against medical advice(DAMA)" runat="server" ID="prt_dama_title" />
                                            <asp:Label runat="server" ID="prt_dama"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="11." Title="Chuyển viện:" SubTitle="Transfer to another hospita" runat="server" ID="prt_trans_to_hospital_title" />
                                            <asp:Label runat="server" ID="prt_trans_to_hospital"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="30" Title="Nếu có, nêu rõ lý do:" SubTitle="If yes, specify the reaso" runat="server" ID="prt_transfer_reason_title" />
                                            <asp:Label runat="server" ID="prt_transfer_reason"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="11." Title="Hướng dẫn theo dõi (ghi rõ các dấu hiệu cần tái khám):" SubTitle="Follow-up instructions (signs and symptoms for immediate revisit)" runat="server" ID="prt_follow_up_instruc_title" />
                                            <asp:Label runat="server" ID="prt_follow_up_instruc"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="12." Title="Chế độ ăn uống:" SubTitle="Special diet" runat="server" ID="prt_special_diet_title" />
                                            <asp:Label runat="server" ID="prt_special_diet"></asp:Label>

                                            <webUI:PrtRowS1 FontBold="true" Order="13." Title="Ngày tái khám (ghi rõ ngày và tên bác sỹ):" SubTitle="Next consultation (specify date and with whom):" runat="server" ID="prt_next_consult_title" />
                                            <asp:Label runat="server" ID="prt_next_consult"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <div></div>
                                            <div class="text-center" style="break-inside: avoid;">
                                                <div>Ngày/ <span class="text-primary">Date</span>: 14-12-2019</div>
                                                <div>Bác sỹ điều trị/ <span class="text-primary">Attending Physician</span>:</div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell" style="font-size: 10px">
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

                <div class="cssclsNoPrint" style="overflow: scroll; height: 100vh; overflow-x: hidden;">
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
         
                    <uc1:PatientInfo runat="server" ID="PatientInfo1" />

                    <div class="row">
                        <div class="col-md-12">
                                    <div class="card mt-2">
                                        <div class="card-header">
                                            <h4 class="text-primary">Discharge Summary</h4>
                                            <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                        </div>
                                        <div class="card-body collapse show" id="collapseOne">
                                            <div class="form-body">

                                                <div class="row mb-2">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1" style="width: 150px">Lý do xuất viện/ <span class="text-primary">Discharge Reason </span><span class="text-danger">*</span></label>
                                                        <asp:Label CssClass="align-top" runat="server" ID="lbl_disc_reason_desc" />
                                                        <div class="d-inline-block align-top" runat="server" id="disc_reason_code_wrapper">

                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input onclick="__doPostBack('discReasonCode_Change', 'ama')" type="radio" runat="server" id="rad_disc_reason_code_ama" name="rad_disc_reason_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_disc_reason_code_ama"><span class="text-primary">Normal</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input onclick="__doPostBack('discReasonCode_Change', 'dama')" type="radio" runat="server" id="rad_disc_reason_code_dama" name="rad_disc_reason_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_disc_reason_code_dama"><span class="text-primary">Dama</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input onclick="__doPostBack('discReasonCode_Change', 'transfer')" type="radio" runat="server" id="rad_disc_reason_code_transfer" name="rad_disc_reason_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_disc_reason_code_transfer"><span class="text-primary">Transfer</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_disc_reason_code" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare38" />
                                                                </a>
                                                            </div>
                                                            <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="Discharge Reason is required" CssClass="text-danger" OnServerValidate="disc_reason_code_ServerValidate"></asp:CustomValidator>
                                                        </div>
                                                    </div>
                                                </div>

                                                <fieldset class="row mb-2">
                                                    <div class="col-md-12 mb-2">
                                                        <label class="control-label mb-1" style="width: 150px">Ngày nhập viện/ <span class="text-primary">Date of hospitalization:</span></label>
                                                        <asp:Label CssClass="align-top" runat="server" ID="lbl_date_of_hospital" />
                                                        <span runat="server" id="date_of_hospital_wrapper">
                                                            <telerik:RadDatePicker runat="server" ID="dpk_date_of_hospital" CssClass="align-top" Width="120px" />
                                                        </span>
                                                    </div>

                                                    <div class="col-md-12 mb-2">
                                                        <label class="control-label mb-1" style="width: 150px">Ngày xuất viện/ <span class="text-primary">Date of discharge:</span></label>
                                                        <asp:Label CssClass="align-top" runat="server" ID="lbl_date_of_discharge" />
                                                        <span runat="server" id="date_of_discharge_wrapper">
                                                            <telerik:RadDatePicker CssClass="align-top" runat="server" ID="dpk_date_of_discharge" Width="120px" />
                                                        </span>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label mb-2">1. Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                                    </legend>

                                                    <div class="col-md-12">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block align-top" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_admission_reason" />
                                                            <div runat="server" id="admission_reason_wrapper">
                                                                <aih:TextField runat="server" ID="txt_admission_reason" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label mb-2">2. Chẩn đoán chính/ <span class="text-primary">Main diagnosis:</span></label>
                                                    </legend>
                                                    <div class="col-md-12 mb-2">
                                                        <label style="width: 150px" class="control-label mb-1">Phân loại bệnh theo ICD-10/ <span class="text-primary">ICD-10 Code:</span></label>
                                                        <div class="d-inline-block align-top" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_icd10_diagnosis" />
                                                            <div runat="server" id="icd10_diagnosis_wrapper">
                                                                <aih:TextField runat="server" ID="txt_icd10_diagnosis" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 mb-2">
                                                        <label class="control-label mb-1" style="width: 150px">Chẩn đoán kết hợp/ <span class="text-primary">Associated diagnosis:</span></label>
                                                        <div class="d-inline-block align-top" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_associated_diagnosis" />
                                                            <div class="form-group" runat="server" id="associated_diagnosis_wrapper">
                                                                <aih:TextField runat="server" ID="txt_associated_diagnosis" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label mb-2">3. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                                    </legend>
                                                    <div class="col-md-12 mb-2">
                                                        <label class="control-label mb-1" style="width: 150px">Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                                        <div class="d-inline-block align-top" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_cur_med_history" />
                                                            <div runat="server" id="cur_med_history_wrapper">
                                                                <aih:TextField runat="server" ID="txt_cur_med_history" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 mb-2">
                                                        <label class="control-label mb-1" style="width: 150px">Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                                        <div class="d-inline-block align-top" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_ant_med_history" />
                                                            <div runat="server" id="ant_med_history_wrapper">
                                                                <aih:TextField runat="server" ID="txt_ant_med_history" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label mb-2">4. Dấu hiệu lâm sàng lúc nhập viện/ <span class="text-primary">Physical findings on admission:</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_physical_finding" />
                                                            <div runat="server" id="physical_finding_wrapper">
                                                                <aih:TextField runat="server" ID="txt_physical_finding" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label mb-2">5. Kết quả xét nghiệm/ <span class="text-primary">Laboratory investigation results:</span></label>
                                                    </legend>
                                                    <div class="col-md-12 mb-2">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_lab_result" />
                                                            <div runat="server" id="lab_result_wrapper">
                                                                <aih:TextField runat="server" ID="txt_lab_result" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 mb-2">
                                                        <label class="control-label mb-1" style="width: 150px">Giải phẫu bệnh/ <span class="text-primary">Pathology:</span></label>
                                                        <asp:Label runat="server" CssClass="align-top" ID="lbl_patho_result_desc" />
                                                        <div class="d-inline-block align-top" runat="server" id="patho_result_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input type="radio" runat="server" id="rad_patho_result_code_be" name="rad_patho_result_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_patho_result_code_be">Lành tính/ <span class="text-primary">Benign</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio  d-inline-block ml-2">
                                                                <input type="radio" runat="server" id="rad_patho_result_code_ma" name="rad_patho_result_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_patho_result_code_ma">Ác tính/ <span class="text-primary">Malignant</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input type="radio" runat="server" id="rad_patho_result_code_uc" name="rad_patho_result_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_patho_result_code_uc">Chưa xác định/ <span class="text-primary">Unconfirmed</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_patho_result_code" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare2" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label mb-2">6. Các quy trình đã được thực hiện/ <span class="text-primary">Procedures performed:</span></label>
                                                    </legend>

                                                    <div class="col-md-12">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_proce_performed" />
                                                            <div runat="server" id="proce_performed_wrapper">
                                                                <aih:TextField runat="server" ID="txt_proce_performed" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label mb-2">7. Điều trị trong quá trình nằm viện/ <span class="text-primary">Treatment during hospitalization:</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_treatment" />
                                                            <div runat="server" id="treatment_wrapper">
                                                                <aih:TextField runat="server" ID="txt_treatment" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label mb-2">8. Diễn tiến trong quá trình nằm viện/ <span class="text-primary">Evolution during hospitalization:</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_evolution" />
                                                            <div runat="server" id="evolution_wrapper">
                                                                <aih:TextField runat="server" ID="txt_evolution" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label mb-2">9. Tình trạng của bệnh nhân khi xuất viện/ <span class="text-primary">Patient’s condition on discharge:</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_disc_condition" />
                                                            <div runat="server" id="disc_condition_wrapper">
                                                                <aih:TextField runat="server" ID="txt_disc_condition" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2" runat="server" id="disc_medication_field">
                                                    <legend>
                                                        <label class="control-label mb-2">10. Thuốc khi xuất viện/ <span class="text-primary">Discharge medications:</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_disc_medication" />
                                                            <div runat="server" id="disc_medication_wrapper">
                                                                <aih:TextField runat="server" ID="txt_disc_medication" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2" runat="server" id="follow_up_field">
                                                    <legend>
                                                        <label class="control-label mb-2">11. Hướng dẫn theo dõi (ghi rõ các dấu hiệu cần tái khám ngay)/ <span class="text-primary">Follow-up instructions (signs and symptoms for immediate revisit):</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_follow_up_instruc" />
                                                            <div runat="server" id="follow_up_instruc_wrapper">
                                                                <aih:TextField runat="server" ID="txt_follow_up_instruc" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2" runat="server" id="special_diet_field">
                                                    <legend>
                                                        <label class="control-label mb-2">12. Chế độ ăn uống/ <span class="text-primary">Special Diet:</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_special_diet" />
                                                            <div runat="server" id="special_diet_wrapper">
                                                                <aih:TextField runat="server" ID="txt_special_diet" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2" runat="server" id="next_consultation_field">
                                                    <legend>
                                                        <label class="control-label mb-2">13. Ngày tái khám (ghi rõ ngày và tên Bác sĩ)/ <span class="text-primary">Next consultation (specify date and with whom):</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_next_consult_date" />
                                                            <span runat="server" id="next_consult_date_wrapper">
                                                                <telerik:RadDatePicker Width="120px" ID="dpk_next_consult_date" runat="server"></telerik:RadDatePicker>
                                                            </span>
                                                            <asp:Label runat="server" ID="lbl_next_consult_doctor" />
                                                            <div class="form-group d-inline-block w-n mb-2" runat="server" id="next_consult_doctor_wrapper">
                                                                <aih:TextField runat="server" ID="txt_next_consult_doctor" />
                                                            </div>

                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2 dama_field" runat="server" id="dama_field">
                                                    <legend>
                                                        <label class="control-label mb-2">10. Xuất viện trái với lời khuyên bác sỹ/ <span class="text-primary">Discharge against medical advice (DAMA):</span></label>
                                                    </legend>
                                                    <div class="col-md-12 mb-2">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_dama" />
                                                            <div runat="server" id="dama_wrapper">
                                                                <aih:TextField runat="server" ID="txt_dama" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 mb-2">
                                                        <label class="control-label mb-1" style="width: 150px">
                                                            Nếu có, nêu rõ lí do/ <span class="text-primary">If yes, specify the reason
            :</span></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label CssClass="align-top" runat="server" ID="lbl_dama_note" />
                                                            <div runat="server" id="dama_note_wrapper">
                                                                <aih:TextField runat="server" ID="txt_dama_note" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2" runat="server" id="transfer_field">
                                                    <legend>
                                                        <label class="control-label mb-2">11. Chuyển viện/ <span class="text-primary">Transfer to another hospital:</span></label>
                                                    </legend>
                                                    <div class="col-md-12 mb-2">
                                                        <label style="width: 150px"></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_trans_to_hospital" />
                                                            <div runat="server" id="trans_to_hospital_wrapper">
                                                                <aih:TextField runat="server" ID="txt_trans_to_hospital" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 mb-2">
                                                        <label class="control-label mb-1" style="width: 150px">
                                                            Nếu có, nêu rõ lí do/ <span class="text-primary">If yes, specify the reason
            :</span></label>
                                                        <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                            <asp:Label runat="server" ID="lbl_transfer_reason" />
                                                            <div runat="server" id="transfer_reason_wrapper">
                                                                <aih:TextField runat="server" ID="txt_transfer_reason" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <fieldset class="row mb-2">
                                                    <div class="col-md-12 mb-2">
                                                        <label class="control-label" style="width: 150px">Ngày/ <span class="text-primary">Date</span></label>
                                                        <asp:Label runat="server" ID="lbl_signed_date" />
                                                        <span runat="server" id="signed_date_wrapper">
                                                            <telerik:RadDatePicker Width="120px" ID="dpk_signed_date" runat="server"></telerik:RadDatePicker>
                                                        </span>

                                                    </div>

                                                    <div class="col-md-12">
                                                        <label class="control-label" style="width: 150px">Họ tên bác sỹ và mã số nhân viên/ <span class="text-primary">Doctor’s Name and ID</span></label>
                                                        <div class="d-inline-block w-n align-top">
                                                            <asp:Label runat="server" ID="lbl_signed_doctor" />
                                                            <div runat="server" id="signed_doctor_wrapper">
                                                                <aih:TextField runat="server" ID="txt_signed_doctor" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <div class="row mb-2">
                                                    <div class="col-md-12">
                                                        <div class="form-actions">
                                                            <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                                <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

                                                                <div data-toggle="modal" runat="server" data-target="#myModal" id="btnDeleteModal" class="btn btn-danger waves-effect">Delete</div>

                                                                <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                                <asp:LinkButton runat="server" OnClick="btnPrint_Click" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

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
                                                            <asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
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

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
        }

    </script>
</body>
</html>
