<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisCer.aspx.cs" Inherits="Emr_client.emr.DischargeCertificate" %>

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
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header bg-primary">
                            <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                <h4 class="m-b-0 text-white font-bold">Discharge certificate</h4>
                            </a>
                        </div>
                        <div class="card-body collapse show" id="collapseTwo">
                            <div class="form-body">
                                <div class="row mb-2">
                                    <div class="col-md-12 d-sm-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">KHOA /<span class="text-primary">DEPARTMENT:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox2" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 col-lg-6 mb-2 d-sm-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">Họ tên người bệnh /<span class="text-primary">Paitent's Name:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox4" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
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
                                                        <input type="radio" id="rad_gender1" name="rad_gender" class="custom-control-input"/>
                                                        <label class="custom-control-label" for="rad_gender1">Nam/ <span class="text-primary">Male</span></label>
                                                    </div>
                                                </div>
                                                <div class="col-6">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_gender2" name="rad_gender" class="custom-control-input"/>
                                                        <label class="custom-control-label" for="rad_gender2">Nữ/ <span class="text-primary">Female</span></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-md-6 mb-2 d-md-block d-lg-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">Dân tộc /<span class="text-primary">Nationality:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox3" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-md-6 mb-2 d-md-block d-lg-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">Nghề nghiệp /<span class="text-primary">Occupation:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox1" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12">
                                        <label class="control-label mb-1">BHYT /<span class="text-primary">Health Insurance:</span></label>
                                    </div>

                                    <div class="col-sm-6 col-md-4 col-lg-6 mb-2 d-lg-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">Giá trị từ/ <span class="text-primary">Valid from:</span></label>
                                        </div>
                                        <div class="form-group">
                                            <telerik:RadDatePicker RenderMode="Classic" ID="RadDatePicker1" runat="server"  ></telerik:RadDatePicker>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-md-4 col-lg-6 mb-2 d-lg-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">đến/ <span class="text-primary">to:</span></label>
                                        </div>
                                        <div class="form-group">
                                            <telerik:RadDatePicker RenderMode="Classic" ID="RadDatePicker4" runat="server"  ></telerik:RadDatePicker>
                                        </div>
                                    </div>

                                    <div class="col-sm-12 col-md-4 col-lg-6 mb-2 d-sm-flex d-md-block d-lg-flex d-xl-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">Số/ <span class="text-primary">No:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox6" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>
                                        
                                <div class="row mb-2">
                                    <div class="col-md-12 d-md-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">Địa chỉ/ <span class="text-primary">Address:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox5" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6 col-md-4 col-lg-6 mb-2 d-lg-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">Vào viện/ <span class="text-primary">Admitted time:</span></label>
                                        </div>
                                        <div class="form-group">
                                            <telerik:RadDatePicker RenderMode="Classic" ID="RadDatePicker3" runat="server"  ></telerik:RadDatePicker>
                                        </div>
                                    </div>

                                    <div class="col-sm-6 col-md-4 col-lg-6 mb-2 d-lg-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">Ra viện lúc/ <span class="text-primary">Discharged time:</span></label>
                                        </div>
                                        <div class="form-group">
                                            <telerik:RadDatePicker RenderMode="Classic" ID="RadDatePicker5" runat="server"  ></telerik:RadDatePicker>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12 d-md-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox7" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12 d-md-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">Phương pháp điều trị/ <span class="text-primary">Treatment:</span></label>                                                
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox8" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12 d-md-flex">
                                        <div class="w-sm-7">
                                            <label class="control-label mb-1">Ghi chú/ <span class="text-primary">Note:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox11" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-actions mb-3">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Complete</button>
                                    <button type="submit" class="btn btn-secondary"><i class="fa fa-check"></i> Save</button>
                                    <button type="button" class="btn btn-secondary">Revert</button>
                                    <button type="button" class="btn btn-secondary">Delete</button>
                                </div>

                                <div id="grid-info" class="alert alert-primary" style="position: fixed; top: 10px; right: 10px; display: none"></div>
                            </div>
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
    <script src="../../scripts/custom.min.js"></script>
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