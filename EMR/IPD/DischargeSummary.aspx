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

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <%--<link href="../../style/style-custom.css" rel="stylesheet" />--%>
    <style>
        * {
            scroll-behavior: smooth;
        }
    </style>
</head>
<body>
    <%--class="cssclsNoScreen"--%>
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
                                <div runat="server" id="prt_fullname" style="margin-left: 16px"></div> 
                                <div runat="server" id="prt_gender" style="margin-left: 16px"></div>
                                <div class="d-block" runat="server" id="prt_DOB" style="margin-left: 16px"></div> 
                                <div runat="server" id="prt_vpid" class="d-block" style="margin-left: 16px"></div>
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
                                <webUI:PrtRowS1  FontBold="true" FixedLeft="30" FixedWidth="120" Title="Ngày nhập viện" SubTitle="Day of visit"  runat="server" id="prt_date_of_hospital"  />

                                <webUI:PrtRowS1 FontBold="true" FixedLeft="30" FixedWidth="120" Title="Ngày xuất viện" SubTitle="Date of Discharge"  runat="server" id="prt_date_of_discharge"  />
                            </div>

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="1." Title="Lý do nhập viện:" SubTitle="Reason for admission"  runat="server" id="prt_admission_reason"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="2." Title="Chẩn đoán:" SubTitle="Diagnosis"  runat="server" id="prt_icd10_diagnosis"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="3." Title="Bệnh sử:" SubTitle="Medical History"  runat="server" id="prt_cur_med_history"  />

                        <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="4." Title="Khám lâm sàng:" SubTitle="Physical findings on admission"  runat="server" id="prt_physical_finding"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="5." Title="Kết quả xét nghiệm:" SubTitle="Laboratory investigation results"  runat="server" id="prt_lab_result"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="6." Title="Các quy trình đã được thực hiện:" SubTitle="Procedures performed"  runat="server" id="prt_proce_performed"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="7." Title="Điều trị trong quá trình nằm viện:" SubTitle="Treatment during hospitalization"  runat="server" id="prt_treatment"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="8." Title="Diễn tiến trong quá trình nằm viện:" SubTitle="Evolution during hospitalization"  runat="server" id="prt_evolution"  />

                            <webUI:PrtRowS1 FontBold="true"  FixedWidth="200" Order="9." Title="Tình trạng của bệnh nhân khi xuất viện:" SubTitle="Patient’s condition on discharge"  runat="server" id="prt_disc_condition"  />
                            
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="10." Title="Thuốc khi xuất viện:" SubTitle="Discharge medications"  runat="server" id="prt_disc_medication"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="10." Title="Xuất viện trái lời khuyên bác sỹ:" SubTitle="Discharge against medical advice(DAMA)"  runat="server" id="prt_dama"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="11." Title="Chuyển viện:" SubTitle="Transfer to another hospita"  runat="server" id="prt_trans_to_hospital"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" FixedLeft="30" Title="Nếu có, nêu rõ lý do:" SubTitle="If yes, specify the reaso"  runat="server" id="prt_transfer_reason"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="11." Title="Hướng dẫn theo dõi (ghi rõ các dấu hiệu cần tái khám):" SubTitle="Follow-up instructions (signs and symptoms for immediate revisit)"  runat="server" id="prt_follow_up_instruc"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="12." Title="Chế độ ăn uống:" SubTitle="Special diet"  runat="server" id="prt_special_diet"  />

                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="13." Title="Ngày tái khám (ghi rõ ngày và tên bác sỹ):" SubTitle="Next consultation (specify date and with whom):"  runat="server" id="prt_next_consult"  />

                            <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                <div></div>
                                <div style="break-inside: avoid;">
                                    <webUI:Signature1 runat="server" ID="prt_signature1" />
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

    <div class="cssclsNoPrint">
        <form method="post" action="#" id="form2" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
            <div class="h-100 w-100" id="form-content">
                <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                <asp:Panel runat="server" ID="messagePlaceHolder">
                    <aih:AmendReason runat="server" ID="txt_amendReason" />
                </asp:Panel>

                <uc1:PatientInfo runat="server" ID="PatientInfo1" />

                <div class="row">
                    <div class="col-md-12">
                        <div class="card mt-2">
                            <div class="card-header">
                                <h4 class="text-primary">Discharge Summary</h4>
                                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                            </div>
                            <div class="card-body collapse show" id="collapseOne">
                                <div class="form-body">

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Lý do xuất viện/ <span class="text-primary">Discharge Reason <span class="text-danger">*</span>:</span></label>
                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                <input onchange="document.getElementById('rad_disc_reason_code_error').innerHTML=''" disabled-for="normal_field" type="radio" runat="server" id="rad_disc_reason_code_ama" name="rad_disc_reason_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_disc_reason_code_ama"><span class="text-primary">Normal</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                <input onchange="document.getElementById('rad_disc_reason_code_error').innerHTML=''" type="radio" runat="server" id="rad_disc_reason_code_dama" disabled-for="dama_field" name="rad_disc_reason_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_disc_reason_code_dama"><span class="text-primary">DAMA</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                <input onchange="document.getElementById('rad_disc_reason_code_error').innerHTML=''" type="radio" runat="server" id="rad_disc_reason_code_transfer" disabled-for="transfer_field" name="rad_disc_reason_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_disc_reason_code_transfer"><span class="text-primary">Transfer</span></label>
                                                <a href="javascript:void(0)" data-clear="rad_disc_reason_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare38" />
                                                </a>
                                            </div>
                                            <div id="rad_disc_reason_code_error" class="text-danger"></div>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Ngày nhập viện/ <span class="text-primary">Date of hospitalization:</span></label>
                                            <div class="d-inline-block ml-2">
                                                <telerik:RadDatePicker runat="server" ID="dpk_date_of_hospital" Width="120px" />
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Ngày xuất viện/ <span class="text-primary">Date of discharge:</span></label>
                                            <div class="d-inline-block ml-2">
                                                <telerik:RadDatePicker runat="server" ID="dpk_date_of_discharge" Width="120px" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">1. Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                        </legend>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_admission_reason" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">2. Chẩn đoán chính/ <span class="text-primary">Main diagnosis:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Phân loại bệnh theo ICD-10/ <span class="text-primary">ICD-10 Code:</span></label>
                                            <aih:TextField runat="server" ID="txt_icd10_diagnosis" />
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Chẩn đoán kết hợp/ <span class="text-primary">Associated diagnosis:</span></label>
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_associated_diagnosis" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">3. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_cur_med_history" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_ant_med_history" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">4. Dấu hiệu lâm sàng lúc nhập viện/ <span class="text-primary">Physical findings on admission:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_physical_finding" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">5. Kết quả xét nghiệm/ <span class="text-primary">Laboratory investigation results:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_lab_result" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Giải phẫu bệnh/ <span class="text-primary">Pathology:</span></label>
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
                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_patho_result_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare2" />
                                                </a>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">6. Các quy trình đã được thực hiện/ <span class="text-primary">Procedures performed:</span></label>
                                        </legend>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_proce_performed" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">7. Điều trị trong quá trình nằm viện/ <span class="text-primary">Treatment during hospitalization:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_treatment" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">8. Diễn tiến trong quá trình nằm viện/ <span class="text-primary">Evolution during hospitalization:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_evolution" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">9. Tình trạng của bệnh nhân khi xuất viện/ <span class="text-primary">Patient’s condition on discharge:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_disc_condition" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">10. Thuốc khi xuất viện/ <span class="text-primary">Discharge medications:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <aih:TextField runat="server" ID="txt_disc_medication" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 normal_field">
                                        <legend>
                                            <label class="control-label mb-2">11. Hướng dẫn theo dõi (ghi rõ các dấu hiệu cần tái khám ngay)/ <span class="text-primary">Follow-up instructions (signs and symptoms for immediate revisit):</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <aih:TextField runat="server" ID="txt_follow_up_instruc" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 normal_field">
                                        <legend>
                                            <label class="control-label mb-2">12. Chế độ ăn uống/ <span class="text-primary">Special Diet:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <aih:TextField runat="server" ID="txt_special_diet" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 normal_field">
                                        <legend>
                                            <label class="control-label mb-2">13. Ngày tái khám (ghi rõ ngày và tên Bác sĩ)/ <span class="text-primary">Next consultation (specify date and with whom):</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="d-inline-block mb-2 mr-2">
                                                <telerik:RadDatePicker Width="120px" ID="dpk_next_consult_date" runat="server"></telerik:RadDatePicker>
                                            </div>

                                            <div class="form-group d-inline-block w-n mb-2">
                                                <aih:TextField runat="server" ID="txt_next_consult_doctor" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 dama_field">
                                        <legend>
                                            <label class="control-label mb-2">10. Xuất viện trái với lời khuyên bác sỹ/ <span class="text-primary">Discharge against medical advice (DAMA):</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <aih:TextField runat="server" ID="txt_dama" />
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">
                                                Nếu có, nêu rõ lí do/ <span class="text-primary">If yes, specify the reason
