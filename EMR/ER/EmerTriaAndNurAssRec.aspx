<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmerTriaAndNurAssRec.aspx.cs" Inherits="EMR.EmergencyTriageAndNursingAssessmentRecord" %>

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
                            <h4 class="m-b-0 text-white font-bold"><a>Emergency Triage And Nursing Assessment Record</a></h4>
                        </div>
                        <div class="card-body">
                            <form action="#" class="form-horizontal form-bordered">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-6 mb-2 d-sm-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Mã số người bệnh/ <span class="text-primary">PID:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox40" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6 col-md-4 col-lg-6 mb-2 d-lg-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Ngày/ <span class="text-primary">Date:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker3" runat="server" ></telerik:RadDatePicker>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-4 col-lg-6 mb-2 d-md-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Giờ/ <span class="text-primary">Triage Time:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker2" runat="server" ></telerik:RadTimePicker>
                                            </div>
                                        </div>

                                        <div class="col-md-12 col-lg-6 mb-2 d-sm-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Khu vực/ <span class="text-primary">Triage Area #:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox43" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-12 col-lg-6 mb-2 d-sm-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Họ tên/ <span class="text-primary">Patient Name:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox44" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-sm-12 col-md-12 col-lg-6 mb-2 d-sm-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Ngày sinh/ <span class="text-primary">DOB:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker4" runat="server" ></telerik:RadDatePicker>
                                            </div>
                                        </div>

                                        <div class="col-md-12 col-lg-6 mb-2 d-sm-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Quốc tịch/ <span class="text-primary">Nationality:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox45" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-12 col-lg-6 mb-2 d-sm-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Chỗ ở hiện tại/ <span class="text-primary">Home Address:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox46" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-12 col-lg-6 mb-2 d-sm-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Người liên lạc/ <span class="text-primary">Contact:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox47" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-12 col-lg-6 mb-2 d-sm-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Quan hệ/ <span class="text-primary">Relationship:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox48" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-12 col-lg-6 mb-2 d-sm-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Số điện thoại/ <span class="text-primary">Telephone:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" Rows="1" runat="server" ID="RadTextBox49" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                            <label class="control-label mb-1">Than phiền chính/ <span class="text-primary">Chief complaint:</span></label>
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox2" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-2 col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_chief_complaint1" name="rad_chief_complaint" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_chief_complaint1">Hồi sức/ <span class="text-primary">Resuscitation</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-2  col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_chief_complaint2" name="rad_chief_complaint" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_chief_complaint2">Cấp cứu/ <span class="text-primary">Emergency</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_chief_complaint3" name="rad_chief_complaint" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_chief_complaint3">Khẩn trương/ <span class="text-primary">Urgent</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_chief_complaint4" name="rad_chief_complaint" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_chief_complaint4">Trì hoãn/ <span class="text-primary">Less Urgent</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_chief_complaint5" name="rad_chief_complaint" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_chief_complaint5">Không cấp cứu/ <span class="text-primary">Non-Urgent</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- End Chief complaint -->

                                    <!-- Mode of arrival -->
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Đến khoa bằng/ <span class="text-primary">Mode of arrival:</span></label>
                                        </div>
                                    </div>
                                        
                                    <div class="row mb-2">
                                        <div class="col-md-4 col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_mode_arrival1" name="rad_mode_arrival" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_mode_arrival1">Tự đến/ <span class="text-primary">Walk-in</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_mode_arrival2" name="rad_mode_arrival" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_mode_arrival2">Xe lăn/ <span class="text-primary">Wheel chair</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_mode_arrival3" name="rad_mode_arrival" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_mode_arrival3">Xe cấp cứu/ <span class="text-primary">Ambulance</span></label>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Mode of arrival -->

                                    <!-- Chief complaint -->
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tiền căn/ <span class="text-primary">Past Medical History:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox1" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- End Chief complaint -->

                                    <!-- Vital signs -->

                                        
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2 font-bold">Dấu sinh hiệu/ <span class="text-primary">Vital signs</span></label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_blood_pressure" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">mmHg</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Mạch/ <span class="text-primary">Pulse:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_pulse" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1 ">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_temperature" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">°C</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_respiratory_rate" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label for="spO2" class="control-label mb-1">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_spo2" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">%</span>
                                            </div>
                                        </div>

                                        <div class="col-12 mb-1">
                                            <label class="control-label">Tri giác/ <span class="text-primary">LOC-AVPU:</span></label>
                                        </div>

                                            <div class="col-md-4 col-sm-6 mb-2">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_AVPU1" name="rad_AVPU" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_AVPU1">Tỉnh/ <span class="text-primary">A-Alert</span></label>
                                                </div>
                                            </div>

                                        <div class="col-md-4 col-sm-6 mb-2">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_AVPU2" name="rad_AVPU" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_AVPU2">Đáp ứng lời nói/ <span class="text-primary">V-Verbal</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-4 col-sm-6 mb-2">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_AVPU3" name="rad_AVPU" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_AVPU3">Đáp ứng đau/ <span class="text-primary">P-Painful</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-4 col-sm-6 mb-2">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_AVPU4" name="rad_AVPU" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_AVPU4">Không đáp ứng/ <span class="text-primary">U-Unresponsive</span></label>
                                                </div>
                                            </div>
                                    </div>


                                    <!-- End Vital signs -->

                                    <!-- Pain assess -->

                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Đánh giá đau/ <span class="text-primary">Pain assess:</span></label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Khởi phát/ <span class="text-primary">Onset:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox11" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Vị trí/ <span class="text-primary">Location:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox12" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Kéo dài/ <span class="text-primary">Duration:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox13" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Hướng lan/ <span class="text-primary">Radiation:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox14" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-12"><img src="../images/pain_score.png" alt="" style="width: 100%;" /></div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 d-sm-flex">
                                            <div class="w-sm-6">
                                                <label for="pain-scale" class="control-label mb-1">Điểm đau/ <span class="text-primary">Pain scale:</span></label>
                                            </div>

                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox15" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">/10</span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- End Pain assess -->

                                    <div class="row">
                                        <div class="col-md-6 col-sm-6 mb-2">
                                            <div class="form-group">
                                                <label for="pain-scale" class="control-label mb-1 mr-2">Cân nặng/ <span class="text-primary">Weight:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox16" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">kg</span>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-6 mb-2">
                                            <div class="form-group">
                                                <label for="pain-scale" class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox17" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">cm</span>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-6 mb-2">
                                            <div class="form-group">
                                                <label for="pain-scale" class="control-label mb-1 mr-2">Vòng đầu/ <span class="text-primary">Head circumsference:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox19" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label for="pain-scale" class="control-label mb-1">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox18" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Medications used -->
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Thuốc đã dùng/ <span class="text-primary">Medications used:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox20" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- End Medications used -->

                                    <!-- Skin integrity -->

                                    <div class="row">
                                            
                                        <div class="col-md-6 mb-2">
                                            <label class="control-label mb-1 font-bold">SKIN INTEGRITY</label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Rách da/ <span class="text-primary">Laceration (L)</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Trầy xước/ <span class="text-primary">Abrasion (A)</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Bong gân/Căng cơ/ <span class="text-primary">Sprain/Strain (S)</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Bỏng/ <span class="text-primary">Burn (B)</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Biến dạng/ <span class="text-primary">Deformity (D)</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Loét/ <span class="text-primary">Ulceration (U)</span></span>
                                            </label>
                                        </div>

                                        <div class="col-md-6 mb-2">
                                            <label class="control-label mb-1 font-bold">TẦM SOÁT BỆNH LÂY NHIỄM/ <span class="text-primary">Communicable disease screening</span></label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Ho/ <span class="text-primary">Cough</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Sốt/ <span class="text-primary">Fever</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Nổi mần/ <span class="text-primary">Rash</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Đau họng/ <span class="text-primary">Sore throat</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Đi khỏi Việt Nam trong vòng 15 ngày gần đây/ <span class="text-primary">Travel outside Vietnam in past 15 days</span></span>
                                            </label>
                                        </div>
                                            
                                        <div class="col-md-6 mb-2">
                                            <label class="control-label mb-1 font-bold">Kế hoạch xuất viện/ <span class="text-primary">Discharge Planning</span></label>
                                                <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Sống một mình/ <span class="text-primary">Lives alone</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Cần trợ giúp sinh hoạt hàng ngày/ <span class="text-primary">Requires assistance with activities of daily living</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Nguy cơ ngã cao/ <span class="text-primary">high fall risk</span> Nơi cư trú sau khi xuất viện <span class="text-primary">Place of residence after discharge</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Nhà riêng/ <span class="text-primary">Private home</span></span>
                                            </label>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Cơ sở y tế khác/ <span class="text-primary">Other healthcare facility</span></span>
                                            </label>
                                            <label class="control-label mb-1 mt-2">Người chăm sóc sau khi xuất viện <span class="text-primary">People who will look after patient after discharge:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox21" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">TRỞ NGẠI TRONG CHĂM SÓC/ <span class="text-primary">BARRIER TO CARE</span></label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">1. Trở ngại về ngôn ngữ/ <span class="text-primary">Language Barriers:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_language_b1" name="rad_language_b" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_language_b1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="custom-control custom-radio mb-2">
                                                <input disabled-for="language_b2" type="radio" id="rad_language_b2" name="rad_language_b" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_language_b2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox22" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control language_b2" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">2. Trở ngại về nhận thức/ <span class="text-primary">Cognitive Barriers:</span></label>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_cognitive_b1" name="rad_cognitive_b" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_cognitive_b1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="cognitive_b2" type="radio" id="rad_cognitive_b2" name="rad_cognitive_b" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_cognitive_b2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                    </div>
                                            <div class="form-group">
                                                        <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox23" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control cognitive_b2" disabled="disabled"></telerik:RadTextBox>
                                                </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">3. Trở ngại về Giác quan/ <span class="text-primary">Sensory Barriers:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_sensory_b1" name="rad_sensory_b" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_sensory_b1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="sensory_b2" type="radio" id="rad_sensory_b2" name="rad_sensory_b" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_sensory_b2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                    </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox24" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control sensory_b2" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">4. Trở ngại về Tôn giáo/ <span class="text-primary">Religious Barriers:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_religious_b1" name="rad_religious_b" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_religious_b1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="religious_b2" type="radio" id="rad_religious_b2" name="rad_religious_b" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_religious_b2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                </div>
                                            <div class="form-group">
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox25" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control religious_b2" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">5. Trở ngại về Văn hóa/ <span class="text-primary">Cultural Barriers:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_cultural_b1" name="rad_cultural_b" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_cultural_b1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="custom-control custom-radio mb-2">
                                                <input disabled-for="cultural_b" type="radio" id="rad_cultural_b2" name="rad_cultural_b" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_cultural_b2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox26" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control cultural_b" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2 font-bold">ĐÁNH GIÁ THỂ CHẤT CÁC CƠ QUAN/ <span class="text-primary">ASSESSMENT BY SYSTEM:</span></label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-2 d-sm-flex">
                                            <div class="w-sm-8">
                                                <label class="control-label mb-1">Số phòng/ <span class="text-primary">Room number:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox27" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control cultural_b" ></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-block d-xl-flex">
                                            <div class="w-sm-8">
                                                <label class="control-label mb-1">Thời điểm đánh giá/ <span class="text-primary">Time of assessment:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker7" runat="server" ></telerik:RadDatePicker>
                                                <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker10" runat="server" ></telerik:RadTimePicker>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                                <label class="control-label mb-1">Tổng trạng chung/ <span class="text-primary">General appearance:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_gen_app1" name="rad_gen_app" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_gen_app1">Hồng hào/ <span class="text-primary">Pink</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_gen_app2" name="rad_gen_app" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_gen_app2">Tím/ <span class="text-primary">Cyanosis</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_gen_app3" name="rad_gen_app" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_gen_app3">Tái/ <span class="text-primary">Pallor</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Thần kinh/ <span class="text-primary">Neuro:</span></label>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">GCS</label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group m-0 border-0">
                                                <label class="control-label mb-2">Mắt/ <span class="text-primary">E</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox29" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control cultural_b" ></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group m-0 border-0">
                                                <label class="control-label mb-2">Lời nói/ <span class="text-primary">V</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox30" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control cultural_b" ></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group m-0 border-0">
                                                <label class="control-label mb-2">Vận động/ <span class="text-primary">M</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox31" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control cultural_b" ></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_neuro1" name="rad_neuro" class="custom-control-input" checked />
                                                <label class="custom-control-label" for="rad_neuro1">Tỉnh táo/ <span class="text-primary">Alert</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_neuro2" name="rad_neuro" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_neuro2">Hôn mê/ <span class="text-primary">Coma</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="neuro" type="radio" id="rad_neuro3" name="rad_neuro" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_neuro3">Khác/ <span class="text-primary">Others:</span></label>
                                                </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox32" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control neuro" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">Hô hấp/ <span class="text-primary">Respiratory:</span></label>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_respiratory1" name="rad_respiratory" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_respiratory1">Thở đều/ <span class="text-primary">Regular</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_respiratory2" name="rad_respiratory" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_respiratory2">Thở không đều/ <span class="text-primary">Regular</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_respiratory3" name="rad_respiratory" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_respiratory3">Thở nhanh/ <span class="text-primary">Tachypneic</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_respiratory4" name="rad_respiratory" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_respiratory4">Thở nông/ <span class="text-primary">Shallow</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="custom-control custom-radio mb-1">
                                                <input disabled-for="respiratory" type="radio" id="rad_respiratory5" name="rad_respiratory" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_respiratory5">Khác/ <span class="text-primary">Others:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox33" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control respiratory"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">Tim mạch/ <span class="text-primary">Cardiovascular:</span></label>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">Nhịp tim/ <span class="text-primary">Rhythm:</span></label>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_rhythm1" name="rad_rhythm" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_rhythm1">Đều/ <span class="text-primary">Regular</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_rhythm2" name="rad_rhythm" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_rhythm2">Ngưng tim/ <span class="text-primary">Cardiac arrest</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_rhythm3" name="rad_rhythm" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_rhythm3">Đau ngực/ <span class="text-primary">Chest pain</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="custom-control custom-radio mb-2">
                                                <input disabled-for="rhythm" type="radio" id="rad_rhythm4" name="rad_rhythm" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_rhythm4">Khác/ <span class="text-primary">Others:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox34" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control rhythm"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">Tâm lý/ <span class="text-primary">Psychosocial:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_psycho1" name="rad_psycho" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_psycho1">Bình thường/ <span class="text-primary">Normal</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="custom-control custom-radio mb-2">
                                                <input disabled-for="psycho" type="radio" id="rad_psycho2" name="rad_psycho" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_psycho2">Khác/ <span class="text-primary">Others:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox35" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control psycho"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">Các cơ quan khác/ <span class="text-primary">Other systems:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_other_systems1" name="rad_other_systems" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_other_systems1">Bình thường/ <span class="text-primary">Normal</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="custom-control custom-radio mb-2">
                                                <input disabled-for="other_systems" type="radio" id="rad_other_systems2" name="rad_other_systems" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_other_systems2">Khác/ <span class="text-primary">Others:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox36" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control other_systems"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">Sản-phụ</label>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="custom-control mb-1 custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Trầy xước/ <span class="text-primary">Abrasion (A)</span></span>
                                            </label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox37" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control other_systems"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tiền sử thai nghén/ <span class="text-primary">Gravida/PARA:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox38" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control other_systems"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Sẩy/ <span class="text-primary">Abortions:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox39" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control other_systems"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <div class="form-group row">
                                            <div class="col-md-4 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Điều dưỡng thực hiện/ <span class="text-primary">Registered Nurse:</span></label>
                                                    <input type="text" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">Ký tên/ <span class="text-primary">Signature:</span></label>
                                                    <input type="text" placeholder="" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">MSNV/ <span class="text-primary">ID:</span></label>
                                                    <input type="text" placeholder="" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-2 d-md-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1 font-bold">Giờ thông báo Bác sĩ/ <span class="text-primary">Time notified to Doctor:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker1" runat="server" ></telerik:RadDatePicker>
                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker1" runat="server" ></telerik:RadTimePicker>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2 font-bold">Can thiệp/ <span class="text-primary">Procedure:</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2 font-bold">Thời gian/ <span class="text-primary">Time:</span></label>
                                                                </div>
                                                            </td>
                                                            <td style="width: 40%;">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2 font-bold">Ghi chú/ <span class="text-primary">Note:</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2 font-bold">Ký tên/ <span class="text-primary">Signature:</span></label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2 font-bold">Đường huyết mao mạch/ <span class="text-primary">Capillary Blood Glucose:</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker8" runat="server" ></telerik:RadDatePicker>
                                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker12" runat="server" ></telerik:RadTimePicker>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2 font-bold">Điện tim/ <span class="text-primary">ECG:</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker9" runat="server" ></telerik:RadDatePicker>
                                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker11" runat="server" ></telerik:RadTimePicker>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2 font-bold">Thông tiểu/ <span class="text-primary">Urine catheter:</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker10" runat="server" ></telerik:RadDatePicker>
                                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker8" runat="server" ></telerik:RadTimePicker>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2 font-bold">Nẹp / Bó bột / Thay băng/ <span class="text-primary">Splint/Cast/Dressing:</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker11" runat="server" ></telerik:RadDatePicker>
                                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker9" runat="server" ></telerik:RadTimePicker>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2 font-bold">Khác/ <span class="text-primary">Others:</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker12" runat="server" ></telerik:RadDatePicker>
                                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker7" runat="server" ></telerik:RadTimePicker>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2"><span class="text-primary">Time</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2"><span class="text-primary">RR Up</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2"><span class="text-primary">O2Sat %</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2"><span class="text-primary">HR bpm</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2"><span class="text-primary">BP mmHg</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2"><span class="text-primary">Temp °C</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2"><span class="text-primary">GCS</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2"><span class="text-primary">Pain /10</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2"><span class="text-primary">ATS scale</span></label>
                                                                </div>
                                                            </td>
                                                            <td style="width: 40%;">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2 font-bold">Tái đánh giá & Can thiệp/ <span class="text-primary">Re-Assesssment & Intervention</span></label>
                                                                </div>
                                                            </td>
                                                            <td style="width: 20%;">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2 font-bold">Điều dưỡng/ <span class="text-primary">RN’s Initia</span></label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker2" runat="server" ></telerik:RadDatePicker>
                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker3" runat="server" ></telerik:RadTimePicker>
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="11">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <button class="btn btn-secondary">New row</button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <!-- Direct Medication & IV fluids Order -->
                                        <div class="form-group">
                                            <label class="control-label mb-2 font-bold">Y lệnh thuốc & dịch truyền trực tiếp/ <span class="text-primary">Direct Medication & IV fluids Order</span></label>
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">Giờ/ <span class="text-primary">Time</span></label>
                                                                </div>
                                                            </td>
                                                            <td style="width: 35%;">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">
                                                                        THUỐC/ <span class="text-primary">MEDICATION</span>
                                                                        <br />
                                                                        DỊCH TRUYỀN/ <span class="text-primary">IV FLUIDS</span>
                                                                    </label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">LIỀU/ <span class="text-primary">DOSE</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">ĐƯỜNG DÙNG/ <span class="text-primary">ROUTE</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">TỐC ĐỘ/ <span class="text-primary">RATE</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">BÁC SĨ/ <span class="text-primary">DOCTOR</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">GHI CHÚ/ <span class="text-primary">COMMENT</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">Giờ/ <span class="text-primary">Time</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">Chữ kí/ Tên & MSNV/ <span class="text-primary">Signature/ Name & ID</span></label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker5" runat="server" ></telerik:RadDatePicker>
                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker4" runat="server" ></telerik:RadTimePicker>
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker13" runat="server" ></telerik:RadDatePicker>
                                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker6" runat="server" ></telerik:RadTimePicker>
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="9">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <button class="btn btn-secondary">New row</button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- End Direct Medication & IV fluids Order -->

                                        <div class="form-group row">
                                            <div class="col-md-6">
                                                <div class="form-group p-0 m-0 border-0">
                                                    <!-- <label class="control-label mb-2 font-bold text-center">Xuất viện/ <span class="text-primary">Discharged</span></label> -->
                                                    <div class="form-group row p-0 border-0">
                                                        <div class="col-md-6">
                                                            <div class="form-group p-0 m-0 border-0">
                                                                <label class="control-label mb-2 font-bold">Xuất viện/ <span class="text-primary">Discharged</span></label>
                                                                <input type="text" placeholder="" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group p-0 m-0 border-0">
                                                                <label class="control-label mb-2 font-bold">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                                <input type="text" placeholder="" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <label class="custom-control custom-checkbox m-b-0">
                                                        <input type="checkbox" class="custom-control-input" />
                                                        <span class="custom-control-label">Về nhà/ <span class="text-primary">Home</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox m-b-0">
                                                        <input type="checkbox" class="custom-control-input" />
                                                        <span class="custom-control-label">Tự ý/ <span class="text-primary">Against Medical Advice/AMA</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox m-b-0">
                                                        <input type="checkbox" class="custom-control-input" />
                                                        <span class="custom-control-label">Tử vong/ <span class="text-primary">Dead</span></span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group row p-0 border-0">
                                                    <div class="col-md-6">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2 font-bold">Nhập viện/ <span class="text-primary">Admited</span></label>
                                                            <input type="text" placeholder="" class="form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2 font-bold">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                            <input type="text" placeholder="" class="form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 mt-2">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2 font-bold">Khoa tiếp nhận/ <span class="text-primary">Receiving Unit</span></label>
                                                            <input type="text" placeholder="" class="form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mt-2">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2 font-bold">Chuyển viện/ <span class="text-primary">Transfer to</span></label>
                                                            <input type="text" placeholder="" class="form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mt-2">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2 font-bold">bởi BS/ <span class="text-primary">by Dr.</span></label>
                                                            <input type="text" placeholder="" class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Nursing Notes -->
                                        <div class="form-group p-0 m-0 border-0">
                                            <label class="control-label mb-2 font-bold">PHIẾU GHI CHÚ ĐIỀU DƯỠNG/ <span class="text-primary">NURSING NOTES</span></label>
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">
                                                                        NGÀY/ <span class="text-primary">DATE</span><br />
                                                                        dd/mm/yyy
                                                                    </label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">
                                                                        GIỜ PHÚT/ <span class="text-primary">TIME</span><br />
                                                                        hh/mm
                                                                    </label>
                                                                </div>
                                                            </td>
                                                            <td style="width: 30%;">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">THEO DÕI DIỄN TIẾN/ <span class="text-primary">PATIENT CONDITION</span></label>
                                                                </div>
                                                            </td>
                                                            <td style="width: 30%;">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">CAN THIỆP ĐIỀU DƯỠNG/ <span class="text-primary">NURSING INTERVENTION</span></label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">KÝ/GHI TÊN ĐD/ <span class="text-primary">RN’S NAME & SIGNATURE</span></label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker6" runat="server" ></telerik:RadDatePicker>
                                                    
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker5" runat="server" ></telerik:RadTimePicker>
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                            <td class="p-0">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <input type="text" placeholder="" class="form-control" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="5">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <button class="btn btn-secondary">New row</button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- End Nursing Notes -->
                                    </div>
                                </div>
                                <!-- End Assessment by system -->

                                <!-- End Hospitalisation required -->

                                <div class="form-actions mb-3">
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i>Complete</button>
                                    <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i>Save</button>
                                    <button type="button" class="btn btn-secondary">Revert</button>
                                    <button type="button" class="btn btn-secondary">Delete</button>
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
