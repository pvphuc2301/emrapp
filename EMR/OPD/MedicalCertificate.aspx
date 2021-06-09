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
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <style>
        .icheckbox {
                font-size: 20px;
                line-height: 20px;
                display: inline-block;
        }
    </style>
</head>
<body>
    <%--class="cssclsNoScreen"--%> 
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
                            <webUI:PatientLabel1 runat="server" ID="prt_patient_label" />
                        </div>
                        <webUI:Line runat="server" ID="Line" />
                    </th>
                </tr>
            </thead>

            <tbody class="report-content">
                <tr>
                    <td class="report-content-cell">
                        <div class="main">
                            
                            <webUI:PrtRowS1 Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT"  runat="server" />

                            <div class="d-grid" style="grid-template-columns: 2fr 1fr">
                                <webUI:PrtRowS1 FixedWidth="155" Title="Họ tên bệnh nhân:" SubTitle="Patient's Name"  runat="server" id="prt_patient_name"  />

                                <webUI:PrtRowS1 FixedWidth="95" Title="Ngày sinh:" SubTitle="DOB"  runat="server" id="prt_dob"  />
                            </div>
                            
                            
                            <webUI:PrtRowS2 FixedWidth="155" ID="prt_gender" Title="Giới tính:" SubTitle="Gender" TitleOption1="Nam<div class='text-primary'>Male</div>" TitleOption2="Nữ<div class='text-primary'>Female</div>" runat="server" />
                            
                            <div class="d-grid" style="grid-template-columns: 2fr 1fr">
                                <webUI:PrtRowS1 FixedWidth="155" Title="Khoa:" SubTitle="Dept"  runat="server" id="PrtRowS2"  />

                                <webUI:PrtRowS1 FixedWidth="95" Title="Mã BN:" SubTitle="Patient ID"  runat="server" id="prt_pid"  />

                            </div>

                            
                            <webUI:PrtRowS1 Title="Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau:" SubTitle="Visited and received treatment at our hospital, with the following information"  runat="server"  />

                            <webUI:PrtRowS1 FixedWidth="260" Title="Ngày khám bệnh:" SubTitle="Date of visit"  runat="server" id="prt_date_of_visit"  />

                            <webUI:PrtRowS1 FixedWidth="260" Title="Lý do đến khám:" SubTitle="Chief complaint"  runat="server" id="prt_chief_complain"  />

                            <webUI:PrtRowS1 FixedWidth="260" Title="Tóm tắt bệnh sử:" SubTitle="History of present illness"  runat="server" id="prt_history_present_illness"  />

                            <webUI:PrtRowS1 FixedWidth="260" Title="Tiền sử bệnh:" SubTitle="Past history"  runat="server" id="prt_past_history"  />

                            <webUI:PrtRowS1 FixedWidth="260" Title="Đặc điểm lâm sàng:" SubTitle="Clinical findings"  runat="server" id="prt_clinical_findings"  />

                            <webUI:PrtRowS1 FixedWidth="260" Title="Cận lâm sàng được chỉ định:" SubTitle="Para-clinical investigations"  runat="server" id="prt_para_clinical_investigations"  />

                            <webUI:PrtRowS1 FixedWidth="260" Title="Chẩn đoán:" SubTitle="Diagnosis"  runat="server" id="prt_diagnosis"  />

                            <webUI:PrtRowS1 FixedWidth="260" Title="Phương pháp và thuốc điều trị:" SubTitle="Treatment and medications"  runat="server" id="prt_treatment"  />

                             <webUI:PrtRowS1 FixedWidth="260" Title="Thời gian điều trị:" SubTitle="Treatment period"  runat="server" id="prt_treatment_period"  />

                            <webUI:PrtRowS1 FixedWidth="260" Title="Lời khuyên và theo dõi:" SubTitle="Recommendation and Follow-up"  runat="server" id="prt_recommendation"  />

                            <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                <div></div>
                                <webUI:Signature1 runat="server" id="prt_signature1"/>
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
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->


        <form method="post" action="#" id="form1" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
            <div class="scroll-sidebar h-100 w-100">
                <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <webUI:AmendReason runat="server" ID="txt_amend_reason" />
                        </asp:Panel>

                        <uc1:PatientInfo runat="server" ID="PatientInfo" />

                        <div class="row" style="margin-bottom: 50px;">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">Medical Certificate</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-body collapse show" id="collapseOne">
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau/ <span class="text-primary">Visited and received treatment at our hospital, with the following information</span>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1">Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" ID="txtChiefComplaint" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1">Tóm tắt bệnh sử/ <span class="text-primary">History of present illness:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" ID="txtHistoryPresentIllness" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1">Tiền sử bệnh/ <span class="text-primary">Past History:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" ID="txtPastHistory" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1">Đặc điểm lâm sàng/ <span class="text-primary">Clinical examination and findings:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" ID="txtClinicalFindings" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1">Cận lâm sàng được chỉ định/ <span class="text-primary">Para-clinical Investigations:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" ID="txtParaClinicalInvestigations" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" ID="txtDiagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1">Phương pháp và thuốc điều trị/ <span class="text-primary">Treatment and medications:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" ID="txtTreatment" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1">Thời gian điều trị/ <span class="text-primary">Treatment period:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" ID="txtTreatmentPeriod" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1">Lời khuyên và theo dõi/ <span class="text-primary">Recommendation & Follow-up:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" ID="txtRecommendation" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1">Lịch điều trị/ <span class="text-primary">Treatment plan:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" ID="txtTreatmentPlan" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <fieldset class="row mb-2">
                                                <div class="form-actions">
                                                    <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                                    <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>

                                                    <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                    <asp:Button OnClientClick="window.print()" ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />

                                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                                </div>
                                            </fieldset>
                                        
                                            <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                                <modalbody>
                                                <div class="text-center">
                                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                    <h4 class="mt-4 mb-4">Delete document?
                                                    </h4>
                                                </div>
                                                <div class="text-right">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <asp:Button runat="server" OnClick="btnDelete_Click" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                                </div>
                                            </modalbody>
                                            </webUI:PopupModal>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        <asp:PostBackTrigger ControlID="btnAmend" />
                        <asp:PostBackTrigger ControlID="btnCancel" />
                        <asp:PostBackTrigger ControlID="btnComplete" />
                    </Triggers>
                </asp:UpdatePanel>
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
