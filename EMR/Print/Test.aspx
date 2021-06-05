<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="EMR.Print.Tét" %>

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
<%--    <div class="cssclsNoScreen">--%>
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
    
    



    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>
</html>