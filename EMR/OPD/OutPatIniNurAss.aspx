<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatIniNurAss.aspx.cs" Inherits="Emr_client.emr.OutpatientInitialNursingAssessment" %>


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
                                <h4 class="m-b-0 text-white font-bold">Outpatient Initial Nursing Assessment</h4>
                            </a>
                        </div>
                        <div class="card-body collapse show" id="collapseTwo">
                            <form action="#" class="form-horizontal form-bordered">
                                <div class="form-body mb-4">

                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2 font-bold">I. DẤU HIỆU SINH TỒN/ <span class="text-primary">Vital signs</span></label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 ">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_temperature" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control text-right"></telerik:RadTextBox>
                                                <span class="append">°C</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Mạch/ <span class="text-primary">Pulse:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_pulse" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control text-right"></telerik:RadTextBox>
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 ">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_weight" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control text-right"></telerik:RadTextBox>
                                                <span class="append">Kg</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_respiratory_rate" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control text-right"></telerik:RadTextBox>
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 ">Chiều cao/ <span class="text-primary">Height:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_height" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control text-right"></telerik:RadTextBox>
                                                <span class="append">cm</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_blood_pressure" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control text-right"></telerik:RadTextBox>
                                                <span class="append">mmHg</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2">
                                            <label for="bmi" class="control-label mb-1">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_bmi" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control text-right"></telerik:RadTextBox>
                                                <span class="append">(Kg/m <sup>2</sup>)</span>
                                            </div>
                                            <p class="mt-1">(Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
applicable for children and pregnant</span>)</p>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label for="spO2" class="control-label mb-1">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_spo2" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control text-right"></telerik:RadTextBox>
                                                <span class="append">%</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2">
                                            <label for="head-circumference" class="control-label mb-1">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_head_circumference" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control text-right"></telerik:RadTextBox>
                                                <span class="append">cm</span>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- III. ASSESSMENT --%>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label font-bold">II. ĐÁNH GIÁ/ <span class="text-primary">ASSESSMENT:</span></label>
                                        </div>
                                    </div>

                                    <%-- 1. Chief complaint --%>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1 font-bold">1. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_chief_complaint" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- 2. Allergy --%>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">2. Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_allergy1" name="rad_allergy" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_allergy1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div class="custom-control custom-radio mb-1">
                                                <input disabled-for="allergy" type="radio" id="rad_allergy2" name="rad_allergy" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_allergy2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_allergy" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control allergy" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- 3. Allergy --%>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">3. Trạng thái tinh thần/ <span class="text-primary">Mental status:</span></label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Đáp ứng phù hợp/ <span class="text-primary">Appropriate response:</span></label>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_appropriate_response1" name="rad_appropriate_response" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_appropriate_response1">Có/ <span class="text-primary">Yes</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div class="custom-control custom-radio mb-1">
                                                <input disabled-for="appropriate-response" type="radio" id="rad_appropriate_response2" name="rad_appropriate_response" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_appropriate_response2">Không, ghi rõ/ <span class="text-primary">No, specify:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox1" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control appropriate-response" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- 4. Pain score --%>
                                    <div class="row mb-2">
                                        <div class="col-md-4">
                                            <label class="control-label mb-1 font-bold">4. Thang điểm đau/ <span class="text-primary">Pain score:</span></label>
                                        </div>
                                        <div class="col-md-8">
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_pain_score" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <img src="../images/pain_score.png" style="width: 100%" alt="" />
                                        </div>
                                    </div>

                                    <%-- 5. Fall risk MORSE SCALE --%>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold d-block">5. Tầm soát nguy cơ té ngã/ <span class="text-primary">Fall risk MORSE SCALE:</span></label>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_frms1" name="rad_frms" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_frms1">Không có nguy cơ/ <span class="text-primary">No risk </span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div class="custom-control custom-radio mb-1">
                                                <input disabled-for="frms" type="radio" id="rad_frms2" name="rad_frms" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_frms2">Nếu có, cung cấp phương tiện hỗ trợ/ <span class="text-primary">If yes, provide assistance: </span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox2" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control frms" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- 6. Nutritional status screening --%>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold d-block">6. Đánh giá tình trang dinh dưỡng/ <span class="text-primary">Nutritional status screening::</span></label>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_nss1" name="rad_nss" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_nss1">Suy dinh dưỡng/ <span class="text-primary">Malnutrition</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_nss2" name="rad_nss" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_nss2">Bình thường/ <span class="text-primary">Normal</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_nss3" name="rad_nss" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_nss3">Thừa cân hoặc béo phì/ <span class="text-primary">Overweight or obesity</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- III. SOCIAL FACTORS ASSESSMENT (ONLY FOR THE FIRST VISIT) --%>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label font-bold d-block">III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH (DUY NHẤT CHO LẦN KHÁM ĐẦU TIÊN)/ <span class="text-primary">SOCIAL FACTORS ASSESSMENT (ONLY FOR THE FIRST VISIT):</span></label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Tình trạng sinh sống/ <span class="text-primary">Housing</span></label>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_housing1" name="rad_housing" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_housing1">Sống một mình/ <span class="text-primary">Lives alone</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_housing2" name="rad_housing" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_housing2">Sống với người thân/ <span class="text-primary">With relatives</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- IV. PRIORITIZATION --%>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold d-block">IV.	MỨC ĐỘ ƯU TIÊN/ <span class="text-primary">PRIORITIZATION:</span></label>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_prior1" name="rad_prior" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_prior1">Cần được khám ngay/ <span class="text-primary">Immediate consulting requirement</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_prior2" name="rad_prior" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_prior2">Có thể chờ khám trong khoảng thời gian xác định/ <span class="text-primary">Be able to wait for consultation at a specific time</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-actions mb-3">
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
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>

</body>
</html>
