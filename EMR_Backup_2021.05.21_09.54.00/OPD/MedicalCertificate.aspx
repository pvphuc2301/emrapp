<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicalCertificate.aspx.cs" Inherits="EMR.MedicalCertificate" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="Input" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <style>
        .alert {
            display: flex;
            align-items: center;
        }

        #MessagePlaceHolder {
            left: 0;
            right: 0;
        }
    </style>
</head>
<body>

    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">AIH Hospital</p>
        </div>
    </div>

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

                                        <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" OnClick="btnPrint_Click" Text="Print" />

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


    <script>
        let alertBox = document.getElementById("MessagePlaceHolder");

        setTimeout(function () {
            alertBox.style.top = "0";
        }, 2000);

        //setTimeout(function () {
        //    alertBox.innerHTML = "";
        //}, 3000);

    </script>
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>
</html>
