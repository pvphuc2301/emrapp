<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SummaryOfMedRec.aspx.cs" Inherits="EMR.SummaryOfMedicalReport" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>

<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="aih" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label1.ascx" TagPrefix="webUI" TagName="Label1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    <%----%>
    <div class="cssclsNoScreen">
        <table class="report-container">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info" style="display: flex; align-items: center;">
                            <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                            <div style="flex-grow: 1; text-align: center;">
                                <div style="color: #007297; font-size: 26.6667px;">TÓM TẮT BỆNH ÁN</div>
                                <div style="color: #e20e5a; font-size: 16.6667px;">SUMMARY OF MEDICAL REPORT</div>
                            </div>
                            <webUI:PatientLabel1 runat="server" id="prt_patient_label1" />
                        </div>
                        <webUI:Line runat="server" id="Line" />
                    </th>
                </tr>
            </thead>
            <tbody class="report-content">
                <tr>
                    <td class="report-content-cell">
                        <div class="main" runat="server" id="print_content">

                            <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                <webUI:PrtRowS1  CssClass="text-inline" FixedLeft="30" Title="Từ ngày/ " SubTitle="From:" runat="server" id="prt_form_date"  />

                                <webUI:PrtRowS1  CssClass="text-inline" FixedLeft="30" Title="Đến ngày/ " SubTitle="To:" runat="server" id="prt_to_date"  />
                            </div>

                            <webUI:PrtRowS1  CssClass="text-inline" FixedLeft="30" Title="Khoa/ " SubTitle="Department:" runat="server" id="PrtRowS1"  />

                            <webUI:PrtRowS1 FixedLeft="30" CssClass="text-inline"  Title="Lý do nhập viện/ " SubTitle="Chief complaint:" runat="server" id="prt_chief_complaint"  />

                            <webUI:PrtRowS1  CssClass="text-inline" FixedLeft="30" Title="Chẩn đoán/ " SubTitle="Diagnosis:" runat="server" id="prt_diagnosis"  />

                            <webUI:PrtRowS1 Order="1."  CssClass="text-inline"  Title="Diễn biến lâm sàng trong đợt điều trị/ " SubTitle="Clinical Evolution:" runat="server" id="prt_clinical_evolution"  />

                            <webUI:PrtRowS1 Order="2."  CssClass="text-inline"  Title="KQ xét nghiệm cận lâm sàng/ " SubTitle="Results of para clinical tests:" runat="server" id="prt_result_para_clinical"  />

                            <webUI:PrtRowS1 Order="3."  CssClass="text-inline"  Title="Quá trình điều trị/ " SubTitle="Treatment:" runat="server" id="prt_treatment"  />

                            <webUI:PrtRowS1 Order="4."  CssClass="text-inline"  Title="Đánh giá kết quả/ " SubTitle="Evaluation of treatment:" runat="server" id="prt_eval_treatment"  />

                            <webUI:PrtRowS1 Order="5."  CssClass="text-inline"  Title="Hướng dẫn điều trị tiếp và tiên lượng/ " SubTitle="Continuous treatment and prognosis:" runat="server" id="prt_treatment_prognosis"  />

                            <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                <webUI:Signature1 runat="server" ID="prt_signature1" />
                                <webUI:Signature1 runat="server" ID="prt_signature2" />
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
                                                <span class="text-danger el-hide" id="dpk_form_date_error">Từ ngày/ From is required</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mr-2">Đến ngày/ <span class="text-primary">To:</span><span class="text-danger">*</span><span class="text-danger"></span></label>
                                            <div class="d-inline-block">
                                                <telerik:RadDatePicker runat="server" ID="dpk_to_date" Width="120px" />
                                                <span class="text-danger el-hide" id="dpk_to_date_error">Đến ngày/ To is required</span>
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
                                                <icon:ExclamationTriangle Size="80" runat="server" ID="ExclamationTriangle" />
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
    <script src="../scripts/checkValidFields.js"></script>

</body>
</html>


