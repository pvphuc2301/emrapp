<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicalCertificate.aspx.cs" Inherits="EMR.MedicalCertificate" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="Input" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/DateTime.ascx" TagPrefix="webUI" TagName="DateTime" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Medical Certificate</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info" style="display: flex; align-items: center;">
                                        <img width="180px" src="../images/AIH_PI_FULL.png" />
                                        <div style="flex-grow: 1; text-align: center">
                                            <div style="color: #007297; font-size: 20.6963px;">GIẤY CHỨNG NHẬN ĐIỀU TRỊ</div>
                                            <div style="color: #e20e5a; font-size: 16.6667px;">MEDICAL CERTIFICATE</div>
                                        </div>
                                        <div class="text-center" style="width: 175px;">
                                            <webUI:Barcode runat="server" ID="prt_barcode" Width="120" Height="22" />
                                            <asp:Label runat="server" ID="prt_vpid" CssClass="d-block" ></asp:Label>
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

                                        <webUI:PrtRowS1 FontBold="true" Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: 2fr 1fr">
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <webUI:PrtRowS1 FontBold="true" FixedWidth="155" Title="Họ tên bệnh nhân:" SubTitle="Patient's Name" runat="server" />
                                                <asp:Label runat="server" ID="prt_patient_name" />
                                            </div>

                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <webUI:PrtRowS1 FontBold="true" FixedWidth="95" Title="Ngày sinh:" SubTitle="DOB" runat="server" />
                                                <asp:Label runat="server" ID="prt_dob" />
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="155" Title="Giới tính:" SubTitle="Gender" runat="server" />
                                            <asp:Label runat="server" ID="prt_gender" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 2fr 1fr">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="155" Title="Khoa:" SubTitle="Dept" runat="server" />
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <webUI:PrtRowS1 FontBold="true" FixedWidth="95" Title="Mã BN:" SubTitle="Patient ID" runat="server" />
                                                <asp:Label runat="server" ID="prt_pid" />
                                            </div>

                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" Title="Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau:" SubTitle="Visited and received treatment at our hospital, with the following information" runat="server" />
                                        
                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="260" Title="Ngày khám bệnh:" SubTitle="Date of visit" runat="server" />
                                            <asp:Label runat="server" ID="prt_date_of_visit" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="260" Title="Lý do đến khám:" SubTitle="Chief complaint" runat="server" />
                                            <asp:Label runat="server" ID="prt_chief_complain" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="260" Title="Tóm tắt bệnh sử:" SubTitle="History of present illness" runat="server" />
                                            <asp:Label runat="server" ID="prt_history_present_illness" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="260" Title="Tiền sử bệnh:" SubTitle="Past history" runat="server" />
                                            <asp:Label runat="server" ID="prt_past_history" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="260" Title="Đặc điểm lâm sàng:" SubTitle="Clinical findings" runat="server" />
                                            <asp:Label runat="server" ID="prt_clinical_findings" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="260" Title="Cận lâm sàng được chỉ định:" SubTitle="Para-clinical investigations" runat="server" />
                                            <asp:Label runat="server" ID="prt_para_clinical_investigations" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="260" Title="Chẩn đoán:" SubTitle="Diagnosis" runat="server" />
                                            <asp:Label runat="server" ID="prt_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="260" Title="Phương pháp và thuốc điều trị:" SubTitle="Treatment and medications" runat="server" />
                                            <asp:Label runat="server" ID="prt_treatment" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="260" Title="Thời gian điều trị:" SubTitle="Treatment period" runat="server" />
                                            <asp:Label runat="server" ID="prt_treatment_period" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="260" Title="Lời khuyên và theo dõi:" SubTitle="Recommendation and Follow-up" runat="server" />
                                            <asp:Label runat="server" ID="prt_recommendation" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr; grid-gap: 5px">
                                            <div></div>
                                            <div class="text-center avoid-page-break">
                                                <div>Ngày/ <span class="text-primary">Date:</span> 08/06/2021</div>
                                                <div><span class="font-bold">BÁC SĨ ĐIỀU TRỊ</span></div>
                                                <div><span class="text-primary">ATTENDING DOCTOR</span></div>
                                                <div>(Họ tên, chữ ký & MSNV)</div>
                                                <div><span class="text-primary">(Full name, Signature & ID)</span></div>
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

                <div class="cssclsNoPrint" style="overflow: scroll; height: calc(100vh - 52px); overflow-x: hidden;">
                    <asp:Panel runat="server" ID="messagePlaceHolder">
                        <div class="card" runat="server" id="amendReasonWraper">
                            <div class="card-body">
                                <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span>
                                    <br />
                                    <span class="text-danger">* </span><small>Nội dung lý do thay đổi phải trên 3 ký tự</small></h5>
                                <div class="form-group mb-2">

                                    <asp:TextBox runat="server" ID="txt_amend_reason" CssClass="el-hide" />
                                    <div spellcheck="false" style="height: auto; text-align: left; display: inline-block;" class="form-control" id="DisplayControl" onblur="changeValue1(this, 'txt_amend_reason')" contenteditable='true' runat="server"></div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                        ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                    </asp:Panel>
                    <uc1:PatientInfo runat="server" ID="PatientInfo" />

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">Medical Certificate</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                </div>
                                <div class="card-body">
                                    <div class="form-body collapse show" id="collapseOne">
                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <div class="form-group" runat="server" id="chief_complain_wrapper">
                                                    <Input:TextField runat="server" ID="txt_chief_complain" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_chief_complain" />
                                            </div>
                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Tóm tắt bệnh sử/ <span class="text-primary">History of present illness:</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <div class="form-group" runat="server" id="history_present_illness_wrapper">
                                                    <Input:TextField runat="server" ID="txt_history_present_illness" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_history_present_illness" />
                                            </div>
                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Tiền sử bệnh/ <span class="text-primary">Past History:</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <div class="form-group" runat="server" id="past_history_wrapper">
                                                    <Input:TextField runat="server" ID="txt_past_history" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_past_history" />
                                            </div>
                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Đặc điểm lâm sàng/ <span class="text-primary">Clinical examination and findings:</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <div class="form-group" runat="server" id="clinical_findings_wrapper">
                                                    <Input:TextField runat="server" ID="txt_clinical_findings" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_clinical_findings" />
                                            </div>
                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Cận lâm sàng được chỉ định/ <span class="text-primary">Para-clinical Investigations:</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <div class="form-group" runat="server" id="para_clinical_investigations_wrapper">
                                                    <Input:TextField runat="server" ID="txt_para_clinical_investigations" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_para_clinical_investigations" />
                                            </div>
                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <div class="form-group" runat="server" id="diagnosis_wrapper">
                                                    <Input:TextField runat="server" ID="txt_diagnosis" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_diagnosis" />
                                            </div>
                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Phương pháp và thuốc điều trị/ <span class="text-primary">Treatment and medications:</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <div class="form-group" runat="server" id="treatment_wrapper">
                                                    <Input:TextField runat="server" ID="txt_treatment" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_treatment" />
                                            </div>
                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Thời gian điều trị/ <span class="text-primary">Treatment period:</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <div class="form-group" runat="server" id="treatment_period_wrapper">
                                                    <Input:TextField runat="server" ID="txt_treatment_period" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_treatment_period" />
                                            </div>
                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Lời khuyên và theo dõi/ <span class="text-primary">Recommendation & Follow-up:</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <div class="form-group" runat="server" id="recommendation_wrapper">
                                                    <Input:TextField runat="server" ID="txt_recommendation" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_recommendation" />
                                            </div>
                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label">Lịch điều trị/ <span class="text-primary">Treatment plan:</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <div class="form-group" runat="server" id="treatment_plan_wrapper">
                                                    <Input:TextField runat="server" ID="txt_treatment_plan" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_treatment_plan" />
                                            </div>
                                        </fieldset>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-actions">
                                                <button type="button" runat="server" id="btnComplete" validationgroup="Group1" onserverclick="btnComplete_Click" class="btn btn-primary waves-effect">
                                                    Complete
                                                </button>

                                                <button type="button" onserverclick="btnSave_Click" validationgroup="Group1" runat="server" id="btnSave" class="btn btn-primary waves-effect">
                                                    Save
                                                </button>

                                                <button type="button" data-toggle="modal" data-target="#myModal" id="btnDeleteModal" runat="server" class="btn btn-danger waves-effect">
                                                    Delete
                                                </button>

                                                <button onserverclick="btnAmend_Click" runat="server" id="btnAmend" class="btn btn-secondary waves-effect">
                                                    Amend
                                                </button>

                                                <button onserverclick="btnPrint_Click" id="btnPrint" runat="server" class="btn btn-secondary waves-effect">
                                                    Print
                                                </button>

                                                <button runat="server" onserverclick="btnCancel_Click" id="btnCancel" class="btn btn-secondary waves-effect">
                                                    Cancel
                                                </button>
                                            </div>
                                        </div>
                                    </div>


                                    <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                        <ModalBody>
                                            <div class="text-center">
                                                <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                <h4 class="mt-4 mb-4">Delete document?
                                                </h4>
                                            </div>
                                            <div class="text-right">
                                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                                <button type="button" onserverclick="btnDelete_Click" runat="server" id="btnDelete" class="btn btn-danger waves-effect">Delete</button>
                                            </div>
                                        </ModalBody>
                                    </webUI:PopupModal>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="Upd">
                    <ProgressTemplate>
                        <div class="slice">
                          <div data-loader="circle"></div>
                          <div>data-loader="circle"</div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnPrint" />
                <asp:AsyncPostBackTrigger ControlID="btnSave" />
                <asp:AsyncPostBackTrigger ControlID="btnAmend" />
                <asp:AsyncPostBackTrigger ControlID="btnCancel" />
                <asp:AsyncPostBackTrigger ControlID="btnComplete" />
            </Triggers>
        </asp:UpdatePanel>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>

    <script type="text/javascript">

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
        }

    </script>
</body>
</html>
