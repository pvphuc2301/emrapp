<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObsAtDeliRoom.aspx.cs" Inherits="EMR.ObstetricObservationAtDeliveryRoom" ValidateRequest="false" %>


<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />

</head>
<body>
    <webUI:PrintWindow runat="server" ID="PrintWindow">
        <PrintHeader>
            <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
            <div style="flex-grow: 1; text-align: center;">
                <div style="color: #007297; font-size: 26.6667px;">GIẤY CHỨNG NHẬN ĐIỀU TRỊ</div>
            <div style="color: #e20e5a; font-size: 16.6667px;">MEDICAL CERTIFICATE - Mr Chung test</div>
            </div>
            <div style="width: 200px; text-align: center">
                <div>MAI MAI MÃI1</div>
                <div>05-10-1960 | Nữ</div>
                <webUI:Barcode runat="server" id="Barcode" Text="900000488" Width="200" Height="40" />
                <div>900000488</div>
            </div>
        </PrintHeader>
        <PrintContent>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT" />
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-6">
                   <webUI:Label runat="server" Title="Họ tên bệnh nhân:" SubTitle="Patient's name" />
                    <div class="d-inline-block ml-2 align-top">MAI MAI MÃI1</div>
                </div>
                <div class="col-6">
                   <webUI:Label runat="server" Title="Ngày sinh:" SubTitle="DOB" />
                    <div class="d-inline-block ml-2 align-top">05-10-1960</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Giới tính:" SubTitle="Gender" />
                    <webUI:Label runat="server" Title="Nam" SubTitle="Male" />
                    <webUI:Label runat="server" Title="Nữ " SubTitle="Female" />
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-6">
                    <webUI:Label runat="server" Title="Khoa:" SubTitle="Dept" />
                    <div class="d-inline-block ml-2 align-top">Khoa khám bệnh</div>
                </div>
                <div class="col-6">
                    <webUI:Label runat="server" Title="Mã BN:" SubTitle="Patient ID" />
                    <div class="d-inline-block ml-2 align-top">900000488</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau:" SubTitle="Visited and received treatment at our hospital, with the following information" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Ngày khám bệnh:" SubTitle="Date of visit" />
                    <div class="d-inline-block ml-2 align-top">05-03-2021</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Lý do đến khám:" SubTitle="Chief complaint" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Tóm tắt bệnh sử:" SubTitle="History of present illness" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Tiền sử bệnh:" SubTitle="Past history" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Đặc điểm lâm sàng:" SubTitle="Clinical findings" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Cận lâm sàng được chỉ định:" SubTitle="Para-clinical investigations" />
                    <div class="d-inline-block ml-2 align-top">None;</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Chẩn đoán:" SubTitle="Diagnosis" />
                    <div class="d-inline-block ml-2 align-top">J01.0: Acute maxillary sinusitis/ Viêm xoang hàm cấp;;</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Phương pháp và thuốc điều trị:" SubTitle="Treatment and medications" />
                    <div class="d-inline-block ml-2 align-top">Paracetamol (Perfalgan) 10mg/ml;;</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Thời gian điều trị:" SubTitle="Treatment period" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Lời khuyên và theo dõi:" SubTitle="Recommendation and Follow-up" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-6">

                </div>
                <div class="col-6 mb-2">
                    <div>
                        <webUI:Signature runat="server" Title="BÁC SĨ ĐIỀU TRỊ" SubTitle="ATTENDING DOCTOR" FullName="Dr. Nguyen Dinh My">
                            <ItemTemplate>
                                <webUI:Date runat="server" Day="23" Month="5" Year="2021" />
                            </ItemTemplate>
                        </webUI:Signature>
                    </div>
                </div>
            </div>

        </PrintContent>
    </webUI:PrintWindow>


    <div class="cssclsNoPrint">
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    

