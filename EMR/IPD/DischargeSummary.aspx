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
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="aih" TagName="Line" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label1.ascx" TagPrefix="webUI" TagName="Label1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="aih" TagName="PatientLabel1" %>





<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <%--<link href="../../style/style-custom.css" rel="stylesheet" />--%>
</head>
<body>
    <div class="cssclsNoScreen" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
        <table class="report-container">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info" style="display: flex; align-items: center;">
                            <img width="180px" src="../images/AIH_PI_FULL.png" />
                            <div style="flex-grow: 1; text-align: center">
                                <div style="color: #007297; font-size: 20.6963px;">TÓM TẮT XUẤT VIỆN</div>
                                <div style="color: #e20e5a; font-size: 16.6667px;">DISCHARGE SUMMARY</div>
                            </div>
                            <aih:PatientLabel1 runat="server" ID="PatientLabel1" />
                        </div>
                        <aih:Line runat="server" ID="Line" />
                    </th>
                </tr>
            </thead>

            <tbody class="report-content">
                <tr>
                    <td class="report-content-cell">
                        <div class="main">
                            
                            <div class="d-grid grid-template-2">
                                <div>
                                    <webUI:Label runat="server" SubTitle="Day of visit" Title="Ngày nhập viện:" />
                                    <asp:Label runat="server" ID="prt_date_of_hospital" />
                                </div>
                                <div>
                                    <webUI:Label runat="server" SubTitle="Day of visit" Title="Ngày xuất viện:" />
                                    <asp:Label runat="server" ID="prt_date_of_discharge" />
                                </div>
                            </div>

                            <div class="d-grid grid-template-1">
                                <webUI:Label1 runat="server" SubTitle="Reason for admission" No="1." Title="Lý do nhập viện:" />
                                <asp:Label CssClass="align-top" runat="server" ID="prt_admission_reason" />
                            </div>

                            <div class="d-grid grid-template-1">
                                    <webUI:Label1 runat="server" ID="Label2" SubTitle="Diagnosis" No="2." Title="Chẩn đoán:" />
                                    <asp:Label runat="server" ID="prt_icd10_diagnosis" />
                                </div>

                            <div class="d-grid grid-template-1">
                                <webUI:Label1 runat="server" ID="Label4" SubTitle="Medical History" No="3." Title="Bệnh sử:" />
                                <asp:Label runat="server" ID="prt_cur_med_history" />
                            </div>

                            <div class="d-grid grid-template-1">
                                <webUI:Label1 runat="server" SubTitle="Physical findings on admission" No="4." Title="Khám lâm sàng:" />
                                <asp:Label runat="server" ID="prt_physical_finding" />
                            </div>

                            <div class="d-grid grid-template-1">
                                    <webUI:Label1 runat="server" ID="Label8" SubTitle="Laboratory investigation results" No="5." Title="Kết quả xét nghiệm:" />
                                    <asp:Label runat="server" ID="prt_lab_result" />
                            </div>

                            <div class="d-grid grid-template-1">
                                <webUI:Label1 runat="server" SubTitle="Procedures performed" No="6." Title="Các quy trình đã được thực hiện:" />
                                <asp:Label runat="server" ID="prt_proce_performed" />
                            </div>

                            <div class="d-grid grid-template-1">
                                    <webUI:Label1 runat="server" SubTitle="Treatment during hospitalization" No="7." Title="Điều trị trong quá trình nằm viện:" />
                                    <asp:Label runat="server" ID="prt_treatment" />
                                </div>

                            <div class="d-grid grid-template-1">
                                <webUI:Label1 runat="server"  SubTitle="Evolution during hospitalization" No="8." Title="Diễn tiến trong quá trình nằm viện:" />
                                <asp:Label runat="server" ID="prt_evolution" />
                            </div>

                            <div class="d-grid grid-template-1">
                                <webUI:Label1 runat="server" SubTitle="Patient’s condition on discharge" No="9." Title="Tình trạng của bệnh nhân khi xuất viện:" />
                                <asp:Label runat="server" ID="prt_disc_condition" />
                            </div>

                            <div class="d-grid grid-template-1">
                                <webUI:Label1 runat="server" SubTitle="Discharge medications" No="10." Title="Thuốc khi xuất viện:" />
                                <asp:Label runat="server" ID="prt_disc_medication" />
                            </div>

                            <div class="d-grid grid-template-1">
                                <webUI:Label1 runat="server" SubTitle="Follow-up instructions (signs and symptoms for immediate revisit)" No="11." Title="Hướng dẫn theo dõi (ghi rõ các dấu hiệu cần tái khám):" />
                                <asp:Label runat="server" ID="prt_follow_up_instruc" />
                            </div>

                            <div class="d-grid  grid-template-1">
                                <webUI:Label1 runat="server" No="12." SubTitle="Special diet" Title="Chế độ ăn uống:" />
                                <asp:Label runat="server" ID="prt_special_diet" />
                            </div>

                            <div class="d-grid grid-template-1">
                                <webUI:Label1 runat="server" SubTitle="Next consultation (specify date and with whom)" No="13." Title="Ngày tái khám (ghi rõ ngày và tên bác sỹ):" />
                                <asp:Label runat="server" ID="prt_next_consult" />
                            </div>

                            <div class="d-grid grid-template-2">
                                <div></div>
                                <webUI:Signature1 runat="server" id="Signature1" Title="Bác sỹ điều trị/ Attending Physician:" DateTime="Ngày/ Date: .........." />
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
            <div class="scroll-sidebar h-100 w-100">
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
                                                <input disabled-for="normal_field" type="radio" runat="server" id="rad_disc_reason_code_ama" name="rad_disc_reason_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_disc_reason_code_ama"><span class="text-primary">Normal</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                <input type="radio" runat="server" id="rad_disc_reason_code_dama" disabled-for="dama_field" name="rad_disc_reason_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_disc_reason_code_dama"><span class="text-primary">DAMA</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                <input type="radio" runat="server" id="rad_disc_reason_code_transfer" disabled-for="transfer_field" name="rad_disc_reason_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_disc_reason_code_transfer"><span class="text-primary">Transfer</span></label>
                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_disc_reason_code" onclick="clear_radiobutton(this)">
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

                                    <fieldset class="row mb-2 normal_field transfer_field">
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
                                                <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />
                                                <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                <asp:Button ID="btnPrint" OnClientClick="window.print()" CssClass="btn btn-secondary" runat="server" Text="Print" />
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
        console.log(document.querySelector("#RequiredFieldValidator").value, document.querySelector("#RequiredFieldValidator").value == true);

        if (document.querySelector("#RequiredFieldValidator").value) {
            if (!document.querySelector('input[name="rad_disc_reason_code"]:checked')) {
                document.querySelector("#rad_disc_reason_code_error").innerHTML = "Lý do xuất viện/ Discharge Reason is required.";
            }
        }
    </script>

</body>
</html>
