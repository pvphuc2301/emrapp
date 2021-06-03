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
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="webUI" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />

</head>
<body>
    <div class="cssclsNoScreen">
        <table class="report-container">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info" style="display: flex; align-items: center;">
                            <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                            <div style="flex-grow: 1; text-align: center;">
                                <div class="font-bold" style="color: #007297; font-size: 26.6667px;">BỆNH ÁN NGOẠI TRÚ NHI</div>
                                <div style="color: #e20e5a; font-size: 16.6667px;">PEDIATRIC OUTPATIENT MEDICAL RECORD</div>
                            </div>
                            <div style="width: 200px; text-align: left">
                                <div>
                                    <asp:Label ID="prt_patient_name" runat="server"></asp:Label>
                                </div>
                                <div>
                                    <asp:Label ID="prt_dob" runat="server"></asp:Label>
                                </div>

                                <webUI:Barcode runat="server" ID="Barcode" Text="900000488" Width="200" Height="40" />

                                <div>
                                    <asp:Label class="font-bold" ID="lbPID" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <webUI:Line runat="server" ID="Line" />
                    </th>
                </tr>
            </thead>

            <tbody class="report-content" style="font-size: 12px; font-family: Tahoma">
                <tr>
                    <td class="report-content-cell">
                        <div class="main" runat="server" id="print_content">
                            <!-- Code printed here -->

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="Ngày khám bệnh:" SubTitle="Date of visit" />
                                    <asp:Label ID="prt_day_of_visit" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="I. Lý do đến khám:" SubTitle="Chief complaint" />

                                    <asp:Label ID="prt_chief_complaint" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="II. Bệnh sử:" SubTitle="Medical history" />
                                    <asp:Label ID="prt_medical_history" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="III. Tiền sử bệnh:" SubTitle="Atencedent medical history" />
                                    <asp:Label ID="" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="❖Bản Thân:" SubTitle="Personal" />
                                    <asp:Label ID="prt_personal" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="❖Gia đình:" SubTitle="Family" />
                                    <asp:Label ID="prt_family" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="❖Tiêm chủng:" SubTitle="Imminization" />
                                    <asp:Label ID="prt_immunization" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="❖Thuốc đang sử dụng:" SubTitle="Current medications" />
                                    <asp:Label ID="prt_current_medication" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="IV. Khám bệnh:" SubTitle="Physical examinations" />
                                    <asp:Label ID="prt_physical_examination" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="1. Dấu hiệu sinh tồn/ Vital signs:" />
                                    <asp:Label ID="Label6" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>


                            <!-- Table -->
                            <div class="col-md-12 mb-2">
                                <asp:Table runat="server" GridLines="Both">
                                    <asp:TableRow>
                                        <asp:TableCell Width="200" Text="Nhiệt độ/Temperature (C degree)" HorizontalAlign="Left"></asp:TableCell>
                                        <asp:TableCell Width="75" ID="lbTemperature" runat="server" HorizontalAlign="Right"></asp:TableCell>

                                        <asp:TableCell Width="200px" Text="Mạch/ Pulse (/min)" HorizontalAlign="Left"></asp:TableCell>
                                        <asp:TableCell Width="75px" HorizontalAlign="Right" ID="lbHeartRate" runat="server"></asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow>
                                        <asp:TableCell Width="200px" Text="Cân nặng/ Weight (Kg)" HorizontalAlign="Left"></asp:TableCell>
                                        <asp:TableCell Width="75px" ID="lbWeight" runat="server" HorizontalAlign="Right"></asp:TableCell>

                                        <asp:TableCell Width="200px" Text="Nhịp thở/ Respiratory Rate (/min)" HorizontalAlign="Left"></asp:TableCell>
                                        <asp:TableCell Width="75px" HorizontalAlign="Right" ID="lbRespiratoryRate" runat="server"></asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow>
                                        <asp:TableCell Width="200px" Text="Chiều cao/Height (cm)" HorizontalAlign="Left"></asp:TableCell>
                                        <asp:TableCell Width="15%" ID="lbHeight" runat="server" HorizontalAlign="Right"></asp:TableCell>

                                        <asp:TableCell Width="200px" Text="Huyết áp/Blood pressure (mmHg)" HorizontalAlign="Left"></asp:TableCell>
                                        <asp:TableCell Width="75px" HorizontalAlign="Right" ID="lbBloodPressure" runat="server"></asp:TableCell>
                                    </asp:TableRow>

                                    <asp:TableRow>
                                        <asp:TableCell Width="200px" Text="Chỉ số khối cơ thể/ BMI (Kg/m2)" HorizontalAlign="Left"></asp:TableCell>
                                        <asp:TableCell Width="75px" ID="lbBmi" runat="server" HorizontalAlign="Right"></asp:TableCell>

                                        <asp:TableCell Width="200px" Text="Độ bão hòa Oxy/ SpO2 (%)" HorizontalAlign="Left"></asp:TableCell>
                                        <asp:TableCell Width="75px" HorizontalAlign="Right" ID="lbSpo2" runat="server"></asp:TableCell>
                                    </asp:TableRow>

                                </asp:Table>
                            </div>

                            <div class="col-12">
                                <webUI:Label runat="server" CssClass="font-bold" Title="2. Khám bệnh/" SubTitle="Physical Examination:" />

                                <asp:Label ID="Label27" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                            </div>


                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="• Tổng trạng/General appearance:" />
                                    <asp:Label ID="Label7" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="• Hệ hô hấp/Respiratory system:" />
                                    <%--<asp:Label ID="lbRespiratoryRate" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>--%>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="• Tai Mũi Họng/Otorhinolaryngology:" />
                                    <asp:Label ID="Label5" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="❖ Yêu cầu khám chuyên khoa tâm lý:" SubTitle="Psychological consultation required" />

                                    <asp:Label ID="Label1" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="V. Chỉ định và kết quả xét nghiệm:" SubTitle="Laboratory indications and results" />

                                    <asp:Label ID="Label18" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="❖ Khảo sát bổ sung khác:" SubTitle="Additional investigations" />

                                    <asp:Label ID="Label15" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="VI. Kết luận:" SubTitle="Conclusion" />

                                    <asp:Label ID="Label16" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="● Chẩn đoán xác định:" SubTitle="Initial diagnosis" />
                                    <%--<asp:Label ID="lb_diagnosis" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>--%>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="● Chẩn đoán ban đầu:" SubTitle="Diagnosis" />

                                    <asp:Label ID="lb_initial_diagnosis" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="● Chẩn đoán xác định:" SubTitle="Diagnosis" />

                                    <asp:Label ID="lb_diagnosis" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="● Chẩn đoán phân biệt:" SubTitle="Differential diagnosis" />

                                    <asp:Label ID="lb_diffesrentialDiagnosis" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="● Bệnh kèm theo:" SubTitle="Associated conditions" />

                                    <asp:Label ID="lb_associated_conditions" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="● Điều trị:" SubTitle="Treatment" />

                                    <asp:Label ID="Label14" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="❖ Yêu cầu ý kiến chuyên khoa:" SubTitle="Specialized opinion requested" />

                                    <asp:Label ID="Label11" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="● Hướng dẫn cụ thể dànhcho bệnh nhân:" SubTitle="Specific education required" />

                                    <asp:Label ID="lb_specific_education_required" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="● Hẹn lần khám tới:" SubTitle="Next Appointment" />

                                    <asp:Label ID="lb_next_appointment" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <!-- Chu ky bac sy -->
                            <div class="row">
                                <div class="col-6">
                                </div>
                                <div class="col-6 mb-2">
                                    <div>
                                        <webUI:Signature runat="server" Day="23" Month="5" Year="2021" Title="BÁC SĨ ĐIỀU TRỊ" SubTitle="ATTENDING DOCTOR" FullName="Dr. Nguyen Dinh My" />

                                    </div>
                                </div>
                            </div>
                            <!--Het Chu ky bac sy -->

                            <!-- END cODE PRINTED HERE-->
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
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
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
                                        <div class="col-md-12">
                                            <label class="control-label mb-2 font-bold">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
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

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">1. Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <webUI:TextField runat="server" id="txt_medical_history" />
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>

                                            <div class="form-group">
                                                <webUI:TextField runat="server" id="txt_current_medication" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">2. Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <label class="control-label">Bản thân/ <span class="text-primary">Personal:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" id="txt_personal" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="control-label">Gia đình/ <span class="text-primary">Family:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" id="txt_family" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <label class="control-label mb-2 d-block">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                            <div class="custom-control custom-radio ml-2 d-inline-block">
                                                <input type="radio" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                            <div class="custom-control custom-radio ml-2 d-inline-block">
                                                <input disabled-for="allergy_note_field" type="radio" runat="server" id="rad_allergy_true" name="rad_allergy" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                            </div>
                                            <div class="form-group allergy_note_field">
                                                <webUI:TextField runat="server" id="txt_allergy_note" />
                                            </div>
                                        </div>
                                    </fieldset>


                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1 font-bold">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                            </div>
                                        </div>
                                    </div>

                                        <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                        </legend>
                                            <div class="col-md-12">
                                                <div class="alert alert-warning d-flex no-block">
                                                    <div class="flex-grow-1">
                                                        <webUI:ExclamationTriangle runat="server" ID="ExclamationTriangle" Size="28" />
                                                        <span class="ml-2">
                                                        Updates are available.
                                                        </span>
                                                    </div>
                                                    <asp:Button runat="server" ID="btnUpdateVitalSign" CssClass="btn btn-sm btn-secondary" OnClick="btnUpdateVitalSign_Click" Text="Update" />
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2">
                                                <label class="control-label mr-2 mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                <div class="form-group w-4 d-inline-block">
                                                    <input runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                    <span class="append">°C</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2">
                                                <label class="control-label mr-2 mb-1">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                                <div class="form-group w-5 d-inline-block">
                                                    <input runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2">
                                                <label class="control-label mr-2 mb-1">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                <div class="form-group w-4 d-inline-block">
                                                    <input runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                    <span class="append">Kg</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2">
                                                <label class="control-label mr-2 mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                <div class="form-group w-5 d-inline-block">
                                                    <input runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2">
                                                <label class="control-label mr-2 mb-1">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                <div class="form-group w-4 d-inline-block">
                                                    <input maxlength="3" id="txt_vs_height" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2">
                                                <label class="control-label mr-2 mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                <div class="form-group w-5 d-inline-block">
                                                    <input id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                    <span class="append">mmHg</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2">
                                                <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                <div class="form-group w-5 d-inline-block">
                                                    <input runat="server" id="txt_vs_bmi" class="form-control text-right" disabled="disabled" />
                                                    <span class="append">(Kg/m <sup>2</sup>)</span>
                                                </div>
                                                <p class="mt-1">
                                                    (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
applicable for children and pregnant</span>)
                                                </p>
                                            </div>

                                            <div class="col-sm-6 mb-2">
                                                <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                <div class="form-group w-4 d-inline-block">
                                                    <input runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                    <span class="append">%</span>
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-2">
                                                <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                <div class="form-group w-4 d-inline-block">
                                                    <input runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                    </fieldset>

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
                                                <input type="radio" id="rad_spec_opinion_requested_false" runat="server" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_spec_opinion_requested_false">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>

                                        <div class="col-md-8 mb-2">
                                            <div class="custom-control custom-radio mb-1">
                                                <input type="radio" id="rad_spec_opinion_requested_true" runat="server" disabled-for="spec_opinion_requested_note_field" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_spec_opinion_requested_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
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
                                                <input disabled-for="date_next_appointment_field" type="radio" id="rad_next_appointment_true" runat="server" name="rad_next_appointment" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_next_appointment_true"><span class="text-primary">Calendar</span></label>
                                            </div>
                                            <div class="form-group date_next_appointment_field">
                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_date_next_appointment" Width="200px" />
                                            </div>
                                        </div>
                                        <div class="col-sm-8">
                                            <div class="custom-control custom-radio">
                                                <input disabled-for="text_next_appointment_field" type="radio" id="rad_next_appointment_false" runat="server" name="rad_next_appointment" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_next_appointment_false"><span class="text-primary">Text</span></label>
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
            </Triggers>
        </asp:UpdatePanel>
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
  
