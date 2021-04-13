<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InpIniMedAss.aspx.cs" Inherits="EMR.InpatientInitialMedicalAssessment" %>


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

<div class="preloader">
    <div class="loader">
        <div class="loader__figure"></div>
        <p class="loader__label">AIH Hospital</p>
    </div>
</div>
        
<div class="scroll-sidebar h-100 w-100">
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
                <div class="card-header bg-primary">
                    <h4 class="m-b-0 text-white font-bold"><a>INPATIENT INITIAL MEDICAL ASSESSMENT</a></h4>
                </div>
                <div class="card-body">
                    <div class="form-body">
                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1 font-bold">I. Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox7" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
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
                                    <label class="control-label mb-2 font-bold">1. Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox1" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-2 font-bold">Thuốc đang sử dụng hiện tại/ <span class="text-primary">Current medications :</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox2" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label class="control-label mb-1 font-bold">2. Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Bản thân/ <span class="text-primary">Personal:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox3" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Bệnh lý/ <span class="text-primary">Diseases:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox4" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Phẩu thuật/ <span class="text-primary">Operation:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox5" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Chấn thương/ <span class="text-primary">Trauma:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox6" EmptyMessage="" TextMode="MultiLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label class="control-label mb-1">Quá trình sinh trưởng và phát triển/ <span class="text-primary">Growth and Development:</span></label>
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
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12 d-sm-flex mb-2">
                                <div class="w-sm-8">
                                    <label class="control-label mb-1">Con thứ mấy/ <span class="text-primary">Birth order:</span></label>
                                </div>
                                <div class="form-group flex-grow-1">
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox8" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="col-md-12 d-sm-flex mb-2">
                                <div class="w-sm-8">
                                    <label class="control-label mb-1">Cân nặng lúc sinh/ <span class="text-primary">Weight of Birth:</span></label>
                                </div>
                                <div class="form-group flex-grow-1">
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox21" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="col-md-12 d-sm-flex mb-2">
                                <div class="w-sm-8">
                                    <label class="control-label mb-1">Dị tật bẩm sinh/ <span class="text-primary">Congenital malformation:</span></label>
                                </div>
                                <div class="form-group flex-grow-1">
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox9" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="col-md-12 d-sm-flex mb-2">
                                <div class="w-sm-8">
                                    <label class="control-label mb-1">Phát triển về tinh thần/ <span class="text-primary">Neurological development:</span></label>
                                </div>
                                <div class="form-group flex-grow-1">
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox10" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="col-md-12 d-sm-flex mb-2">
                                <div class="w-sm-8">
                                    <label class="control-label mb-1">Phát triển về vận động/ <span class="text-primary">Motor development:</span></label>
                                </div>
                                <div class="form-group flex-grow-1">
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox23" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="col-md-12 d-sm-flex mb-2">
                                <div class="w-sm-8">
                                    <label class="control-label mb-1">Chế độ dinh dưỡng/ <span class="text-primary">Regimen:</span></label>
                                </div>
                                <div class="form-group flex-grow-1">
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox11" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="col-md-12 d-sm-flex mb-2">
                                <div class="w-sm-8">
                                    <label class="control-label mb-1">Tiêm chủng/ <span class="text-primary">Immunization:</span></label>
                                </div>
                                <div class="form-group flex-grow-1">
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox12" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>

                            <div class="col-md-12 d-sm-flex mb-2">
                                <div class="w-sm-8">
                                    <label class="control-label mb-1">Tiêm chủng/ <span class="text-primary">Immunization:</span></label>
                                </div>
                                <div class="form-group flex-grow-1">
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox13" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label class="control-label mb-1">Thói quen/ <span class="text-primary">Habits:</span></label>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <label class="control-label mb-1">Hút thuốc lá/ <span class="text-primary">Smoking:</span></label>
                            </div>
                            <div class="col-md-4">
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="rad_smoking1" name="rad_smoking" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_smoking1">Không/ <span class="text-primary">No</span></label>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="custom-control custom-radio mb-2">
                                    <input disabled-for="rad_smoking" type="radio" id="rad_smoking2" name="rad_smoking" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_smoking2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                </div>
                                <div class="form-group">
                                    <telerik:RadTextBox
                                        RenderMode="Lightweight"
                                        Width="100%"
                                        runat="server"
                                        ID="RadTextBox22"
                                        EmptyMessage=""
                                        TextMode="MultiLine"
                                        Resize="None"
                                        CssClass="form-control rad_smoking"
                                        disabled="disabled"
                                    ></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <label class="control-label mb-1">Uống rượu/ <span class="text-primary">Alcohol:</span></label>
                            </div>
                            <div class="col-md-4">
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="rad_alcohol1" name="rad_alcohol" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_alcohol1">Không/ <span class="text-primary">No</span></label>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="custom-control custom-radio mb-2">
                                    <input disabled-for="rad_smoking" type="radio" id="rad_alcohol2" name="rad_alcohol" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_alcohol2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                </div>
                                <div class="form-group">
                                    <telerik:RadTextBox
                                        RenderMode="Lightweight"
                                        Width="100%"
                                        runat="server"
                                        ID="RadTextBox15"
                                        EmptyMessage=""
                                        TextMode="MultiLine"
                                        Resize="None"
                                        CssClass="form-control rad_smoking"
                                        disabled="disabled"
                                    ></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <label class="control-label mb-1">Uống rượu/ <span class="text-primary">Alcohol:</span></label>
                            </div>
                            <div class="col-md-4">
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="rad_alcohol1" name="rad_alcohol" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_alcohol1">Không/ <span class="text-primary">No</span></label>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="custom-control custom-radio mb-2">
                                    <input disabled-for="rad_smoking" type="radio" id="rad_alcohol2" name="rad_alcohol" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_alcohol2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                </div>
                                <div class="form-group">
                                    <telerik:RadTextBox
                                        RenderMode="Lightweight"
                                        Width="100%"
                                        runat="server"
                                        ID="RadTextBox16"
                                        EmptyMessage=""
                                        TextMode="MultiLine"
                                        Resize="None"
                                        CssClass="form-control rad_smoking"
                                        disabled="disabled"
                                    ></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <label class="control-label mb-1">Chất gây nghiện/ <span class="text-primary">Drugs:</span></label>
                            </div>
                            <div class="col-md-4">
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="rad_drugs1" name="rad_drugs" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_drugs1">Không/ <span class="text-primary">No</span></label>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="custom-control custom-radio mb-2">
                                    <input disabled-for="rad_smoking" type="radio" id="rad_drugs2" name="rad_drugs" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_drugs2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                </div>
                                <div class="form-group">
                                    <telerik:RadTextBox
                                        RenderMode="Lightweight"
                                        Width="100%"
                                        runat="server"
                                        ID="RadTextBox17"
                                        EmptyMessage=""
                                        TextMode="MultiLine"
                                        Resize="None"
                                        CssClass="form-control rad_smoking"
                                        disabled="disabled"
                                    ></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <label class="control-label mb-1">Tập thể dục thường xuyên/ <span class="text-primary">Regular physical exercise:</span></label>
                            </div>
                            <div class="col-md-4">
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="rad_re_phy_exe1" name="rad_re_phy_exe" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_re_phy_exe1">Không/ <span class="text-primary">No</span></label>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="custom-control custom-radio mb-2">
                                    <input disabled-for="rad_smoking" type="radio" id="rad_re_phy_exe2" name="rad_re_phy_exe" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_re_phy_exe2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                </div>
                                <div class="form-group">
                                    <telerik:RadTextBox
                                        RenderMode="Lightweight"
                                        Width="100%"
                                        runat="server"
                                        ID="RadTextBox18"
                                        EmptyMessage=""
                                        TextMode="MultiLine"
                                        Resize="None"
                                        CssClass="form-control rad_smoking"
                                        disabled="disabled"
                                    ></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label class="control-label mb-1">Khác, Ghi rõ/ <span class="text-primary">Other, Specify:</span></label>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <label class="control-label mb-1">Tiền sử dị ứng/ <span class="text-primary">Allergy:</span></label>
                            </div>
                            <div class="col-md-4">
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="rad_allergy1" name="rad_allergy" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_allergy1">Không/ <span class="text-primary">No</span></label>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="custom-control custom-radio mb-2">
                                    <input disabled-for="rad_allergy" type="radio" id="rad_allergy2" name="rad_allergy" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_allergy2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                </div>
                                <div class="form-group">
                                    <telerik:RadTextBox
                                        RenderMode="Lightweight"
                                        Width="100%"
                                        runat="server"
                                        ID="RadTextBox19"
                                        EmptyMessage=""
                                        TextMode="MultiLine"
                                        Resize="None"
                                        CssClass="form-control rad_allergy"
                                        disabled="disabled"
                                    ></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                <div class="form-group">
                                    <telerik:RadTextBox RenderMode="Lightweight" runat="server" Width="100%" ID="RadTextBox20" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <label class="control-label font-bold">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <label class="control-label mb-2 font-bold">I. DẤU HIỆU SINH TỒN/ <span class="text-primary">VITAL SIGNS</span></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6 mb-2">
                                <label class="control-label mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                <div class="form-group">
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_temperature" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    <span class="append">°C</span>
                                </div>
                            </div>

                            <div class="col-sm-6 mb-2">
                                <label class="control-label mb-1">Mạch/ <span class="text-primary">Pulse:</span></label>
                                <div class="form-group">
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_pulse" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    <span class="append">/phút (m)</span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6 mb-2">
                                <label class="control-label mb-1">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                <div class="form-group">
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txtWeight" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    <span class="append">Kg</span>
                                </div>
                            </div>
                            <div class="col-sm-6 mb-2">
                                <label class="control-label mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                <div class="form-group">
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txtRespiratoryRate" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    <span class="append">/phút (m)</span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6 mb-2">
                                <label class="control-label mb-1">Chiều cao/ <span class="text-primary">Height:</span></label>
                                <div class="form-group">
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txtHeight" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    <span class="append">cm</span>
                                </div>
                            </div>
                            <div class="col-sm-6 mb-2">
                                <label class="control-label mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                <div class="form-group">
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txtBloodPressure" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    <span class="append">mmHg</span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6 mb-2">
                                <label for="bmi" class="control-label mb-1">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                <div class="form-group">
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txtBmi" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    <span class="append">(Kg/m <sup>2</sup>)</span>
                                </div>
                                <p class="mt-1">(Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not applicable for children and pregnant</span>)</p>
                            </div>

                            <div class="col-sm-6 mb-2">
                                <label for="spO2" class="control-label mb-1">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                <div class="form-group">
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txtSpo2" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    <span class="append">%</span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6 mb-2">
                                <label for="head-circumference" class="control-label mb-1">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                <div class="form-group">
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txtHeadCircumference" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                    <span class="append">cm</span>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Tổng trạng/ <span class="text-primary">General appearance:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox14" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Hệ tim mạch/ <span class="text-primary">Cardiovascular system:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox24" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Hệ hô hấp/ <span class="text-primary">Respiratory system:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox25" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Hệ thần kinh/ <span class="text-primary">Nervous system:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox26" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <label class="control-label">Hệ niệu-dục/ <span class="text-primary">Urogenital system:</span></label>
                            </div>

                            <div class="col-4">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="rad_urogenital_system1" name="rad_urogenital_system" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_urogenital_system1">Male</label>
                                </div>
                            </div>

                            <div class="col-4">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="rad_urogenital_system2" name="rad_urogenital_system" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_urogenital_system2">Female</label>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <div class="form-group">
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox38" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Hệ cơ-xương-khớp/ <span class="text-primary">Musculoskeletal system:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox27" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Hệ cơ-xương-khớp/ <span class="text-primary">Musculoskeletal system:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox28" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Tai Mũi Họng/ <span class="text-primary">Otorhinolaryngology:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox29" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Hệ da-lông/ <span class="text-primary">Integumentary system:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox30" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Mắt/ <span class="text-primary">Ophthalmology:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox31" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Ghi nhận khác/ <span class="text-primary">Other findings:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox32" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <label class="control-label">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological consultation required:</span></label>
                            </div>

                            <div class="col-md-4">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="rad_pcr1" name="rad_pcr" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_pcr1">Không/ <span>No</span> </label>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" id="rad_pcr2" name="rad_pcr" class="custom-control-input" />
                                    <label class="custom-control-label" for="rad_pcr2">Có/ <span>Yes</span> </label>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1 font-bold">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox37" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1 font-bold">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox36" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox35" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox34" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Kế hoạch điều trị/ <span class="text-primary">Treatment Plan:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox33" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-2">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label mb-1">Kế hoạch xuất viện / <span class="text-primary">Discharge plan:</span></label>
                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox39" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                </div>
                            </div>
                        </div>

                        <!-- End Hospitalisation required -->

                        <div class="form-actions mb-3">
                            <button type="submit " class="btn btn-primary"><i class="fa fa-check"></i> Complete</button>
                            <button type="submit " class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
                            <button type="button " class="btn btn-secondary">Revert</button>
                            <button type="button " class="btn btn-secondary">Delete</button>
                        </div>
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