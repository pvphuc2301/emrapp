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

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />

</head>
<body>

    <div class="cssclsNoScreen">
        <table class="report-container" style="max-width: 992px; width: 100%; margin-top: 20px; margin-bottom: 100px;">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info" style="display: flex; align-items: center;">
                            <img width="200px" src="../images/AIH_PI_FULL.png" />
                            <div style="flex-grow: 1">
                                <div style="color: #007297; font-size: 26.6667px;">BỆNH ÁN NGOẠI TRÚ</div>
                                <div style="color: #e20e5a; font-size: 16.6667px;">OUTPATIENT MEDICAL RECORD</div>
                            </div>
                            <div style="font-size: 13.3333px">

                                <div style="width: 200px; text-align: center">
                              <%--      <div>
                                        <asp:Label ID="lbPatientName" runat="server"></asp:Label>
                                    </div>
                                    <div>
                                        <asp:Label ID="lbDoB" runat="server"></asp:Label>
                                    </div>--%>

                                    <webUI:Barcode runat="server" ID="Barcode" Text="900000488" Width="200" Height="40" />

                                    <div>
                                        <asp:Label class="font-bold" ID="lbPID" runat="server"></asp:Label>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div style="margin-bottom: 80px;">
                            <span style="width: 190px; border-bottom-style: solid; border-bottom-color: #e20e5a; border-bottom-width: 5px; display: inline-block; font-size: 26.6667px;"></span>
                            <span style="display: inline-block; border-bottom-style: solid; border-bottom-color: #007297; border-bottom-width: 5px; width: calc(100% - 191px); margin-left: -5px;"></span>
                        </div>
                    </th>
                </tr>
            </thead>

            <tbody class="report-content">
                <tr>
                    <td class="report-content-cell">
                        <div class="main">
                            <!-- Code printed here -->
                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT" />
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-6">
                                    <webUI:Label runat="server" Title="Họ tên bệnh nhân:" SubTitle="Patient's name" />
                                    <div class="d-inline-block ml-2 align-top">
                                    <asp:Label ID="lbPatientName" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>    
                                        
                                        </div>
                                </div>
                                <div class="col-6">
                                    <webUI:Label runat="server" Title="Ngày sinh:" SubTitle="DOB" />
                                    <div class="d-inline-block ml-2 align-top">
                                    <asp:Label ID="lbDoB" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>   
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Giới tính:" SubTitle="Gender" />
                                    
                                    <webUI:Label runat="server" Title="Nam" SubTitle="Male" />
                                    <asp:label ID="lbMan1" runat="server" class="d-inline-block ml-2 align-top mr-5">✕</asp:label>
                                    <asp:label ID="lbMan2" runat="server" class="d-inline-block ml-2 align-top mr-5">❏</asp:label>

                                    <webUI:Label runat="server" Title="Nữ " SubTitle="Female" />   
                                    <asp:label ID="lbWomen1" runat="server" class="d-inline-block ml-2 align-top">✕</asp:label>
                                    <asp:label ID="lbWomen2" runat="server" class="d-inline-block ml-2 align-top">❏</asp:label>

                                </div>
                            </div>
                           

                            <div class="row mb-2">
                                <div class="col-6">
                                    <webUI:Label runat="server" Title="Khoa:" SubTitle="Dept" />
                                    <div class="d-inline-block ml-2 align-top">
                                        Khoa khám bệnh
                                    </div>
                                </div>
                                <div class="col-6">
                                    <webUI:Label runat="server" Title="Mã BN:" SubTitle="Patient ID" />
                                    <div class="d-inline-block ml-2 align-top">
                                       <asp:Label ID="lbPID2" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau:" SubTitle="Visited and received treatment at our hospital, with the following information" />
                                    <div class="d-inline-block ml-2 align-top">

                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Ngày khám bệnh:" SubTitle="Date of visit" />
                                    <div class="d-inline-block ml-2 align-top">                                        
                                        <asp:Label ID="lbNgayKhamBenh" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Lý do đến khám:" SubTitle="Chief complaint" />
                                    <div class="d-inline-block ml-2 align-top">
                                        <asp:Label ID="lbChiefComplaint" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Tóm tắt bệnh sử:" SubTitle="History of present illness" />
                                    <div class="d-inline-block ml-2 align-top">
                                        <asp:Label ID="lbHistoryPresentIllness" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Tiền sử bệnh:" SubTitle="Past history" />
                                    <div class="d-inline-block ml-2 align-top">
                                        <asp:Label ID="lbPastHistory" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Đặc điểm lâm sàng:" SubTitle="Clinical findings" />
                                    <div class="d-inline-block ml-2 align-top">
                                        <asp:Label ID="lbClinicalFindings" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Cận lâm sàng được chỉ định:" SubTitle="Para-clinical investigations" />
                                    <div class="d-inline-block ml-2 align-top">
                                         <asp:Label ID="lbParaClinicalInvestigations" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Chẩn đoán:" SubTitle="Diagnosis" />
                                    <div class="d-inline-block ml-2 align-top">
                                        <asp:Label ID="lbDiagnosis" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Phương pháp và thuốc điều trị:" SubTitle="Treatment and medications" />
                                    <div class="d-inline-block ml-2 align-top">
                                       <asp:Label ID="lbTreatment" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>

                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Thời gian điều trị:" SubTitle="Treatment period" />
                                    <div class="d-inline-block ml-2 align-top">
                                        <asp:Label ID="lbTreatmentPeriod" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Lời khuyên và theo dõi:" SubTitle="Recommendation and Follow-up" />
                                    <div class="d-inline-block ml-2 align-top">
                                        <asp:Label ID="lbRecommendation" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                    </div>
                                </div>
                            </div>

                               <!-- Chu ky bac sy -->
                            <div class="row">
                                <div class="col-6">
                                </div>
                                <div class="col-6 mb-2">
                                    <div>
                                        <webUI:Signature runat="server" Day="23" Month="5" Year="2021" Title="BÁC SĨ ĐIỀU TRỊ" SubTitle="ATTENDING DOCTOR" FullName="Dr. Nguyen Dinh My" />

                                    </div>
                                </div>
                            </div>
                            <!--Het Chu ky bac sy -->

                        </div>
                    </td>
                </tr>
            </tbody>

            <tfoot class="report-footer">
                <tr>
                    <td class="report-footer-cell">
                        <img style="width: 100%" src="../images/bottomline.png" />
                        <div class="footer-info" style="display: flex; justify-content: space-between; width: 100%;">
                            <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                            <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Quận 2, Tp.HCM</div>
                            <div>Tel: 028 3910 9999</div>
                            <div>www.aih.com.vn</div>
                        </div>
                    </td>
                    <td class="report-footer-space" style="height: 100px;"></td>
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
                        <div id="AmendReasonPlaceHolder" runat="server"></div>

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

                                        <div class="form-actions mb-3">
                                            <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                            <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                            <asp:Button ID="btnDelete" data-target="#exampleModalCenter" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-danger" runat="server" Text="Delete" />

                                            <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                            <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" OnClientClick="window.print()" Text="Print" />

                                            <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                                        </div>

                                        <asp:UpdatePanel ID="updatePanelDeleteReason" runat="server" UpdateMode="Always">
                                            <ContentTemplate>
                                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLongTitle">Delete document</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p runat="server">Please provide reason for deletion</p>
                                                                <div class="form-group mb-2">
                                                                    <Input:TextField runat="server" ID="TextField1" />
                                                                </div>
                                                                <div id="Div1" class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button onserverclick="btnDelete_Click" class="btn btn-danger" runat="server">Delete</button>
                                                                <button id="btnClose" data-dismiss="modal" class="btn btn-secondary">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

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