:</span></label>
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_dama_note" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 transfer_field">
                                        <legend>
                                            <label class="control-label mb-2">11. Chuyển viện/ <span class="text-primary">Transfer to another hospital:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_trans_to_hospital" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">
                                                Nếu có, nêu rõ lí do/ <span class="text-primary">If yes, specify the reason
:</span></label>
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_transfer_reason" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 mr-2 mb-2">Ngày/ <span class="text-primary">Date</span></label>
                                            <div class="d-inline-block mb-2">
                                                <telerik:RadDatePicker Width="120px" ID="dpk_signed_date" runat="server"></telerik:RadDatePicker>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-1 mr-2 mb-2">Họ tên bác sỹ và mã số nhân viên/ <span class="text-primary">Doctor’s Name and ID</span></label>
                                            <div class="form-group d-inline-block w-n mb-2">
                                                <aih:TextField runat="server" ID="txt_signed_doctor" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-actions">
                                                <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />
                                                <asp:Button ID="btnSave" OnClick="btnSave_Click" OnClientClick="JavaScript:return validateForm()" class="btn btn-primary" runat="server" Text="Save" />
                                                <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                <asp:Button ID="btnPrint" OnClientClick="window.print();return false;" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                        <ModalBody>
                                            <div class="text-center">
                                                <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                <h4 class="mt-4 mb-4">Delete document?
                                                </h4>
                                            </div>
                                            <div class="text-right">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <asp:Button runat="server" OnClick="btnDelete_Click" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                            </div>
                                        </ModalBody>
                                    </webUI:PopupModal>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

    </div>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>

    <script>

        function validateForm() {
            disc_reason = document.querySelector("input[type='radio'][name='rad_disc_reason_code']:checked");
            if (!disc_reason) {
                document.querySelector("#rad_disc_reason_code_error").innerHTML = "Lý do xuất viện/ Discharge Reason is required.";
                
                document.getElementById('rad_disc_reason_code_error').scrollIntoView();
            }

            return false;
        }

    </script>

</body>
</html>
