<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SummaryOfMedRec.aspx.cs" Inherits="EMR.SummaryOfMedicalReport" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/base.css" rel="stylesheet" />
    <link href="../styles/default.css" rel="stylesheet" />
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../style/style-custom.css" rel="stylesheet" />
    <script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
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
            <div class="container-fluid pb-5">

                <!-- Row -->
                <div class="row">
                    <div class="col-lg-12" id="accordionExample">
                        <div class="card">
                            <div class="card-header bg-primary">
                                <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <h4 class="m-b-0 text-white font-bold">Patient details</h4>
                                </a>
                            </div>
                            <div class="card-body collapse show" id="collapseOne" aria-labelledby="headingOne">
                                <form class="form-horizontal" role="form">
                                    <div class="form-body">
                                        <h4 class="box-title font-bold">Person Info</h4>
                                        <hr class="m-t-0 m-b-40">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">First Name:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">John </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Last Name:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">Doe </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Gender:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">Male </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Date of Birth:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">11/06/1987 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Contact Person:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Relationship:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Address:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">19/1 Phan Tây Hồ,P.7, Quận Phú Nhuận, Tp. HCM, Việt Nam </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/row-->
                                        <!--/row-->
                                        <h4 class="box-title font-bold">Visit Details</h4>
                                        <hr class="m-t-0 m-b-40">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Encounter:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">OPD 8536 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-3">Admit Date:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">15-05-2019 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->

                <!-- Row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-primary">
                                <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                    <h4 class="m-b-0 text-white font-bold">SUMMARY OF MEDICAL REPORT</h4>
                                </a>
                            </div>
                            <div class="card-body collapse show" id="collapseTwo">
                                <form action="#" class="form-horizontal form-bordered">
                                    <div class="form-body mb-4">

                                        <div class="row">
                                            <div class="col-sm-6 mb-2">
                                                <div class="position-relative">
                                                    <span class="prepend-text">từ ngày/ <span class="text-primary">from</span></span><input style="padding-left: 70px" type="date" class="form-control text-right">
                                                </div>
                                            </div>

                                            <div class="col-sm-6 mb-2">
                                                <div class="position-relative">
                                                    <span class="prepend-text">đến ngày/ <span class="text-primary">to</span></span><input style="padding-left: 70px" type="date" class="form-control text-right">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2">
                                                <div class="position-relative">
                                                    <span class="prepend-text">Khoa/ <span class="text-primary">Department</span></span><input style="padding-left: 70px" type="text" class="form-control text-right">
                                                </div>
                                            </div>

                                            <div class="col-sm-6 mb-2">
                                                <div class="position-relative">
                                                    <span class="prepend-text">Phòng số/ <span class="text-primary">Room no</span></span><input style="padding-left: 70px" type="text" class="form-control text-right">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Lý do nhập viện/<span class="text-primary">Chief complaint:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Chẩn đoán/<span class="text-primary">Diagnosis:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">1. Diễn biến lâm sàng trong đợt điều trị/<span class="text-primary">Clinical Evolution:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                         <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">2. KQ xét nghiệm cận lâm sàng/<span class="text-primary">Results of para clinical tests:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">3. Quá trình điều trị/<span class="text-primary">Treatment:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">4. Đánh giá kết quả/<span class="text-primary">Evaluation of treatment:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">5. Hướng dẫn điều trị tiếp và tiên lượng/<span class="text-primary">Continuous treatment and prognosis:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i>Complete</button>
                                            <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i>Save</button>
                                            <button type="button" class="btn btn-secondary">Revert</button>
                                            <button type="button" class="btn btn-secondary">Delete</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Row -->

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

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/perfect-scrollbar.jquery.min.js"></script>
    <!--Wave Effects -->
    <script src="../scripts/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../scripts/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="../scripts/sticky-kit.min.js"></script>
    <script src="../scripts/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="../scripts/custom.min.js"></script>
    <script src="../scripts/myScript.js"></script>
</body>
</html>


