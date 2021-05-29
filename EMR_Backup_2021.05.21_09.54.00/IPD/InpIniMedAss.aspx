<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InpIniMedAss.aspx.cs" Inherits="EMR.InpIniMedAss" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <aih:AmendReason runat="server" ID="txt_amendReason" />
                    <uc1:PatientInfo runat="server" ID="PatientInfo1" />
                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-lg-12">
                            <div class="card mt-2">
                                <div class="card-header">
                                    <h4 class="text-primary">INPATIENT INITIAL MEDICAL ASSESSMENT</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">I. Lí do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_chief_complaint" />
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
                                                    <aih:TextField runat="server" ID="txt_cur_med_history" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_cur_medication" />
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
                                                    <aih:TextField runat="server" ID="txt_personal" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Habits/ <span class="text-primary">Thói quen:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Hút thuốc lá/ <span class="text-primary">Smoking:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_habits_smoking1" name="rad_habits_smoking" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_smoking1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="habits_smoking_field" type="radio" runat="server" id="rad_habits_smoking2" name="rad_habits_smoking" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_smoking2">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_habits_smoking" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare3" />
                                                    </a>
                                                </div>
                                                <div class="form-group habits_smoking_field">
                                                    <aih:TextField runat="server" ID="txt_habits_smoking_pack" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Uống rượu/ <span class="text-primary">Alcohol:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_habits_alcohol1" name="rad_habits_alcohol" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_alcohol1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="habits_alcohol_field" type="radio" runat="server" id="rad_habits_alcohol2" name="rad_habits_alcohol" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_alcohol2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_habits_alcohol" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare4" />
                                                    </a>
                                                </div>
                                                <div class="form-group habits_alcohol_field">
                                                    <aih:TextField runat="server" ID="txt_habits_alcohol_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Chất gây nghiện/ <span class="text-primary">Drugs:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_habits_drugs1" name="rad_habits_drugs" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_drugs1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="habits_drugs_field" type="radio" runat="server" id="rad_habits_drugs2" name="rad_habits_drugs" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_drugs2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_habits_drugs" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare5" />
                                                    </a>
                                                </div>
                                                <div class="form-group habits_drugs_field">
                                                    <aih:TextField runat="server" ID="txt_habits_drugs_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Tập thể dục thường xuyên/ <span class="text-primary">Regular physical exercise:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_habits_physical_exercise1" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_physical_exercise1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="habits_physical_exercise_field" type="radio" runat="server" id="rad_habits_physical_exercise2" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_physical_exercise2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_habits_physical_exercise" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare6" />
                                                    </a>
                                                </div>
                                                <div class="form-group habits_physical_exercise_field">
                                                    <aih:TextField runat="server" ID="txt_habits_phy_exer_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Khác, Ghi rõ/ <span class="text-primary">Other, Specify:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_habits_other" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Tiền sử dị ứng/ <span class="text-primary">Allergy:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_allergy1" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="allergy_field" type="radio" runat="server" id="rad_allergy2" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare2" />
                                                    </a>
                                                </div>
                                                <div class="form-group allergy_field">
                                                    <aih:TextField runat="server" ID="txt_allergy_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_family" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tiêm chủng/ <span class="text-primary">Immunization:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_immunization" />
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
                                                <label class="control-label mb-2 font-bold">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                <div class="form-group w-4">
                                                    <input runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                    <span class="append">°C</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                                <div class="form-group w-5">
                                                    <input runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1 ">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                <div class="form-group w-4">
                                                    <input runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                    <span class="append">Kg</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                <div class="form-group w-5">
                                                    <input  runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1 ">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                <div class="form-group w-4">
                                                    <input maxlength="3" id="txt_vs_height" runat="server" class="form-control text-right" />
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
                                                        <input runat="server" id="txt_vs_BMI" class="form-control text-right" disabled="disabled" />
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
                                                    <input  runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                    <span class="append">%</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label for="head-circumference" class="control-label w-6 mb-1">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                <div class="form-group w-4">
                                                    <input  runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_physical_exam" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological consultation required:</span></label>
                                            </div>
                                            <div class="col-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_psy_consult_required1" name="rad_psy_consult_required" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_psy_consult_required1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-8">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_psy_consult_required2" name="rad_psy_consult_required" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_psy_consult_required2">Có/ <span class="text-primary">Yes</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_psy_consult_required" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare1" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold mb-1">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_laboratory_result" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_add_investigation" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_initial_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán xác định/ <span class="text-primary">Diagnosis:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_diff_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_associated_conditions" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Kế hoạch điều trị/ <span class="text-primary">Treatment Plan:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_treatment_plan" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Kế hoạch xuất viện/ <span class="text-primary">Discharge Plan:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_discharge_plan" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions mb-3">
                                        <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />
                                        <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />
                                        <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                        <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                        <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                        <div runat="server" id="messagePlaceHolder"></div>
                                    </div>

                                        <div id="myModal" class="modal fade" role="dialog">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Delete document</h4>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p runat="server">Please provide reason for deletion</p>
                                                        <div class="form-group mb-2">
                                                            <aih:TextField runat="server" ID="TextField17" />
                                                        </div>
                                                        <div class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <asp:Button runat="server" OnClick="btnDelete_Click" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                                    </div>
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
                    <%--<asp:PostBackTrigger ControlID="btnSave" />                     <asp:PostBackTrigger ControlID="btnComplete" />--%>                 </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>
</html>
