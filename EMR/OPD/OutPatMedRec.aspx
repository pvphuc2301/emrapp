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
                                <div class="font-bold" style="color: #007297; font-size: 26.6667px;">BỆNH ÁN NGOẠI TRÚ</div>
                                <div style="color: #e20e5a; font-size: 16.6667px;">OUTPATIENT MEDICAL RECORD</div>
                            </div>
                            <div style="width: 200px; text-align: left">
                                <div>
                                    <asp:Label ID="lbPatientName" runat="server"></asp:Label>
                                </div>
                                <div>
                                    <asp:Label ID="lbDoB" runat="server"></asp:Label>
                                </div>

                                <webUI:Barcode runat="server" ID="Barcode" Text="900000488" Width="200" Height="40" />

                                <div>
                                    <asp:Label class="font-bold" ID="lbPID" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div style="margin-bottom: 80px;">
                            <span style="width: 190px; border-bottom-style: solid; border-bottom-color: #e20e5a; border-bottom-width: 5px; display: inline-block; font-size: 26.6667px;"></span>
                            <span style="display: inline-block; border-bottom-style: solid; border-bottom-color: #007297; border-bottom-width: 5px; width: calc(100% - 191px); margin-left: -5px;"></span>
                        </div>
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
                                    <asp:Label ID="lbNgayKhamBenh" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="I. Lý do đến khám:" SubTitle="Chief complaint" />

                                    <asp:Label ID="lbChiefComplaint" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="II. Bệnh sử:" SubTitle="Medical history" />
                                    <asp:Label ID="lbMedicalHistory" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="III. Tiền sử bệnh:" SubTitle="Atencedent medical history" />
                                    <asp:Label ID="Label2" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="❖Bản Thân:" SubTitle="Personal" />
                                    <asp:Label ID="lbPersonal" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="❖Gia đình:" SubTitle="Family" />
                                    <asp:Label ID="lbFamily" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="❖Tiêm chủng:" SubTitle="Imminization" />
                                    <asp:Label ID="lbImmunization" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="❖Thuốc đang sử dụng:" SubTitle="Current medications" />
                                    <asp:Label ID="lbCurrentMedication" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" CssClass="font-bold" Title="IV. Khám bệnh:" SubTitle="Physical examinations" />
                                    <asp:Label ID="Label3" runat="server" class="d-inline-block ml-2 align-top"> </asp:Label>
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
            <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
            <div class="scroll-sidebar h-100 w-100">
                <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <webUI:AmendReason runat="server" ID="txt_amendReason" />
                        </asp:Panel>

                        <webUI:PatientInfo runat="server" ID="PatientInfo" />

                        <div class="row">
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
                                                    <label class="control-label mb-2 font-bold">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txtChiefComplaint" />
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
                                                        <webUI:TextField runat="server" ID="txtMedicalHistory" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txtCurrentMedication" />
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
                                                        <webUI:TextField runat="server" ID="txtPersonal" />
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
                                                    </div>
                                                    <div class="form-group habits_smoking_field">
                                                        <webUI:TextField runat="server" ID="txt_habits_smoking_pack" />
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
                                                        <label class="custom-control-label" for="rad_habits_alcohol2">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                    </div>
                                                    <div class="form-group habits_alcohol_field">
                                                        <webUI:TextField runat="server" ID="txt_habits_alcohol_note" />
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
                                                        <label class="custom-control-label" for="rad_habits_drugs2">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                    </div>
                                                    <div class="form-group habits_drugs_field">
                                                        <webUI:TextField runat="server" ID="txt_habits_drugs_note" />
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
                                                        <label class="custom-control-label" for="rad_habits_physical_exercise2">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                    </div>
                                                    <div class="form-group habits_physical_exercise_field">
                                                        <webUI:TextField runat="server" ID="txt_habits_phy_exer_note" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Khác, Ghi rõ/ <span class="text-primary">Other, Specify:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_habits_other" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="radAllergy1" name="radAllergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radAllergy1">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                </div>

                                                <div class="col-md-8">
                                                    <div class="custom-control custom-radio mb-1">
                                                        <input disabled-for="allergy_field" type="radio" runat="server" id="radAllergy2" name="radAllergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radAllergy2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    </div>
                                                    <div class="form-group allergy_field">
                                                        <webUI:TextField runat="server" ID="txtAllergyNote" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txtFamily" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Tiêm chủng/ <span class="text-primary">Immunization:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txtImmunization" />
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
                                                        <input id="txtTemperature" runat="server" class="form-control text-right" />
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
                                                            (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not applicable for children and pregnant</span>)
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
                                                            <input id="txt_pulse" runat="server" class="form-control text-right" />
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
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-2">
                                                    <div class="col-md-12">
                                                        <label class="control-label font-bold mb-1">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                                        <div class="form-group">
                                                            <webUI:TextField runat="server" ID="txt_laboratory_indications_results" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-2">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label>
                                                        <div class="form-group">
                                                            <webUI:TextField runat="server" ID="txt_additional_investigation" />
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
                                                        <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis (ICD 10):</span></label>
                                                        <div class="form-group">
                                                            <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-2">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1">Chẩn đoán xác định/ <span class="text-primary">Initial diagnosis (ICD 10):</span></label>
                                                        <div class="form-group">
                                                            <webUI:TextField runat="server" ID="txt_diagnosis" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-2">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis (ICD 10):</span></label>
                                                        <div class="form-group">
                                                            <webUI:TextField runat="server" ID="txtDiffesrentialDiagnosis" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-2">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                        <div class="form-group">
                                                            <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-2">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1">Điều trị/ <span class="text-primary">Treatment:</span></label>
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
                                                            <input type="radio" runat="server" id="radTreatment3" name="radTreatment" class="custom-control-input" />
                                                            <label class="custom-control-label" for="radTreatment3">Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-2 current_medication_field">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1"><span class="text-primary">5. Current medications:</span></label>
                                                        <div class="form-group">
                                                            <webUI:TextField runat="server" ID="txtMedicine" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-2">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                                    </div>

                                                    <div class="col-md-4">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" runat="server" id="rad_spec_opinion_requested1" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_spec_opinion_requested1">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-8">
                                                        <div class="custom-control custom-radio mb-1">
                                                            <input disabled-for="spec_opinion_requested_field" type="radio" runat="server" id="rad_spec_opinion_requested2" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_spec_opinion_requested2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                        </div>
                                                        <div class="form-group spec_opinion_requested_field">
                                                            <webUI:TextField runat="server" ID="txt_spec_opinion_requested_note" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-2">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                                        <div class="form-group">
                                                            <webUI:TextField runat="server" ID="txt_specific_education_required" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row mb-2">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                                        <div class="form-group">
                                                            <webUI:TextField runat="server" ID="txt_next_appointment" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-actions">
                                                        <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />
                                                        <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />
                                                        <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                        <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                        <asp:Button ID="btnPrint" OnClientClick="window.print()" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                                <ModalBody>
                                                    <div class="text-center">
                                                        <icon:ExclamationTriangle cssClass="text-danger" Width="80" Height="80" runat="server" />
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
