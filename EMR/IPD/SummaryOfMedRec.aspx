<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SummaryOfMedRec.aspx.cs" Inherits="EMR.SummaryOfMedicalReport" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>

<%@ Register Src="~/UserControls/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="aih" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="aih" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="aih" TagName="Signature" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    <webUI:PrintWindow runat="server" ID="PrintWindow">
        <PrintTitle>
            <div style="color: #007297; font-size: 26.6667px;">TÓM TẮT BỆNH ÁN</div>
            <div style="color: #e20e5a; font-size: 16.6667px;">SUMMARY OF MEDICAL REPORT</div>
        </PrintTitle>
        <PrintContent>

            <div class="row mb-2">
                <div class="col-6">
                    <aih:Label runat="server" Title="Từ ngày:" SubTitle="From" />
                    <div class="d-inline-block ml-2 align-top">21-02-2019</div>
                </div>
                <div class="col-6">
                    <aih:Label runat="server" Title="Đến ngày:" SubTitle="To" />
                    <div class="d-inline-block ml-2 align-top">23-02-2019</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <aih:Label runat="server" Title="Khoa:" SubTitle="Department" />
                    <div class="d-inline-block ml-2 align-top">Khoa khám bệnh</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <aih:Label runat="server" Title="Lý do nhập viện:" SubTitle="Chief complaint" />
                    <div class="d-inline-block ml-2 align-top">nnn</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <aih:Label runat="server" Title="Chẩn đoán" SubTitle="Diagnosis" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <span class="align-top h4">1. </span>
                    <aih:Label runat="server" Title="Diễn biến lâm sàng trong đợt điều trị:" SubTitle="Clinical Evolution" />
                    <div class="d-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <span class="align-top h4">2. </span>
                    <aih:Label runat="server" Title="KQ xét nghiệm cận lâm sàng:" SubTitle="Results of para clinical tests" />
                    <div class="d-block ml-2 align-top">afgwegHY</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <span class="align-top h4">3. </span>
                    <aih:Label runat="server" Title="Quá trình điều trị:" SubTitle="Treatment" />
                    <div class="d-block ml-2 align-top">nn</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <span class="align-top h4">4. </span>
                    <aih:Label runat="server" Title="Đánh giá kết quả:" SubTitle="Evaluation of treatment" />
                    <div class="d-inline-block ml-2 align-top">Uống thuốc</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <span class="align-top h4">5. </span>
                    <aih:Label runat="server" Title="Hướng dẫn điều trị tiếp và tiên lượng:" SubTitle="Continuous treatment and prognosis" />
                    <div class="d-inline-block ml-2 align-top">nn</div>
                </div>
            </div>
            <div class="row mb-2">
                <div class="col-6 mb-2">
                    <aih:Signature runat="server" Title="Trưởng khoa (ký và ghi rõ họ tên)" SubTitle="The Head of Department's signature and full name">
                        <ItemTemplate>
                            <aih:Date runat="server" Day="23" Month="5" Year="2021" />
                        </ItemTemplate>
                    </aih:Signature>
                </div>
                <div class="col-6 mb-2">
                    <aih:Signature runat="server" Title="Bác sĩ điều trị (ký và ghi rõ họ tên)" SubTitle="Physician's signature and full name">
                        <ItemTemplate>
                            <aih:Date runat="server" Day="23" Month="5" Year="2021" />
                        </ItemTemplate>
                    </aih:Signature>
                </div>
            </div>
        </PrintContent>
    </webUI:PrintWindow>

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
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="text-primary">SUMMARY OF MEDICAL REPORT</h4>
                            <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                        </div>
                        <div class="card-body collapse show" id="collapseOne">
                            <div class="form-body">
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mr-2">Từ ngày/ <span class="text-primary">From</span><span class="text-danger">*</span></label>
                                        <div class="d-inline-block">
                                            <telerik:RadDatePicker runat="server" ID="dpk_form_date" Width="120px" />
                                            <asp:RequiredFieldValidator runat="server" ID="dpk_form_date_required" ControlToValidate="dpk_form_date" CssClass="text-danger"
                                                ErrorMessage="Từ ngày/ From is required."></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mr-2">Đến ngày/ <span class="text-primary">To:</span><span class="text-danger">*</span><span class="text-danger"></span></label>
                                        <div class="d-inline-block">
                                            <telerik:RadDatePicker runat="server" ID="dpk_to_date" Width="120px" />
                                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="dpk_to_date" CssClass="text-danger"
                                                ErrorMessage="Đến ngày/ To is required."></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-2">Lý do nhập viện/ <span class="text-primary">Chief complaint:</span></label>
                                        <div class="form-group">
                                            <aih:TextField runat="server" ID="txt_chief_complaint" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-2">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                        <div class="form-group">
                                            <aih:TextField runat="server" ID="txt_diagnosis" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-2">1. Diễn biến lâm sàng trong đợt điều trị/ <span class="text-primary">Clinical Evolution:</span></label>
                                        <div class="form-group">
                                            <aih:TextField runat="server" ID="txt_clinical_evolution" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-2">2. KQ xét nghiệm cận lâm sàng/ <span class="text-primary">Results of para clinical tests:</span></label>
                                        <div class="form-group">
                                            <aih:TextField runat="server" ID="txt_result_para_clinical" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-2">3. Quá trình điều trị/ <span class="text-primary">Treatment:</span></label>
                                        <div class="form-group">
                                            <aih:TextField runat="server" ID="txt_treatment" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-2">4. Đánh giá kết quả/ <span class="text-primary">Evaluation of treatment:</span></label>
                                        <div class="form-group">
                                            <aih:TextField runat="server" ID="txt_eval_treatment" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-2">5. Hướng dẫn điều trị tiếp và tiên lượng/ <span class="text-primary">Continuous treatment and prognosis:</span></label>
                                        <div class="form-group">
                                            <aih:TextField runat="server" ID="txt_treatment_prognosis" />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-actions mb-3">
                                    <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                    <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>

                                    <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                    <asp:Button ID="btnPrint" OnClientClick="window.print()" CssClass="btn btn-secondary" runat="server" Text="Print" />

                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                </div>

                                <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                    <ModalBody>
                                        <div class="text-center">
                                            <icon:ExclamationTriangle cssClass="text-danger" Width="80" Height="80" runat="server" />
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
</body>
</html>


