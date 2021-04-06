<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InpIniNurAss.aspx.cs" Inherits="Emr_client.emr.InpatientInitialNursingAssessment" %>

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
                    <div class="col-lg-12" id="accordionExample">
                        <div class="card">
                            <div class="card-header bg-primary">
                                <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <h4 class="text-white">Patient details</h4>
                                </a>
                            </div>
                            <div class="card-body collapse show" id="collapseOne" aria-labelledby="headingOne">
                                <div class="form-body">
                                        <h4 class="box-title font-bold">Person Info</h4>
                                        <hr class="m-t-0 m-b-40">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label mb-1 text-right col-md-3">First Name:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">John </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label mb-1 text-right col-md-3">Last Name:</label>
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
                                                    <label class="control-label mb-1 text-right col-md-3">Gender:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">Male </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label mb-1 text-right col-md-3">Date of Birth:</label>
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
                                                    <label class="control-label mb-1 text-right col-md-3">Contact Person:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static"></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label mb-1 text-right col-md-3">Relationship:</label>
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
                                                    <label class="control-label mb-1 text-right col-md-3">Address:</label>
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
                                                    <label class="control-label mb-1 text-right col-md-3">Encounter:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">OPD 8536 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group row">
                                                    <label class="control-label mb-1 text-right col-md-3">Admit Date:</label>
                                                    <div class="col-md-9">
                                                        <p class="form-control-static">15-05-2019 </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>

                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->

                <%-- A.	THÔNG TIN TỔNG QUÁT VỀ NGƯỜI BỆNH/GENERAL PATIENT INFORMATION --%>
                <div class="card ">
                    <div class="card-header bg-primary">
                        <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                            <h4 class="text-white">A. THÔNG TIN TỔNG QUÁT VỀ NGƯỜI BỆNH/ GENERAL PATIENT INFORMATION</h4>
                        </a>
                    </div>
                    <div class="card-body collapse show" id="collapseTwo" aria-labelledby="headingTwo">
                        <form class="form-horizontal" action="#">
                            <div class="form-body">

                                <div class="row">
                                    <div class="col-sm-6 mb-2">
                                        <label class="control-label mb-1">Ngày nhập viện / <span class="text-primary">Date of Admission</span></label>
                                        <input class="form-control" type="date" style="width: auto" />
                                    </div>

                                    <div class="col-sm-6 mb-2">
                                        <label class="control-label mb-1">Giờ vào viện / <span class="text-primary">Time of Admission</span></label>
                                        <input class="form-control" type="date" style="width: auto" />
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Quốc gia cư trú/ <span class="text-primary">Country of residence</span></label>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_country_of_residence1" name="rad_country_of_residence" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_country_of_residence1">Việt Nam/ <span class="text-primary">Vietnamese</span></label>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio mb-2">
                                                <input type="radio" id="rad_country_of_residence2" name="rad_country_of_residence" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_country_of_residence2">Khác/ <span class="text-primary">Other:</span></label>
                                                <input class="form-control" type="text" />
                                                <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mt-2">
                                        <textarea class="form-control intervention-results mt-1" rows="1"></textarea>
                                        <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label font-bold mb-1">Cần phiên dịch/ <span class="text-primary">Requires interpreter:</span></label>
                                    </div>
                                    <div class="col-sm-4 col-6">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_requires_interpreter1" name="rad_requires_interpreter" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_requires_interpreter1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-6">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_requires_interpreter2" name="rad_requires_interpreter" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_requires_interpreter2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tôn giáo/ <span class="text-primary">Religion:</span></label>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_religion1" name="rad_religion" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_religion1">Phật giáo/ <span class="text-primary">Buddhism</span></label>
                                        </div>
                                    </div>

                                    <div class="col-sm-8">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_religion2" name="rad_religion" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_religion2">Thiên chúa giáo/ <span class="text-primary">Christian:</span></label>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_religion3" name="rad_religion" disabled-for="religion" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_intervention_results2">Khác/ <span class="text-primary">Other:</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 mt-2">
                                        <textarea class="form-control religion mt-1" rows="1"></textarea>
                                        <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label font-bold mb-1">Cần phiên dịch/ <span class="text-primary">Requires interpreter:</span></label>
                                    </div>
                                    <div class="col-sm-4 col-6">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_requires_interpreter1" name="rad_requires_interpreter" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_requires_interpreter1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 col-6">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_requires_interpreter2" name="rad_requires_interpreter" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_requires_interpreter2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>



                                <label class="control-label mb-1">Nhu cầu tín ngưỡng/ <span class="text-primary">Spiritual counselling:</span></label>

                                <div class="row  mb-2">
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_spiritual_counselling1" name="rad_spiritual_counselling" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_spiritual_counselling1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_spiritual_counselling2" name="rad_spiritual_counselling" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_spiritual_counselling2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Nghề nghiệp/ <span class="text-primary">Occupation:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <br />
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Hoàn cảnh sống/ <span class="text-primary">Living status:</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_living_status1" name="rad_living_status" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_living_status1">Một mình/ <span class="text-primary">Alone</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <!--/span-->
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_living_status2" name="rad_living_status" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_living_status2">Với vợ/chồng/con/anh,chị, em ruột/ <span class="text-primary">With spouse/ children/ sibling</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_living_status3" name="rad_living_status" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_living_status3">Khác/ <span class="text-primary">Other:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                                <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/span-->
                                </div>

                                <%--Concerns related to hospitalization--%>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Mối quan tâm khi nằm viện/ <span class="text-primary">Concerns related to hospitalization:</span></label>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Không/ <span class="text-primary">None</span></span>
                                        </label>
                                    </div>
                                    <!--/span-->
                                    <div class="col-md-6">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Gia đình/các mối quan hệ/ <span class="text-primary">Family/ relationship issues</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Tài chính/ <span class="text-primary">Financial</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Lo âu/ <span class="text-primary">Worriedness</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Khác/ <span class="text-primary">Other:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                        </div>
                                    </div>
                                    <!--/span-->
                                </div>


                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Tên người liên lạc/ <span class="text-primary">Contact person’s Name:</span></label>
                                            <input type="text" name="name" value="" class="form-control" />
                                            <br />
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Quan hệ/ <span class="text-primary">Relationship:</span></label>
                                            <input type="text" name="name" value="" class="form-control" />
                                            <br />
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Điện thoại/ <span class="text-primary">Phone:</span></label>
                                            <input type="text" name="name" value="" class="form-control" />
                                            <br />
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Người đi cùng/ <span class="text-primary">Accompanied by:</span></label>
                                            <input type="text" name="name" value="" class="form-control" />
                                            <br />
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Điện thoại/ <span class="text-primary">Phone:</span></label>
                                            <input type="text" name="name" value="" class="form-control" />
                                            <br />
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1 mb-2">Quan hệ/ <span class="text-primary">Relationship:</span></label>
                                            <div style="display: flex" class="flex-column">
                                                <input type="text" name="name" value="" class="form-control" />
                                                <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Điện thoại/ <span class="text-primary">Phone:</span></label>
                                            <input type="text" name="name" value="" class="form-control" />
                                            <br />
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <%-- B.	BỆNH SỬ/ MEDICAL HISTORY --%>
                <div class="card ">
                    <div class="card-header bg-primary">
                        <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
                            <h4 class="m-b-0 text-white">B.	BỆNH SỬ/ MEDICAL HISTORY</h4>
                        </a>
                    </div>
                    <div class="card-body collapse show" id="collapseThree" aria-labelledby="headingThree">
                        <form class="form-horizontal" action="#">
                            <div class="form-body">
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Bệnh nhập viện từ/ <span class="text-primary">Patient admitted from</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_patient_admitted_from1" name="rad_patient_admitted_from" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_patient_admitted_from1">Khoa khám bệnh/ <span class="text-primary">OPD</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_patient_admitted_from2" name="rad_patient_admitted_from" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_patient_admitted_from2">Khoa cấp cứu/ <span class="text-primary">Emergency</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_patient_admitted_from3" name="rad_patient_admitted_from" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_patient_admitted_from3">Bác sĩ hợp tác/ <span class="text-primary">Visiting doctor</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_patient_admitted_from4" name="rad_patient_admitted_from" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_patient_admitted_from4">Khác/ <span class="text-primary">Referral:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                                <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tình trang khi đến/ <span class="text-primary">Arrived by</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_arrived_by1" name="rad_arrived_by" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_arrived_by1">Tự đi được/ <span class="text-primary">Walking</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_arrived_by2" name="rad_arrived_by" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_arrived_by2">Bằng băng ca/ <span class="text-primary">Stretcher</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_arrived_by3" name="rad_arrived_by" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_arrived_by3">Bằng xe lăn/ <span class="text-primary">Wheelchair</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <br />
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Lần nhập viện trước tại bệnh viện Quốc tế Mỹ/ <span class="text-primary">Previous admission at AIH:</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_previous_admission1" name="rad_previous_admission" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_previous_admission1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_previous_admission2" name="rad_previous_admission" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_previous_admission2">Có/ <span class="text-primary">Yes:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                                <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tiền sử bệnh/ <span class="text-primary">Past medical history:</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_past_medical_history1" name="rad_past_medical_history" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_past_medical_history1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_past_medical_history2" name="rad_past_medical_history" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_past_medical_history2">Có/ <span class="text-primary">Yes:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                                <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tiền sử phẫu thuật/ <span class="text-primary">Past surgical history:</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_past_surgical_history1" name="rad_past_surgical_history" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_past_surgical_history1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_past_surgical_history2" name="rad_past_surgical_history" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_past_surgical_history2">Có/ <span class="text-primary">Yes:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                                <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--Substance abuse--%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Lạm dụng chất kích thích/ <span class="text-primary">Substance abuse:</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Hút thuốc/ <span class="text-primary">Smoking</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Rượu bia/ <span class="text-primary">Alcohol</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="custom-control-label mb-1" for="rad_past_surgical_history2">Khác/ <span class="text-primary">Other:</span></label>
                                            <textarea class="form-control" rows="1"></textarea><br />
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <%--test results/documents--%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Hồ sơ bệnh án kèm theo/ <span class="text-primary">Previous test results/documents:</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_pre_test_result1" name="rad_pre_test_result" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_pre_test_result1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_pre_test_result2" name="rad_pre_test_result" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_pre_test_result2">Có, Ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                                <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--Current home medication--%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Thuốc hiện đang dùng tại nhà/ <span class="text-primary">Current home medication:</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_current_home_medication1" name="rad_current_home_medication" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_current_home_medication1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_current_home_medication2" name="rad_current_home_medication" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_current_home_medication2">Có (Tham khảo đơn thuốc đính kèm)/ <span class="text-primary">Yes, if yes please refer to the prescription attached:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                                <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--Allergy/Reaction--%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Dị ứng/ Phản ứng/ <span class="text-primary">Allergy/Reaction:</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_allergy1" name="rad_allergy" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_allergy1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_allergy2" name="rad_allergy" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_allergy2">Có, Ghi rõ/ <span class="text-primary">Yes, Specify:</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                                <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--High-risk patient--%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Người bệnh có nguy cơ cao <span class="text-primary">High-risk patient</span>:</label>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Trẻ em (< hoặc 8 tuổi)/ <span class="text-primary">Children (<8 years old)</span></span>
                                        </label>
                                    </div>
                                    <!--/span-->
                                    <div class="col-md-6">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Những người bệnh tàn tật năng/ <span class="text-primary">Severely disabled patients</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Người cao tuổi (80 tuổi hoặc hơn)/ <span class="text-primary">Elderly people (80 years old or above)</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Những người bệnh có nguy cơ té ngã cao/ <span class="text-primary">Patients with high risk of falls</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Những người bệnh lú lẫn/hôn mê/ <span class="text-primary">Confused or comatose patients</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Người bệnh bị kìm giữ/ <span class="text-primary">Restrained patients</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Người bệnh đang điều trị có nguy cơ cao (như chạy thận nhân tạo, hóa trị liệu..)/ <span class="text-primary">Patients that receiving high-risk treatments (such as dialysis, chemotherapy…)</span></span>
                                        </label>
                                    </div>

                                    <!--/span-->
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <%-- C.	ĐÁNH GIÁ CỦA ĐIỀU DƯỠNG/ NURSING ASSESSMENT --%>
                <div class="card">
                    <div class="card-header bg-primary">
                        <a data-toggle="collapse" data-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour" href="javascript:void(0)">
                            <h4 class="m-b-0 text-white">C.	ĐÁNH GIÁ CỦA ĐIỀU DƯỠNG/ NURSING ASSESSMENT</h4>
                        </a>
                    </div>
                    <div class="card-body collapse show" id="collapseFour" aria-labelledby="headingFour">
                            <div class="form-body">

                                <%-- Vital signs and standard measurements --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">1. Dấu hiệu sinh tồn và các chỉ số đo lường/ <span class="text-primary">Vital signs and standard measurements:</span></label>
                                    </div>
                                </div>

                                <%-- Temperature --%>
                                <div class="row">
                                    <div class="col-md-6 mb-2">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label for="temperature" class="control-label mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="temperature" />
                                                    <div class="input-group-append">
                                                        <label for="temperature" class="input-group-text bg-white">°C</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-2">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label for="pulse" class="control-label mb-1">Mạch/ <span class="text-primary">Pulse:</span></label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="pulse" />
                                                    <div class="input-group-append">
                                                        <label for="pulse" class="input-group-text bg-white">/phút (m)</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- BP --%>
                                <div class="row">
                                    <div class="col-md-6 mb-2">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label for="bp" class="control-label mb-1 mb-2 d-block">HA/ <span class="text-primary">BP:</span></label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="bp" />
                                                    <div class="input-group-append">
                                                        <label for="bp" class="input-group-text bg-white">mmHg</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-2">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label for="respiratory-rate" class="control-label mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="respiratory-rate" />
                                                    <div class="input-group-append">
                                                        <label for="respiratory-rate" class="input-group-text bg-white">/phút (m)</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- Weight --%>
                                <div class="row">
                                    <div class="col-md-6 mb-2">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label for="weight" class="control-label mb-1">Trọng lượng/ <span class="text-primary">Weight: </span></label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="weight" />
                                                    <div class="input-group-append">
                                                        <label for="weight" class="input-group-text bg-white">kg</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-2">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label for="height" class="control-label mb-1">Chiều cao/ <span class="text-primary">Height: </span></label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="height" />
                                                    <div class="input-group-append">
                                                        <label for="height" class="input-group-text bg-white">cm</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- BMI --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label for="bmi" class="control-label mb-1">Chỉ số BMI/ <span class="text-primary">BMI</span></label>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="bmi" />
                                            <div class="input-group-append">
                                                <label for="bmi" class="input-group-text bg-white">kg/m2</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%--Respiratory system--%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">2. Hệ hô hấp/ <span class="text-primary">Respiratory system:</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_respiratory_system1" name="rad_respiratory_system" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_respiratory_system1">Không có vấn đề/ <span class="text-primary">Normal </span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_respiratory_system2" name="rad_respiratory_system" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_respiratory_system2">Khó thở/ <span class="text-primary">Dyspnea</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_respiratory_system3" name="rad_respiratory_system" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_respiratory_system3">Khó thở nằm/ <span class="text-primary">Orthopnea</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_respiratory_system4" name="rad_respiratory_system" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_respiratory_system4">Khó thở khò khè/ <span class="text-primary">Wheeze</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_respiratory_system5" name="rad_respiratory_system" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_respiratory_system5">Da xanh tái/ <span class="text-primary">Cyanosis</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%--Cough--%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 mb-2 font-bold d-block">Ho/ <span class="text-primary">Cough:</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_cough1" name="rad_cough" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_cough1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_cough2" name="rad_cough" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_cough2">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_cough3" name="rad_cough" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_cough3">Không có đờm/ <span class="text-primary">Unproductive cough</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_cough4" name="rad_cough" class="custom-control-input" />
                                                <label class="custom-control-label mb-1" for="rad_cough4">Có đờm (ghi rõ màu/ tính chất/số lượng)/ <span class="text-primary">Productive (specify colour/ nature/amount):</span></label>
                                                <textarea class="form-control" rows="1"></textarea>
                                                <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%-- Cardiovascular system --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">3. Hệ tim mạch/ <span class="text-primary">Cardiovascular system:</span></label>
                                    </div>
                                </div>

                                <%-- Pulse --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Mạch/ <span class="text-primary">Pulse:</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_pulse1" name="rad_pulse" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_pulse1">Đều/ <span class="text-primary">Regular</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_pulse2" name="rad_pulse" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_pulse2">Không đều/ <span class="text-primary">Irregular</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Presence with --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tình trạng hiện tại/ <span class="text-primary">Presence with:</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_presence_with1" name="rad_presence_with" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_presence_with1">Đau ngực/ <span class="text-primary">Chest pain</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_presence_with2" name="rad_presence_with" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_presence_with2">Chóng mặt/ <span class="text-primary">Dizziness</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_presence_with3" name="rad_presence_with" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_presence_with3">Đau bắp chân/ <span class="text-primary">Calf pain</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_presence_with4" name="rad_presence_with" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_presence_with4">Phù ngoại biên/ <span class="text-primary">Peripheral edema</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Extremities --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tứ chi/ <span class="text-primary">Extremities:</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_extremities1" name="rad_extremities" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_extremities1">Ấm/ <span class="text-primary">Warm</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_extremities2" name="rad_extremities" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_extremities2">Lạnh/ <span class="text-primary">Cold</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_extremities3" name="rad_extremities" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_extremities3">Ẩm ướt/ <span class="text-primary">Clammy</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_extremities4" name="rad_extremities" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_extremities4">Xanh tái/ <span class="text-primary">Cyanosed</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Neurosensory system --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">4. Hệ thần kinh cảm giác/ <span class="text-primary">Neurosensory system:</span></label>
                                    </div>
                                </div>

                                <%-- Oriented --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Định hướng được/ <span class="text-primary">Oriented</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_oriented1" name="rad_oriented" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_oriented1">Ngày/ <span class="text-primary">Day</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_oriented2" name="rad_extremities" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_oriented2">Thời gian/ <span class="text-primary">Time</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_oriented3" name="rad_extremities" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_oriented3">Người/ <span class="text-primary">Person</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_oriented4" name="rad_extremities" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_oriented4">Nơi/ <span class="text-primary">Place</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_oriented5" name="rad_extremities" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_oriented5">Không định hướng được/ <span class="text-primary">Not at all</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Mental status --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tình trạng tinh thần/ <span class="text-primary">Mental status</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_mental_status1" name="rad_mental_status" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_mental_status1">Tỉnh táo/ <span class="text-primary">Alert</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_mental_status2" name="rad_mental_status" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_mental_status2">Nhầm lẫn/ <span class="text-primary">Confused</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_mental_status3" name="rad_mental_status" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_mental_status3">Kích động/ <span class="text-primary">Agitated</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_mental_status4" name="rad_mental_status" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_mental_status4">Lo âu/ <span class="text-primary">Anxious</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_mental_status5" name="rad_mental_status" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_mental_status5">Quấy/ <span class="text-primary">Fretful</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_mental_status6" name="rad_mental_status" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_mental_status6">Lơ mơ/ <span class="text-primary">Lethargic</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_mental_status7" name="rad_mental_status" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_mental_status7">Trầm cảm/ <span class="text-primary">Depressed</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_mental_status8" name="rad_mental_status" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_mental_status8">Khác/ <span class="text-primary">Other:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <%-- Hearing --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Thính giác/ <span class="text-primary">Hearing</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_hearing1" name="rad_hearing" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_hearing1">Bình thường/ <span class="text-primary">Normal impaired</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_hearing2" name="rad_hearing" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_hearing2">Khiếm thính/ <span class="text-primary">Hearing impaired</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_hearing3" name="rad_hearing" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_hearing3">Dùng máy trợ thính (Trái/Phải)/ <span class="text-primary">Uses hearing aid (Left/Right)</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Vision --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Thị giác/ <span class="text-primary">Vision</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_vision1" name="rad_vision" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_vision1">Bình thường/ <span class="text-primary">Normal</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_vision2" name="rad_vision" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_vision2">Đeo kính/ <span class="text-primary">Glasses</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_vision3" name="rad_vision" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_vision3">Kính sát tròng/ <span class="text-primary">Contact lenses</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_vision4" name="rad_vision" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_vision4">Khác/ <span class="text-primary">Other:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <%-- Speech --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Khả năng ngôn ngữ/ <span class="text-primary">Speech</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_speech1" name="rad_speech" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_speech1">Bình thường/ <span class="text-primary">Normal</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_speech2" name="rad_speech" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_speech2">Nói lắp/ <span class="text-primary">Slurred</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_speech3" name="rad_speech" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_speech3">Chứng mất ngôn ngữ/ <span class="text-primary">Aphasic</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_speech4" name="rad_speech" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_speech4">Không giao tiếp (Bất tỉnh or mê)/ <span class="text-primary">Non-communicative(Unconscious </span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_speech5" name="rad_speech" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_speech5">Khiếm ngôn/ <span class="text-primary">Speech impaired</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_speech6" name="rad_speech6" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_speech6">Chưa biết nói/ <span class="text-primary">Non-verbal</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Gastrointestinal system --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">5. Hệ tiêu hóa/ <span class="text-primary">Gastrointestinal system</span></label>
                                    </div>
                                </div>

                                <%-- Diet --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Chế độ ăn uống/ <span class="text-primary">Diet</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_diet1" name="rad_diet" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_diet1">Bình thường/ <span class="text-primary">Normal</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_diet2" name="rad_diet" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_diet2">Bú bình/ <span class="text-primary">Bottle feeding</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_diet3" name="rad_diet" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_diet3">Bú mẹ hoàn toàn/ <span class="text-primary">Total breast feeding</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_diet4" name="rad_diet" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_diet4">Khác/ <span class="text-primary">Other:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <%-- Presence of --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tình trang hiện có/ <span class="text-primary">Presence of</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_presence_of1" name="rad_presence_of" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_presence_of1">Nôn/ <span class="text-primary">Vomiting</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_presence_of2" name="rad_presence_of" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_presence_of2">Buồn nôn/ <span class="text-primary">Nausea</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_presence_of3" name="rad_presence_of" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_presence_of3">Nuốt khó (chuyển đến chuyên gia trị liệu)/ <span class="text-primary">Swallowing difficulties (refer to therapist)</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_presence_of4" name="rad_presence_of" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_presence_of4">Khác/ <span class="text-primary">Other:</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <%-- NG tube --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Ống thông/ <span class="text-primary">NG tube</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_ng_tube1" name="rad_ng_tube" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_ng_tube1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Mở dạ dày/ <span class="text-primary">Gastrostomy</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4 mb-2">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Kích cỡ/ <span class="text-primary">Size</span></span>
                                            <div class="input-group">
                                                <input type="text" class="form-control w-5" id="temperature" />
                                                <div class="input-group-append">
                                                    <label for="temperature" class="input-group-text bg-white">Fr</label>
                                                </div>
                                            </div>
                                        </label>
                                    </div>

                                    <div class="col-md-12 mb-2">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Ngày thay ống gần nhất/ <span class="text-primary">Date last changed:</span></label>
                                            <input class="form-control" type="date" />
                                        </div>
                                    </div>
                                </div>

                                <%-- Food dislikes --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Thức ăn không ưa thích/ <span class="text-primary">Food dislikes</span></span>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </label>
                                    </div>
                                </div>

                                <%-- Bowel Elimination --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Bài tiết/ <span class="text-primary">Bowel Elimination:</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_bowel_elimination1" name="rad_bowel_elimination" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_bowel_elimination1">2 lần/ngày/ <span class="text-primary">2 times/day</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_bowel_elimination2" name="rad_bowel_elimination" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_bowel_elimination2">1 lần/ngày/ <span class="text-primary">1 time/day</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_bowel_elimination3" name="rad_bowel_elimination" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_bowel_elimination3">Cách ngày/ <span class="text-primary">Every other day</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_pulse2" name="rad_pulse" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_pulse2">Khác/ <span class="text-primary">Other</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Consistency of stool --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tính chất phân/ <span class="text-primary">Consistency of stool:</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_consistency_of_stool1" name="rad_consistency_of_stool" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_consistency_of_stool1">Cứng/ <span class="text-primary">Hard</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_consistency_of_stool2" name="rad_consistency_of_stool" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_consistency_of_stool2">Có hình dạng/ <span class="text-primary">Formed</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_consistency_of_stool3" name="rad_consistency_of_stool" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_consistency_of_stool3">Lỏng/ <span class="text-primary">Loose</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_consistency_of_stool4" name="rad_consistency_of_stool" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_consistency_of_stool4">Phân nước/ <span class="text-primary">Watery</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Presence with --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tình trạng hiện có/ <span class="text-primary">Presence with:</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_presence_with1" name="rad_presence_with" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_presence_with1">Bình thường/ <span class="text-primary">Normal</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_presence_with2" name="rad_presence_with" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_presence_with2">Không kiểm soát/ <span class="text-primary">Incontinence</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_presence_with3" name="rad_presence_with" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_presence_with3">Hậu môn nhân tạo/ <span class="text-primary">Stoma</span></label>
                                        </div>
                                    </div>

                                </div>

                                <%-- Gastrointestinal system --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">6. Đánh giá dinh dưỡng ban đầu/ <span class="text-primary">Initial Nutrition Assessment</span></label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Bảng 1: Khảo sát dinh dưỡng ban đầu/ <span class="text-primary">Table 1: Initial screening</span></label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 border mt-2 mb-2">
                                        <div class="row border-bottom">
                                            <div class="col-md-6 border-right" style="padding: .75rem;"><label class="control-label mb-1">1. Chỉ số BMI < 20.5/ <span class="text-primary">Is BMI < 20.5?</span></label></div>
                                            <div class="col-md-3" style="padding: .75rem;">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_initial_screening_1_1" name="rad_initial_screening_1" class="custom-control-input"/>
                                                    <label class="custom-control-label mb-1" for="rad_initial_screening_1_1">Có/ <span class="text-primary">Yes</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-3" style="padding: .75rem;">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_initial_screening_1_2" name="rad_initial_screening_1" class="custom-control-input"/>
                                                    <label class="custom-control-label mb-1" for="rad_initial_screening_1_2">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row border-bottom">
                                            <div class="col-md-6 border-right" style="padding: .75rem;"><label class="control-label mb-1">2. Người bệnh có sụt cân trong vòng 3 tháng gần đây không?/ <span class="text-primary">Has the patient lost weight within the last 3 months?</span></label></div>
                                            <div class="col-md-3" style="padding: .75rem;">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_initial_screening_2_1" name="rad_initial_screening_2" class="custom-control-input"/>
                                                    <label class="custom-control-label mb-1" for="rad_initial_screening_2_1">Có/ <span class="text-primary">Yes</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-3" style="padding: .75rem;">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_initial_screening_2_2" name="rad_initial_screening_2" class="custom-control-input"/>
                                                    <label class="custom-control-label mb-1" for="rad_initial_screening_2_2">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row border-bottom">
                                            <div class="col-md-6 border-right" style="padding: .75rem;"><label class="control-label mb-1">3. Người bệnh có chán ăn trong 1 tuần qua không?/ <span class="text-primary">Has the patient had a reduced dietary intake in the last week?</span></label></div>
                                            <div class="col-md-3" style="padding: .75rem;">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_initial_screening_3_1" name="rad_initial_screening_3" class="custom-control-input"/>
                                                    <label class="custom-control-label mb-1" for="rad_initial_screening_3_1">Có/ <span class="text-primary">Yes</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-3" style="padding: .75rem;">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_initial_screening_3_2" name="rad_initial_screening_3" class="custom-control-input"/>
                                                    <label class="custom-control-label mb-1" for="rad_initial_screening_3_2">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                        </div>

                                         <div class="row border-bottom">
                                            <div class="col-md-6 border-right" style="padding: .75rem;"><label class="control-label mb-1">4. Người bệnh có bị bệnh gì nghiêm trọng không?/ <span class="text-primary">Is the patient severely ill?</span></label></div>
                                            <div class="col-md-3" style="padding: .75rem;">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_initial_screening_4_1" name="rad_initial_screening_4" class="custom-control-input"/>
                                                    <label class="custom-control-label mb-1" for="rad_initial_screening_4_1">Có/ <span class="text-primary">Yes</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-3" style="padding: .75rem;">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_initial_screening_4_2" name="rad_initial_screening_4" class="custom-control-input"/>
                                                    <label class="custom-control-label mb-1" for="rad_initial_screening_4_2">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <p>
                                            Ghi chú: Thức ăn bao gồm ăn qua miệng và các đường khác (qua ống thông dạ dày hoặc dinh dưỡng qua đường tĩnh mạch).
                                            <br />
                                            <span class="text-primary">Note: Food intake includes food taken by mouth, and other route (tube feeding or parenteral nutrition).</span>
                                            <br />
                                            - Nếu trả lời “<span class="font-bold">Có</span>” cho bất kỳ câu hỏi nào ở bảng 1 thì vui lòng đánh giá tiếp ở bảng 2.<br />
                                            <span class="text-primary">The answer is ‘<span class="font-bold">Yes</span>’ to any question: go to the final screening in Table 2.</span>
                                            <br />
                                            - Nếu trả lời “<span class="font-bold">Không</span>” cho bất kỳ câu hỏi nào ở bảng 1 thì vui lòng đánh giá lại mỗi tuần.<br />
                                            <span class="text-primary">The answer is ‘<span class="font-bold">No</span>’ to all questions: the patient is re-screened weekly.</span>
                                        </p>
                                    </div>
                                </div>
                                
                                <%-- Table 2: Final screening --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Bảng 2: Khảo sát dinh dưỡng tiếp theo/ <span class="text-primary">Table 2: Final screening</span></label>
                                    </div>
                                </div>

                                <%-- Nutrition status --%>
                                <div  class="row mb-2 border">
                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;"></div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Tình trạng dinh dưỡng/ <span class="text-primary">Nutrition status</span></label>
                                    </div>

                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm = 0 <br /><span class="text-primary">Score = 0</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Tình trạng dinh dưỡng bình thường <br /><span class="text-primary">Normal nutritional status</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm = 1 <br /><span class="text-primary">Score = 1 (Cross 1 or more)</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Sụt cân > 5% trong 3 tháng <br /><span class="text-primary">Weight loss > 5% in 3 months</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Ăn ít 50%-75% so với nhu cầu ăn bình thường trong tuần qua <br /><span class="text-primary">Food intake below 50 - 75% of normal requirement in preceding week</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm = 2 <br /><span class="text-primary">Score = 2 (Cross 1 or more)</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Sụt cân > 5% trong 2 tháng <br /><span class="text-primary">Weight loss > 5% in 2 months</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">BMI 18.5-20.5 và tổng trạng suy yếu<br /><span class="text-primary">BMI 18.5 - 20.5 and impaired general condition</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Ăn ít 25%-50% so với nhu cầu ăn bình thường trong tuần qua<br /><span class="text-primary">Food intake 25–50% of normal requirement in preceding week</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm = 3 <br /><span class="text-primary">Score = 3 (Cross 1 or more)</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Sụt cân > 5% trong 1 tháng <br /><span class="text-primary">Weight loss > 5% in 1 month</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">BMI < 18.5 và tổng trạng suy yếu<br /><span class="text-primary">BMI < 18.5 and impaired general condition</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Ăn ít 0-25% so với nhu cầu ăn bình thường trong tuần qua<br /><span class="text-primary">Food intake 25–50% of normal requirement in preceding week</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm<br /><span class="text-primary"> Score</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">-</label>
                                    </div>
                                    </div>

                                <%-- Severity of disease --%>
                                <div  class="row mb-2 mt-4 border">
                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;"></div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Bệnh nặng/ <span class="text-primary">Severity of disease</span></label>
                                    </div>

                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm = 0 <br /><span class="text-primary">Score = 0</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Yêu cầu dinh dưỡng đặc biệt <br /><span class="text-primary">Normal nutritional requirements</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm = 1 <br /><span class="text-primary">Score = 1 (Cross 1 or more)</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Gãy khớp háng <br /><span class="text-primary">Hip fracture</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Bệnh mãn tính có kèm theo biến chứng <br /><span class="text-primary">Chronic disease with complications</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Viêm phổi tắc nghẽn mãn tính <br /><span class="text-primary">COPD</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">NB yếu nhưng có thể di chuyển được <br /><span class="text-primary">The patient is weak but can move out of bed</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm = 2 <br /><span class="text-primary">Score = 2 (Cross 1 or more)</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Có phẫu thuật ở bụng<br /><span class="text-primary">Major abdominal surgery</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Đột quị<br /><span class="text-primary">Stroke</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Viêm phổi nặng <br /><span class="text-primary">Severe pneumonia</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Bệnh ác tính huyết học<br /><span class="text-primary">Hematologic malignancy</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Người bệnh nằm liệt giường<br /><span class="text-primary">The patient is bedridden</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm = 3 <br /><span class="text-primary">Score = 3 (Cross 1 or more)</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Chấn thương đầu<br /><span class="text-primary">Head injury</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Ghép tủy xương<br /><span class="text-primary">Bone marrow transplantation</span></span>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Bệnh nhân chăm sóc chuyên sâu (APACHE> 10)<br /><span class="text-primary">Intensive care patients (APACHE > 10)</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm<br /><span class="text-primary"> Score</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">-</label>
                                    </div>
                                </div>

                                <%-- Age --%>
                                <div  class="row mb-2 mt-4 border">
                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;"></div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Tuổi<br /><span class="text-primary">Age</span></label>
                                    </div>

                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm = 0 <br /><span class="text-primary">Score = 0</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">&lt; 70 tuổi <br /><span class="text-primary">&lt; 70 years old</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm = 1<br /><span class="text-primary">Score = 1 (Cross 1 or more)</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">≥ 70 tuổi <br /><span class="text-primary">≥ 70 years old</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4 border-right border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">Điểm<br /><span class="text-primary"> Score</span></label>
                                    </div>
                                    <div class="col-sm-8 border-bottom" style="padding: .75rem;">
                                        <label class="control-label mb-1">-</label>
                                    </div>
                                </div>

                                <div class="row mb-4 border">
                                    <div class="col-md-4 border-right" style="padding: .75rem;">
                                        <label class="control-label mb-1">Tổng điểm<br /><span class="text-primary"> Total Score</span></label>
                                    </div>
                                    <div class="col-sm-8" style="padding: .75rem;">
                                        <label class="control-label mb-1">-</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <p>
                                            <strong>*Ghi chú</strong>: Khi đánh giá điểm cho mỗi tiêu chí thì luôn luôn chọn điểm cao nhất. Sau đó cộng tất cả các điểm số ở cuối để có điểm số cuối cùng
                                            <br />
                                            <span class="text-primary"><strong>Notes</strong>: When assessing the score for each criterion, always choose the highest score. Then add up all scores at the end to get the final score </span>
                                            <br />
                                            Nếu điểm <3: đánh giá lại Nb mỗi tuần/ <span class="text-primary">If score < 3: weekly re-screening of the patient</span>
                                            <br />
                                            Nếu điểm ≥ 3: giới thiệu NB đến khám chuyên gia dinh dưỡng/ <span class="text-primary">If score ≥ 3: refer patients to the nutritionists</span>

                                        </p>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">7. Hệ tiết niệu sinh dục/ <span class="text-primary">Genitourinary system</span></label>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tiểu/ <span class="text-primary">Urination</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Không có vấn đề/ <span class="text-primary">Normal</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Tiểu đêm/ <span class="text-primary">Nocturia</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Thường xuyên/ <span class="text-primary">Frequency</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Khó tiểu/ <span class="text-primary">Dysuria</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Không kiểm soát/ <span class="text-primary">Incontinece</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4 mb-2">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label">Thông tiểu ngắt quãng/ <span class="text-primary">Intermittent catheterization</span></span>
                                            <div class="input-group mt-1">
                                                <input type="text" class="form-control w-5" id="temperature" />
                                                <div class="input-group-append">
                                                    <label for="temperature" class="input-group-text bg-white">lần/ngày</label>
                                                </div>
                                            </div>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Ống thông tiểu lưu/ <span class="text-primary">Indwelling catheter</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4 mb-2">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Kích cỡ/ <span class="text-primary">Size</span></label>
                                            <div class="input-group">
                                                <input type="text" class="form-control w-5" id="temperature" />
                                                <div class="input-group-append">
                                                    <label for="temperature" class="input-group-text bg-white">Fr</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 mb-2">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Ngày thay gần nhất/ <span class="text-primary">Date last changed</span></label>
                                            <input type="date" class="form-control w-5" id="temperature" />
                                        </div>
                                    </div>
                                </div>

                                <%-- Urination --%>
                                <div class="row">
                                    <div class="col-md-4 mb-2">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Ống thông bàng quang qua da/ <span class="text-primary">Suprapubic catheter</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4 mb-2">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Kích cỡ/ <span class="text-primary">Size</span></label>
                                            <div class="input-group">
                                                <input type="text" class="form-control w-5" id="temperature" />
                                                <div class="input-group-append">
                                                    <label for="temperature" class="input-group-text bg-white">Fr</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 mb-2">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Ngày thay gần nhất/ <span class="text-primary">Date last changed</span></label>
                                            <input type="date" class="form-control w-5" id="temperature" />
                                        </div>
                                    </div>
                                </div>

                                <%-- For female patients only --%>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Đối với người bệnh nữ/ <span class="text-primary">For female patients only:</span></label>
                                    </div>
                                </div>

                                <%-- Menstruation --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Kinh nguyệt/ <span class="text-primary">Menstruation</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_menstruation1" name="rad_menstruation" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_menstruation1">Vô kinh/ <span class="text-primary">Amenorrhea</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_menstruation2" name="rad_menstruation" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_menstruation2">Mãn kinh/ <span class="text-primary">Menopause</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4 mb-2">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_menstruation2" name="rad_menstruation" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_menstruation2">Chu kỳ/ <span class="text-primary">Cycle</span></label>
                                            <div class="input-group">
                                                <input type="text" class="form-control w-5" id="temperature" />
                                                <div class="input-group-append">
                                                    <label for="temperature" class="input-group-text bg-white">ngày /<span class="text-primary">day</span></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 mb-2">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Ngày đầu của kỳ kinh cuối/ <span class="text-primary">Last menstrual period started</span></label>
                                            <input type="date" class="form-control w-5" id="temperature" />
                                        </div>
                                    </div>
                                </div>

                                <%-- Pregnancy --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Có thai/ <span class="text-primary">Pregnancy</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Không/ <span class="text-primary">No</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Đã từng mang  thai trước đây/ <span class="text-primary">Previous pregnancy</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Kích cỡ/ <span class="text-primary">PARA</span></span>
                                            <input type="text" class="form-control w-5" />
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Hiện đang mang thai/ <span class="text-primary">Current pregnancy</span></span>
                                            <div class="input-group">
                                                <input type="text" class="form-control w-5" id="temperature" />
                                                <div class="input-group-append">
                                                    <label for="temperature" class="input-group-text bg-white">tuần/ <span class="text-primary">weeks</span></label>
                                                </div>
                                            </div>
                                        </label>
                                    </div>
                                </div>

                                <%-- Contraception --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Ngừa thai/ <span class="text-primary">Contraception</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_contraception1" name="rad_contraception" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_contraception1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_contraception2" name="rad_contraception" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_contraception2">Thuốc ngừa thai/ <span class="text-primary">Contraceptive pill</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4 mb-2">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_contraception3" name="rad_contraception" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_contraception3">Dụng cụ ngừa thai đặt trong tử cung/ <span class="text-primary">Intrauterine Device</span></label>
                                            <input type="text" class="form-control" id="temperature" />
                                        </div>
                                    </div>

                                    <div class="col-md-4 mb-2">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_contraception4" name="rad_contraception" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_contraception4">Khác/ <span class="text-primary">Other</span></label>
                                            <input type="text" class="form-control" id="temperature" />
                                        </div>
                                    </div>
                                </div>

                                <%-- Musculoskeletal system --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">8. Hệ cơ – xương khớp/ <span class="text-primary">Musculoskeletal system</span></label>
                                    </div>
                                </div>

                                <%-- History --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tiền sử/ <span class="text-primary">History</span></label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Bình thường/ <span class="text-primary">Normal</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Đau khớp/ <span class="text-primary">Joint pain</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Sưng khớp/ <span class="text-primary">Joint swelling</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Sự co rút cơ/ <span class="text-primary">Muscle spasms</span></span>
                                        </label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Liệt/ (1/2 người/2 chi/4 chi)/ <span class="text-primary">Paralysis (Hemi/Para/Tetra):</span></span>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </label>
                                    </div>

                                    <div class="col-md-12">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Đoạn chi/ <span class="text-primary">Amputation:</span></span>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </label>
                                    </div>

                                    <div class="col-md-12">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Cơ bắp co rút/ <span class="text-primary">Contracture:</span></span>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </label>
                                    </div>

                                    <div class="col-md-12">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Lắp bộ phận giả/ <span class="text-primary">Prosthesis:</span></span>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </label>
                                    </div>
                                </div>

                                <%-- Pain --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">9.	Đau/ <span class="text-primary">Pain</span></label>
                                    </div>

                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Hiện đang đau/ <span class="text-primary">Currently in pain</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_currently_in_pain1" name="rad_currently_in_pain" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_currently_in_pain1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_currently_in_pain2" name="rad_currently_in_pain" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_currently_in_pain2">Có, báo bác sĩ/ <span class="text-primary">Yes, inform doctor</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Pain Assessment Description --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Mô tả đánh giá đau/ <span class="text-primary">Pain Assessment Description</span></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">P Nguyên nhân đau<br /><span class="text-primary">Provoking factors <br /><small>(what factors precipitated the discomfort?)</small></span></label>
                                    </div>
                                    </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 1/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                     </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 2/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                     </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 3/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Q Đau như thế nào?/ <span class="text-primary">Quality <br /></span> <small>(Mô tả đau, sự khó chịu) <br /><span class="text-primary">(describe the pain, discomfort, & characteristics of pain)</span></small> </label>
                                    </div>
                                    </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 1/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                    </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 2/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                    </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 3/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">R Nơi đau<br /><span class="text-primary">Region/ Radiation<br /></span> <small> (Đau ở đâu? Đau có lan truyền qua vị trí khác)/
<span class="text-primary">(Where is the pain? Does it radiate?)</span></small></label>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 1/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 2/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 3/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">S Mức độ đau<br /><span class="text-primary">Severity<br /><small>(rate pain score)</small></span></label>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 1/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 2/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 3/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">T Thời gian/ <span class="text-primary">Time<br /></span><small>(Người bệnh đã bị đau trong bao lâu?)/ <span class="text-primary">(how long the patient had the pain?)</span></small></label>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 1/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 2/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-3">
                                        <label class="control-label mb-1">Vị trí 3/ <span class="text-primary">Location 1</span></label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" name="name" value="" class="form-control"/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Sử dụng thuốc giảm đau/ <span class="text-primary">Using painkiller</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_using_painkiller1" name="rad_using_painkiller" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_using_painkiller1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_using_painkiller2" name="rad_using_painkiller" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_using_painkiller2">Có (nếu có báo cho BS điều trị đau)/ <span class="text-primary">Yes (if, yes. Inform a pain specialist)</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Tên thuốc/ <span class="text-primary">Name of painkiller</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Nhận xét/ <span class="text-primary">Comments</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>

                                </div>

                                <%-- 10. Skin & Pressure Sore Risk --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">10.	Da & Nguy cơ loét tỳ đè/ <span class="text-primary">Skin & Pressure Sore Risk</span></label>
                                    </div>

                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Tình trạng/ <span class="text-primary">Condition</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Bình thường/ <span class="text-primary">Normal</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Tái/ <span class="text-primary">Pale</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Đỏ/ <span class="text-primary">Flush</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Vàng da/ <span class="text-primary">Jaundiced</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Khô/ <span class="text-primary">Dry</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Nhờn/ <span class="text-primary">Oily</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Nhiều mồ hôi/ <span class="text-primary">Sweaty</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Phát ban/ <span class="text-primary">Rash</span></span>
                                        </label>
                                    </div>

                                    <%-- Wounds --%>
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Vết thương/ <span class="text-primary">Wounds</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Máu tụ (1)/ <span class="text-primary">Haematoma</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Sự thâm tím (2)/ <span class="text-primary">Bruises</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Rách (3)/ <span class="text-primary">Laceration</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Sẹo (4)/ <span class="text-primary">Scar</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Phỏng (5)/ <span class="text-primary">Burn</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <span class="custom-control-label mb-1">Loét do tì đè (6)/ <span class="text-primary">Pressure sore</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-12 mb-2">
                                        <label class="control-label mb-1">
                                            Biểu thị vùng da với chỉ số tương ứng trên sơ đồ cơ thể và mô tả vết thương dưới dây
                                            <br />
                                            <span class="text-primary">Indicate the location with the corresponding number in the body diagram and describe the wound below.</span></label>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-4">
                                                        <label class="control-label mb-1">Vùng <br /><span class="text-primary">Location</span></label>
                                                    </div>
                                                    <div class="col-8">
                                                        <label class="control-label mb-1">Loại vết thương và mô tả vết thương (vd: kích cỡ, độ sâu, màu...) <br /><span class="text-primary">Wound type and description (i.e. size, depth, colour...)</span></label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-4">
                                                        <input type="text" name="name" value="" class="form-control"/>
                                                    </div>
                                                    <div class="col-8">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control w-5"/>
                                                            <div class="input-group-append">
                                                                <button class="btn btn-outline-secondary" type="button">-</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mt-2">
                                                    <div class="col-md-12">
                                                        <div class="btn btn-secondary">Add row</div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-6">
                                                <label class="control-label mb-1">Chỉ rõ vùng của vết thương bằng chỉ số tương ứng (1-6) dưới đây<br /><span class="text-primary">Specify location of wound with the corresponding number (1-6) below</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 mt-2">
                                        <label class="control-label mb-1">
                                            Đánh giá nguy cơ loét tỳ đè được cải tiến thang Braden<br />
                                            <span class="text-primary">Pressure Sore risk assessment-Modified Braden</span></label>
                                        <label class="control-label mb-1">
                                            <span class="font-bold">Hướng dẫn</span>: So sánh tình trạng của người bệnh với mô tả phù hợp nhất của từng loại. Ghi điểm (bằng số) ở cột bên phải. Cộng lại ở bên dưới để tính.
                                            <br />
                                            <span class="text-primary">
                                                <span class="font-bold">Guidance</span>: Compare the patient’s condition to the most appropriate description for each category. Note the score (written as a number) at the right column. Add up at the bottom to receive the total score.
                                            </span>
                                        </label>
                                    </div>

                                    <div class="col-md-12">
                                        Add table
                                    </div>

                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Nguy cơ loét tỳ đè/ <span class="text-primary">Pressure sore risk</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_pressure_sore_risk1" name="rad_pressure_sore_risk" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_pressure_sore_risk1">Rất cao/ <span class="text-primary">Very high</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_pressure_sore_risk2" name="rad_pressure_sore_risk" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_pressure_sore_risk2">Cao/ <span class="text-primary">High</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_pressure_sore_risk3" name="rad_pressure_sore_risk" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_pressure_sore_risk3">Thấp/ <span class="text-primary">Low</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Cách phòng ngừa tương ứng với những nguy cơ xác định/ <span class="text-primary">Take preventive actions according to the identified risk</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <%-- 11. Ability to perform daily activities --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">11.	Khả năng thực hiện những sinh hoạt hàng ngày/ <span class="text-primary">Ability to perform daily activities</span></label>
                                    </div>
                                </div>

                                <%-- Bathing --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Tắm/ <span class="text-primary">Bathing</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_bathing1" name="rad_bathing" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_bathing1">Tự tắm/ <span class="text-primary">Independent</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_bathing2" name="rad_bathing" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_bathing2">Cần sự hỗ trợ khi tắm/ <span class="text-primary">Assisted in shower</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_bathing3" name="rad_bathing" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_bathing3">Hỗ trợ tắm tại giường/ <span class="text-primary">Assisted in bed</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_bathing4" name="rad_bathing" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_bathing4">Tự tắm tại giường/ <span class="text-primary">Dependent in bed</span></label>
                                        </div>
                                    </div>

                                </div>

                                <%-- Oral care --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Chăm sóc răng miệng/ <span class="text-primary">Oral care</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_oral_care1" name="rad_oral_care" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_oral_care1">Tự làm/ <span class="text-primary">Independent</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_oral_care2" name="rad_oral_care" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_oral_care2">Chỉ chuẩn bị đồ dùng/ <span class="text-primary">Prepare utensils only</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_oral_care3" name="rad_oral_care" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_oral_care3">Hỗ trợ đánh răng/ <span class="text-primary">Assisted to brush teeth</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4 mb-2">
                                        <div class="input-group">
                                            <input type="text" class="form-control w-5" id="oral_care" />
                                            <div class="input-group-append">
                                                <label for="oral_care" class="input-group-text bg-white">lần/ngày/&nbsp;<span class="text-primary">times/day</span></label>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <%-- Dentures --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Răng giả/ <span class="text-primary">Dentures</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_c_dentures1" name="rad_c_dentures" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_c_dentures1">Không có/ <span class="text-primary">None</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_c_dentures2" name="rad_c_dentures" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_c_dentures2">Hàm trên/ <span class="text-primary">Upper</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_c_dentures3" name="rad_c_dentures" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_c_dentures3">Hàm dưới/ <span class="text-primary">Lower</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_c_dentures4" name="rad_c_dentures" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_c_dentures4">Từng phần/ <span class="text-primary">Partial</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Toilet use --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Đi vệ sinh/ <span class="text-primary">Toilet use</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_toilet_use1" name="rad_toilet_use" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_toilet_use1">Tự vệ sinh/ <span class="text-primary">Independent</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_toilet_use2" name="rad_toilet_use" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_toilet_use2">Cần hỗ trợ khi đi vệ sinh/ <span class="text-primary">Assisted to the toilet</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_toilet_use3" name="rad_toilet_use" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_toilet_use3">Cần hỗ trợ trên ghế dùng để tiểu tiện trong phòng/ <span class="text-primary">Assisted on the commode</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_toilet_use4" name="rad_toilet_use" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_toilet_use4">Tã/ <span class="text-primary">Diaper</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_toilet_use5" name="rad_toilet_use" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_toilet_use5">Bô dùng tại giường/ <span class="text-primary">Bedpan/urine bottle</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_toilet_use6" name="rad_toilet_use" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_toilet_use6">Ống thông tiểu đặt ngoài bàng quang/ <span class="text-primary">Urinary condom</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_toilet_use7" name="rad_dentures" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_toilet_use7">Ống thông tiểu/ <span class="text-primary">Urinary catheter</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Toilet use --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Trang phục/ <span class="text-primary">Dressing</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_dressing1" name="rad_dressing" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_dressing1">Tự làm/ <span class="text-primary">Independent</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_dressing2" name="rad_dressing" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_dressing2">Cần hỗ trợ/ <span class="text-primary">With assistance</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Eating/ Feeding --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Ăn/cho ăn/ <span class="text-primary">Eating/ Feeding</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_eating_feeding1" name="rad_eating_feeding" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_eating_feeding1">Tự ăn/ <span class="text-primary">Independent</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_eating_feeding2" name="rad_eating_feeding" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_eating_feeding2">Phụ thuộc về tư thế/ <span class="text-primary">Depend on position</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_eating_feeding3" name="rad_eating_feeding" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_eating_feeding3">Phụ thuộc về ăn uống/ <span class="text-primary">Dependent to eat</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_eating_feeding4" name="rad_eating_feeding" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_eating_feeding4">Cho ăn qua ống/ <span class="text-primary">NG tube/Gastrostomy</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Eating/ Feeding --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Xoay trở tư thế trên giường/ <span class="text-primary">Turning in bed</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_turning_in_bed1" name="rad_turning_in_bed" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_turning_in_bed1">Tự xoay trở/ <span class="text-primary">Independent</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_turning_in_bed2" name="rad_turning_in_bed" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_turning_in_bed2">Không tự xoay trở/ <span class="text-primary">Does not turn independently</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- Ambulation --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Đi lại/ <span class="text-primary">Ambulation</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_ambulation1" name="rad_ambulation" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_ambulation1">Tự đi/ <span class="text-primary">Independent</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_ambulation2" name="rad_ambulation" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_ambulation2">Liệt giường/ <span class="text-primary">Bedfast</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-2">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_ambulation3" name="rad_ambulation" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_ambulation3">Cần hỗ trợ (ghi rõ)/ <span class="text-primary">Need assistance (specify)</span></label>
                                            <input type="text" class="form-control" id="ambulation" />
                                        </div>
                                    </div>
                                </div>

                                <%-- Sleep --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Ngủ/ <span class="text-primary">Sleep</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_sleep1" name="rad_sleep" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_sleep1">Bình thường/ <span class="text-primary">Normal</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_sleep2" name="rad_sleep" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_sleep2">Thức sớm/ <span class="text-primary">Awake early</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_sleep3" name="rad_sleep" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_sleep3">Khó ngủ/ <span class="text-primary">Problem to fall asleep</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_sleep4" name="rad_sleep" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_sleep4">Khó ngủ say/ <span class="text-primary">Problem to sleep through</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Thuốc đã sử dụng/ <span class="text-primary">Medication used</span></label>
                                            <textarea class="form-control" rows="1"></textarea>
                                            <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                        </div>
                                    </div>
                                </div>

                                <%-- 12. High risk of fall assessment using Morse Scale --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">12.	Đánh giá nguy cơ té ngã sử dụng Bảng Morse Scale/ <span class="text-primary">High risk of fall assessment using Morse Scale</span></label>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        Add table
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-md-4">
                                        0-24: Nguy cơ thấp/ <span class="text-primary">Low risk</span>
                                    </div>
                                    <div class="col-md-4">
                                        25-44: Nguy cơ trung bình/ <span class="text-primary">Medium risk</span>

                                    </div>
                                    <div class="col-md-4">
                                        45+: Nguy cơ cao/ <span class="text-primary">High risk</span>
                                    </div>
                                </div>

                                </div>
                    </div>
                </div>

                <%-- D.	KẾ HOẠCH XUẤT VIỆN (HOÀN TẤT TRONG VÒNG 24 GIỜ SAU KHI NHẬP VIỆN)
DISCHARGE PLAN (TO BE COMPLETED WITHIN 24HOURS OF ADMISSION)
                --%>
                <div class="card">
                    <div class="card-header bg-primary">
                        <a data-toggle="collapse" data-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive" href="javascript:void(0)">
                            <h4 class="m-b-0 text-white">D.	KẾ HOẠCH XUẤT VIỆN (HOÀN TẤT TRONG VÒNG 24 GIỜ SAU KHI NHẬP VIỆN)/ DISCHARGE PLAN (TO BE COMPLETED WITHIN 24 HOURS OF ADMISSION)</h4>
                        </a>
                    </div>
                    <div class="card-body collapse show" id="collapseFive" aria-labelledby="headingFive">
                        <div class="form-body">
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Đánh giá lại và mời hội chẩn nếu tình trạng sức khỏe của người bệnh thay đổi. Nếu cần, chuyển bệnh đến khoa thích hợp. Nếu có nghi vấn, thảo luận với bác sĩ phụ trách.
                                            <br />
                                            <span class="text-primary">Reassess and inform if patient’s condition charges. If there is “ Yes” refer to the respective unit. In doubt, discuss with doctor in charge.</span></label>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Nhiều chuyên khoa cùng tham gia điều trị/ <span class="text-primary">Multidisciplinary team involvement</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_mul_team_involvement1" name="rad_mul_team_involvement" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_mul_team_involvement1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_mul_team_involvement2" name="rad_mul_team_involvement" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_mul_team_involvement2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Yêu cầu thiết bị y tế, máy tạo oxy và dịch vụ giúp đỡ chăm sóc tại nhà/ <span class="text-primary">Requires medical equipment, oxygen concentrator and home care help services</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_home_care_services1" name="rad_home_care_services" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_home_care_services1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_home_care_services2" name="rad_home_care_services" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_home_care_services2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Yêu cầu theo dõi điều trị/ <span class="text-primary">Requires follow-up care</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_follow_up_care1" name="rad_follow_up_care" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_follow_up_care1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_follow_up_care2" name="rad_follow_up_care" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_follow_up_care2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Các trường hợp tự tử (cần hội chẩn khẩn cấp)/ <span class="text-primary">Suicidal cases (Urgent referral)</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_suicidal_cases1" name="rad_suicidal_cases" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_suicidal_cases1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_suicidal_cases2" name="rad_suicidal_cases" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_suicidal_cases2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Sống một mình với tình trạng suy giảm chức năng và không được chăm sóc điều trị hay hỗ trợ từ gia đình/ <span class="text-primary">Lives alone with reduced functional status and no other care giver or family support</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_no_other_care_giver1" name="rad_no_other_care_giver" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_no_other_care_giver1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_no_other_care_giver2" name="rad_no_other_care_giver" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_no_other_care_giver2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Mời chuyên gia ngôn ngữ trị liệu hội chẩn (nếu có, báo bác sĩ)/ <span class="text-primary">Referral to speech therapist (if yes, inform doctor)</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_referral_to_physiotherapist1" name="rad_referral_to_physiotherapist " class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_referral_to_physiotherapist1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_referral_to_physiotherapist2" name="rad_referral_to_physiotherapist" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_referral_to_physiotherapist2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Giới thiệu đến chuyên gia dinh dưỡng/ <span class="text-primary">Referral to Dietician</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_referral_to_dietician1" name="rad_referral_to_dietician" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_referral_to_dietician1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_referral_to_dietician2" name="rad_referral_to_dietician" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_referral_to_dietician2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Giới thiệu đến chuyên gia tâm lý/ <span class="text-primary">Referral to Psychologist</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_referral_to_psychologist1" name="rad_referral_to_psychologist" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_referral_to_psychologist1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_referral_to_psychologist2" name="rad_referral_to_psychologist" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_referral_to_psychologist2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Yêu cầu chuyển đến bệnh viện khác/ <span class="text-primary">Requires referral to other hospital</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_referral_to_other_hospital1" name="rad_referral_to_other_hospital" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_referral_to_other_hospital1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_referral_to_other_hospital2" name="rad_referral_to_other_hospital" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_referral_to_other_hospital2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Người nhà hỗ trợ tại nhà/ <span class="text-primary">Support system at home</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_ss_at_home1" name="rad_ss_at_home" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_ss_at_home1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_ss_at_home2" name="rad_ss_at_home" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_ss_at_home2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Người bệnh yêu cầu phương tiện vận chuyển về nhà/ <span class="text-primary">Will patient require transportation arrangements to go home</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_require_transportation1" name="rad_require_transportation" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_require_transportation1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_require_transportation2" name="rad_require_transportation" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_require_transportation2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row  mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Cầu thang bộ tại nhà/ <span class="text-primary">Stairs to climb at home</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_stairs_at_home1" name="rad_stairs_at_home" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_stairs_at_home1">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_stairs_at_home2" name="rad_stairs_at_home" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_stairs_at_home2">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>

                <!-- Row -->
                <%-- E. HƯỚNG DẪN NGƯỜI BỆNH VỀ NHỮNG TIỆN NGHI TRONG PHÒNG VÀ CÁC DỊCH VỤ (HOÀN TẤT TRONG VÒNG 4 GIỜ SAU KHI NHẬP VIỆN).
PATIENT ORIENTATION TO ROOM FACILITIES AND SERVICES (TO BE COMPLETED WITHIN 4 HOURS OF ADMISSION)
 --%>
                <div class="card">
                    <div class="card-header bg-primary">
                        <a data-toggle="collapse" data-target="#collapseSix" aria-expanded="true" aria-controls="collapseSix" href="javascript:void(0)">
                            <h4 class="m-b-0 text-white">E. HƯỚNG DẪN NGƯỜI BỆNH VỀ NHỮNG TIỆN NGHI TRONG PHÒNG VÀ CÁC DỊCH VỤ (HOÀN TẤT TRONG VÒNG 4 GIỜ SAU KHI NHẬP VIỆN)/ PATIENT ORIENTATION TO ROOM FACILITIES AND SERVICES (TO BE COMPLETED WITHIN 4 HOURS OF ADMISSION)</h4>
                        </a>
                    </div>
                    <div class="card-body collapse show" id="collapseSix" aria-labelledby="headingSix">
                            <div class="form-body">

                                <%-- Orientation provided to --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">Hướng dẫn/ <span class="text-primary">Orientation provided to</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_orientation_provided1" name="rad_orientation_provided" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_orientation_provided1">Người bệnh/ <span class="text-primary">Patient</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_orientation_provided2" name="rad_orientation_provided" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_orientation_provided2">Thân nhân/ <span class="text-primary">Relative</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_orientation_provided3" name="rad_orientation_provided" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_orientation_provided3">khác (ghi rõ)/ <span class="text-primary">Others</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_orientation_provided4" name="rad_orientation_provided" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_orientation_provided4">Không áp dụng/ <span class="text-primary">Not applicable</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- 1.	Ward personnel --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">1. Nhân viên lầu trại/ <span class="text-primary">Ward personnel</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_ward_personnel1" name="rad_ward_personnel" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_ward_personnel1">Giới thiệu với điều dưỡng phụ trách và nhân viên khác/ <span class="text-primary">Introduction to Nurse in charge and other staffs</span></label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_ward_personnel2" name="rad_ward_personnel" class="custom-control-input" />
                                            <label class="custom-control-label mb-1" for="rad_ward_personnel2">Giới thiệu với người bệnh khác(trường hợp phòng đôi)/ <span class="text-primary">Introduction to other patient (in case of double beds)</span></label>
                                        </div>
                                    </div>
                                </div>

                                <%-- 2. Physical facilities --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">2. Tiện nghi vật chất/ <span class="text-primary">Physical facilities</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Vị trí lầu trại và giường/ <span class="text-primary">Ward and bed location</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Phòng tắm/toilet/ <span class="text-primary">Bathroom/toilet</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Sử dụng TV/ <span class="text-primary">Use of TV</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Sử dụng điện thoại/ <span class="text-primary">Use of telephone</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Hệ thống gọi điều dưỡng/ <span class="text-primary">Nurse call system</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Trạm điều dưỡng và quầy chính/ <span class="text-primary">Nurse station and main counter</span></span>
                                        </label>
                                    </div>
                                </div>

                                <%-- 3. Policies and procedure --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">3. Chính sách và quy trình/ <span class="text-primary">Policies and procedure</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Khách thăm bệnh, giờ thăm/ <span class="text-primary">Visitors and visiting hours</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Phiếu ở lại đêm/ <span class="text-primary">Over-night pass</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Mặc đồ ờ nhà/ <span class="text-primary">Wearing of home clothes	</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Dịch vụ ăn uống/ <span class="text-primary">Meal service</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Quy trình trước và sau phẫu thuật nếu có/ <span class="text-primary">Pre-and postoperative procedures (if applicable)</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Số liên lạc với lầu trại/ <span class="text-primary">Ward contact number</span></span>
                                        </label>
                                    </div>
                                </div>

                                <%-- 4. Safety precautions --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">4. Biện pháp an toàn/ <span class="text-primary">Safety precautions</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Vị trí cửa thoát hiểm/ <span class="text-primary">Location of fire exits</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Biện pháp phòng ngừa té ngã/ <span class="text-primary">Fall precaution</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Sử dụng vòng đeo tay nhận diện/ <span class="text-primary">Use of identification wrist band</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Nguy cơ cháy-Không hút thuốc trong phạm vi bệnh viện/ <span class="text-primary">Fire hazard- No smoking within the hospital</span></span>
                                        </label>
                                    </div>
                                </div>

                                <%-- 5.	Valuables/Belongings --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">5. Tư trang/ vật dụng cá nhân/ <span class="text-primary">Vital Valuables/Belongings</span></label>
                                    </div>
                                </div>

                                <%-- Dentures --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Răng giả/ <span class="text-primary">Dentures</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_dentures1" name="rad_dentures" class="custom-control-input"/>
                                            <label class="custom-control-label mb-1" for="rad_dentures1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_dentures2" name="rad_dentures" class="custom-control-input"/>
                                            <label class="custom-control-label mb-1" for="rad_dentures2">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Người bệnh giữ/ <span class="text-primary">With patient</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Thân nhân giữ/ <span class="text-primary">With relative</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">ghi rõ/ <span class="text-primary">Specify</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Hàm trên/ <span class="text-primary">Upper</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Hàm dười/ <span class="text-primary">Lower</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Từng phần/ <span class="text-primary">Partial</span></span>
                                        </label>
                                    </div>
                                </div>

                                <%-- Hearing aid --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Máy trợ thính/ <span class="text-primary">Hearing aid</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_hearing_aid1" name="rad_hearing_aid" class="custom-control-input"/>
                                            <label class="custom-control-label mb-1" for="rad_hearing_aid1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_hearing_aid2" name="rad_hearing_aid" class="custom-control-input"/>
                                            <label class="custom-control-label mb-1" for="rad_hearing_aid2">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Người bệnh giữ/ <span class="text-primary">With patient</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Thân nhân giữ/ <span class="text-primary">With relative</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">ghi rõ/ <span class="text-primary">Specify</span></label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">trái/ <span class="text-primary">left</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">phải/ <span class="text-primary">right</span></span>
                                        </label>
                                    </div>
                                </div>

                                <%-- Eye glasses --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Mắt kính/ <span class="text-primary">Eye glasses</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_hearing_aid1" name="rad_hearing_aid" class="custom-control-input"/>
                                            <label class="custom-control-label mb-1" for="rad_hearing_aid1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_hearing_aid2" name="rad_hearing_aid" class="custom-control-input"/>
                                            <label class="custom-control-label mb-1" for="rad_hearing_aid2">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Người bệnh giữ/ <span class="text-primary">With patient</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Thân nhân giữ/ <span class="text-primary">With relative</span></span>
                                        </label>
                                    </div>
                                </div>

                                <%-- Contact lenses --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Kính sát tròng/ <span class="text-primary">Contact lenses</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_contact_lenses1" name="rad_contact_lenses" class="custom-control-input"/>
                                            <label class="custom-control-label mb-1" for="rad_contact_lenses1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_contact_lenses2" name="rad_contact_lenses" class="custom-control-input"/>
                                            <label class="custom-control-label mb-1" for="rad_contact_lenses2">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Người bệnh giữ/ <span class="text-primary">With patient</span></span>
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Thân nhân giữ/ <span class="text-primary">With relative</span></span>
                                        </label>
                                    </div>
                                </div>

                                <%-- Cash/Jewelry --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tiền mặt/nữ trang/ <span class="text-primary">Cash/Jewelry</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_contact_lenses1" name="rad_contact_lenses" class="custom-control-input"/>
                                            <label class="custom-control-label mb-1" for="rad_contact_lenses1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_contact_lenses2" name="rad_contact_lenses" class="custom-control-input"/>
                                            <label class="custom-control-label mb-1" for="rad_contact_lenses2">Có/ <span class="text-primary">Yes</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Người bệnh giữ/ <span class="text-primary">With patient</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Thân nhân giữ/ <span class="text-primary">With relative</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-4">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label mb-1">Trong két an toàn của bệnh viện/ <span class="text-primary">WithIn the safety box</span></span>
                                        </label>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="control-label mb-1">Khác (ghi rõ)/ <span class="text-primary">Other (specify):</span></label>
                                            <input type="text" name="name" value="" class="form-control" />
                                        </div>
                                    </div>
                                
                                </div>

                                <%-- Relative --%>
                                <div class="row">
                                    <div class="col-md-12">
                                        Confirm
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
                <!-- Row -->

                <%-- F. DISCHARGE PLANNING - REASSESSMENT   --%>
                <div class="card">
                    <div class="card-header bg-primary">
                        <a data-toggle="collapse" data-target="#collapseSeven" aria-expanded="true" aria-controls="collapseSeven" href="javascript:void(0)">
                            <h4 class="m-b-0 text-white">F. KẾ HOẠCH XUẤT VIỆN- ĐÁNH GIÁ LẠI/ DISCHARGE PLANNING - REASSESSMENT</h4>
                        </a>
                    </div>
                    <div class="card-body collapse show" id="collapseSeven" aria-labelledby="headingSix">
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <textarea class="form-control" rows="1"></textarea>
                                        <small class="form-control-feedback mt-1 text-danger">This field has error. </small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- G. DISCHARGE PLANNING - REASSESSMENT   --%>
                <div class="card">
                    <div class="card-header bg-primary">
                        <a data-toggle="collapse" data-target="#collapseEight" aria-expanded="true" aria-controls="collapseEight" href="javascript:void(0)">
                            <h4 class="m-b-0 text-white">G.	QUẢN LÝ XUẤT VIỆN (HOÀN THÀNH SỚM NHẤT CÓ THỂ TRONG NGÀY NHẬP VIỆN) ,<br />
                                DISCHARGE MANAGEMENT (TO BE DONE AS EARLY AT THE DAY OF ADMISSION)
                            </h4>
                        </a>
                    </div>
                    <div class="card-body collapse show" id="collapseEight" aria-labelledby="headingSix">
                        <div class="form-body">
                            <div class="row">
                                <div class="col-md-12">
                                    Confirm
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/popper.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
</body>
</html>
