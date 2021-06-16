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
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Outpatient Medical Record</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info">
                                        <img src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>BỆNH ÁN NGOẠI TRÚ NHI</h4>
                                            <h5>PEDIATRIC OUTPATIENT MEDICAL RECORD</h5>
                                        </div>
                                        <div style="width: 175px;">
                                            <asp:Label CssClass="d-block" runat="server" ID="prt_fullname"></asp:Label>
                                            <asp:Label class="d-block" CssClass="d-block" runat="server" ID="prt_dob"></asp:Label>
                                            <webUI:Barcode runat="server" ID="prt_barcode" Width="120" Height="22" />
                                            <asp:Label runat="server" ID="prt_vpid" CssClass="d-block font-bold"></asp:Label>
                                        </div>
                                    </div>
                                    <webUI:Line runat="server" ID="Line" />
                                </th>
                            </tr>
                        </thead>

                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div class="main" runat="server" id="print_content">

                                        <div class="d-grid" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Title="Ngày khám bệnh" SubTitle="Day of visit" runat="server" />
                                            <asp:Label runat="server" ID="prt_day_of_visit" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="I." Title="Lý do đến khám:" SubTitle="Chief complaint" runat="server" />
                                            <asp:Label runat="server" ID="prt_chief_complaint" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="II." Title="Bệnh sử:" SubTitle="Medical history" runat="server" />
                                            <asp:Label runat="server" ID="prt_medical_history" />
                                        </div>
                                         
                                        <webUI:PrtRowS1 FontBold="true" Order="1." Title="Bệnh sử hiện tại:" SubTitle="Current Medical History" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="❖" Title="Thuốc đang sử dụng:" SubTitle="Current medications" runat="server" />
                                            <asp:Label runat="server" ID="prt_current_medication" />
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" Order="2." Title="Tiền sử bệnh:" SubTitle="Atencedent medical history" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="❖" Title="Bản Thân:" SubTitle="Personal" runat="server" />
                                            <asp:Label runat="server" ID="prt_personal" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="❖" Title="Gia đình:" SubTitle="Family" runat="server" />
                                            <asp:Label runat="server" ID="prt_family" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="❖" Title="Dị ứng:" SubTitle="Allergy" runat="server" />
                                            <asp:Label runat="server" ID="prt_allergy" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Nếu có, nêu rõ:" SubTitle="If yes, specify" runat="server" />
                                            <asp:Label runat="server" ID="prt_allergy_note" />
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" Order="III." Title="Khám bệnh:" SubTitle="Physical examinations" runat="server" />

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

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr">
                                            <label></label>
                                            <asp:Label runat="server" ID="prt_physical_examination" />
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" Order="IV." Title="Chỉ định và kết quả xét nghiệm:" SubTitle="Laboratory indications and results" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: 20px 1fr">
                                            <label></label>
                                            <asp:Label runat="server" ID="prt_laboratory_indications_results" />
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" Order="V." Title="Kết luận:" SubTitle="Conclusion" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" Title="Chẩn đoán ban đầu:" SubTitle="Initial diagnosis" runat="server" />
                                            <asp:Label runat="server" ID="prt_initial_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" Title="Chẩn đoán phân biệt:" SubTitle="Differential diagnosis" runat="server" />
                                            <asp:Label runat="server" ID="prt_differential_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" Title="Bệnh kèm theo:" SubTitle="Associated conditions" runat="server" />
                                            <asp:Label runat="server" ID="prt_associated_conditions" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 85px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Điều trị:" SubTitle="Treatment" runat="server" />
                                            <asp:Label runat="server" ID="prt_treatment" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 90px 1fr">
                                            <label></label>
                                            <asp:Label runat="server" ID="prt_medicine" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 280px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="5" Order="❖" Title="Yêu cầu ý kiến chuyên khoa:" SubTitle="Specialized opinion requested" runat="server" />
                                            <asp:Label runat="server" ID="prt_spec_opinion_requested" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Nếu có, nêu rõ:" SubTitle="If yes, specif" runat="server" />
                                            <asp:Label runat="server" ID="prt_spec_opinion_requested_note" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Hướng dẫn cụ thể dành cho bệnh nhân:" SubTitle="Specific education required" runat="server" />
                                            <asp:Label runat="server" ID="prt_specific_education_required" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Hẹn lần khám tới:" SubTitle="Next Appointment" runat="server" />
                                            <asp:Label runat="server" ID="prt_next_appointment" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <div></div>
                                            <div class="text-center" style="break-inside: avoid;">
                                                <div class="font-bold">BÁC SĨ ĐIỀU TRỊ</div>
                                                <div>ATTENDING DOCTOR</div>
                                            </div>
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
                    <div style="overflow: scroll; height: calc(100vh - 52px); overflow-x: hidden;">
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <div class="card" runat="server" id="amendReasonWraper">
                                <div class="card-body">
                                    <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span>
                                        <br />
                                        <span class="text-danger">* </span><small>Nội dung lý do thay đổi phải trên 3 ký tự</small></h5>
                                    <div class="form-group mb-2">

                                        <asp:TextBox runat="server" ID="txt_amend_reason" CssClass="el-hide" />
                                        <div spellcheck="false" style="height: auto; text-align: left; display: inline-block;" class="form-control" id="DisplayControl" onblur="changeValue1(this, 'txt_amend_reason')" contenteditable='true' runat="server"></div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                            ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <asp:ValidationSummary
                                ID="valSum"
                                DisplayMode="BulletList"
                                CssClass="validationSummary"
                                runat="server" ValidationGroup="Group1"
                                HeaderText="Please complete the highlighted field(s)." />
                        </asp:Panel>

                        <webUI:PatientInfo runat="server" ID="PatientInfo" />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card mt-2">
                                    <div class="card-header">
                                        <h4 class="text-primary">OUTPATIENT MEDICAL RECORD - PEDIATRIC</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                    <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                    </div>
                                                    <div>
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
                                                    <div class="form-group" runat="server" id="medical_history_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_medical_history" />
                                                    </div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_medical_history" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <fieldset class="row">
                                                        <legend>
                                                            <label class="control-label">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 mb-2">
                                                            <div class="form-group " runat="server" id="current_medication_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_current_medication" />
                                                            </div>
                                                            <div>
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
                                                            <div class="form-group " runat="server" id="personal_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_personal" />
                                                            </div>
                                                            <div>
                                                                <asp:Label runat="server" ID="lbl_personal" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label style="width: 160px" class="control-label mb-2">Tiền sử dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                            <asp:Label runat="server" ID="lbl_allergy" />

                                                            <div runat="server" id="allergy_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" onchange="radioButtonChange(this)" data-target="allergy_field" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input disabled-for="allergy_field" onchange="radioButtonChange(this)" type="radio" runat="server" id="rad_allergy_true" name="rad_allergy" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                                        <icon:XSquare runat="server" ID="XSquare38" />
                                                                    </a>
                                                                </div>
                                                                <asp:CustomValidator ID="CustomValidator2" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="Tiền sử dị ứng/ allergy is requested" CssClass="text-danger" OnServerValidate="allergy_ServerValidate"></asp:CustomValidator>
                                                                <div class="form-group allergy_field">
                                                                    <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">Gia đình/ <span class="text-primary">Family:</span></label>
                                                        </legend>

                                                        <div class="col-md-12 mb-2">
                                                            <div class="form-group " runat="server" id="family_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_family" />
                                                            </div>
                                                            <div>
                                                                <asp:Label runat="server" ID="lbl_family" />
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
                                                            <label class="control-label">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                                            <button onserverclick="btnUpdateVitalSign_Click" class="btn btn-sm btn-secondary waves-effect " runat="server" id="btnUpdateVitalSign">
                                                                Update
                                                            </button>
                                                            <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updatepnl_vital_sign">
                                                                <ProgressTemplate>
                                                                    <div class="loader1 ml-2">
                                                                        <div style="width: 28px; height: 28px;" class="loader-wheel"></div>
                                                                    </div>
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                            <asp:Label runat="server" ID="vs_temperature" />°C
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 mr-2">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                                            <asp:Label runat="server" ID="vs_heart_rate" />/phút (m)
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                            <asp:Label runat="server" ID="vs_weight" />Kg
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                            <asp:Label runat="server" ID="vs_respiratory_rate" />/phút (m)
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                            <asp:Label runat="server" ID="vs_height" />cm
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                            <asp:Label runat="server" ID="vs_blood_pressure" />mmHg
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                            <asp:Label runat="server" ID="vs_bmi" />(Kg/m <sup>2</sup>)
                                            <div>
                                                (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not applicable for children and pregnant</span>)
                                            </div>
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                            <asp:Label runat="server" ID="vs_spo2" />%
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                            <asp:Label runat="server" ID="vs_pulse" />cm
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnUpdateVitalSign" />
                                                </Triggers>
                                            </asp:UpdatePanel>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-group" runat="server" id="physical_examination_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_physical_examination" />
                                                    </div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_physical_examination" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                                    <div class="form-group mb-2 " runat="server" id="laboratory_indications_results_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_laboratory_indications_results" />
                                                    </div>
                                                    <div class="form-view mb-2">
                                                        <asp:Label runat="server" ID="lbl_laboratory_indications_results" />
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
                                                    <div class="form-group " runat="server" id="initial_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                    </div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_initial_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                                    <div class="form-group " runat="server" id="differential_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_differential_diagnosis" />
                                                    </div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_differential_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                    <div class="form-group" runat="server" id="associated_conditions_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                    </div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_associated_conditions" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Điều trị/ <span class="text-primary">Treatment:</span></label>
                                                    <label style="width: 20px"></label>
                                                    <asp:Label runat="server" ID="lbl_treatment_code" />
                                                    <div runat="server" id="treatment_code_wrapper" class="d-inline-block">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onchange="radioButtonChange(this)" disabled-for="current_medication_field" type="radio" runat="server" id="rad_treatment_code_opd" name="rad_treatment_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_treatment_code_opd">Ngoại trú/ <span class="text-primary">Ambulatory care</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onchange="radioButtonChange(this)" data-target="current_medication_field" type="radio" runat="server" id="rad_treatment_code_ipd" name="rad_treatment_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_treatment_code_ipd">Nhập viện/ <span class="text-primary">Admission</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onchange="radioButtonChange(this)" data-target="current_medication_field" type="radio" runat="server" id="rad_treatment_code_trf" name="rad_treatment_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_treatment_code_trf">Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_treatment_code" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare2" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2 current_medication_field">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1"><span class="text-primary">5. Current medications:</span></label>
                                                    <asp:Label runat="server" ID="lbl_medicine" />
                                                    <div class="form-group " runat="server" id="medicine_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_medicine" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_spec_opinion_requested" />
                                                    </div>
                                                    <div runat="server" id="spec_opinion_requested_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onchange="radioButtonChange(this)" data-target="spec_opinion_requested_field" type="radio" runat="server" id="rad_spec_opinion_requested_false" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_spec_opinion_requested_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onchange="radioButtonChange(this)" disabled-for="spec_opinion_requested_field" type="radio" runat="server" id="rad_spec_opinion_requested_true" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_spec_opinion_requested_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_spec_opinion_requested" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare3" />
                                                            </a>
                                                            <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="Yêu cầu ý kiến chuyên khoa/ Specialized opinion requested" CssClass="text-danger" OnServerValidate="spec_opinion_requested_ServerValidate"></asp:CustomValidator>
                                                        </div>
                                                        <div class="form-group spec_opinion_requested_field">
                                                            <webUI:TextField runat="server" ID="txt_spec_opinion_requested_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                                    <div class="form-group " runat="server" id="specific_education_required_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_specific_education_required" />
                                                    </div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_specific_education_required" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                                    <div class="form-group" runat="server" id="bool_next_appointment_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input disabled-for="date_next_appointment_field" type="radio" id="rad_bool_next_appointment_true" runat="server" name="rad_bool_next_appointment" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_bool_next_appointment_true"><span class="text-primary">Calendar</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input disabled-for="text_next_appointment_field" type="radio" id="rad_bool_next_appointment_false" runat="server" name="rad_bool_next_appointment" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_bool_next_appointment_false"><span class="text-primary">Text</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_bool_next_appointment" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare1" />
                                                            </a>
                                                            <asp:CustomValidator ID="CustomValidator3" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="Hẹn lần khám tới/ Next Appointment is required" CssClass="text-danger" OnServerValidate="bool_next_appointment_ServerValidate"></asp:CustomValidator>
                                                        </div>
                                                        <div class="form-group date_next_appointment_field">
                                                            <telerik:RadDateTimePicker runat="server" ID="dtpk_date_next_appointment" Width="200px" />
                                                        </div>
                                                        <div class="form-group text_next_appointment_field w-n">
                                                            <webUI:TextField runat="server" id="txt_next_appointment" />
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_date_next_appointment" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-actions">
                                                    <button type="button" runat="server" id="btnComplete" validationgroup="Group1" onserverclick="btnComplete_Click" class="btn btn-primary waves-effect">
                                                        Complete
                                                    </button>

                                                    <button type="button" onserverclick="btnSave_Click" validationgroup="Group1" runat="server" id="btnSave" class="btn btn-primary waves-effect">
                                                        Save
                                                    </button>

                                                    <button type="button" data-toggle="modal" data-target="#myModal" id="btnDeleteModal" runat="server" class="btn btn-danger waves-effect">
                                                        Delete
                                                    </button>

                                                    <button onserverclick="btnAmend_Click" runat="server" id="btnAmend" class="btn btn-secondary waves-effect">
                                                        Amend
                                                    </button>

                                                    <button onserverclick="btnPrint_Click" id="btnPrint" runat="server" class="btn btn-secondary waves-effect">
                                                        Print
                                                    </button>

                                                    <button runat="server" onserverclick="btnCancel_Click" id="btnCancel" class="btn btn-secondary waves-effect">
                                                        Cancel
                                                    </button>
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
                                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                                    <button type="button" onserverclick="btnDelete_Click" runat="server" id="btnDelete" class="btn btn-danger waves-effect">Delete</button>
                                                </div>
                                            </ModalBody>
                                        </webUI:PopupModal>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnPrint" />
                <asp:AsyncPostBackTrigger ControlID="btnSave" />
                <asp:AsyncPostBackTrigger ControlID="btnAmend" />
                <asp:AsyncPostBackTrigger ControlID="btnCancel" />
                <asp:AsyncPostBackTrigger ControlID="btnComplete" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/waves.js"></script>

    <script type="text/javascript">

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            let radiosAttr = [];

            document.querySelectorAll('input[type=radio]').forEach(e => {
                if (!radiosAttr.includes(e.name)) radiosAttr.push(e.name);
            });

            for (let i = 0; i < radiosAttr.length; i++) {
                let radiosEle = $(`input[name=${radiosAttr[i]}]`);

                for (let j = 0; j < radiosEle.length; j++) {
                    let disabledFor = radiosEle[j].getAttribute('disabled-for');

                    if (disabledFor != 'undefined' && disabledFor != false) {

                        if (!radiosEle[j].checked) {
                            let EleByClassName = document.getElementsByClassName(disabledFor);

                            for (let l = 0; l < EleByClassName.length; l++) {
                                EleByClassName[l].classList.add("el-hide");
                            }
                        }
                    }

                    radiosEle[j].addEventListener('change', function () {
                        try {

                            let disabledFor = radiosEle[j].getAttribute('disabled-for');

                            if (disabledFor != 'undefined' && disabledFor != false) {

                                for (let k = 0; k < radiosEle.length; k++) {

                                    let EleByClassName = document.getElementsByClassName(radiosEle[k].getAttribute('disabled-for'));

                                    for (let l = 0; l < EleByClassName.length; l++) {

                                        if (EleByClassName[l].classList.contains(disabledFor)) {
                                            EleByClassName[l].classList.remove("el-hide");
                                            EleByClassName[l].classList.add("el-show");
                                        } else {
                                            EleByClassName[l].classList.remove("el-show");
                                            EleByClassName[l].classList.add("el-hide");
                                        }
                                    }
                                }
                            }
                        } catch (ex) {
                            console.error(ex);
                        }
                    })
                }
            }
        }

    </script>

</body>
</html>
