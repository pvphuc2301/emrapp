<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InpatientMedicalRecord.aspx.cs" Inherits="Emr_client.emr.InpatientMedicalRecord" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../style/style-custom.css" rel="stylesheet" />
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
            <div class="container-fluid pb-5">
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-12" id="accordionExample">
                        <div class="card">
                            <div class="card-header bg-primary">
                                <a data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
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
                                <h4 class="m-b-0 text-white font-bold"><a>INPATIENT MEDICAL RECORD</a></h4>
                            </div>
                            <div class="card-body">
                                <form action="#" class="form-horizontal form-bordered">
                                    <div class="form-body">

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">I. Lí do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <label class="control-label mb-2 font-bold d-block">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">1. Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">* Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <label class="control-label mb-2 font-bold d-block">2. Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Bản thân/ <span class="text-primary">Personal:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Gia đình/ <span class="text-primary">Family:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                            <p>
                                                (tự lấy dữ liệu từ mục này của những lần khám trước lên/ <span class="text-primary">recall from the previous data</span>)
                                            </p>
                                        </div>

                                        <label class="control-label mb-2 font-bold">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Mục sinh hiệu:</label>
                                            <p>
                                                lấy từ thông tin bên điều dưỡng qua
                                            </p>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Phần khám bệnh:</label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <label class="control-label mb-2 font-bold">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Điều trị/ <span class="text-primary">Treatment:</span></label>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_treatment1" name="rad_treatment" class="custom-control-input" checked />
                                                        <label class="custom-control-label" for="rad_treatment1">Ngoại trú/ <span class="text-primary">Ambulatory care</span></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_treatment2" name="rad_treatment" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_treatment2">Nhập viện/ <span class="text-primary">Admission</span></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_treatment3" name="rad_treatment" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_treatment3">Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mt-2">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_treatment4" name="rad_treatment" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_treatment4">Khác, ghi rõ/ <span class="text-primary">Other, specify</span></label>

                                                        <textarea class="form-control" rows="1"></textarea>
                                                        <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="control-label mb-2 d-block">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_so_requested1" name="rad_so_requested" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_so_requested1">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="form-group m-0 p-0 border-0">
                                                        <div class="custom-control custom-radio mb-2">
                                                            <input type="radio" id="rad_so_requested2" name="rad_so_requested" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_so_requested2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                            <textarea class="form-control" rows="1"></textarea>
                                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>

                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-info"><i class="fa fa-check"></i>Complete</button>
                                            <button type="submit" class="btn btn-success"><i class="fa fa-check"></i>Save</button>
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
    <script src="../scripts/popper.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../scripts/custom.min.js"></script>
    <script src="../scripts/myScript.js"></script>
</body>
</html>
