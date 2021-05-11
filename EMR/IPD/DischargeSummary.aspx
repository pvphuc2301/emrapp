<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DischargeSummary.aspx.cs" Inherits="EMR.DischargeSummary" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <aih:AmendReason runat="server" ID="txt_amendReason" />

                    <uc1:PatientInfo runat="server" ID="PatientInfo1" />

                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">Discharge Summary</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Lý do xuất viện/ <span class="text-primary">Discharge Reason <span class="text-danger">*</span>:</span></label>
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="normal_field" type="radio" runat="server" id="rad_disc_reason_code_ama" name="rad_disc_reason_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_disc_reason_code_ama"><span class="text-primary">Normal</span></label>
                                                </div>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_disc_reason_code_dama" disabled-for="dama_field" name="rad_disc_reason_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_disc_reason_code_dama"><span class="text-primary">DAMA</span></label>
                                                </div>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_disc_reason_code_transfer" disabled-for="transfer_field" name="rad_disc_reason_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_disc_reason_code_transfer"><span class="text-primary">Transfer</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row" style="border: 1px solid #ddd;border-radius: 4px;">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">Ngày nhập viện/ <span class="text-primary">Date of hospitalization:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker RenderMode="Classic" ID="dpk_date_of_hospital" runat="server"></telerik:RadDatePicker>
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">Ngày xuất viện/ <span class="text-primary">Date of discharge:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker RenderMode="Classic" ID="dpk_date_of_discharge" runat="server"></telerik:RadDatePicker>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">1. Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_admission_reason" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3" style="border: 1px solid #ddd;border-radius: 4px;">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">2. Chẩn đoán chính/ <span class="text-primary">Main diagnosis:</span></label>
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <label class="control-label mb-1">Phân loại bệnh theo ICD-10/ <span class="text-primary">ICD-10 Code:</span></label>
                                                <aih:TextField runat="server" ID="txt_icd10_diagnosis" />
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <label class="control-label mb-1">Chẩn đoán kết hợp/ <span class="text-primary">Associated diagnosis:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_associated_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3" style="border: 1px solid #ddd;border-radius: 4px;">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">3. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                            </div>
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
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">4. Dấu hiệu lâm sàng lúc nhập viện/ <span class="text-primary">Physical findings on admission:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_physical_finding" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2"  style="border: 1px solid #ddd;border-radius: 4px;">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">5. Kết quả xét nghiệm/ <span class="text-primary">Laboratory investigation results:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_lab_result" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">Giải phẫu bệnh/ <span class="text-primary">Pathology:</span></label>

                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_patho_result_code_be" name="rad_patho_result_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_patho_result_code_be">Lành tính/ <span class="text-primary">Benign</span></label>
                                                </div>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_patho_result_code_ma" name="rad_patho_result_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_patho_result_code_ma">Ác tính/ <span class="text-primary">Malignant</span></label>
                                                </div>
                                                <div class="custom-control custom-radio mb-2">
                                                    <input type="radio" runat="server" id="rad_patho_result_code_uc" name="rad_patho_result_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_patho_result_code_uc">Chưa xác định/ <span class="text-primary">Unconfirmed</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">6. Các quy trình đã được thực hiện/ <span class="text-primary">Procedures performed:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_proce_performed" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">7. Điều trị trong quá trình nằm viện/ <span class="text-primary">Treatment during hospitalization:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_treatment" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">8. Diễn tiến trong quá trình nằm viện/ <span class="text-primary">Evolution during hospitalization:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_evolution" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">9. Tình trạng của bệnh nhân khi xuất viện/ <span class="text-primary">Patient’s condition on discharge:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_disc_condition" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3 normal_field transfer_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">10. Thuốc khi xuất viện/ <span class="text-primary">Discharge medications:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_disc_medication" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3 normal_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">11. Hướng dẫn theo dõi (ghi rõ các dấu hiệu cần tái khám ngay)/ <span class="text-primary">Follow-up instructions (signs and symptoms for immediate revisit):</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_follow_up_instruc" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3 normal_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">12. Chế độ ăn uống/ <span class="text-primary">Special Diet:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_special_diet" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 normal_field" style="border: 1px solid #ddd;border-radius: 4px;">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">13. Ngày tái khám (ghi rõ ngày và tên Bác sĩ)/ <span class="text-primary">Next consultation (specify date and with whom):</span></label>
                                                </div>
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Ngày/ <span class="text-primary">Date</span></label>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker RenderMode="Classic" ID="dpk_next_consult_date" runat="server"></telerik:RadDatePicker>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Họ tên bác sỹ và mã số nhân viên/ <span class="text-primary">Doctor’s Name and ID</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_next_consult_doctor" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 dama_field" style="border: 1px solid #ddd; border-radius: 4px;">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">10. Xuất viện trái với lời khuyên bác sỹ/ <span class="text-primary">Discharge against medical advice (DAMA):</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_dama" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">Nếu có, nêu rõ lí do/ <span class="text-primary">If yes, specify the reason
:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_dama_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 transfer_field" style="border: 1px solid #ddd;border-radius: 4px;">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">11. Chuyển viện/ <span class="text-primary">Transfer to another hospital:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_trans_to_hospital" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">Nếu có, nêu rõ lí do/ <span class="text-primary">If yes, specify the reason
:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_transfer_reason" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2" style="border: 1px solid #ddd;border-radius: 4px;">
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Ngày/ <span class="text-primary">Date</span></label>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker RenderMode="Classic" ID="dpk_signed_date" runat="server"></telerik:RadDatePicker>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Họ tên bác sỹ và mã số nhân viên/ <span class="text-primary">Doctor’s Name and ID</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_signed_doctor" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-actions mb-3">
                                            <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                            <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                            <asp:Button ID="btnDeleteModal" data-toggle="modal" data-target="#deleteDocumentModal" class="btn btn-danger" runat="server" Text="Delete" />

                                            <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                            <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />

                                            <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />

                                            <div runat="server" id="messagePlaceHolder"></div>
                                        </div>

                                        <div class="modal fade" id="deleteDocumentModal" tabindex="-1" role="dialog" aria-labelledby="deleteDocumentModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="deleteDocumentModalLabel">Delete document</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p runat="server">Please provide reason for deletion</p>
                                                        <div class="form-group mb-2">
                                                            <aih:TextField runat="server" ID="TextField1" />
                                                        </div>
                                                        <div class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <asp:Button runat="server" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnAmend" />
                    <asp:PostBackTrigger ControlID="btnCancel" />
                    <%--<asp:PostBackTrigger ControlID="btnSave" />
                    <asp:PostBackTrigger ControlID="btnComplete" />--%>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>

</body>
</html>
