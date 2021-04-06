<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurgicalCertificate.aspx.cs" Inherits="Emr_client.emr.SurgicalCertificate" %>

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

    <style>
        .form-group {
            margin-bottom: 0;
        }

        input[type="radio"] ~ textarea,
        input[type="radio"] ~ input,
        input[type="radio"] ~ div > input
        {
            pointer-events: none;
            background-color: #f6f6f6;
        }

        input[type="radio"]:checked ~ textarea,
        input[type="radio"]:checked ~ input,
        input[type="radio"]:checked ~ input,
        input[type="radio"]:checked ~ div > input
        {
            pointer-events: auto;
            background-color: transparent;
        }
    </style>
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
                                            <hr class="m-t-0 m-b-40" />
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-3">First Name:</label>
                                                        <div class="col-md-9">
                                                            <p class="form-control-static">John</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-3">Last Name:</label>
                                                        <div class="col-md-9">
                                                            <p class="form-control-static">Doe</p>
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
                                                            <p class="form-control-static">Male</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-3">Date of Birth:</label>
                                                        <div class="col-md-9">
                                                            <p class="form-control-static">11/06/1987</p>
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
                                                            <p class="form-control-static">19/1 Phan Tây Hồ,P.7, Quận Phú Nhuận, Tp. HCM, Việt Nam</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/row-->
                                            <!--/row-->
                                            <h4 class="box-title font-bold">Visit Details</h4>
                                            <hr class="m-t-0 m-b-40" />
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-3">Encounter:</label>
                                                        <div class="col-md-9">
                                                            <p class="form-control-static">OPD 8536</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--/span-->
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                        <label class="control-label text-right col-md-3">Admit Date:</label>
                                                        <div class="col-md-9">
                                                            <p class="form-control-static">15-05-2019</p>
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
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-info">
                                <h4 class="m-b-0 text-white font-bold"><a>SURGICAL CERTIFICATE</a></h4>
                            </div>
                            <div class="card-body">
                                <form action="#" class="form-horizontal form-bordered">
                                    <div class="form-body">
                                        <!-- Chief complaint -->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label mb-2 font-bold">Họ và tên người bệnh/ <span class="text-info">Patient’s Full Name:</span></label>
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label mb-2 font-bold">Mã bệnh/ <span class="text-info">PID:</span></label>
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label mb-2 font-bold">1. Ngày nhập viện/ <span class="text-info">Admission Date:</span></label>
                                                    <input type="date" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label mb-2 font-bold">2. Ngày phẫu thuật/ <span class="text-info">Procedure Date:</span></label>
                                                    <input type="date" class="form-control" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-2 font-bold">3. Chẩn đoán trước phẫu thuật/ <span class="text-info">Preoperative diagnosis:</span></label>
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-2 font-bold">4.	Phương pháp phẫu thuật:/ <span class="text-info">Name of Surgery/ procedure:</span></label>
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-2 font-bold">5.	Cách thức phẫu thuật/ <span class="text-info">Procedure narrative:</span></label>
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-2 font-bold">6. Yếu tố Rh/ <span class="text-info">Rh:</span></label>
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>
                                        </div>

                                        <!-- End Hospitalisation required -->

                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-info"><i class="fa fa-check"></i> Complete</button>
                                            <button type="submit" class="btn btn-success"><i class="fa fa-check"></i> Save</button>
                                            <button type="button" class="btn waves-effect waves-light btn-warning">Revert</button>
                                            <button type="button" class="btn waves-effect waves-light btn-danger">Delete</button>
                                        </div>
                                    </div>
                                </form>
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
</body>
</html>