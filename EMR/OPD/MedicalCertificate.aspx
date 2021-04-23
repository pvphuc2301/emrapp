<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicalCertificate.aspx.cs" Inherits="EMR.MedicalCertificate" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="Input" TagName="TextField" %>

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
    </style>
    <script>
        function binding_data(display, input) {
            
            display.addEventListener('blur', function (e) {
                input.value = this.innerHTML;
            });
        }
    </script>
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
    <div class="scroll-sidebar h-100 w-100">
        
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
                        <form method="post" action="#" id="form1" runat="server">
                            <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
                            <div class="form-body collapse show" id="collapseOne">

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                        <div class="form-group">
                                            <Input:TextField runat="server" ID="txtChiefComplaint1" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Tóm tắt bệnh sử/ <span class="text-primary">History of present illness:</span></label>
                                        <div class="form-group">
                                            <Input:TextField runat="server" ID="txtPastHistory1" />
                                        </div>
                                    </div>
                                </div>

                                <button runat="server" id="btnGetValue" onserverclick="btnGetValue_ServerClick">get value</button>




                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau/ <span class="text-primary">Visited and received treatment at our hospital, with the following information</span>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                        <div class="form-group">
                                            <input id="txtChiefComplaint" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Tóm tắt bệnh sử/ <span class="text-primary">History of present illness:</span></label>
                                        <div class="form-group">
                                            <input id="txtHistoryPresentIllness" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Tiền sử bệnh/ <span class="text-primary">Past History:</span></label>
                                        <div class="form-group">
                                            <input id="txtPastHistory" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Đặc điểm lâm sàng/ <span class="text-primary">Clinical examination and findings:</span></label>
                                        <div class="form-group">
                                            <input id="txtClinicalFindings" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Cận lâm sàng được chỉ định/ <span class="text-primary">Para-clinical Investigations:</span></label>
                                        <div class="form-group">
                                            <input id="txtParaClinicalInvestigations" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                        <div class="form-group">
                                            <input id="txtDiagnosis" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Phương pháp và thuốc điều trị/ <span class="text-primary">Treatment and medications:</span></label>
                                        <div class="form-group">
                                            <input id="txtTreatment" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Thời gian điều trị/ <span class="text-primary">Treatment period:</span></label>
                                        <div class="form-group">
                                            <input id="txtTreatmentPeriod" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Lời khuyên và theo dõi/ <span class="text-primary">Recommendation & Follow-up:</span></label>
                                        <div class="form-group">
                                            <input id="txtRecommendation" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-12">
                                        <label class="control-label mb-1">Lịch điều trị/ <span class="text-primary">Treatment plan:</span></label>
                                        <div class="form-group">
                                            <input id="txtTreatmentPlan" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-actions mb-3">
                                    <button type="submit" id="btnComplete" class="btn btn-primary" onserverclick="btnComplete_ServerClick" runat="server">Complete</button>

                                    <button type="submit" id="btnSave" onserverclick="btnSave_ServerClick" class="btn btn-primary" runat="server">Save</button>

                                    <button onclick="return confirm('are you sure to delete?');" onserverclick="btnDelete_ServerClick" type="submit" id="btnDelete" class="btn btn-secondary" runat="server">Delete</button>

                                    <button type="submit" id="btnAmend" class="btn btn-secondary" runat="server" onserverclick="btnAmend_ServerClick">Amend</button>

                                    <button type="submit" id="btnPrint" class="btn btn-secondary" runat="server" onserverclick="btnPrint_ServerClick">Print</button>

                                    <button type="submit" id="btnCancel" class="btn btn-secondary" runat="server" onserverclick="btnCancel_ServerClick">Cancel</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ============================================================== -->
    <!-- Container fluid  -->
    <!-- ============================================================== -->

    <!-- ============================================================== -->
    <!-- End Container fluid  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->

    <script src="../scripts/sticky-affect.js"></script>
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>
</html>
