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
<%@ Register Src="~/UserControls/Message.ascx" TagPrefix="aih" TagName="Message" %>
<%@ Register Src="~/icons/X.ascx" TagPrefix="aih" TagName="X" %>
<%@ Register Src="~/UserControls/TextField1.ascx" TagPrefix="aih" TagName="TextField1" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="aih" TagName="PopupShowDelay" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info" style="display: flex; align-items: center;">
                                        <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>TÓM TẮT BỆNH ÁN</h4>
                                            <h5>SUMMARY OF MEDICAL REPORT</h5>
                                        </div>
                                        <div style="width: 175px;">
                                            <asp:Label CssClass="d-block" runat="server" ID="prt_fullname"></asp:Label>
                                            <asp:Label class="d-block" CssClass="d-block" runat="server" ID="prt_dob"></asp:Label>
                                            <webUI:Barcode runat="server" ID="prt_barcode" Width="120" Height="22" />
                                            <asp:Label runat="server" ID="prt_vpid" CssClass="d-block font-bold"></asp:Label>
                                        </div>
                                    </div>
                                    <webUI:Line runat="server" ID="Line" />
                                </th>
                            </tr>
                        </thead>
                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div class="main" runat="server" id="print_content">

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" FixedLeft="13" Title="Từ ngày/ " SubTitle="From:" runat="server" />
                                                <p>
                                                    <asp:Label runat="server" ID="prt_form_date"></asp:Label>
                                                </p>
                                            </div>

                                            <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" FixedLeft="13" Title="Đến ngày/ " SubTitle="To:" runat="server" />
                                                <p>
                                                    <asp:Label runat="server" ID="prt_to_date"></asp:Label>
                                                </p>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" FixedLeft="13" Title="Khoa/ " SubTitle="Department:" runat="server" />
                                            <p>

                                                <asp:Label runat="server" ID="prt_department"></asp:Label>
                                            </p>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="13" CssClass="text-inline" Title="Lý do nhập viện/ " SubTitle="Chief complaint:" runat="server" />
                                            <p>

                                                <asp:Label runat="server" ID="prt_chief_complaint"></asp:Label>
                                            </p>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" FixedLeft="13" Title="Chẩn đoán/ " SubTitle="Diagnosis:" runat="server" />
                                            <p>

                                                <asp:Label runat="server" ID="prt_diagnosis"></asp:Label>
                                            </p>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" Order="1." CssClass="text-inline" Title="Diễn biến lâm sàng trong đợt điều trị/ " SubTitle="Clinical Evolution:" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_clinical_evolution"></asp:Label>
                                        </p>

                                        <webUI:PrtRowS1 FontBold="true" Order="2." CssClass="text-inline" Title="KQ xét nghiệm cận lâm sàng/ " SubTitle="Results of para clinical tests:" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_result_para_clinical"></asp:Label>
                                        </p>

                                        <webUI:PrtRowS1 FontBold="true" Order="3." CssClass="text-inline" Title="Quá trình điều trị/ " SubTitle="Treatment:" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_treatment"></asp:Label>
                                        </p>

                                        <webUI:PrtRowS1 FontBold="true" Order="4." CssClass="text-inline" Title="Đánh giá kết quả/ " SubTitle="Evaluation of treatment:" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_eval_treatment"></asp:Label>
                                        </p>

                                        <webUI:PrtRowS1 FontBold="true" Order="5." CssClass="text-inline" Title="Hướng dẫn điều trị tiếp và tiên lượng/ " SubTitle="Continuous treatment and prognosis:" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_treatment_prognosis"></asp:Label>
                                        </p>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <div class="text-center" style="break-inside: avoid;">
                                                <div>Ngày/ Date: 16-06-2021</div>
                                                <div class="font-bold">Trưởng khoa (ký và ghi rõ họ tên)</div>
                                                <div class="text-primary">The Head of Department's signature and full name</div>
                                            </div>
                                            <div class="text-center" style="break-inside: avoid;">
                                                <div>Ngày/ Date: 16-06-2021</div>
                                                <div class="font-bold">Trưởng khoa (ký và ghi rõ họ tên)</div>
                                                <div class="text-primary">The Head of Department's signature and full name</div>
                                            </div>
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
                    <div style="overflow: scroll; height: calc(100vh - 52px); overflow-x: hidden;">

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

                            <asp:ValidationSummary
                                ID="valSum"
                                DisplayMode="BulletList"
                                CssClass="validationSummary"
                                runat="server" ValidationGroup="Group1"
                                HeaderText="Please complete the highlighted field(s)." />
                        </asp:Panel>
                        <uc1:PatientInfo runat="server" ID="PatientInfo1" />

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">SUMMARY OF MEDICAL REPORT</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">
                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label" style="width: 120px">Từ ngày/ <span class="text-primary">From</span><span class="text-danger">*</span></label>
                                                    <asp:Label runat="server" ID="lbl_form_date"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="form_date_wrapper">
                                                        <telerik:RadDatePicker runat="server" ID="dpk_form_date" Width="120px" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Group1" runat="server" ControlToValidate="dpk_form_date" ErrorMessage="Từ ngày/ From is required"
                                                            CssClass="text-danger" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label" style="width: 120px">Đến ngày/ <span class="text-primary">To:</span><span class="text-danger">*</span><span class="text-danger"></span></label>
                                                    <asp:Label runat="server" ID="lbl_to_date"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="to_date_wrapper">
                                                        <telerik:RadDatePicker runat="server" ID="dpk_to_date" Width="120px" />
                                                        <asp:RequiredFieldValidator ID="pass" runat="server" ControlToValidate="dpk_to_date" ValidationGroup="Group1" ErrorMessage="Đến ngày/ To is required"
                                                            CssClass="text-danger" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">

                                                    <label class="control-label mb-2 h5">Lý do nhập viện/ <span class="text-primary">Chief complaint:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_chief_complaint"></asp:Label>
                                                    <div class="form-group " runat="server" id="chief_complaint_wrapper">
                                                        <aih:TextField runat="server" ID="txt_chief_complaint" />

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_diagnosis"></asp:Label>
                                                    <div class="form-group " runat="server" id="diagnosis_wrapper">
                                                        <aih:TextField runat="server" ID="txt_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">1. Diễn biến lâm sàng trong đợt điều trị/ <span class="text-primary">Clinical Evolution:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_clinical_evolution"></asp:Label>
                                                    <div class="form-group " runat="server" id="clinical_evolution_wrapper">
                                                        <aih:TextField runat="server" ID="txt_clinical_evolution" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">2. KQ xét nghiệm cận lâm sàng/ <span class="text-primary">Results of para clinical tests:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_result_para_clinical"></asp:Label>
                                                    <div class="form-group " runat="server" id="result_para_clinical_wrapper">
                                                        <aih:TextField runat="server" ID="txt_result_para_clinical" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">3. Quá trình điều trị/ <span class="text-primary">Treatment:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_treatment"></asp:Label>
                                                    <div class="form-group " runat="server" id="treatment_wrapper">
                                                        <aih:TextField runat="server" ID="txt_treatment" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">4. Đánh giá kết quả/ <span class="text-primary">Evaluation of treatment:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_eval_treatment"></asp:Label>
                                                    <div class="form-group " runat="server" id="eval_treatment_wrapper">
                                                        <aih:TextField runat="server" ID="txt_eval_treatment" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">5. Hướng dẫn điều trị tiếp và tiên lượng/ <span class="text-primary">Continuous treatment and prognosis:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_treatment_prognosis"></asp:Label>
                                                    <div class="form-group " runat="server" id="treatment_prognosis_wrapper">
                                                        <aih:TextField runat="server" ID="txt_treatment_prognosis" />
                                                    </div>
                                                </div>
                                            </div>

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

                                            <aih:PopupShowDelay runat="server" ID="PopupShowDelay" />
                                        </div>
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


