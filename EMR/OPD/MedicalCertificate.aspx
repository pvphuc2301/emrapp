<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicalCertificate.aspx.cs" Inherits="Emr_client.emr.MedicalCertificate" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
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
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-primary">
                                <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                    <h4 class="m-b-0 text-white font-bold">Medical Certificate</h4>
                                </a>
                            </div>
                            <div class="card-body">
                                <form action="#">
                                    <div class="form-body collapse show" id="collapseTwo">
                                        <div class="row">
                                            <div class="col-md-12 col-lg-6 mb-2 d-sm-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">Họ tên người bệnh /<span class="text-primary">Paitent's Name:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox34" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 col-lg-6 mb-2 d-md-block d-lg-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">Ngày tháng năm sinh /<span class="text-primary">DOB:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <telerik:RadDatePicker RenderMode="Classic" Width="150px" ID="RadDatePicker2" runat="server"></telerik:RadDatePicker>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 col-lg-6 mb-2 d-md-block d-lg-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">Giới tính /<span class="text-primary">Gender:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" id="rad_gender1" name="rad_gender" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_gender1">Nam/ <span class="text-primary">Male</span></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="custom-control custom-radio">
                                                                <input type="radio" id="rad_gender2" name="rad_gender" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_gender2">Nữ/ <span class="text-primary">Female</span></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-12 col-md-4 col-lg-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">Mã số người bệnh/ <span class="text-primary">PID:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox35" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>

                                            <div class="col-12 mb-2 d-sm-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">Khoa /<span class="text-primary">Dept:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox1" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                            

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau/ <span class="text-primary">Visited and received treatment at our hospital, with the following information</span>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12 mb-2 d-sm-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">1. Ngày khám bệnh/ <span class="text-primary">Date of visit:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <telerik:RadDatePicker RenderMode="Classic" Width="150px" ID="RadDatePicker1" runat="server"></telerik:RadDatePicker>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">2. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox4" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">3. Tóm tắt bệnh sử/ <span class="text-primary">History of present illness:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox5" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">4. Tiền sử bệnh/ <span class="text-primary">Past History:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox6" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">5. Đặc điểm lâm sàng/ <span class="text-primary">Clinical examination and findings:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox7" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">6. Cận lâm sàng được chỉ định/ <span class="text-primary">Para-clinical Investigations:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox8" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">7. Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox9" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">8. Phương pháp và thuốc điều trị/ <span class="text-primary">Treatment and medications:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox10" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">9. Thời gian điều trị/ <span class="text-primary">Treatment period:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox11" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">10. Lời khuyên và theo dõi/ <span class="text-primary">Recommendation & Follow-up:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox12" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-actions mb-3">
                                        <button type="submit" class="btn btn-primary mb-2"><i class="fa fa-check"></i>Complete</button>
                                        <button type="submit" class="btn btn-primary mb-2"><i class="fa fa-check"></i>Save</button>
                                        <button type="button" class="btn btn-secondary mb-2">Revert</button>
                                        <button type="button" class="btn btn-secondary mb-2">Delete</button>
                                    </div>

                                    <div id="grid-info" class="alert alert-primary" style="position: fixed; top: 10px; right: 10px; display: none"></div>
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

    </form>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/popper.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.js"></script>
    <script src="../../scripts/myScript.js"></script>
    
    <script>
        showGridDetail();

        function showGridDetail() {
            document.getElementById("grid-info").style.display = "block";
            getGridDetail();
            window.addEventListener("resize", getGridDetail);
        }

        function getGridDetail() {
            var width = window.innerWidth;
            var range;
            let col;

            if (width < 576) { range = "0-575"; col = "xs"; }
            else if (width < 768) { range = "576-767"; col = "sm"; }
            else if (width < 992) { range = "768-991"; col = "md"; }
            else if (width < 1200) { range = "992-1199"; col = "lg"; }
            else { range = "> 1200"; col = "xl"; }

            document.getElementById("grid-info").innerHTML = "size: " + window.innerWidth + "<br>" + "range: " + range + "<br>" + "grid system: " + " [col-" + col + "]";

        }
    </script>
</body>
</html>
