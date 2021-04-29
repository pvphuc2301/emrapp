﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatMedRecPed.aspx.cs" Inherits="EMR.PediatricOutpatientMedicalRecord" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    
        <div class="preloader">
            <div class="loader">
                <div class="loader__figure"></div>
                <p class="loader__label">AIH Hospital</p>
            </div>
        </div>

        <div class="scroll-sidebar h-100 w-100">
            
            <div class="row" id="amendReasonBox" runat="server">
                <div class="col-md-12">
                    <div class="card amend-box">
                        <div class="card-header">
                            <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span><span class="text-danger">*</span></h5>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <input id="txtAmendReason" class="contenteditable" runat="server" value="" />
                            </div>
                            <div id="lblAmendReasonError" class="text-danger" runat="server">Nội dung lý do thay đổi phải trên 3 ký tự</div>
                        </div>
                    </div>
                </div>
            </div>

            <uc1:PatientInfo runat="server" ID="PatientInfo" />

            <div class="row" style="margin-bottom: 50px;">
                <div class="col-lg-12">
                    <div class="card mt-2">
                        <div class="card-header">
                            <h4 class="text-primary">PEDIATRIC OUTPATIENT MEDICAL RECORD</h4>
                            <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                        </div>
                        <div class="card-body collapse show" id="collapseOne" aria-labelledby="headingOne">
                            <div class="form-body">
                                <form id="form1" runat="server">
                                    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
                                    <div class="row mb-2">
                                        <label class="control-label mb-2 font-bold">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <input id="txtChiefComplaint" class="contenteditable" runat="server" value="" />
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
                                                <input id="txtMedicalHistory" class="contenteditable" runat="server" value="" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>

                                            <div class="form-group">
                                                <input id="txtCurrentMedication" class="contenteditable" runat="server" value="" />
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
                                                <input id="txtPersonal" class="contenteditable" runat="server" value="" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label">Gia đình/ <span class="text-primary">Family:</span></label>
                                            <div class="form-group">
                                                <input id="txtFamily" class="contenteditable" runat="server" value="" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input  type="radio" runat="server" id="radAllergy1" name="radAllergy" class="custom-control-input" />
                                                <label class="custom-control-label" for="radAllergy1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-8">
                                            <div class="custom-control custom-radio mb-1">
                                                <input disabled-for="allergy_field" type="radio" runat="server" id="radAllergy2" name="radAllergy" class="custom-control-input" />
                                                <label class="custom-control-label" for="radAllergy2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                            </div>
                                            <div class="form-group allergy_field">
                                                <input id="txtAllergy" class="contenteditable" runat="server" value="" />
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
                                                <input id="txtTemperature" runat="server" class="form-control text-right"/>
                                                <span class="append">°C</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                            <label class="control-label w-6 mb-1">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                            <div class="form-group w-5">
                                                <input id="txtHeartRate" runat="server" class="form-control text-right" />
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                            <label class="control-label w-6 mb-1 ">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                            <div class="form-group w-4">
                                                <input id="txtWeight" runat="server" class="form-control text-right" />
                                                <span class="append">Kg</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                            <label class="control-label w-6 mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                            <div class="form-group w-5">
                                                <input id="txtRespiratoryRate" runat="server" class="form-control text-right" />
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                            <label class="control-label w-6 mb-1 ">Chiều cao/ <span class="text-primary">Height:</span></label>
                                            <div class="form-group w-4">
                                                <input id="txtHeight" maxlength="3" runat="server" class="form-control text-right" />
                                                <span class="append">cm</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                            <label class="control-label w-6 mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                            <div class="form-group w-5">
                                                <input id="txtBloodPressure" runat="server" class="form-control text-right" />
                                                <span class="append">mmHg</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2">
                                            <div class="d-flex no-block">
                                                <label for="bmi" class="control-label w-6 mb-1">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                <div class="form-group w-5">
                                                    <input id="txtBmi" runat="server" class="form-control text-right" disabled="disabled" />
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
                                                <input id="txtSpo2" runat="server" class="form-control text-right" />
                                                <span class="append">%</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                            <label for="head-circumference" class="control-label w-6 mb-1">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                            <div class="form-group w-4">
                                                <input id="txtPulse" runat="server" class="form-control text-right" />
                                                <span class="append">cm</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <input id="txtPhysicalExamination" class="contenteditable" runat="server" value="" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1 font-bold">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                                <input id="txtLIAR" class="contenteditable" runat="server" value="" />
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
                                            <div class="form-group">
                                                <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label>
                                                <input id="txtInitDiagnosis" class="contenteditable" runat="server" value="" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                                <input id="txtDiffDiagnosis" class="contenteditable" runat="server" value="" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                <input id="txtAssociatedCon" class="contenteditable" runat="server" value="" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Điều trị/ <span class="text-primary">Treatment:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input disabled-for="current_medication_field" type="radio" runat="server" id="radTreatment1" name="radTreatment" class="custom-control-input" />
                                                <label class="custom-control-label" for="radTreatment1">Ngoại trú/ <span class="text-primary">Ambulatory care</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" runat="server" id="radTreatment2" name="radTreatment" class="custom-control-input" />
                                                <label class="custom-control-label" for="radTreatment2">Nhập viện/ <span class="text-primary">Admission</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4 mb-1">
                                            <div class="custom-control custom-radio">
                                                <input disabled-for="transfer_field" type="radio" runat="server" id="radTreatment3" name="radTreatment" class="custom-control-input" />
                                                <label class="custom-control-label" for="radTreatment3">Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row transfer_field" >
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <input runat="server" id="txtTransfer" class="contenteditable" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row current_medication_field" >
                                        <div class="col-md-12">
                                            <label class="control-label mb-2"><span class="text-primary">5. Current medications:</span></label>
                                            <div class="form-group">
                                                <input runat="server" id="txtCurrentMedications" class="contenteditable" />
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
                                                <input runat="server" id="txt_spec_opinion_requested_note" class="contenteditable" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                                <input id="txtSer" class="contenteditable" runat="server" value="" />
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
                                                <telerik:RadDatePicker ID="txt_date_next_appointment" runat="server"></telerik:RadDatePicker>
                                                <telerik:RadTimePicker ID="txt_time_next_appointment" runat="server"></telerik:RadTimePicker>
                                            </div>
                                        </div>
                                        <div class="col-sm-8">
                                            <div class="custom-control custom-radio">
                                                <input disabled-for="text_next_appointment_field" type="radio" id="rad_next_appointment2" runat="server" name="rad_next_appointment" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_next_appointment2"><span class="text-primary">Text</span></label>
                                            </div>
                                            <div class="form-group text_next_appointment_field">
                                                <input id="txt_next_appointment" class="contenteditable" runat="server" value=""/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-actions mb-3">
                                        <button type="submit" id="btnComplete" class="btn btn-primary" onserverclick="btnComplete_ServerClick" runat="server">Complete</button>

                                        <button type="submit" id="btnSave" onserverclick="btnSave_ServerClick" class="btn btn-primary" runat="server">Save</button>

                                        <button type="submit" id="btnDelete" class="btn btn-secondary" runat="server">Delete</button>

                                        <button type="submit" id="btnAmend" class="btn btn-secondary" runat="server" onserverclick="btnAmend_ServerClick">Amend</button>

                                        <button type="submit" id="btnPrint" class="btn btn-secondary" runat="server">Print</button>

                                        <button type="submit" id="btnCancel" class="btn btn-secondary" runat="server" onserverclick="btnCancel_ServerClick">Cancel</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <script src="../scripts/sticky-affect.js"></script>
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>


    
</body>
</html>
