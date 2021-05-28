<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatMedRecPed.aspx.cs" Inherits="EMR.PediatricOutpatientMedicalRecord" ValidateRequest="false" %>

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
            <div style="color: #e20e5a; font-size: 16.6667px;">MEDICAL CERTIFICATE</div>
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
                                    <h4 class="text-primary">PEDIATRIC OUTPATIENT MEDICAL RECORD</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row mb-2">
                                            <label class="control-label mb-2 font-bold">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_chief_complaint" />
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
                                                <label class="control-label mb-1 font-bold">1. Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_medical_history" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>

                                                <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_current_medication" />
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
                                                <label class="control-label">Bản thân/ <span class="text-primary">Personal:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_personal" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label">Gia đình/ <span class="text-primary">Family:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_family" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_allergy1" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="allergy_note_field" type="radio" runat="server" id="rad_allergy2" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>
                                                <div class="form-group allergy_note_field">
                                                    <webUI:TextField runat="server" id="txt_allergy_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                <div class="form-group w-4">
                                                    <input id="txt_vs_temperature" runat="server" class="form-control text-right" />
                                                    <span class="append">°C</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                                <div class="form-group w-5">
                                                    <input id="txt_vs_heart_rate" runat="server" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1 ">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                <div class="form-group w-4">
                                                    <input id="txt_vs_weight" runat="server" class="form-control text-right" />
                                                    <span class="append">Kg</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                <div class="form-group w-5">
                                                    <input id="txt_vs_respiratory_rate" runat="server" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1 ">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                <div class="form-group w-4">
                                                    <input id="txt_vs_height" maxlength="3" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                <div class="form-group w-5">
                                                    <input id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                    <span class="append">mmHg</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2">
                                                <div class="d-flex no-block">
                                                    <label for="bmi" class="control-label w-6 mb-1">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                    <div class="form-group w-5">
                                                        <input id="txt_vs_bmi" runat="server" class="form-control text-right" disabled="disabled" />
                                                        <span class="append">(Kg/m <sup>2</sup>)</span>
                                                    </div>
                                                </div>
                                                <p class="mt-1">
                                                    (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
        applicable for children and pregnant</span>)
                                                </p>
                                            </div>

                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label for="spO2" class="control-label w-6 mb-1">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                <div class="form-group w-4">
                                                    <input id="txt_vs_spO2" runat="server" class="form-control text-right" />
                                                    <span class="append">%</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label for="head-circumference" class="control-label w-6 mb-1">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                <div class="form-group w-4">
                                                    <input id="txt_vs_pulse" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_physical_examination" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1 font-bold">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                                    <webUI:TextField runat="server" id="txt_laboratory_indications_results" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_initial_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_differential_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_associated_conditions" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Điều trị/ <span class="text-primary">Treatment:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="current_medication_field" type="radio" runat="server" id="rad_treatment_code_opd" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_opd">Ngoại trú/ <span class="text-primary">Ambulatory care</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_treatment_code_ipd" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_ipd">Nhập viện/ <span class="text-primary">Admission</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-1">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="transfer_field" type="radio" runat="server" id="rad_treatment_code_trf" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_trf">Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row transfer_field">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_transfer" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row current_medication_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2"><span class="text-primary">5. Current medications:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_medication" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_spec_opinion_requested1" runat="server" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_requested1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8 mb-2">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input type="radio" id="rad_spec_opinion_requested2" runat="server" disabled-for="spec_opinion_requested_note_field" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_requested2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>
                                                <div class="form-group spec_opinion_requested_note_field">
                                                    <webUI:TextField runat="server" id="txt_spec_opinion_requested_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" id="txt_specific_education_required" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="control-label mb-1">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="date_next_appointment_field" type="radio" id="rad_next_appointment1" runat="server" name="rad_next_appointment" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_next_appointment1"><span class="text-primary">Calendar</span></label>
                                                </div>
                                                <div class="form-group date_next_appointment_field">
                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_date_next_appointment" Width="200px" />
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="text_next_appointment_field" type="radio" id="rad_next_appointment2" runat="server" name="rad_next_appointment" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_next_appointment2"><span class="text-primary">Text</span></label>
                                                </div>
                                                <div class="form-group text_next_appointment_field">
                                                    <webUI:TextField runat="server" id="txt_next_appointment" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions mb-3">
                                            <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                            <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                            <asp:Button ID="btnDelete" data-target="#exampleModalCenter" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-danger" runat="server" Text="Delete" />

                                            <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                            <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" OnClientClick="window.print()" Text="Print" />

                                            <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server"  OnClick="btnCancel_Click" Text="Cancel" />
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
  
