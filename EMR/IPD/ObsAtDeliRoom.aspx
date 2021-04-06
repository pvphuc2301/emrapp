<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObsAtDeliRoom.aspx.cs" Inherits="Emr_client.emr.ObstetricObservationAtDeliveryRoom" %>


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
                                <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseTwo" aria-expanded="true"
                                    aria-controls="collapseTwo">
                                    <h4 class="m-b-0 text-white font-bold">OBSTETRIC OBSERVATION AT DELIVERY ROOM</h4>
                                </a>
                            </div>
                            <div class="card-body collapse show" id="collapseTwo">
                                <form action="#" class="form-horizontal form-bordered">
                                    <div class="form-body">

                                        <div class="row">
                                            <div class="col-md-12 mb-2 d-md-flex">
                                                <div class="w-sm-9">
                                                    <label class="control-label mb-1">Nhập phòng sinh lúc<span class="text-primary">Admission to Delivery room at:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker7" runat="server" ></telerik:RadDatePicker>
                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker10" runat="server" ></telerik:RadTimePicker>
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2 d-lg-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">Người theo dõi/ <span class="text-primary">Observer’s name:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                   <telerik:RadTextBox RenderMode="Lightweight" runat="server" Width="100%" ID="RadTextBox1" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2 d-lg-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">Chức danh/ <span class="text-primary">Initial:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                   <telerik:RadTextBox RenderMode="Lightweight" runat="server" Width="100%" ID="RadTextBox29" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>

                                        </div>

                                        <%-- Neonatal features --%>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">1. Đặc điểm trẻ sơ sinh/ <span class="text-primary">Neonatal features:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2 d-md-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">Sinh lúc/ <span class="text-primary">Delivered at:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker1" runat="server" ></telerik:RadDatePicker>
                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker1" runat="server" ></telerik:RadTimePicker>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold">Điểm số Apgar/ <span class="text-primary">Apgar score:</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Phút thứ nhất/ <span class="text-primary">1st minute:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox37" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control text-right"></telerik:RadTextBox>
                                                    <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Phút thứ 5/ <span class="text-primary">5st minute:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox8" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control text-right"></telerik:RadTextBox>
                                                    <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Phút thứ 10/ <span class="text-primary">10st minute:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox9" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control text-right"></telerik:RadTextBox>
                                                    <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Cân nặng lúc sinh/ <span class="text-primary">WOB:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox5" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control text-right"></telerik:RadTextBox>
                                                    <span class="append">gram</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Chiều dài/ <span class="text-primary">Length:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox6" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control text-right"></telerik:RadTextBox>
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-lg-4 mb-2">
                                                <label class="control-label mb-1">Vòng đầu/ <span class="text-primary">Head circumference:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox7" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control text-right"></telerik:RadTextBox>
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-1">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold">Trẻ/ <span class="text-primary">Newborn:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Dị tật bẩm sinh/ <span class="text-primary">Birth defect:</span></label>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_birth_defect1" name="rad_birth_defect" class="custom-control-input" checked="" />
                                                    <label class="custom-control-label" for="rad_birth_defect1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_birth_defect2" name="rad_birth_defect" class="custom-control-input" disabled-for="birth-defect" />
                                                    <label class="custom-control-label" for="rad_birth_defect2">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>

                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox3" EmptyMessage="" TextMode="MultiLine" Resize="None" Width="100%" CssClass="form-control birth-defect" disabled="disabled"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Tình trạng trẻ sơ sinh sau sinh/ <span class="text-primary">Neonatal status after birth:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox4" EmptyMessage="" TextMode="MultiLine" Resize="None" Width="100%" CssClass="form-control" ></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Can thiệp và kết quả/ <span class="text-primary">Intervention and results:</span></label>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_intervention_results1" name="rad_intervention_results" class="custom-control-input" checked="" />
                                                    <label class="custom-control-label" for="rad_intervention_results1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_intervention_results2" name="rad_intervention_results" class="custom-control-input" disabled-for="intervention-results" />
                                                    <label class="custom-control-label" for="rad_intervention_results2">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>

                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox10" EmptyMessage="" TextMode="MultiLine" Resize="None" Width="100%" CssClass="form-control intervention-results" disabled="disabled"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold mb-1">2. Sổ nhau/ <span class="text-primary">Placenta delivery:</span></label>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_placenta_delivery1" name="rad_placenta_delivery" class="custom-control-input" checked="" />
                                                    <label class="custom-control-label" for="rad_placenta_delivery1">Bằng tay/ <span class="text-primary">Manual</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_placenta_delivery2" name="rad_placenta_delivery" class="custom-control-input" checked="" />
                                                    <label class="custom-control-label" for="rad_placenta_delivery2">Tự nhiên/ <span class="text-primary">Spontaneous</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2 d-md-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">At</label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker2" runat="server" ></telerik:RadDatePicker>
                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker2" runat="server" ></telerik:RadTimePicker>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-6 mb-2 d-lg-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label">Cách sổ nhau/ <span class="text-primary">Placenta delivery mode:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox12" Width="100%" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2 d-lg-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">Cân nặng/ <span class="text-primary">Weight:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" Width="100%" ID="RadTextBox2" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                    <span class="append">gram</span>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Dây rốn quấn cổ/ <span class="text-primary">Umbilical coil:</span></label>
                                            </div>

                                            <div class="col-sm-4 col-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_umbilical_coil1" name="rad_umbilical_coil" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_umbilical_coil1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-4 col-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_umbilical_coil2" name="rad_umbilical_coil" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_umbilical_coil2">Có/ <span class="text-primary">Yes</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-2 d-lg-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">Chiều dài dây rốn/ <span class="text-primary">Umbilical length:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox14" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2 d-lg-flex">
                                                <div class="w-lg-8">
                                                    <label class="control-label mb-1">Lượng máu mất sau khi sổ nhau/ <span class="text-primary">Quantity of blood loss after placenta delivery:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox11" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                    <span class="append">ml</span>
                                                </div>
                                            </div>

                                        </div>


                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Can thiệp và kết quả/ <span class="text-primary">Intervention and results:</span></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_intervention_results_b_1" name="rad_intervention_results_b" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_intervention_results_b_1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_intervention_results_b_2" name="rad_intervention_results_b" class="custom-control-input" disabled-for="intervention-results1" />
                                                    <label class="custom-control-label" for="rad_intervention_results_b_2">Có, chi tiết/ <span class="text-primary">Yes, specify</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox15" EmptyMessage="" TextMode="MultiLine" Resize="None" Width="100%" CssClass="form-control intervention-results1" disabled="disabled"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold mb-1">3. Tình trạng sản phụ sau sinh/ <span class="text-primary">Maternal status after delivery:</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">SpO2:</label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox16" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control text-right"></telerik:RadTextBox>
                                                    <span class="append">%</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">T°:</label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox17" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control text-right"></telerik:RadTextBox>
                                                    <span class="append">°C</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Huyết áp/ <span class="text-primary">BP</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox18" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control text-right"></telerik:RadTextBox>
                                                    <span class="append">mmHg</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Nhịp tim/ <span class="text-primary">HR</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox19" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control text-right"></telerik:RadTextBox>
                                                    <span class="append">lần/phút/bpm</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Nhịp thở/ <span class="text-primary">RR</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox20" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control text-right"></telerik:RadTextBox>
                                                    <span class="append">lần/phút/bpm</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold mb-1">Tổng trạng chung/ <span class="text-primary">General appearance:</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Phương pháp sinh/ <span class="text-primary">Delivery mode:</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Sanh ngã âm đạo/ <span class="text-primary">Vaginal delivery:</span></label>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_vaginal_delivery1" name="rad_vaginal_delivery" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_vaginal_delivery1">Sanh tự nhiên/ <span class="text-primary">Spontaneous</span></label>
                                                </div>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_vaginal_delivery2" name="rad_vaginal_delivery" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_vaginal_delivery2">Sanh hút/ <span class="text-primary">Vacuum-assisted</span></label>
                                                </div>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_vaginal_delivery3" name="rad_vaginal_delivery" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_vaginal_delivery3">Sanh kềm/ <span class="text-primary">Forceps-assisted</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Sanh mổ/ <span class="text-primary">C-Section:</span></label>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_c_section1" name="rad_c_section" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_c_section1">Mổ chương trình/ <span class="text-primary">Elective</span></label>
                                                </div>
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_c_section2" name="rad_c_section" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_c_section2">Mổ cấp cứu/ <span class="text-primary">Emergency</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Lí do can thiệp, nếu có/ <span class="text-primary">Reason for intervention, if yes:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox21" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tầng sinh môn/ <span class="text-primary">Perineum:</span></label>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_perineum1" name="rad_perineum" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_perineum1">Nguyên vẹn/ <span class="text-primary">Intact</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-8 mb-2 d-sm-flex">
                                                <div class="w-sm-7">
                                                    <div class="custom-control custom-radio mb-1">
                                                        <input type="radio" id="rad_perineum2" name="rad_perineum" class="custom-control-input" disabled-for="laceration-degree" />
                                                        <label class="custom-control-label" for="rad_perineum2">Rách, độ/ <span class="text-primary">Laceration, degree:</span></label>
                                                    </div>
                                                </div>

                                                <div class="form-group flex-grow-1">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox22" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control laceration-degree" disabled="disabled"></telerik:RadTextBox>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_perineum3" name="rad_perineum" class="custom-control-input" disabled-for="episiotomy" />
                                                    <label class="custom-control-label" for="rad_perineum3">Cắt/ <span class="text-primary">Episiotomy. Nếu có, cách khâu và loại chỉ/ If yes, suture and silk type:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox23" EmptyMessage="" TextMode="MultiLine" Resize="None" Width="100%" CssClass="form-control episiotomy" disabled="disabled"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Cổ tử cung/ <span class="text-primary">Cervix:</span></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_cervix1" name="rad_cervix" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_cervix1">Nguyên vẹn/ <span class="text-primary">Intact</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_cervix2" name="rad_cervix" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_cervix2">Rách/ <span class="text-primary">Laceration</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold mb-1">4. Thông tin phẫu thuật (nếu có)/ <span class="text-primary">Operation details (if possible):</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Chẩn đoán tiền phẫu/ <span class="text-primary">Preoperative diagnosis:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox24" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control" ></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label">Chẩn đoán hậu phẫu/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox25" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control" ></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">Add table</div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tai biến/ <span class="text-primary">Incident:</span></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_incident1" name="rad_incident" class="custom-control-input" checked="" />
                                                    <label class="custom-control-label" for="rad_incident1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_incident2" name="rad_incident" class="custom-control-input" disabled-for="incident" />
                                                    <label class="custom-control-label" for="rad_incident2">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>

                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox26" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control incident" disabled="disabled"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Biến chứng/ <span class="text-primary">Complication:</span></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_complication1" name="rad_complication" class="custom-control-input" checked="" />
                                                    <label class="custom-control-label" for="rad_complication1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_complication2" name="rad_complication" class="custom-control-input" disabled-for="complication" />
                                                    <label class="custom-control-label" for="rad_complication2">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>

                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox27" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control complication" disabled="disabled"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <div class="form-group">
                                                    <label class="control-label font-bold mb-1">5. Kế hoạch điều trị/ <span class="text-primary">Treatment plan:</span></label>
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox28" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control complication" disabled="disabled"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- End Assessment by system -->
                                        <!-- End Hospitalisation required -->
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
