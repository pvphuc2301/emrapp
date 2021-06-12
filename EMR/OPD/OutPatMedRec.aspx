<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatMedRec.aspx.cs" Inherits="EMR.OutPatMedRec" ValidateRequest="false" %>

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
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/TextField1.ascx" TagPrefix="webUI" TagName="TextField1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    <%--class="cssclsNoScreen"--%>
    <div class="cssclsNoScreen">
        <table class="report-container">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info">
                            <img src="../images/AIH_PI_FULL.png" />
                            <div class="header-info-title">
                                <h4>BỆNH ÁN NGOẠI TRÚ</h4>
                                <h5>OUTPATIENT MEDICAL RECORD</h5>
                            </div>
                            <webUI:PatientLabel1 runat="server" ID="prt_patient_label" />
                        </div>
                        <webUI:Line runat="server" ID="Line" />
                    </th>
                </tr>
            </thead>

            <tbody class="report-content">
                <tr>
                    <td class="report-content-cell">
                        <div class="main" runat="server" id="print_content">
                            <!-- Code printed here -->

                            <webUI:PrtRowS1 FontBold="true" Title="Ngày khám bệnh" SubTitle="Day of visit" runat="server" ID="prt_day_of_visit" />

                            <webUI:PrtRowS1 FontBold="true" Order="I." FixedWidth="168" Title="Lý do đến khám:" SubTitle="Chief complaint" runat="server" ID="prt_chief_complaint" />

                            <webUI:PrtRowS1 FontBold="true" Order="II." FixedWidth="168" Title="Bệnh sử:" SubTitle="Medical history" runat="server" ID="prt_medical_history" />

                            <webUI:PrtRowS1 FontBold="true" Order="III." Title="Tiền sử bệnh:" SubTitle="Atencedent medical history" runat="server" ID="PrtRowS1" />

                            <webUI:PrtRowS1 FontBold="true" FixedLeft="5" Order="❖" Title="Bản Thân:" SubTitle="Personal" runat="server" ID="prt_personal" />

                            <webUI:PrtRowS1 FontBold="true" FixedLeft="5" Order="❖" Title="Gia đình:" SubTitle="Family" runat="server" ID="prt_family" />

                            <webUI:PrtRowS1 FontBold="true" FixedLeft="5" Order="❖" Title="Tiêm chủng:" SubTitle="Imminization" runat="server" ID="prt_immunization" />

                            <webUI:PrtRowS1 FontBold="true" FixedLeft="5" Order="❖" FixedWidth="168" Title="Thuốc đang sử dụng:" SubTitle="Current medications" runat="server" ID="prt_current_medication" />

                            <webUI:PrtRowS1 FontBold="true" Order="IV." Title="Khám bệnh:" SubTitle="Physical examinations" runat="server" />

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="1." Title="Dấu hiệu sinh tồn/ " SubTitle="Vital signs:" runat="server" />

                            <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%">
                                <tr>
                                    <td class="p-2">Nhiệt độ/ Temperature (C degree)</td>
                                    <td class="p-2 text-right" style="width: 100px;">
                                        <asp:Label runat="server" ID="prt_vs_temperature" /></td>
                                    <td class="p-2">Mạch/ Pulse (/min)</td>
                                    <td class="p-2 text-right" style="width: 100px;">
                                        <asp:Label runat="server" ID="prt_pulse" /></td>
                                </tr>
                                <tr>
                                    <td class="p-2">Cân nặng/ Weight (Kg)</td>
                                    <td class="p-2 text-right">
                                        <asp:Label runat="server" ID="prt_vs_weight" /></td>
                                    <td class="p-2">Nhịp thở/ Respiratory Rate (/min)</td>
                                    <td class="p-2 text-right">
                                        <asp:Label runat="server" ID="prt_vs_respiratory_rate" /></td>
                                </tr>
                                <tr>
                                    <td class="p-2">Chiều cao/Height (cm)</td>
                                    <td class="p-2 text-right">
                                        <asp:Label runat="server" ID="prt_vs_height" /></td>
                                    <td class="p-2">Huyết áp/Blood pressure (mmHg)</td>
                                    <td class="p-2 text-right">
                                        <asp:Label runat="server" ID="prt_vs_blood_pressure" /></td>
                                </tr>
                                <tr>
                                    <td class="p-2">Chỉ số khối cơ thể/ BMI (Kg/m2)</td>
                                    <td class="p-2 text-right">
                                        <asp:Label runat="server" ID="prt_vs_BMI" /></td>
                                    <td class="p-2">Độ bão hòa Oxy/ SpO2 (%)</td>
                                    <td class="p-2 text-right">
                                        <asp:Label runat="server" ID="prt_vs_spO2" /></td>
                                </tr>
                            </table>

                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="2." Title="Khám bệnh/ " SubTitle="Physical Examination:" runat="server" />

                            <webUI:PrtRowS1 CssClass="text-inline" FixedLeft="10" runat="server" ID="prt_physical_examination" />

                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                <webUI:PrtRowS1 FontBold="true" Order="❖" Title="Yêu cầu khám chuyên khoa tâm lý" SubTitle="Psychological consultation required:" FixedLeft="5" runat="server" FixedWidth="280" />
                                <webUI:PrtRowS2 ID="prt_psy_consult_required" runat="server" Gap="40" />
                            </div>

                            <webUI:PrtRowS1 FontBold="true" Order="V." Title="Chỉ định và kết quả xét nghiệm:" SubTitle="Laboratory indications and results" runat="server" />

                            <webUI:PrtRowS1 runat="server" ID="prt_laboratory_indications_results" FixedLeft="30" />

                            <webUI:PrtRowS1 FontBold="true" FixedLeft="5" Order="❖" Title="Khảo sát bổ sung khác:" SubTitle="Additional investigations" runat="server" ID="prt_additional_investigation" />

                            <webUI:PrtRowS1 FontBold="true" Order="VI." Title="Kết luận:" SubTitle="Conclusion" runat="server" />

                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" FixedWidth="185" Title="Chẩn đoán ban đầu:" SubTitle="Initial diagnosis" runat="server" ID="prt_initial_diagnosis" />

                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" FixedWidth="185" Title="Chẩn đoán xác định:" SubTitle="Diagnosis" runat="server" ID="prt_diagnosis" />

                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" FixedWidth="185" Title="Chẩn đoán phân biệt:" SubTitle="Differential diagnosis" runat="server" ID="prt_differential_diagnosis" />

                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" FixedWidth="185" Title="Bệnh kèm theo:" SubTitle="Associated conditions" runat="server" ID="prt_associated_conditions" />

                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Điều trị:" FixedWidth="80" SubTitle="Treatment" runat="server" />
                                <webUI:PrtRowS2 runat="server" ID="prt_treatment" Gap="35" />
                            </div>

                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                <webUI:PrtRowS1 FontBold="true" FixedLeft="5" Order="❖" FixedWidth="280" Title="Yêu cầu ý kiến chuyên khoa:" SubTitle="Specialized opinion requested" runat="server" />

                                <webUI:PrtRowS2 ID="prt_spec_opinion_requested" runat="server" Gap="40" />
                            </div>

                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Nếu có, nêu rõ:" SubTitle="If yes, specif" runat="server" ID="prt_spec_opinion_requested_note" />

                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" FixedWidth="187" Title="Hướng dẫn cụ thể dành cho bệnh nhân:" SubTitle="Specific education required" runat="server" ID="prt_specific_education_required" />

                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" FixedWidth="187" Title="Hẹn lần khám tới:" SubTitle="Next Appointment" runat="server" ID="prt_next_appointment" />

                            <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                <div></div>
                                <webUI:Signature1 runat="server" ID="prt_signature1" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>

            <tfoot class="report-footer">
                <tr>
                    <td class="report-footer-cell">
                        <img style="width: 100%" src="../images/bottomline.png" />
                        <div class="footer-info">
                            <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                            <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Quận 2, Tp.HCM</div>
                            <div>Tel: 028 3910 9999</div>
                            <div>www.aih.com.vn</div>
                        </div>
                    </td>
                    <td class="report-footer-space"></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <div class="cssclsNoPrint">
        <form method="post" action="#" id="form2" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
            <div class="h-100 w-100">
                <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField runat="server" ID="FormState" />
                        <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <webUI:AmendReason runat="server" ID="txt_amendReason" />
                            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ValidationGroup="SaveDoc" ErrorMessage="" CssClass="text-danger" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                        </asp:Panel>

                        <webUI:PatientInfo runat="server" ID="PatientInfo" />

                        <div class="row" style="margin-bottom: 50px">
                            <div class="col-lg-12">
                                <div class="card mt-2">
                                    <div class="card-header">
                                        <h4 class="text-primary">Outpatient Medical Record</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                    <div class="form-group form-edit">
                                                        <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                    </div>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_chief_complaint" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">1. Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2">
                                                    <div class="form-group form-edit">
                                                        <webUI:TextField runat="server" ID="txt_medical_history" />
                                                    </div>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_medical_history" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <fieldset class="row">
                                                        <legend>
                                                            <label class="control-label">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 mb-2">
                                                            <div class="form-group form-edit">
                                                                <webUI:TextField runat="server" ID="txt_current_medication" />
                                                            </div>
                                                            <div class="form-view">
                                                                <asp:Label runat="server" ID="lbl_current_medication" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </fieldset>


                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">Bản thân/ <span class="text-primary">Personal:</span></label>
                                                        </legend>

                                                        <div class="col-md-12 mb-2">
                                                            <div class="form-group form-edit">
                                                                <webUI:TextField runat="server" ID="txt_personal" />
                                                            </div>
                                                            <div class="form-view">
                                                                <asp:Label runat="server" ID="lbl_personal" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2" runat="server" id="habits_field">
                                                            <fieldset class="row mb-2">
                                                                <legend>
                                                                    <label class="control-label">Habits/ <span class="text-primary">Thói quen:</span></label>
                                                                </legend>

                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-2" style="width: 310px">Hút thuốc lá/ <span class="text-primary">Smoking:</span></label>
                                                                    <asp:Label runat="server" ID="lbl_habits_smoking" CssClass="form-view" />
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_habits_smoking_false" name="rad_habits_smoking" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_habits_smoking_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio  d-inline-block">
                                                                        <input disabled-for="habits_smoking_field" type="radio" runat="server" id="rad_habits_smoking_true" name="rad_habits_smoking" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_habits_smoking_true">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                                    </div>
                                                                    <div class="form-group habits_smoking_field  d-inline-block">
                                                                        <webUI:TextField runat="server" ID="txt_habits_smoking_pack" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-2" style="width: 310px">Uống rượu/ <span class="text-primary">Alcohol:</span></label>
                                                                    <asp:Label runat="server" ID="lbl_habits_alcohol" CssClass="form-view" />
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <asp:Label runat="server" ID="Label1" CssClass="form-view" />
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_habits_alcohol_false" name="rad_habits_alcohol" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_habits_alcohol_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input disabled-for="habits_alcohol_field" type="radio" runat="server" id="rad_habits_alcohol_true" name="rad_habits_alcohol" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_habits_alcohol_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                    </div>
                                                                    <div class="form-group habits_alcohol_field d-inline-block">
                                                                        <webUI:TextField runat="server" ID="txt_habits_alcohol_note" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-2" style="width: 310px">Chất gây nghiện/ <span class="text-primary">Drugs:</span></label>
                                                                    <asp:Label runat="server" ID="lbl_habits_drugs" CssClass="form-view" />
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_habits_drugs_false" name="rad_habits_drugs" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_habits_drugs_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                        <input disabled-for="habits_drugs_field" type="radio" runat="server" id="rad_habits_drugs_true" name="rad_habits_drugs" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_habits_drugs_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                    </div>
                                                                    <div class="form-group habits_drugs_field d-inline-block">
                                                                        <webUI:TextField runat="server" ID="txt_habits_drugs_note" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-2" style="width: 310px">Tập thể dục thường xuyên/ <span class="text-primary">Regular physical exercise:</span></label>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" runat="server" id="rad_habits_physical_exercise_false" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_habits_physical_exercise_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input disabled-for="habits_physical_exercise_field" type="radio" runat="server" id="rad_habits_physical_exercise_true" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_habits_physical_exercise_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                    </div>
                                                                    <div class="form-group habits_physical_exercise_field d-inline-block">
                                                                        <webUI:TextField runat="server" ID="txt_habits_phy_exer_note" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 d-grid" style="grid-template-columns: 310px 1fr">
                                                                    <label class="control-label mb-1">Khác, Ghi rõ/ <span class="text-primary">Other, Specify:</span></label>
                                                                    <div class="form-group">
                                                                        <webUI:TextField runat="server" ID="txt_habits_other" />
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 d-grid form-edit" style="grid-template-columns: 160px auto">
                                                            <label class="control-label mb-2">Tiền sử dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                            <div class="form-edit">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_allergy_false" name="radAllergy" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input disabled-for="allergy_field" type="radio" runat="server" id="rad_allergy_true" name="radAllergy" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                </div>
                                                            </div>
                                                            <div></div>
                                                            <div class="form-group allergy_field d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 form-view">
                                                            <label class="control-label mb-2">Tiền sử dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                            <asp:Label runat="server" ID="lbl_allergy" />
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">Gia đình/ <span class="text-primary">Family:</span></label>
                                                        </legend>

                                                        <div class="col-md-12 mb-2">
                                                            <div class="form-group form-edit">
                                                                <webUI:TextField runat="server" ID="txt_family" />
                                                            </div>
                                                            <div class="form-view">
                                                                <label class="control-label mb-2">Tiền sử dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                                <asp:Label runat="server" ID="lbl_family" />
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">Tiêm chủng/ <span class="text-primary">Immunization:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="form-group form-edit">
                                                                <webUI:TextField runat="server" ID="txt_immunization" />
                                                            </div>
                                                            <div class="form-view">
                                                                <label class="control-label mb-2">Tiền sử dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                                <asp:Label runat="server" ID="lbl_immunization" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </fieldset>



                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                                </div>
                                            </div>

                                            <asp:UpdatePanel ID="updatepnl_vital_sign" runat="server">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-2 font-bold">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                                            <button onserverclick="btnUpdateVS_Click" class="btn btn-secondary waves-effect form-edit" runat="server" id="btnUpdateVS">
                                                                Update
                                                            </button>
                                                            <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updatepnl_vital_sign">
                                                                <ProgressTemplate>
                                                                    <div>Updating...</div>
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                            <%--<button class="btn btn-info waves-effect" runat="server" id="btnUpdateVS">sdfsdfsd</button>--%>
                                                            <%--<asp:Button CssClass="btn btn-info waves-effect" runat="server" ID="btnUpdateVS" AutoPostBack="true" Text="Update" OnClick="btnUpdateVS_Click"/>--%>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                                            <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                            <asp:Label runat="server" ID="lbl_vs_temperature" CssClass="form-view" />
                                                        </div>
                                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                                            <label class="control-label mb-1 mr-2">Nhịp tim/ <span class="text-primary">rate:</span></label>
                                                            <asp:Label runat="server" ID="lbl_vs_heart_rate" CssClass="form-view" />
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                                            <label class="control-label  mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                            <asp:Label runat="server" ID="lbl_vs_weight" CssClass="form-view" />
                                                        </div>
                                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                                            <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                            <asp:Label runat="server" ID="lbl_vs_respiratory_rate" CssClass="form-view" />
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                                            <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                            <asp:Label runat="server" ID="lbl_vs_height" CssClass="form-view" />
                                                        </div>
                                                        <div class="col-sm-6 mb-2 d-flex no-block">
                                                            <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                            <asp:Label runat="server" ID="lbl_vs_blood_pressure" CssClass="form-view" />
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-6 mb-2 ">
                                                            <div class="d-flex no-block">
                                                                <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                                <span style="width: 100px" class="text-right">
                                                                    <asp:Label runat="server" ID="lbl_vs_bmi" CssClass="mr-1" />
                                                                    (Kg/m <sup>2</sup>)
                                                                </span>
                                                            </div>
                                                            <p class="mt-1">
                                                                (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
            applicable for children and pregnant</span>)
                                                            </p>
                                                        </div>
                                                        <div class="col-sm-6 mb-2  d-flex no-block">
                                                            <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                            <asp:Label runat="server" ID="lbl_vs_spo2" />
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-sm-12 mb-2 d-flex no-block">
                                                            <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                            <asp:Label runat="server" ID="lbl_vs_pulse" />
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnUpdateVS" />
                                                </Triggers>
                                            </asp:UpdatePanel>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-group form">
                                                        <webUI:TextField runat="server" ID="txt_physical_examination" />
                                                    </div>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_physical_examination" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological consultation required:</span></label>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_psy_consult_required" />
                                                    </div>
                                                    <div class="form-edit">
                                                        <div class="d-inline-block">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_psy_consult_required_false" name="rad_psy_consult_required" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_psy_consult_required_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio  d-inline-block">
                                                                <input type="radio" runat="server" id="rad_psy_consult_required_true" name="rad_psy_consult_required" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_psy_consult_required_true">Có/ <span class="text-primary">Yes</span></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                                    <div class="form-group mb-2 form-edit">
                                                        <webUI:TextField runat="server" ID="txt_laboratory_indications_results" />
                                                    </div>
                                                    <div class="form-view mb-2">
                                                        <asp:Label runat="server" ID="lbl_laboratory_indications_results" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label>
                                                    <div class="form-group form-edit">
                                                        <webUI:TextField runat="server" ID="txt_additional_investigation" />
                                                    </div>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_additional_investigation" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label>
                                                    <div class="form-group form-edit">
                                                        <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                    </div>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_initial_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Chẩn đoán xác định/ <span class="text-primary">Diagnosis:</span></label>
                                                    <div class="form-group form-edit">
                                                        <webUI:TextField runat="server" ID="txt_diagnosis" />
                                                    </div>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                                    <div class="form-group form-edit">
                                                        <webUI:TextField runat="server" ID="txt_differential_diagnosis" />
                                                    </div>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_differential_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                    <div class="form-group form-edit">
                                                        <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                    </div>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_associated_conditions" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Điều trị/ <span class="text-primary">Treatment:</span></label>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_treatment" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row form-edit">
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
                                                        <input type="radio" runat="server" id="rad_treatment_code_trf" name="rad_treatment_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_treatment_code_trf">Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2 current_medication_field">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1"><span class="text-primary">5. Current medications:</span></label>
                                                    <div class="form-group form-edit">
                                                        <webUI:TextField runat="server" ID="txt_medicine" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_spec_opinion_requested" />
                                                    </div>
                                                </div>

                                                <div class="col-md-4 form-edit">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="rad_spec_opinion_requested_false" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_spec_opinion_requested_false">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                </div>

                                                <div class="col-md-8 form-edit">
                                                    <div class="custom-control custom-radio mb-1">
                                                        <input disabled-for="spec_opinion_requested_field" type="radio" runat="server" id="rad_spec_opinion_requested_true" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_spec_opinion_requested_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    </div>
                                                    <div class="form-group spec_opinion_requested_field">
                                                        <webUI:TextField runat="server" ID="txt_spec_opinion_requested_note" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                                    <div class="form-group form-edit">
                                                        <webUI:TextField runat="server" ID="txt_specific_education_required" />
                                                    </div>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_specific_education_required" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                                    <div class="form-group form-edit">
                                                        <webUI:TextField runat="server" ID="txt_next_appointment" />
                                                    </div>
                                                    <div class="form-view">
                                                        <asp:Label runat="server" ID="lbl_next_appointment" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-actions">
                                                    <button type="button" onserverclick="btnComplete_Click" validationgroup="SaveDoc" runat="server" id="btnComplete" class="btn btn-primary waves-effect">Complete</button>
                                                    <button type="button" onserverclick="btnSave_Click" validationgroup="SaveDoc" runat="server" id="btnSave" class="btn btn-primary waves-effect">Save</button>
                                                    <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger form-edit" data-toggle="modal" data-target="#myModal">Delete</button>
                                                    <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                    <button type="button" onserverclick="btnPrint_ServerClick" runat="server" id="btnPrint" class="btn btn-secondary waves-effect">Print</button>

                                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                                </div>
                                            </div>
                                        </div>

                                        <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                            <ModalBody>
                                                <div class="text-center">
                                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                    <h4 class="mt-4 mb-4">Delete document?
                                                    </h4>
                                                </div>
                                                <div class="text-right">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <asp:Button runat="server" OnClick="btnDelete_Click" Text="Delete" ID="Button1" class="btn btn-danger" />
                                                </div>
                                            </ModalBody>
                                        </webUI:PopupModal>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnSave" />
                        <asp:PostBackTrigger ControlID="btnAmend" />
                        <asp:PostBackTrigger ControlID="btnCancel" />
                        <asp:PostBackTrigger ControlID="btnComplete" />
                        <%--<asp:PostBackTrigger ControlID="btnUpdateVS" />--%>
                        <%--<asp:AsyncPostBackTrigger ControlID="btnUpdateVS" EventName="Click" />--%>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </form>
    </div>



    <script type="text/javascript" src="../scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script type="text/javascript" src="../scripts/custom.min.js"></script>
    <script type="text/javascript" src="../scripts/myScript.js"></script>
    <script type="text/javascript" src="../scripts/contenteditable.min.js"></script>
    <script type="text/javascript" src="../scripts/waves.js"></script>

    <script type="text/javascript">

        document.getElementById('form2').setAttribute('data-form-state', document.getElementById("FormState").value);

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            let temp = document.querySelectorAll('div[type="number"]');
            let temp1 = document.querySelectorAll('input[data-type="number"]');

            temp1.forEach(e => {
                setInputFilter(e, function (value) {
                    return /^\d*\.?\d*$/.test(value);
                });
            });
        }

        Sys.Application.add_init(appl_init);

        function appl_init() {
            var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
            pgRegMgr.add_beginRequest(BeginHandler);
            pgRegMgr.add_endRequest(EndHandler);
        }

        function BeginHandler() {
            beforeAsyncPostBack();
        }

        function EndHandler() {
            afterAsyncPostBack();
        }

    </script>

</body>
</html>
