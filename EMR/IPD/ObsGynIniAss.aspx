<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObsGynIniAss.aspx.cs" Inherits="Emr_client.Emr.ObstetricAndGynecologicalInitialAssessment" %>

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
                                <h4 class="m-b-0 text-white font-bold">OBSTETRIC & GYNECOLOGICAL INITIAL ASESMENT</h4>
                            </a>
                        </div>
                        <div class="card-body collapse show" id="collapseTwo">
                            <div class="form-body">
                                    <!-- Chief complaint -->
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">I. Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox Width="100%" RenderMode="Lightweight" runat="server" ID="RadTextBox5" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1 font-bold">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label></div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input visible-for="obstetrics" type="radio" id="rad_medical_history1" name="rad_medical_history" class="custom-control-input"/>
                                                <label class="custom-control-label" for="rad_medical_history1"> SẢN KHOA/ <span class="text-primary">OBSTETRICS</span></label>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" visible-for="gynecology" id="rad_medical_history2" name="rad_medical_history" class="custom-control-input"/>
                                                <label class="custom-control-label" for="rad_medical_history2">PHỤ KHOA/ <span class="text-primary">GYNECOLOGY</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">1. Bệnh sử hiện tại/ <span class="text-primary">Current medical history:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox Width="100%" RenderMode="Lightweight" runat="server" ID="RadTextBox1" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2 obstetrics">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1 font-bold">SẢN KHOA/ <span class="text-primary">OBSTETRICS:</span></label>
                                            </div>
                                        </div>
                                    </div>
                                        
                                    <div class="row obstetrics">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Kinh chót/ <span class="text-primary">LMP:</span></label>
                                        </div>

                                        <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">từ/ <span class="text-primary">from:</span></label>

                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTimePicker RenderMode="Classic" ID="RadTimePicker1" runat="server" ></telerik:RadTimePicker>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">đến/ <span class="text-primary">to:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTimePicker RenderMode="Classic" ID="RadTimePicker2" runat="server" ></telerik:RadTimePicker>
                                            </div>
                                        </div>
                                    </div>
     
                                    <!-- SẢN KHOA/ OBSTETRICS  -->

                                    <div class="row obstetrics">
                                        <div class="col-sm-12 mb-2 d-sm-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Tuổi thai/ <span class="text-primary">Gestational age:</span></label>
                                            </div>
                                            <div class="row flex-grow-1">
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="txt_temperature" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                    <span class="append">tuần/ <span class="text-primary">weeks</span></span>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox2" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                    <span class="append">ngày/ <span class="text-primary">days</span></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2 obstetrics">
                                        <div class="col-md-12">
                                                <label class="control-label mb-1">Khám thai/ <span class="text-primary">Prenatal visit:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox7" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2 obstetrics">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Chủng ngừa uốn ván/ <span class="text-primary">Tetanus vaccination:</span></label>
                                        </div>

                                        <div class="col-sm-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_tetanus1"
                                                    name="rad_tetanus" class="custom-control-input"
                                                    checked=""/>
                                                <label class="custom-control-label"
                                                    for="rad_tetanus1">
                                                    Chưa/ <span class="text-primary">Not
                                        yet</span></label>
                                            </div>
                                        </div>
                                        <div class="col-sm-8">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_tetanus2" name="rad_tetanus" class="custom-control-input" disabled-for="tetanus-vaccination"/>
                                                <label class="custom-control-label mb-2" for="rad_tetanus2">Có/ <span class="text-primary">yes</span></label>
                                            </div>

                                            <div class="form-group">
                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox3" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control tetanus-vaccination" disabled="disabled"></telerik:RadTextBox>
                                                    <span class="append">ngày/ <span class="text-primary">days</span></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2 obstetrics">
                                        <div class="col-md-12">
                                            <label class="control-label">Nhiễm Streptococcus nhóm B/ <span class="text-primary">GBS infection:</span></label>
                                        </div>
                                    </div>

                                    <div class="row mb-2 obstetrics">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Con trước nhiễm trùng huyết do Streptococcus nhóm B/ <span class="text-primary">Previous infant with invasive GBS disease:</span></label>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_gbs_a1" name="rad_gbs_a"
                                                    class="custom-control-input" checked="" />
                                                <label class="custom-control-label" for="rad_gbs_a1">
                                                    Không/
                                        <span class="text-primary">No</span></label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_gbs_a2" name="rad_gbs_a"
                                                    class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_gbs_a2">
                                                    Có/ <span
                                                        class="text-primary">Yes</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2 obstetrics">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">
                                            Nhiễm trùng tiểu do Streptococcus nhóm B
                                trong thai kỳ lần này/ <span class="text-primary">GBS bacteriuria during
                                any trimester of the current pregnancy:</span></label>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_gbs_b1" name="rad_gbs_b"
                                                    class="custom-control-input"/>
                                                <label class="custom-control-label" for="rad_gbs_b1">
                                                    Không/
                                                <span class="text-primary">No</span></label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_gbs_b2" name="rad_gbs_b"
                                                    class="custom-control-input"/>
                                                <label class="custom-control-label" for="rad_gbs_b2">
                                                    Có/ <span
                                                        class="text-primary">Yes</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2 obstetrics">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">
                                            Cấy tầm soát phết âm đạo – trực tràng
                                dương tính Streptococcus nhóm B trong tam cá nguyệt cuối thai kỳ lần
                                này/ <span class="text-primary">Positive GBS vaginal-rectal screening
                                culture in late gestation during current pregnancy:</span></label>
                                        </div>
                                        <div class="col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_gbs_c1" name="rad_gbs_c"
                                                        class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_gbs_c1">
                                                        Không/
                                            <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_gbs_c2" name="rad_gbs_c"
                                                        class="custom-control-input"/>
                                                    <label class="custom-control-label" for="rad_gbs_c2">
                                                        Có/ <span
                                                            class="text-primary">Yes</span></label>
                                                </div>
                                            </div>
                                        </div>

                                    <div class="row mb-2 obstetrics">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                Cấy tầm soát phết âm đạo – trực tràng
                                    dương tính Streptococcus nhóm B trong tam cá nguyệt cuối thai kỳ lần
                                    này/ <span class="text-primary">Positive GBS vaginal-rectal screening
                                    culture in late gestation during current pregnancy:</span></label>
                                            </div>
                                            <div class="col-sm-6">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_gbs_c1" name="rad_gbs_c"
                                                            class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_gbs_c1">
                                                            Không/
                                                <span class="text-primary">No</span></label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_gbs_c2" name="rad_gbs_c"
                                                            class="custom-control-input"/>
                                                        <label class="custom-control-label" for="rad_gbs_c2">
                                                            Có/ <span
                                                                class="text-primary">Yes</span></label>
                                                    </div>
                                                </div>
                                        </div>

                                    <div class="row mb-2 obstetrics">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                Đái tháo đường thai kỳ/ <span
                                                    class="text-primary">Gestational Diabetes:</span></label>
                                            </div>
                                                <div class="col-sm-6">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_gestational_diabetes1"
                                                            name="rad_gestational_diabetes" class="custom-control-input"
                                                            />
                                                        <label class="custom-control-label"
                                                            for="rad_gestational_diabetes1">
                                                            Không/ <span
                                                                class="text-primary">No</span></label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_gestational_diabetes2"
                                                            name="rad_gestational_diabetes"
                                                            class="custom-control-input"/>
                                                        <label class="custom-control-label"
                                                            for="rad_gestational_diabetes2">
                                                            Có/ <span
                                                                class="text-primary">Yes</span></label>
                                                    </div>
                                                </div>
                                        </div>

                                    <div class="row mb-2 obstetrics">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                Bất thường khác trong thai kỳ/ <span
                                                    class="text-primary">Other gestational abnormalities:</span></label>
                                            </div>
                                                <div class="col-sm-6">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_other_gestational_abnormalities1"
                                                            name="rad_other_gestational_abnormalities"
                                                            class="custom-control-input" />
                                                        <label class="custom-control-label"
                                                            for="rad_other_gestational_abnormalities1">
                                                            Không/ <span
                                                                class="text-primary">No</span></label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_other_gestational_abnormalities2"
                                                            name="rad_other_gestational_abnormalities"
                                                            class="custom-control-input" />
                                                        <label class="custom-control-label"
                                                            for="rad_other_gestational_abnormalities2">
                                                            Có/ <span
                                                                class="text-primary">Yes</span></label>
                                                    </div>
                                                </div>
                                        </div>

                                    <div class="row obstetrics">
                                        <div class="col-sm-12 mb-2 d-sm-flex">
                                            <div class="w-sm-8">
                                                <label class="control-label mb-1">Chuyển dạ khởi phát lúc/ <span class="text-primary">Labor triggered at:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadDatePicker RenderMode="Classic" Width="120px" ID="RadDatePicker3" runat="server"></telerik:RadDatePicker>
                                                <telerik:RadTimePicker RenderMode="Classic" Width="110px" ID="RadTimePicker3" runat="server" ></telerik:RadTimePicker>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2 obstetrics">
                                            <div class="col-md-12">
                                                    <label class="control-label mb-1">Dấu hiệu ban đầu/ <span class="text-primary">Preliminary signs:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox Width="100%" RenderMode="Lightweight" runat="server" ID="RadTextBox4" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                    <div class="row mb-2 obstetrics">
                                            <div class="col-md-12">
                                                    <label class="control-label mb-1">Diễn tiến/ <span class="text-primary">Progression:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadTextBox Width="100%" RenderMode="Lightweight" runat="server" ID="RadTextBox6" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                </div>
                                            </div>
                                        </div>

                                    <!-- PHỤ KHOA/ GYNECOLOGY -->
                                    <div class="row mb-2 obstetrics">
                                        <div class="col-md-12">
                                                <label class="control-label mb-1">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox Width="100%" RenderMode="Lightweight" runat="server" ID="RadTextBox8" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 2. Tiền sử bệnh/ Antecedent medical history -->
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label font-bold">2. Tiền sử bệnh/ <span class="text-primary">Antecedent medical history:</span></label>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Cá nhân/ <span class="text-primary">Personal:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox9" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox10" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-1">
                                            <label class="control-label font-bold">3. Tiền căn phụ khoa/ <span class="text-primary">Gynecological history:</span></label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                            <div class="w-sm-8">
                                                <label class="control-label mb-1">Tuổi dậy thì/ <span class="text-primary">Age of menarche:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox11" Width="100%" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                            <div class="w-sm-8">
                                                <label class="control-label mb-1">Chu kỳ kinh/ <span class="text-primary">Menstrual cycle:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox62" Width="100%" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                            <div class="w-sm-8">
                                                <label class="control-label mb-1">Số ngày hành kinh/ <span class="text-primary">Length of period:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox63" Width="100%" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">ngày/<span class="text-primary">day(s)</span></span>
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                            <div class="w-sm-8">
                                                <label class="control-label mb-1">Lượng máu kinh/ <span class="text-primary">Amount of menstrual blood:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox12" Width="100%" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                            <div class="w-sm-8">
                                                <label class="control-label mb-1">Tuổi kết hôn/ <span class="text-primary">Marriage age:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox13" Width="100%" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                            <div class="w-sm-8">
                                                <label class="control-label mb-1">Tuổi mãn kinh/ <span class="text-primary">Age of menopause:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox14" Width="100%" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                    </div>

                                <div class="row mb-2">
                                    <div class="col-sm-12">
                                            <label class="control-label mb-1">Những bệnh phụ khoa đã mắc trước đây/ <span class="text-primary">Previous gynecological diseases:</span></label>
                                        <div class="form-group">
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox17" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>
                                </div>

                                        <div class="row mb-2">
                                        <div class="col-md-12">
                                                <label class="control-label mb-1">4. Tiền căn sản khoa/ <span class="text-primary">Obstetric history</span></label>
                                        </div>
                                            <div class="col-md-12">
                                                <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Lần mang thai thứ/ <span class="text-primary">gravidity</span></label>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">1</label>
                                                        </div>
                                                    </td>
                                                    <td class="w-5">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">2</label>
                                                        </div>
                                                    </td>
                                                    <td class="w-5">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">3</label>
                                                        </div>
                                                    </td>
                                                    <td class="w-5">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">4</label>
                                                        </div>
                                                    </td>
                                                    <td class="w-5">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">5</label>
                                                        </div>
                                                    </td>
                                                    <td class="w-5">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">6</label>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td >
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Năm/ <span class="text-primary">Year</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control w-5" />
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control w-5" />
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control w-5" />
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control w-5" />
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control w-5" />
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control w-5" />
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Sanh đủ tháng/ <span class="text-primary">term delivery</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Sanh non tháng/ <span class="text-primary">preterm delivery</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Sảy thai/ <span class="text-primary">miscarriage</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Hút thai/ <span class="text-primary">aspiration abortion</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Nạo thai/ <span class="text-primary">dilation and evacuation</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Thủ thuật Kovac/ <span class="text-primary">Kovac’s procedure</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Thai ngoài tử cung/ <span class="text-primary">ectopic</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Thai trứng/ <span class="text-primary">molar pregnancy</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Thai lưu/ <span class="text-primary">stillbirth</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Sinh sống/ <span class="text-primary">living child</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Cân nặng/ <span class="text-primary">weight</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Phương pháp sinh/ <span class="text-primary">delivery mode</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <label class="control-label mb-2">Biến chứng/ <span class="text-primary">complication</span></label>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                    <td class="pl-1 pr-1">
                                                        <div class="form-group p-0 m-0 border-0">
                                                            <input type="text" placeholder="" class="form-control"/>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                            </div>
                                    </div>


                                    <div class="row mb-2 obstetrics">
                                        <div class="col-md-12 mb-1">
                                            <label class="control-label font-bold">III. Khám lâm sàng/ <span class="text-primary">Physical examination:</span></label>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">1. Khám tổng quát/ <span class="text-primary">General exam:</span></label>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tổng trạng/ <span class="text-primary">General appearance:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox20" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-1">
                                            <label class="control-label">Phù/ <span class="text-primary">Edema:</span></label>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_edema1" name="rad_edema" class="custom-control-input" checked=""/>
                                                <label class="custom-control-label" for="rad_edema1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-8 mb-2">
                                            <div class="custom-control custom-radio mb-1">
                                                <input type="radio" id="rad_edema2" name="rad_edema" class="custom-control-input" disabled-for="edema"/>
                                                <label class="custom-control-label" for="rad_edema2" >Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                            </div>

                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox18" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control edema" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Hệ tim mạch/ <span class="text-primary">Cardiovascular system:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox19" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Hệ hô hấp/ <span class="text-primary">Respiratory system:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox21" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Hệ tiêu hóa/ <span class="text-primary">Digestive system:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox22" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Hệ thần kinh/ <span class="text-primary">Nervous system:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox23" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Hệ niệu-dục/ <span class="text-primary">Urogenital system:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox24" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Hệ cơ-xương-khớp/ <span class="text-primary">Musculoskeletal system:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox25" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tai Mũi Họng/ <span class="text-primary">Otorhinolaryngology:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox26" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Hệ da-lông/ <span class="text-primary">Integumentary system:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox27" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Mắt/ <span class="text-primary">Ophthalmology:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox28" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Ghi nhận khác/ <span class="text-primary">Other findings:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox29" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-1">
                                            <label class="control-label">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological consultation required:</span></label>
                                        </div>

                                        <div class="col-md-4 mb-1">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_pcr1" name="rad_pcr" class="custom-control-input" checked=""/>
                                                <label class="custom-control-label" for="rad_pcr1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>
                                            
                                        <div class="col-md-8 mb-2">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_pcr2" name="rad_pcr" class="custom-control-input"/>
                                                <label class="custom-control-label" for="rad_pcr2">Có/ <span class="text-primary">Yes</span></label>
                                            </div>
                                        </div>

                                    </div>
                                       
                                </div>

                                <div class="row obstetrics">
                                    <div class="col-md-12 mb-1">
                                        <label class="control-label font-bold">2. Khám chuyên khoa/ <span class="text-primary">Specific exam:</span></label>
                                    </div>

                                    <div class="col-md-12 mb-1">
                                        <label class="control-label font-bold">Khám ngoài/ <span class="text-primary">External exam:</span></label>
                                    </div>

                                    <div class="col-md-12 mb-1">
                                        <label class="control-label mb-1">Vết mổ cũ/ <span class="text-primary">Previous cicatrice:</span></label>
                                        <label class="custom-control custom-checkbox ml-2" style="display: initial">
                                            <input type="checkbox" class="custom-control-input"/>
                                            <span class="custom-control-label"></span>
                                        </label>
                                    </div>

                                    <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                        <div class="w-sm-8">
                                            <label class="control-label mb-1">Hình dáng tử cung/ <span class="text-primary">Uterine shape:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox15" Width="100%" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                        <div class="w-sm-8">
                                            <label class="control-label mb-1">Tư thế/ <span class="text-primary">Posture:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox16" Width="100%" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                        <div class="w-sm-8">
                                            <label class="control-label mb-1">Bề cao tử cung/ <span class="text-primary">Fundal height:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox31" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                            <span class="append">cm</span>
                                        </div>
                                    </div>

                                <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                        <div class="w-sm-8">
                                            <label class="control-label mb-1">chu vi vòng bụng/ <span class="text-primary">Fundal height:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox30" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                            <span class="append">cm</span>
                                        </div>
                                    </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="control-label mb-1">Cơn gò tử cung/ <span class="text-primary">Uterine contraction:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox32" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                        <div class="w-sm-8">
                                            <label class="control-label mb-1">Tần số tim thai/ <span class="text-primary">Fetal heart rate:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox33" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                            <span class="append">lần/phút/bpm</span>
                                        </div>
                                    </div>

                                <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                        <div class="w-sm-8">
                                            <label class="control-label mb-1">Ngực/ <span class="text-primary">Breasts:</span></label>
                                        </div>
                                        <div class="form-group flex-grow-1">
                                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox34" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                        </div>
                                    </div>

                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <label class="control-label font-bold">Khám trong/ <span class="text-primary">Internal exam:</span></label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                    <div class="w-sm-8">
                                        <label class="control-label mb-1">Chỉ số Bishop/ <span class="text-primary">Bishop score:</span></label>
                                    </div>
                                    <div class="form-group flex-grow-1">
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox35" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                        <span class="append">điểm/ <span class="text-primary">points</span></span>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                    <div class="w-sm-8">
                                        <label class="control-label mb-1">Âm hộ/ <span class="text-primary">Vulva:</span></label>
                                    </div>
                                    <div class="form-group flex-grow-1">
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox36" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                    <div class="w-sm-8">
                                        <label class="control-label mb-1">Âm đạo/ <span class="text-primary">Vagina:</span></label>
                                    </div>
                                    <div class="form-group flex-grow-1">
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox37" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                    <div class="w-sm-8">
                                        <label class="control-label mb-1">Cổ tử cung/ <span class="text-primary">Cervix:</span></label>
                                    </div>
                                    <div class="form-group flex-grow-1">
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox38" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                    <div class="w-sm-8">
                                        <label class="control-label mb-1">Phần phụ/ <span class="text-primary">Adnexa:</span></label>
                                    </div>
                                    <div class="form-group flex-grow-1">
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox39" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <label class="control-label">Tình trạng ối/ <span class="text-primary">Membrane condition:</span></label>
                                </div>

                                <div class="col-md-4 mb-1">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_membrane_condition1" name="rad_membrane_condition" class="custom-control-input" checked=""/>
                                        <label class="custom-control-label" for="rad_membrane_condition1">Nguyên vẹn/ <span class="text-primary">Intact</span></label>
                                    </div>
                                </div>
                                            
                                <div class="col-md-8 mb-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_membrane_condition2" name="rad_membrane_condition" class="custom-control-input"/>
                                        <label class="custom-control-label" for="rad_membrane_condition2">Đã vỡ/ <span class="text-primary">Ruptured</span></label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2 d-sm-flex">
                                    <div class="w-sm-7">
                                        <label class="control-label mb-1">Ối vỡ lúc/ <span class="text-primary">Rupture of membrance at:</span></label>
                                    </div>
                                    <div class="form-group flex-grow-1">
                                        <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker7" runat="server" ></telerik:RadDatePicker>
                                        <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker10" runat="server" ></telerik:RadTimePicker>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-md-4 mb-1">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_rupture_membrane1" name="rad_rupture_membrane" class="custom-control-input" checked=""/>
                                        <label class="custom-control-label" for="rad_rupture_membrane1">Tự nhiên/ <span class="text-primary">Spontaneous</span></label>
                                    </div>
                                </div>
                                            
                                <div class="col-md-8">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_rupture_membrane2" name="rad_rupture_membrane" class="custom-control-input"/>
                                        <label class="custom-control-label" for="rad_rupture_membrane2">Can thiệp/ <span class="text-primary">Interventional</span></label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <label class="control-label">Đặc điểm dịch ối/ <span class="text-primary">Features of amniotic fluid:</span></label>
                                </div>

                                <div class="col-md-4 mb-1">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_foaf1" name="rad_foaf" class="custom-control-input" checked=""/>
                                        <label class="custom-control-label" for="rad_foaf1">Bình thường/ <span class="text-primary">Normal</span></label>
                                    </div>
                                </div>
                                            
                                <div class="col-md-4 mb-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_foaf2" name="rad_foaf" class="custom-control-input"/>
                                        <label class="custom-control-label" for="rad_foaf2">Thiểu ối/ <span class="text-primary">Oligohydramnios</span></label>
                                    </div>
                                </div>
                                            
                                <div class="col-md-4 mb-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_foaf3" name="rad_foaf" class="custom-control-input"/>
                                        <label class="custom-control-label" for="rad_foaf3">Đa ối/ <span class="text-primary">Polyhydramnios</span></label>
                                    </div>
                                </div>
                                            
                                <div class="col-md-4 mb-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_foaf4" name="rad_foaf" class="custom-control-input"/>
                                        <label class="custom-control-label" for="rad_foaf4">Trong/ <span class="text-primary">Clear</span></label>
                                    </div>
                                </div>
                                         
                                <div class="col-md-4 mb-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_foaf5" name="rad_foaf" class="custom-control-input"/>
                                        <label class="custom-control-label" for="rad_foaf5">Nhuộm phân su/ <span class="text-primary">Meconium-stained</span></label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <label class="control-label">Ngôi thai/ <span class="text-primary">Presentation:</span></label>
                                </div>

                                <div class="col-md-4 mb-1">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_presentation1" name="rad_presentation" class="custom-control-input" checked=""/>
                                        <label class="custom-control-label" for="rad_presentation1">Đầu/ <span class="text-primary">Cephalic</span></label>
                                    </div>
                                </div>
                                            
                                <div class="col-md-4 mb-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_presentation2" name="rad_presentation" class="custom-control-input"/>
                                        <label class="custom-control-label" for="rad_presentation2">Mông/ <span class="text-primary">Breech</span></label>
                                    </div>
                                </div>
                                            
                                <div class="col-md-4 mb-2">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="rad_presentation3" name="rad_presentation" class="custom-control-input"/>
                                        <label class="custom-control-label" for="rad_presentation3">Ngôi khác/ <span class="text-primary">Others, specify</span></label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-md-12">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Vị trí ngôi thai/ <span class="text-primary">Fetal position:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox43" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-md-12">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Khám khung chậu/ <span class="text-primary">Pelvic exam:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox44" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <label class="control-label font-bold">2. Khám chuyên khoa/ <span class="text-primary">Specific exam:</span> (Cho phụ khoa)/ <span class="text-primary">For Gyneacology:</span></label>
                                </div>

                                <div class="col-md-12 mb-1">
                                        <label class="control-label font-bold">Khám ngoài/ <span class="text-primary">External examination:</span></label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <label class="control-label mb-1">Bụng có sẹo phẫu thuật cũ/<span class="text-primary">Abdominal Surgery Scars:</span></label>
                                    <label class="custom-control custom-checkbox mb-2">
                                        <input type="checkbox" class="custom-control-input"/>
                                        <span class="custom-control-label">Lý do/<span class="text-primary">Reason:</span> </span>
                                    </label>

                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox42" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Sờ nắn và đo ngoài tử cung <br /><span class="text-primary">Uterine Height:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox45" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <label class="control-label font-bold">Khám trong/ <span class="text-primary">Internal examination:</span></label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Âm hộ/ <span class="text-primary">Vulva:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox48" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>

                                <div class="col-md-12 mb-2">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Tầng sinh môn/ <span class="text-primary">Perineum:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox46" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-1">
                                    <label class="control-label">Khám mỏ vịt/ <span class="text-primary">Speculum examination</span></label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-2">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Âm đạo/ <span class="text-primary">Vagina:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox47" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 mb-2">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Dịch tiết/ <span class="text-primary">Discharge:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox49" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>
                                
                            <div class="row">
                                <div class="col-md-6 mb-2">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Âm đạo/ <span class="text-primary">Vagina:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox50" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 mb-2">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Dịch tiết/ <span class="text-primary">Discharge:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox51" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-2">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Cổ tử cung/ <span class="text-primary">Cervix:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox52" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>

                                <div class="col-md-6 mb-2">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Tử cung/ <span class="text-primary">Uterus:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox53" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Phần phụ/ <span class="text-primary">Adnexa:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox54" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <div class="form-group apply-grid-2">
                                        <label class="control-label mb-1">Các túi cùng/ <span class="text-primary">Douglas pouchs:</span></label>
                                        <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox55" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <label class="control-label font-bold mb-2">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox56" EmptyMessage="" Width="100%" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <label class="control-label font-bold">V. Conclusion/ <span class="text-primary">Kết luận:</span></label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox57" EmptyMessage="" Width="100%" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox58" EmptyMessage="" Width="100%" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox59" EmptyMessage="" Width="100%" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12 mb-2">
                                    <label class="control-label mb-1">Kế hoạch điều trị/ <span class="text-primary">Treatment Plan:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox60" EmptyMessage="" Width="100%" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                                <div class="row">
                                <div class="col-md-12 mb-2">
                                    <label class="control-label mb-1">Kế hoạch xuất viện/ <span class="text-primary">Discharge plan:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox61" EmptyMessage="" Width="100%" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>


                            <div class="row">

                                    <%-- Internal exam --%>
                                    <div class="col-md-12">
                                        <label class="control-label font-bold">Khám trong/ <span class="text-primary">Internal exam:</span></label>
                                    </div>

                                    <%-- Vulva --%>
                                    <div class="col-sm-4 mb-1">
                                        <label class="control-label mb-1">Âm hộ/ <span class="text-primary">Vulva:</span></label>
                                    </div>

                                    <div class="col-sm-8 mb-2">
                                        <input type="text" class="form-control" />
                                        <br />
                                        <small class="form-control-feedback text-danger">This field has error. </small>
                                    </div>

                                    <%-- Vagina --%>
                                    <div class="col-sm-4 mb-1">
                                        <label class="control-label mb-1">Âm đạo/ <span class="text-primary">Vagina:</span></label>
                                    </div>

                                    <div class="col-sm-8 mb-2">
                                        <input type="text" class="form-control" />
                                        <br />
                                        <small class="form-control-feedback text-danger">This field has error. </small>
                                    </div>

                                    <%-- Perineum --%>
                                    <div class="col-sm-4 mb-1">
                                        <label class="control-label mb-1">Tầng sinh môn/ <span class="text-primary">Perineum:</span></label>
                                    </div>

                                    <div class="col-sm-8 mb-2">
                                        <input type="text" class="form-control" />
                                        <br />
                                        <small class="form-control-feedback text-danger">This field has error. </small>
                                    </div>

                                    <%-- Cervix --%>
                                    <div class="col-sm-4 mb-1">
                                        <label class="control-label mb-1">Cổ tử cung/ <span class="text-primary">Cervix:</span></label>
                                    </div>

                                    <div class="col-sm-8 mb-2">
                                        <input type="text" class="form-control" />
                                        <br />
                                        <small class="form-control-feedback text-danger">This field has error. </small>
                                    </div>

                                        <%-- Adnexa --%>
                                    <div class="col-sm-4 mb-1">
                                        <label class="control-label mb-1">Phần phụ/ <span class="text-primary">Adnexa:</span></label>
                                    </div>

                                    <div class="col-sm-8 mb-2">
                                        <input type="text" class="form-control" />
                                        <br />
                                        <small class="form-control-feedback text-danger">This field has error. </small>
                                    </div>

                                    <%-- Membrane condition --%>
                                    <div class="col-md-12">
                                        <label class="control-label mb-1">Tình trạng ối/ <span class="text-primary">Membrane condition:</span></label>
                                    </div>

                                    <div class="col-sm-4 mb-1">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_membrance_con1" name="rad_membrance_con" class="custom-control-input" checked=""/>
                                            <label class="custom-control-label" for="rad_membrance_con1">Nguyên vẹn/ <span class="text-primary">Intact</span></label>
                                        </div>
                                    </div>

                                    <div class="col-sm-8 mb-2">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" id="rad_membrance_con2" name="rad_membrance_con" class="custom-control-input"/>
                                            <label class="custom-control-label" for="rad_membrance_con2">Đã vỡ/ <span class="text-primary">Ruptured</span></label>
                                        </div>
                                    </div>

                                    <%-- Bishop score --%>
                                    <div class="col-md-4 mb-1">
                                        <label class="control-label mb-1">Chỉ số Bishop/ <span class="text-primary">Bishop score:</span></label>
                                    </div>

                                    <div class="col-md-8 mb-2">
                                        <input type="text" class="form-control append-text" />
                                        <span style="margin-left: -60px;">points</span>
                                        <small class="form-control-feedback text-danger">This field has error. </small>
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