<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <webUI:AmendReason runat="server" ID="txt_amendReason" />
                    <webUI:PatientInfo runat="server" ID="PatientInfo1" />

                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">OBSTETRIC OBSERVATION AT DELIVERY ROOM</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row mb-2">
                                            <label class="control-label mb-2">Nhập phòng sinh lúc/ <span class="text-primary">Admission to Delivery room at:</span></label>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_admis_delivery" Width="200px" />
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-2 d-lg-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">Người theo dõi/ <span class="text-primary">Observer’s name:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <webUI:TextField runat="server" id="txt_obs_name" />
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2 d-lg-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">Chức danh/ <span class="text-primary">Initial:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <webUI:TextField runat="server" id="txt_obs_initial" />
                                                </div>
                                            </div>
                                        </div>

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
                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_delivery_at" Width="200px" />
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
                                                    <input id="txt_apgar_score_1" runat="server" class="form-control text-right" />
                                                    <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Phút thứ 5/ <span class="text-primary">5st minute:</span></label>
                                                <div class="form-group">
                                                    <input id="txt_apgar_score_5" runat="server" class="form-control text-right" />
                                                    <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Phút thứ 10/ <span class="text-primary">10st minute:</span></label>
                                                <div class="form-group">
                                                    <input id="txt_apgar_score_10" runat="server" class="form-control text-right" />
                                                    <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Cân nặng lúc sinh/ <span class="text-primary">WOB:</span></label>
                                                <div class="form-group">
                                                    <input id="txt_weight_of_birth" runat="server" class="form-control text-right" />
                                                    <span class="append">gram</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Chiều dài/ <span class="text-primary">Length:</span></label>
                                                <div class="form-group">
                                                    <input id="txt_length_of_birth" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-lg-4 mb-2">
                                                <label class="control-label mb-1">Vòng đầu/ <span class="text-primary">Head circumference:</span></label>
                                                <div class="form-group">
                                                    <input id="txt_head_circum" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-1">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold">Trẻ/ <span class="text-primary">Newborn:</span></label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label font-bold">Đơn thai/ <span class="text-primary">Signleton:</span></label>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_singleton_sex_code1" name="rad_singleton_sex_code" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_singleton_sex_code1">Nam/ <span class="text-primary">Male</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_singleton_sex_code2" name="rad_singleton_sex_code" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_singleton_sex_code2">Nữ/ <span class="text-primary">Female</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label font-bold">Đa thai/ <span class="text-primary">Multiple:</span></label>
                                            </div>

                                            <div class="col-sm-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_multiple_sex_m" />
                                                    <span class="custom-control-label">Nam/ <span class="text-primary">Male</span></span>
                                                </label>
                                            </div>

                                            <div class="col-sm-8">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_multiple_sex_f" />
                                                    <span class="custom-control-label">Nữ/ <span class="text-primary">Female</span></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Dị tật bẩm sinh/ <span class="text-primary">Birth defect:</span></label>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_birth_defect1" name="rad_birth_defect" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_birth_defect1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" runat="server" id="rad_birth_defect2" name="rad_birth_defect" class="custom-control-input" disabled-for="txt_birth_defect_note" />
                                                    <label class="custom-control-label" for="rad_birth_defect2">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>

                                                <div class="form-group txt_birth_defect_note">
                                                    <webUI:TextField runat="server" id="txt_birth_defect_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">Tình trạng trẻ sơ sinh sau sinh/ <span class="text-primary">Neonatal status after birth:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_neonatal_status" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Can thiệp và kết quả/ <span class="text-primary">Intervention and results:</span></label>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_intervention1" name="rad_intervention" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_intervention1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_intervention2" name="rad_intervention" class="custom-control-input" runat="server" disabled-for="intervention_note_field" />
                                                    <label class="custom-control-label" for="rad_intervention2">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>

                                                <div class="form-group intervention_note_field">
                                                    <webUI:TextField runat="server" ID="txt_intervention_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold mb-1">2. Sổ nhau/ <span class="text-primary">Placenta delivery:</span></label>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_placenta_deli1" name="rad_placenta_deli" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_placenta_deli1">Bằng tay/ <span class="text-primary">Manual</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_placenta_deli2" name="rad_placenta_deli" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_placenta_deli2">Tự nhiên/ <span class="text-primary">Spontaneous</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2 d-md-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">At</label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_pacental_deli_dt" Width="200px" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-6 mb-2 d-lg-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label">Cách sổ nhau/ <span class="text-primary">Placenta delivery mode:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <webUI:TextField runat="server" ID="txt_placenta_deli_mode" />
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2 d-lg-flex">
                                                <div class="w-sm-8">
                                                    <label class="control-label mb-1">Cân nặng/ <span class="text-primary">Weight:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <input id="txt_placenta_weight" runat="server" class="form-control text-right" />
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
                                                    <input type="radio" id="rad_umbilical_coil1" name="rad_umbilical_coil" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_umbilical_coil1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-4 col-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_umbilical_coil2" name="rad_umbilical_coil" class="custom-control-input" runat="server" />
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
                                                    <input id="txt_umbilical_length" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>

                                            <div class="col-md-6 mb-2 d-lg-flex">
                                                <div class="w-lg-8">
                                                    <label class="control-label mb-1">Lượng máu mất sau khi sổ nhau/ <span class="text-primary">Quantity of blood loss after placenta delivery:</span></label>
                                                </div>
                                                <div class="form-group flex-grow-1">
                                                    <input id="txt_blood_loss" runat="server" class="form-control text-right" />
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
                                                    <input type="radio" id="rad_p_intervention1" name="rad_p_intervention" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_p_intervention1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_p_intervention2" name="rad_p_intervention" class="custom-control-input" disabled-for="p_intervention_note_field" runat="server" />
                                                    <label class="custom-control-label" for="rad_p_intervention2">Có, chi tiết/ <span class="text-primary">Yes, specify</span></label>
                                                </div>
                                                <div class="form-group p_intervention_note_field">
                                                    <webUI:TextField runat="server" ID="txt_p_intervention_note" />
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
                                                    <input id="txt_spO2" runat="server" class="form-control text-right" />
                                                    <span class="append">%</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">T°:</label>
                                                <div class="form-group">
                                                    <input id="txt_temp" runat="server" class="form-control text-right" />
                                                    <span class="append">°C</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Huyết áp/ <span class="text-primary">BP</span></label>
                                                <div class="form-group">
                                                    <input id="txt_BP" runat="server" class="form-control text-right" />
                                                    <span class="append">mmHg</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Nhịp tim/ <span class="text-primary">HR</span></label>
                                                <div class="form-group">
                                                    <input id="txt_HR" runat="server" class="form-control text-right" />
                                                    <span class="append">lần/phút/bpm</span>
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-4 mb-2">
                                                <label class="control-label mb-1">Nhịp thở/ <span class="text-primary">RR</span></label>
                                                <div class="form-group">
                                                    <input id="txt_RR" runat="server" class="form-control text-right" />
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

                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="vaginal_deli_field" type="radio" id="rad_delivery_mode_code_v" name="rad_delivery_mode_code" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_delivery_mode_code_v">Sanh ngã âm đạo/ <span class="text-primary">Vaginal delivery</span></label>
                                                </div>
                                            </div>

                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="section_field" type="radio" id="rad_delivery_mode_code_s" name="rad_delivery_mode_code" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_delivery_mode_code_s">Sanh mổ/ <span class="text-primary">C-Section:</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4 mb-2">
                                                <div class="vaginal_deli_field">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_vaginal_deli_code_s" name="rad_vaginal_deli_code" class="custom-control-input" runat="server" />
                                                        <label class="custom-control-label" for="rad_vaginal_deli_code_s">Sanh tự nhiên/ <span class="text-primary">Spontaneous</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_vaginal_deli_code_v" name="rad_vaginal_deli_code" class="custom-control-input" runat="server" />
                                                        <label class="custom-control-label" for="rad_vaginal_deli_code_v">Sanh hút/ <span class="text-primary">Vacuum-assisted</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_vaginal_deli_code_f" name="rad_vaginal_deli_code" class="custom-control-input" runat="server" />
                                                        <label class="custom-control-label" for="rad_vaginal_deli_code_f">Sanh kềm/ <span class="text-primary">Forceps-assisted</span></label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-8 mb-2">
                                                <div class="section_field">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_section_code_el" name="rad_section_code" class="custom-control-input" runat="server" />
                                                        <label class="custom-control-label" for="rad_section_code_el">Mổ chương trình/ <span class="text-primary">Elective</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" id="rad_section_code_em" name="rad_section_code" class="custom-control-input" runat="server" />
                                                        <label class="custom-control-label" for="rad_section_code_em">Mổ cấp cứu/ <span class="text-primary">Emergency</span></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">Lí do can thiệp, nếu có/ <span class="text-primary">Reason for intervention, if yes:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_interven_reason" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tầng sinh môn/ <span class="text-primary">Perineum:</span></label>
                                            </div>

                                            <div class="col-sm-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_intact" />
                                                    <span class="custom-control-label">Nguyên vẹn/ <span class="text-primary">Intact</span></span>
                                                </label>
                                            </div>

                                            <div class="col-sm-8 mb-2 d-sm-flex">
                                                <div class="w-sm-7">
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_lacera" disabled-for="pre_lacera_degree" />
                                                        <span class="custom-control-label">Rách, độ/ <span class="text-primary">Laceration, degree:</span></span>
                                                    </label>
                                                </div>

                                                <div class="form-group flex-grow-1 pre_lacera_degree">
                                                    <webUI:TextField runat="server" ID="txt_pre_lacera_degree" />
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_episiotomy" disabled-for="pre_episiotomy_st_field" />
                                                    <span class="custom-control-label">Cắt/ <span class="text-primary">Episiotomy. Nếu có, cách khâu và loại chỉ/ If yes, suture and silk type:</span></span>
                                                </label>

                                                <div class="form-group flex-grow-1 pre_episiotomy_st_field">
                                                    <webUI:TextField runat="server" ID="txt_pre_episiotomy_st" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Cổ tử cung/ <span class="text-primary">Cervix:</span></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_cervix_intact1" name="rad_cervix_intact" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_cervix_intact1">Nguyên vẹn/ <span class="text-primary">Intact</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_cervix_intact2" name="rad_cervix_intact" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_cervix_intact2">Rách/ <span class="text-primary">Laceration</span></label>
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
                                                <label class="control-label mb-1">Chẩn đoán tiền phẫu/ <span class="text-primary">Preoperative diagnosis:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_preo_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label">Chẩn đoán hậu phẫu/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_post_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <asp:UpdatePanel ID="updatePanel_operations" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:GridView
                                                            ShowHeaderWhenEmpty="true"
                                                            ID="grid_operations"
                                                            runat="server"
                                                            CssClass="tb-responsive"
                                                            AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 105px" class="pt-2 pb-2">Ngày/ <span class="text-primary">Date</span> - Giờ/ <span class="text-primary">hour</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div class="form-group">
                                                                            <telerik:RadDateTimePicker ID="date_time" SelectedDate='<%# DBNull.Value.Equals((Eval("date_time"))) ? null : Eval("date_time") %>' Width="200px" runat="server" />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Phương pháp phẫu thuật và vô cảm/ <span class="text-primary">Surgical and Anesthesia methods</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField Value='<%#Eval("surgical_anesthesia") %>' DataKey="surgical_anesthesia" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Phẫu thuật viên/ <span class="text-primary">Surgeon</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField Value='<%#Eval("surgeon") %>' DataKey="surgeon" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Bác sĩ gây mê/ <span class="text-primary">Anesthesiologist</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField Value='<%#Eval("anesthesiologist") %>' DataKey="anesthesiologist" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />

                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:UpdateProgress ID="updateProgress_operations" runat="server" AssociatedUpdatePanelID="updatePanel_operations">
                                                            <ProgressTemplate>
                                                                Please wait....
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                        <div class="mt-2">
                                                            <asp:Button ID="btn_grid_operations_add" OnClick="btn_grid_operations_add_Click" runat="server" CssClass="btn btn-sm btn-outline-primary" Text="Add row" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btn_grid_operations_add" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tai biến/ <span class="text-primary">Incident:</span></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_sur_incident1" name="rad_sur_incident" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_sur_incident1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_sur_incident2" name="rad_sur_incident" class="custom-control-input" disabled-for="sur_incident_note_field" runat="server" />
                                                    <label class="custom-control-label" for="rad_sur_incident2">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>

                                                <div class="form-group sur_incident_note_field">
                                                    <webUI:TextField runat="server" ID="txt_sur_incident_note" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Biến chứng/ <span class="text-primary">Complication:</span></label>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_sur_complication1" name="rad_sur_complication" class="custom-control-input" runat="server" />
                                                    <label class="custom-control-label" for="rad_sur_complication1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_sur_complication2" name="rad_sur_complication" class="custom-control-input" disabled-for="sur_complication_note_field" runat="server" />
                                                    <label class="custom-control-label" for="rad_sur_complication2">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>

                                                <div class="form-group sur_complication_note_field">
                                                    <webUI:TextField runat="server" ID="txt_sur_complication_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label font-bold mb-1">5. Kế hoạch điều trị/ <span class="text-primary">Treatment plan:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_treatment_plan" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-actions mb-3">
                                            <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                            <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                            <asp:Button ID="btnDeleteModal" data-toggle="modal" data-target="#deleteDocumentModal" OnClick="btnAmend_Click" class="btn btn-danger" runat="server" Text="Delete" />

                                            <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                            <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" OnClientClick="window.print()" />

                                            <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                                        </div>

                                        <div class="modal fade" id="deleteDocumentModal" tabindex="-1" role="dialog" aria-labelledby="deleteDocumentModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="deleteDocumentModalLabel">Delete document</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p runat="server">Please provide reason for deletion</p>
                                                        <div class="form-group mb-2">
                                                            <webUI:TextField runat="server" ID="TextField1" />
                                                        </div>
                                                        <div class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <asp:Button runat="server" Text="Delete" ID="btnDelete" class="btn btn-danger" OnClick="btnDelete_Click" />
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnAmend" />
                    <asp:PostBackTrigger ControlID="btnCancel" />
                    <%--<asp:PostBackTrigger ControlID="btnSave" />
                    <asp:PostBackTrigger ControlID="btnComplete" />--%>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
  </div>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>
</html>
