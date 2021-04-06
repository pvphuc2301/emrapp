<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniMedAssForNeoInp.aspx.cs" Inherits="Emr_client.emr.InitialMedicalAssessmentForNeonatalInpatient" %>


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
                                    <h4 class="m-b-0 text-white font-bold">Initial Medical Assessment For Neonatal Inpatient</h4>
                                </a>
                            </div>
                            <div class="card-body collapse show" id="collapseTwo">
                                <form action="#" class="form-horizontal form-bordered">
                                    <div class="form-body mb-4">

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">I. Lý do nhập viện/<span class="text-primary">Reason for admission:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">1. Bệnh sử hiện tại/<span class="text-primary">Current Medical History:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Thuốc đang sử dụng/<span class="text-primary">Current medicals:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">2. Tiền sử bệnh/<span class="text-primary">Antecedent Medical History:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">a. Quá trình sanh/<span class="text-primary">Delivery:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">b. Chế độ dinh dưỡng/<span class="text-primary">Postnatal nutrition:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">3. Tiền sử sản khoa/<span class="text-primary">Meternal Medical History:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2">
                                                <label class="control-label mb-1 append-weeks">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="weight"/>
                                                    <span class="append">Kg</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2">
                                                <label class="control-label mb-1">Nhịp tim/ <span class="text-primary">Hear rate:</span></label>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="respiratory-rate"/>
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2">
                                                <label class="control-label mb-1">Chiều dài/ <span class="text-primary">Length:</span></label>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="height"/>
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2">
                                                <label class="control-label mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="blood-pressure"/>
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-2">
                                                <label for="head-circumference" class="control-label mb-2 d-block">Vòng đầu/ <span class="text-primary">Head Circumference</span></label>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" id="head-circumference" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Tổng trạng/<span class="text-primary">General appearance:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Hệ tim mạch/<span class="text-primary">Cardiovascular system:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Hệ hô hấp/<span class="text-primary">Respiratory system:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Hệ tiêu hóa/<span class="text-primary">Digestive system:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Hệ thần kinh/<span class="text-primary">Nervous system:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Hệ niệu-dục/<span class="text-primary">Urogenital system:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Hệ cơ-xương-khớp/<span class="text-primary">Musculoskeletal system:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Tai Mũi Họng/<span class="text-primary">Otorhinolaryngology:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Hệ da-lông/<span class="text-primary">Integumentary system:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Mắt/<span class="text-primary">Ophthalmology:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Ghi nhận khác/<span class="text-primary">Other findings:</span></label>
                                                    <textarea class="form-control" rows="1"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                            </div>
                                        </div>

                                        <div class="row">
        <div class="col-md-12">
            <label class="control-label mb-2 font-bold">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
        </div>
    </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
        <div class="col-md-12">
            <label class="control-label mb-1 font-bold">VI. Kế hoạch điều trị/ <span class="text-primary">Treatment Plan:</span></label>
            <textarea class="form-control" rows="1"></textarea>
        </div>
    </div>

                                        <div class="row mb-2">
        <div class="col-md-12">
            <label class="control-label mb-1 font-bold">VII. Kế hoạch xuất viện/ <span class="text-primary">Discharge Plan:</span></label>
            <textarea class="form-control" rows="1"></textarea>
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

