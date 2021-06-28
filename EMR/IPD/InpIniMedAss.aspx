<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InpIniMedAss.aspx.cs" Inherits="EMR.InpIniMedAss" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="Trash" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/icons/Calculator.ascx" TagPrefix="icon" TagName="Calculator" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="icon" TagName="PopupShowDelay" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="UpPrintForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info">
                                        <img src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4></h4>
                                            <h5>INPATIENT INITIAL MEDICAL ASSESSMENT</h5>
                                        </div>
                                        <div style="font-size: 13.3333px">
                                            <div>
                                                <asp:Label ID="lbPatientName" runat="server"></asp:Label>MAI MAI MÃI1
                                            </div>
                                            <div>
                                                <asp:Label ID="lbBirthday" runat="server" Text='<%# Eval("date_of_birth") %>'></asp:Label>
                                                |
                                    <asp:Label ID="lbSex" runat="server"></asp:Label>
                                            </div>
                                            <div>
                                                <asp:Label ID="lbPID" runat="server" Font-Bold="true"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <webUI:Line runat="server" />
                                </th>
                            </tr>
                        </thead>
                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div class="main" runat="server" id="print_content">
                                        <div class="row mb-2">
                                <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                    <asp:Label Style="font-weight: bold;">I. Lí do nhập viện/ Reason for admission: </asp:Label>
                                    <asp:Label runat="server" ID="prt_chief_complaint"></asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2 " style="text-align: justify;">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">I. Lý do đến khám/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Reason for admission: </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="Label2"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">II. Bệnh sử/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Medical history: </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">1. Bệnh sử hiện tại/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Current medical history: </asp:Label>
                                    <asp:Label Style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_cur_med_history"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">* Thuốc đang sử dụng/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Current medications: </asp:Label>
                                    <asp:Label runat="server" ID="prt_cur_medication"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">2. Tiền sử bệnh/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Antecedent medical history: </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12 " style="text-align: justify; margin-left: 10px">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">- Bản thân/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Personal: </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_personal"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12 " style="text-align: justify; margin-left: 10px">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">• Thói quen/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Habits: </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-3" style="text-align: justify; margin-left: 10px">
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Hút thuốc lá/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Smoking: </asp:Label>
                                </div>
                                <div class="col-2" style="top: -5px">
                                    <asp:Label Style="font-size: 22.5px;" ID="prt_habits_smoking_False" runat="server" />
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                    <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>
                                </div>
                                <div class="col-7" style="text-align: justify; top: -5px; margin-right: -15px">
                                    <asp:Label Style="font-size: 22.5px;" ID="prt_habits_smoking_True" runat="server" />
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Có, ghi số gói trong năm/ </label>
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Yes, specify pack years:</label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma; margin-right: 5px" runat="server" ID="lbl_habits_smoking_pack"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-3" style="text-align: justify; margin-left: 10px">
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Uống rượu/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Alcohol: </asp:Label>
                                </div>
                                <div class="col-2" style="top: -5px">
                                    <asp:Label Style="font-size: 22.5px;" ID="prt_habits_alcohol_False" runat="server" />

                                    <label style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                    <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>

                                </div>
                                <div class="col-6" style="top: -5px">
                                    <asp:Label Style="font-size: 22.5px;" ID="prt_habits_alcohol_True" runat="server" />
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Có, ghi rõ/ </label>
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Yes, specify: </label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_habits_alcohol_note"></asp:Label>

                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-3" style="text-align: justify; margin-left: 10px">
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Chất gây nghiện/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Drugs: </asp:Label>
                                </div>
                                <div class="col-2" style="top: -5px">
                                    <asp:Label Style="font-size: 22.5px;" ID="prt_habits_drugs_False" runat="server" />

                                    <label style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                    <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>

                                </div>
                                <div class="col-6" style="top: -5px">
                                    <asp:Label Style="font-size: 22.5px;" ID="prt_habits_drugs_True" runat="server" />
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Có, ghi rõ/ </label>
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Yes, specify: </label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_habits_drugs_note"></asp:Label>

                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12" style="text-align: justify; margin-left: 10px">
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Tập thể dục thường xuyên/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Regular physical exercise: </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-3" style="text-align: justify; margin-left: 10px">
                                </div>
                                <div class="col-2" style="top: -5px">
                                    <asp:Label Style="font-size: 22.5px;" ID="prt_habits_physical_exercise_False" runat="server" />
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                    <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>

                                </div>
                                <div class="col-6" style="top: -5px">
                                    <asp:Label Style="font-size: 22.5px;" ID="prt_habits_physical_exercise_True" runat="server" />
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Có, ghi rõ/ </label>
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Yes, specify: </label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_habits_phy_exer_note"></asp:Label>

                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12" style="text-align: justify; margin-left: 10px">
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Khác, Ghi rõ/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Other, Specify: </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_habits_other"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-3" style="text-align: justify; margin-left: 10px">
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Tiền sử dị ứng/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Allergy: </asp:Label>
                                </div>
                                <div class="col-2" style="top: -5px">
                                    <asp:Label Style="font-size: 22.5px;" ID="prt_allergy_False" runat="server" />

                                    <label style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                    <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>

                                </div>
                                <div class="col-6" style="top: -5px">
                                    <asp:Label Style="font-size: 22.5px;" ID="prt_allergy_True" runat="server" />
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Có, ghi rõ/ </label>
                                    <label style="font-size: 14.5px; font-family: Tahoma;">Yes, specify: </label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_allergy_note"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12 " style="text-align: justify; margin-left: 10px">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">- Gia đình / </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Family: </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_family"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12 " style="text-align: justify; margin-left: 10px">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">- Tiêm chủng/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Immunization: </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_immunization"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 " style="text-align: justify;">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">III. Khám bệnh/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Physical Examination: </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 " style="text-align: justify;">
                                <div class="col-12 " style="text-align: justify; margin-left: 15px">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">DẤU HIỆU SINH TỒN/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">VITAL SIGNS: </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12">
                                    <div class="row mb-2" style="margin-bottom: 0rem !important;">
                                        <div style="width: 280px; border-style: solid; border-width: 0.5px; margin-left: 10px; font-size: 14.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-left-width: 2px; border-top-width: 2px;">
                                            Nhiệt độ/ Temperature (C degree)
                                        </div>
                                        <div style="width: 80px; border-style: solid; border-width: 0.25px; font-size: 14.5px; font-family: Tahoma; text-align: center; border-top-width: 2px;">
                                            <asp:Label runat="server" ID="prt_vs_temperature"></asp:Label>
                                        </div>
                                        <div style="width: 280px; border-style: solid; border-width: 0.25px; font-size: 14.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-top-width: 2px;">
                                            Nhịp tim/ Heart rate  (phút/min)
                                        </div>
                                        <div style="width: 80px; border-style: solid; border-width: 0.5px; font-size: 14.5px; font-family: Tahoma; text-align: center; border-right-width: 2px; border-top-width: 2px;">
                                            <asp:Label runat="server" ID="prt_vs_heart_rate"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="row mb-2" style="margin-bottom: 0rem !important;">
                                        <div style="width: 280px; border-style: solid; border-width: 0.5px; margin-left: 10px; font-size: 14.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-left-width: 2px;">
                                            Cân nặng/ Weight (Kg)
                                        </div>
                                        <div style="width: 80px; border-style: solid; border-width: 0.25px; font-size: 14.5px; font-family: Tahoma; text-align: center">
                                            <asp:Label runat="server" ID="prt_vs_weight"></asp:Label>
                                        </div>
                                        <div style="width: 280px; border-style: solid; border-width: 0.25px; font-size: 14.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px">
                                            Nhịp thở/ Respiratory Rate (phút/min)
                                        </div>
                                        <div style="width: 80px; border-style: solid; border-width: 0.5px; font-size: 14.5px; font-family: Tahoma; text-align: center; border-right-width: 2px;">
                                            <asp:Label runat="server" ID="prt_vs_respiratory_rate"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="row mb-2" style="margin-bottom: 0rem !important;">
                                        <div style="width: 280px; border-style: solid; border-width: 0.5px; margin-left: 10px; font-size: 14.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-left-width: 2px;">
                                            Chiều cao/Height (cm)
                                        </div>
                                        <div style="width: 80px; border-style: solid; border-width: 0.25px; font-size: 14.5px; font-family: Tahoma; text-align: center">
                                            <asp:Label runat="server" ID="prt_vs_height"></asp:Label>
                                        </div>
                                        <div style="width: 280px; border-style: solid; border-width: 0.25px; font-size: 14.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px">
                                            Huyết áp/Blood pressure (mmHg)
                                        </div>
                                        <div style="width: 80px; border-style: solid; border-width: 0.5px; font-size: 14.5px; font-family: Tahoma; text-align: center; border-bottom-width: 1px; border-right-width: 2px;">
                                            <asp:Label runat="server" ID="prt_vs_blood_pressure"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="row mb-2" style="margin-bottom: 0px;">
                                        <div style="width: 280px; border-style: solid; border-width: 0.5px; margin-left: 10px; font-size: 14.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-bottom-width: 2px; border-left-width: 2px;">
                                            Chỉ số khối cơ thể/ BMI (Kg/m2)
                                        </div>
                                        <div style="width: 80px; border-style: solid; border-width: 0.25px; font-size: 14.5px; font-family: Tahoma; text-align: center; border-bottom-width: 2px;">
                                            <asp:Label runat="server" ID="prt_vs_BMI"></asp:Label>
                                        </div>
                                        <div style="width: 280px; border-style: solid; border-width: 0.25px; font-size: 14.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-bottom-width: 2px;">
                                            Độ bão hòa Oxy/ SpO2 (%)
                                        </div>
                                        <div style="width: 80px; border-style: solid; border-width: 0.25px; font-size: 14.5px; font-family: Tahoma; text-align: center; border-bottom-width: 2px; border-right-width: 2px;">
                                            <asp:Label runat="server" ID="prt_vs_spO2"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12 " style="text-align: left; margin: 15px; font-size: 14.5px; white-space: pre-line">
                                    <asp:Label runat="server" ID="prt_physical_exam"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-8 " style="text-align: justify;">
                                            <asp:Label Style="font-weight: bold; font-size: 13.5px; font-family: Tahoma">❖	Yêu cầu khám chuyên khoa tâm lý/ </asp:Label>
                                            <asp:Label Style="font-size: 13.5px; font-family: Tahoma">Psychological consultation required: </asp:Label>
                                        </div>
                                        <div class="col-2" style="top: -5px">
                                            <asp:Label Style="font-size: 22.5px;" ID="prt_psy_consul_required_False" runat="server" />
                                            <label style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                            <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>
                                        </div>
                                        <div class="col-2" style="top: -5px">
                                            <asp:Label Style="font-size: 22.5px;" ID="prt_psy_consul_required_True" runat="server" />
                                            <label style="font-size: 14.5px; font-family: Tahoma;">Có/ </label>
                                            <label style="font-size: 14.5px; font-family: Tahoma;">Yes</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2 " style="text-align: justify;">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">IV. Chỉ định và kết quả xét nghiệm/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Laboratory indications and results: </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 ">
                                <div class="col-12 " style="text-align: left; margin: 15px; font-size: 14.5px; white-space: pre-line">
                                    <asp:Label runat="server" ID="prt_laboratory_result"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 " style="text-align: justify;">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">V. Kết luận/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Conclusion: </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 " style="text-align: justify;">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Chẩn đoán ban đầu/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Initial diagnosis: </asp:Label>
                                    <asp:Label runat="server" ID="prt_initial_diagnosis"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 " style="text-align: justify;">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Chẩn đoán phân biệt/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Differential diagnosis: </asp:Label>
                                    <asp:Label runat="server" ID="prt_diff_diagnosis"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 " style="text-align: justify;">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Bệnh kèm theo/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Associated conditions: </asp:Label>
                                    <asp:Label runat="server" ID="prt_associated_conditions"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 " style="text-align: justify;">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Kế hoạch điều trị/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Treatment Plan: </asp:Label>
                                    <asp:Label runat="server" ID="prt_treatment_plan"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2 " style="text-align: justify;">
                                <div class="col-12 " style="text-align: justify;">
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Kế hoạch xuất viện/ </asp:Label>
                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Discharge plan: </asp:Label>
                                    <asp:Label runat="server" ID="prt_discharge_plan"></asp:Label>
                                </div>
                            </div>

                            <br />

                            <div class="row mb-2">
                                <div class="col-5">
                                </div>
                                <div class="col-7 mb-2">
                                    <div class="col-12" style="text-align: center;">
                                        <label style="font-size: 14.5px; font-family: Tahoma;">
                                            Ngày/Date
                                            <asp:Label runat="server" ID="lbl_date">
                                            </asp:Label>
                                        </label>
                                        <label style="font-size: 14.5px; font-family: Tahoma;">
                                            tháng/month
                                            <asp:Label runat="server" ID="lbl_month">
                                            </asp:Label>
                                        </label>
                                        <label style="font-size: 14.5px; font-family: Tahoma;">
                                            năm/year
                                            <asp:Label runat="server" ID="lbl_year">
                                            </asp:Label>
                                        </label>
                                    </div>
                                    <div class="col-12" style="text-align: center;">
                                        <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">
                                            Họ tên bác sĩ và mã số nhân viên/
                                            <span class="text-primary" style="font-size: 14.5px">Doctor’s name and ID</span>
                                        </label>
                                    </div>
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

                                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_amend_reason" CssClass="form-control" />

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                            ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                        </asp:Panel>

                        <webUI:PatientInfo runat="server" ID="PatientInfo2" />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card mt-2">
                                    <div class="card-header">
                                        <h4 class="text-primary">INPATIENT INITIAL MEDICAL ASSESSMENT</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">I. Lí do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                                    <div class="gt-2-a">
                                                        <label></label>
                                                        <asp:Label CssClass="d-block" runat="server" ID="lbl_chief_complaint"></asp:Label>

                                                        <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                        </div>
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

                                                <div class="col-md-12">
                                                    <div class="gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_cur_med_history"></asp:Label>
                                                        <div class="form-group" runat="server" id="cur_med_history_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_cur_med_history" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                        </legend>

                                                        <div class="col-md-12">
                                                            <div class="gt-2-a">
                                                        <label></label>
                                                            <asp:Label runat="server" ID="lbl_cur_medication"></asp:Label>
                                                            <div class="form-group" runat="server" id="cur_medication_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_cur_medication" />
                                                            </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                                </legend>

                                                <div class="col-md-12">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">Bản thân/ <span class="text-primary">Personal:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 mb-2">
                                                            <div class="gt-2-a">
                                                        <label></label>
                                                            <asp:Label runat="server" ID="lbl_personal"></asp:Label>
                                                            <div class="form-group" runat="server" id="personal_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_personal" />
                                                            </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <fieldset class="row mb-2">
                                                                <legend>
                                                                    <label class="control-label">Habits/ <span class="text-primary">Thói quen:</span></label>
                                                                </legend>
                                                                <div class="col-md-12 gt-2-a mb-2">
                                                                    <label class="control-label mb-2">Hút thuốc lá/ <span class="text-primary">Smoking:</span></label>
                                                                    <asp:Label runat="server" ID="lbl_habits_smoking"></asp:Label>
                                                                    <div class="form-group" runat="server" id="habits_smoking_wrapper">
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input type="radio" runat="server" id="rad_habits_smoking_false" name="rad_habits_smoking" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_habits_smoking_false">Không/ <span class="text-primary">No</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input disabled-for="habits_smoking_field" type="radio" runat="server" id="rad_habits_smoking_true" name="rad_habits_smoking" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_habits_smoking_true">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_habits_smoking" onclick="clear_radiobutton(this)">
                                                                                <icon:xsquare runat="server" ID="XSquare3" />
                                                                            </a>
                                                                        </div>
                                                                        <div class="form-group habits_smoking_field d-inline-block">
                                                                            <input runat="server" class="form-control" id="txt_habits_smoking_pack" data-type="number" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 gt-2-a mb-2">
                                                                    <label class="control-label mb-2">Uống rượu/ <span class="text-primary">Alcohol:</span></label>
                                                                    <asp:Label runat="server" ID="lbl_habits_alcohol"></asp:Label>
                                                                    <div class="form-group" runat="server" id="habits_alcohol_wrapper">
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input type="radio" runat="server" id="rad_habits_alcohol_false" name="rad_habits_alcohol" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_habits_alcohol_false">Không/ <span class="text-primary">No</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input disabled-for="habits_alcohol_field" type="radio" runat="server" id="rad_habits_alcohol_true" name="rad_habits_alcohol" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_habits_alcohol_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_habits_alcohol" onclick="clear_radiobutton(this)">
                                                                                <icon:xsquare runat="server" ID="XSquare4" />
                                                                            </a>
                                                                        </div>
                                                                        <div class="form-group habits_alcohol_field w-n d-inline-block">
                                                                            <webUI:TextField runat="server" ID="txt_habits_alcohol_note" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 gt-2-a mb-2">
                                                                    <label class="control-label mb-2">Chất gây nghiện/ <span class="text-primary">Drugs:</span></label>
                                                                    <asp:Label runat="server" ID="lbl_habits_drugs"></asp:Label>
                                                                    <div class="form-group" runat="server" id="habits_drugs_wrapper">
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input type="radio" runat="server" id="rad_habits_drugs_false" name="rad_habits_drugs" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_habits_drugs_false">Không/ <span class="text-primary">No</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input disabled-for="habits_drugs_field" type="radio" runat="server" id="rad_habits_drugs_true" name="rad_habits_drugs" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_habits_drugs_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_habits_drugs" onclick="clear_radiobutton(this)">
                                                                                <icon:xsquare runat="server" ID="XSquare5" />
                                                                            </a>
                                                                        </div>
                                                                        <div class="form-group habits_drugs_field w-n d-inline-block">
                                                                            <webUI:TextField runat="server" ID="txt_habits_drugs_note" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 gt-2-a mb-2">
                                                                    <label class="control-label mb-2">Tập thể dục thường xuyên/ <span class="text-primary">Regular physical exercise:</span></label>
                                                                    <asp:Label runat="server" ID="lbl_habits_physical_exercise"></asp:Label>
                                                                    <div class="form-group" runat="server" id="habits_physical_exercise_wrapper">
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input type="radio" runat="server" id="rad_habits_physical_exercise_false" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_habits_physical_exercise_false">Không/ <span class="text-primary">No</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input disabled-for="habits_physical_exercise_field" type="radio" runat="server" id="rad_habits_physical_exercise_true" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_habits_physical_exercise_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_habits_physical_exercise" onclick="clear_radiobutton(this)">
                                                                                <icon:xsquare runat="server" ID="XSquare6" />
                                                                            </a>
                                                                        </div>
                                                                        <div class="form-group habits_physical_exercise_field w-n d-inline-block">
                                                                            <webUI:TextField runat="server" ID="txt_habits_phy_exer_note" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 gt-2-a">
                                                                    <label class="control-label mb-1">Khác, Ghi rõ/ <span class="text-primary">Other, Specify:</span></label>
                                                                    <asp:Label runat="server" ID="lbl_habits_other"></asp:Label>
                                                                    <div class="form-group" runat="server" id="habits_other_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_habits_other" />
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label class="control-label mb-2">Tiền sử dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                            <asp:Label runat="server" ID="lbl_allergy"></asp:Label>
                                                                    <div class="form-group" runat="server" id="allergy_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio mb-1  d-inline-block">
                                                        <input disabled-for="allergy_field" type="radio" runat="server" id="rad_allergy_true" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                        <a href="javascript:void(0)"  data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare2" />
                                                        </a>
                                                    </div>
                                                    <div class="form-group allergy_field">
                                                        <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                    </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </fieldset>
                                            

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                                    <asp:Label runat="server" ID="lbl_family"></asp:Label>
                                                    <div class="form-group" runat="server" id="family_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_family" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Tiêm chủng/ <span class="text-primary">Immunization:</span></label>
                                                   <asp:Label runat="server" ID="lbl_immunization"></asp:Label>
                                                    <div class="form-group" runat="server" id="immunization_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_immunization" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                                </div>
                                            </div>

                                            <asp:UpdatePanel ID="updatepnl_vital_sign" runat="server">
                                                <ContentTemplate>
                                                    <div class="row">
                                                        <div class="col-md-12 gt-2-a">
                                                            <label class="control-label">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                                            <div>
                                                                <asp:LinkButton runat="server" ID="btnUpdateVitalSign" OnClick="btnUpdateVitalSign_Click" CssClass="btn btn-sm btn-secondary waves-effect">Update</asp:LinkButton>
                                                            <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updatepnl_vital_sign">
                                                                <ProgressTemplate>
                                                                    <div class="loader1 ml-2">
                                                                        <div style="width: 28px; height: 28px;" class="loader-wheel"></div>
                                                                    </div>
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 gt-2-a">
                                                            <label></label>
                                                            <div>
                                                                <div>
                                                                    <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                                    <asp:Label runat="server" ID="vs_temperature" />
                                                                </div>

                                                                <div >
                                                                    <label class="control-label mb-1 mr-2">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                                                    <asp:Label runat="server" ID="vs_heart_rate" />/phút (m)
                                                                </div>

                                                                <div >
                                                                    <label class="control-label mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                                    <asp:Label runat="server" ID="vs_weight" />Kg
                                                                </div>

                                                                <div >
                                                                    <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                                    <asp:Label runat="server" ID="vs_respiratory_rate" />/phút (m)
                                                                </div>

                                                                <div >
                                                                    <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                                    <asp:Label runat="server" ID="vs_height" />cm
                                                                </div>

                                                                <div >
                                                                    <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                                    <asp:Label runat="server" ID="vs_blood_pressure" />mmHg
                                                                </div>

                                                                <div >
                                                                    <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                                    <asp:Label runat="server" ID="vs_bmi" />(Kg/m <sup>2</sup>)
                                                    <div>
                                                        (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not applicable for children and pregnant</span>)
                                                    </div>
                                                                </div>

                                                                <div >
                                                                    <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                                    <asp:Label runat="server" ID="vs_spo2" />%
                                                                </div>

                                                                <div >
                                                                    <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                                    <asp:Label runat="server" ID="vs_pulse" />cm
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_physical_exam"></asp:Label>
                                                    <div class="form-group" runat="server" id="physical_exam_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_physical_exam" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological consultation required:</span></label>
                                                    <asp:Label runat="server" ID="lbl_psy_consul_required"></asp:Label>
                                                    <div class="form-group d-inline-block" runat="server" id="psy_consul_required_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_psy_consul_required_false" name="rad_psy_consul_required" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_psy_consul_required_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_psy_consul_required_true" name="rad_psy_consul_required" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_psy_consul_required_true">Có/ <span class="text-primary">Yes</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_psy_consul_required" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare1" />
                                                            </a>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12"><label class="control-label h4">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label></div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_laboratory_result"></asp:Label>
                                                    <div class="form-group" runat="server" id="laboratory_result_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_laboratory_result" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label>
                                                    <asp:Label runat="server" ID="lbl_add_investigation"></asp:Label>
                                                    <div class="form-group " runat="server" id="add_investigation_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_add_investigation" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label>
                                                    <asp:Label runat="server" ID="lbl_initial_diagnosis"></asp:Label>
                                                                    <div class="form-group" runat="server" id="initial_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Chẩn đoán xác định/ <span class="text-primary">Diagnosis:</span></label>
                                                    <asp:Label runat="server" ID="lbl_diagnosis"></asp:Label>
                                                                    <div class="form-group" runat="server" id="diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                                    <asp:Label runat="server" ID="lbl_diff_diagnosis"></asp:Label>
                                                                    <div class="form-group" runat="server" id="diff_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_diff_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                    <asp:Label runat="server" ID="lbl_associated_conditions"></asp:Label>
                                                                    <div class="form-group" runat="server" id="associated_conditions_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Kế hoạch điều trị/ <span class="text-primary">Treatment Plan:</span></label>
                                                    <asp:Label runat="server" ID="lbl_treatment_plan"></asp:Label>
                                                                    <div class="form-group" runat="server" id="treatment_plan_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_treatment_plan" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Kế hoạch xuất viện/ <span class="text-primary">Discharge Plan:</span></label>
                                                    <asp:Label runat="server" ID="lbl_discharge_plan"></asp:Label>
                                                                    <div class="form-group" runat="server" id="discharge_plan_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_discharge_plan" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-actions">
                                                    <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                    <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

                                                    <div data-toggle="modal" runat="server" data-target="#myModal" id="btnDeleteModal" class="btn btn-danger waves-effect">Delete</div>

                                                    <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                    <asp:LinkButton runat="server" OnClick="btnPrint_Click" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

                                                    <asp:LinkButton runat="server" OnClick="btnCancel_Click" ID="btnCancel" CssClass="btn btn-secondary waves-effect">Cancel</asp:LinkButton>
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
                                                    <div class="btn btn-default waves-effect" data-dismiss="modal">Close</div>
                                                    <asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
                                                </div>
                                            </ModalBody>
                                        </webUI:PopupModal>

                                        <icon:PopupShowDelay runat="server" ID="PopupShowDelay" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/checkValidFields.js"></script>
    <script src="../scripts/waves.js"></script>

    <script>
        formGroup_init();
        checkboxRadiobutton_init();
        InputFilter();

        function beforeAsyncPostBack() {
            var curtime = new Date();
            console.log(curtime);
        }

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter();
        }

    </script>

</body>
</html>
