<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedRecForNeoVaccin.aspx.cs" Inherits="EMR.OPD.MedRecForNeoVaccin" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="Trash" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <style>
        /* Base for label styling */
        [type="checkbox"]:not(:checked),
        [type="checkbox"]:checked {
            position: absolute;
            left: 0;
            opacity: 0.01;
        }

            [type="checkbox"]:not(:checked) + label,
            [type="checkbox"]:checked + label {
                position: relative;
                padding-left: 2.3em;
                font-size: 1.05em;
                line-height: 1.7;
                cursor: pointer;
            }

                /* checkbox aspect */
                [type="checkbox"]:not(:checked) + label:before,
                [type="checkbox"]:checked + label:before {
                    content: '';
                    position: absolute;
                    left: 0;
                    top: 0;
                    width: 1.4em;
                    height: 1.4em;
                    border: 1px solid #aaa;
                    background: #FFF;
                    border-radius: .2em;
                    box-shadow: inset 0 1px 3px rgba(0,0,0, .1), 0 0 0 rgba(203, 34, 237, .2);
                    -webkit-transition: all .275s;
                    transition: all .275s;
                }

                /* checked mark aspect */

                [type="checkbox"]:checked + label:after {
                    content: '✕';
                    position: absolute;
                    top: .48em;
                    left: .12em;
                    font-size: 1.375em;
                    color: #CB22ED;
                    line-height: 0;
                    -webkit-transition: all .2s;
                    transition: all .2s;
                }

                /* checked mark aspect changes */
                [type="checkbox"]:not(:checked) + label:after {
                    opacity: 0;
                    -webkit-transform: scale(0) rotate(45deg);
                    transform: scale(0) rotate(45deg);
                }


        [type="checkbox"]:disabled:not(:checked) + label:before,
        [type="checkbox"]:disabled:checked + label:before {
            box-shadow: none;
            border-color: #bbb;
            background-color: #e9e9e9;
        }

        [type="checkbox"]:disabled:checked + label:after {
            color: #777;
        }

        [type="checkbox"]:disabled + label {
            color: #000000;
        }
    </style>
    <script>
        function changeValue(a, b) {
            document.getElementById(b).value = document.getElementById(a).innerHTML;
        }
    </script>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />

        <div class="cssclsNoScreen">
            <table class="report-container">
                <thead class="report-header">
                    <tr>
                        <th class="report-header-cell">
                            <div class="header-info" style="display: flex; align-items: center;">
                                <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                                <div style="flex-grow: 1; text-align: center;">
                                    <div style="color: #007297; font-size: 26.6667px; font-family: Tahoma">BỆNH ÁN TIÊM CHỦNG SƠ SINH</div>
                                    <div style="color: #e20e5a; font-size: 16.6667px; font-family: Tahoma;">MEDICAL RECORD FOR NEONATAL VACCINATION</div>
                                </div>
                                <div style="width: 200px; text-align: center">
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
                            <div style="margin-bottom: 5px;">
                                <span style="width: 190px; border-bottom-style: solid; border-bottom-color: #e20e5a; border-bottom-width: 5px; display: inline-block; font-size: 26.6667px;"></span>
                                <span style="display: inline-block; border-bottom-style: solid; border-bottom-color: #007297; border-bottom-width: 5px; width: calc(100% - 191px); margin-left: -5px;"></span>
                            </div>
                        </th>
                    </tr>
                </thead>
                <tbody class="report-content">
                    <tr>
                        <td class="report-content-cell">
                            <div class="main" runat="server" id="print_content">
                                <!-- Code printed here -->
                                <div class="row mb-2 ">
                                    <div class="col-12 ">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">Họ tên người bệnh/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Full name: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma" runat="server" ID="lbl_Fullname"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-6 ">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">Ngày tháng năm sinh/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">DOB: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma" runat="server" ID="lbl_dob1"></asp:Label>
                                    </div>
                                    <div class="col-6 ">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">Giới tính/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Gender: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma" runat="server" ID="lbl_Gender"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-6 ">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">Ngày khám bệnh/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Day of visit: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma" runat="server" ID="lbl_VisitDate"></asp:Label>
                                    </div>
                                    <div class="col-6 ">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">Mã số người bệnh/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">PID: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma" runat="server" ID="lbl_PID"></asp:Label>
                                    </div>
                                </div>
                                <%--<div class="row mb-2 " style="text-align: justify;">
                                    <div class="col-12 " style="text-align: justify;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">I. Lý do đến khám/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Chief complaint: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma" runat="server" ID="lbl_chief_complaint"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">II. Bệnh sử/ </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma">Medical history: </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">1. Bệnh sử hiện tại/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Current medical history: </asp:Label>
                                        <asp:Label Style="text-align: justify; font-size: 17.5px; font-family: Tahoma" runat="server" ID="lbl_cur_med_history"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; margin-left: 10px">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">❖ Thuốc đang sử dụng/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Current medications: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma" runat="server" ID="lbl_cur_medications"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">2. Tiền sử bệnh/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Antecedent medical history: </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; margin-left: 10px">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">❖ Bản thân/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Personal: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma" runat="server" ID="lbl_personal"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; margin-left: 10px">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">❖ Gia đình/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Family: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma" runat="server" ID="lbl_family"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 ">
                                        <div class="row ">
                                            <div class="col-7 ">
                                                <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma; margin-left: 10px">❖ Dị ứng/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Hospitalisation required: </asp:Label>
                                            </div>
                                            <div class="col-3 ">
                                                <input type="checkbox" id="lbl_allergy_False" runat="server" disabled="disabled " />
                                                <label for="lbl_specialist_opinion_False " style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                                <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>
                                            </div>
                                            <div class="col-2 ">
                                                <input disabled-for="lbl_allergy" type="checkbox" runat="server" id="lbl_allergy_True" disabled="disabled" />
                                                <label for="lbl_specialist_opinion_True " style="font-size: 14.5px; font-family: Tahoma;">Có</label>
                                                <label style="font-size: 14.5px; font-family: Tahoma;">/ Yes</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 lbl_allergy ">
                                    <div class="col-12 " style="text-align: justify;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma; margin-left: 25px">● Nếu có, nêu rõ/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">If yes, specify: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma" runat="server" ID="lbl_allergy_text"> </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">III. Khám bệnh/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Physical examination: </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">• Dấu hiệu sinh tồn/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Vital signs: </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-12">
                                        <div class="row mb-2" style="margin-bottom: 0rem !important;">
                                            <div style="width: 400px; border-style: solid; border-width: 0.5px; margin-left: 10px; font-size: 17.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-left-width: 2px; border-top-width: 2px;">
                                                Nhiệt độ/ Temperature (C degree)
                                            </div>
                                            <div style="width: 115px; border-style: solid; border-width: 0.25px; font-size: 17.5px; font-family: Tahoma; text-align: center; border-top-width: 2px;">
                                                <asp:Label runat="server" ID="lbl_vs_temperature"></asp:Label>
                                            </div>
                                            <div style="width: 400px; border-style: solid; border-width: 0.25px; font-size: 17.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-top-width: 2px;">
                                                Mạch/ Pulse (/min)
                                            </div>
                                            <div style="width: 120px; border-style: solid; border-width: 0.5px; font-size: 17.5px; font-family: Tahoma; text-align: center; border-right-width: 2px; border-top-width: 2px;">
                                                <asp:Label runat="server" ID="lbl_vs_heart_rate"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row mb-2" style="margin-bottom: 0rem !important;">
                                            <div style="width: 400px; border-style: solid; border-width: 0.5px; margin-left: 10px; font-size: 17.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-left-width: 2px;">
                                                Cân nặng/ Weight (Kg)
                                            </div>
                                            <div style="width: 115px; border-style: solid; border-width: 0.25px; font-size: 17.5px; font-family: Tahoma; text-align: center">
                                                <asp:Label runat="server" ID="lbl_vs_weight"></asp:Label>
                                            </div>
                                            <div style="width: 400px; border-style: solid; border-width: 0.25px; font-size: 17.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px">
                                                Nhịp thở/ Respiratory Rate (/min)
                                            </div>
                                            <div style="width: 120px; border-style: solid; border-width: 0.5px; font-size: 17.5px; font-family: Tahoma; text-align: center; border-right-width: 2px;">
                                                <asp:Label runat="server" ID="lbl_vs_respiratory_rate"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row mb-2" style="margin-bottom: 0rem !important;">
                                            <div style="width: 400px; border-style: solid; border-width: 0.5px; margin-left: 10px; font-size: 17.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-left-width: 2px;">
                                                Chiều cao/Height (cm)
                                            </div>
                                            <div style="width: 115px; border-style: solid; border-width: 0.25px; font-size: 17.5px; font-family: Tahoma; text-align: center">
                                                <asp:Label runat="server" ID="lbl_vs_height"></asp:Label>
                                            </div>
                                            <div style="width: 400px; border-style: solid; border-width: 0.25px; font-size: 17.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px">
                                                Huyết áp/Blood pressure (mmHg)
                                            </div>
                                            <div style="width: 120px; border-style: solid; border-width: 0.5px; font-size: 17.5px; font-family: Tahoma; text-align: center; border-bottom-width: 1px; border-right-width: 2px;">
                                                <asp:Label runat="server" ID="lbl_vs_blood_pressure"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row mb-2" style="margin-bottom: 0px;">
                                            <div style="width: 400px; border-style: solid; border-width: 0.5px; margin-left: 10px; font-size: 17.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-bottom-width: 2px; border-left-width: 2px;">
                                                Chỉ số khối cơ thể/ BMI (Kg/m2)
                                            </div>
                                            <div style="width: 115px; border-style: solid; border-width: 0.25px; font-size: 17.5px; font-family: Tahoma; text-align: center; border-bottom-width: 2px;">
                                                <asp:Label runat="server" ID="lbl_vs_BMI"></asp:Label>
                                            </div>
                                            <div style="width: 400px; border-style: solid; border-width: 0.25px; font-size: 17.5px; font-family: Tahoma; padding-left: 10px; padding-right: 10px; border-bottom-width: 2px;">
                                                Độ bão hòa Oxy/ SpO2 (%)
                                            </div>
                                            <div style="width: 120px; border-style: solid; border-width: 0.25px; font-size: 17.5px; font-family: Tahoma; text-align: center; border-bottom-width: 2px; border-right-width: 2px;">
                                                <asp:Label runat="server" ID="lbl_vs_SpO2"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">• Khám sàng lọc trước tiêm chủng/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Screening before vaccination: </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; margin-left:15px">
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma">1. Tình trạng sức khỏe chưa ổn định/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Screening before vaccination: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_scr_before_vacc_1"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12" style="text-align: justify; margin-left:15px;margin-right:10px;">
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma">2. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 37,5°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px;  font-family: Tahoma;">Fever / Hypothermia (Fever: temperature ≥ 37.5 ° C; <br style="margin:0px;padding:0px">Hypothermia: temperature ≤ 35.5 ° C): <asp:Label Style="font-size: 17.5px" runat="server" ID="lbl_scr_before_vacc_2"></asp:Label></br> </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; margin-left:15px">
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma">3. Khóc bé hoặc không khóc/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Cry or unable to cry: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_scr_before_vacc_3"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; margin-left:15px">
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma">4. Da, môi không hồng/ Fever/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Skin and lips are not pink: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_scr_before_vacc_4"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; margin-left:15px">
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma">5. Bú kém hoặc bỏ bú/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Poor breastfeeding or breastfeeding refusal: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_scr_before_vacc_5"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; margin-left:15px">
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma">6. Tuổi thai < 28 tuần/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Gestational age < 28 weeks: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_scr_before_vacc_6"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; margin-left:15px">
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma">7. Trẻ < 34 tuần tuổi/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Children < 34 weeks old: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_scr_before_vacc_7"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; margin-left:15px">
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma">8. Cân nặng của trẻ < 2000 g, mẹ có HBsAg (-) / </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Child's weight < 2000g, his/her morther HbsAg (-): </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_scr_before_vacc_8"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; margin-left:15px">
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma">9. Các chống chỉ định khác, nếu có ghi rõ/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Other contraindications, if yes specified: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_scr_before_vacc_9"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">IV. Chỉ định và kết quả xét nghiệm/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Laboratory indications and results: </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">• Loại vắc xin tiêm chủng lần này/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Appointed vaccine: </asp:Label>
                                    </div>
                                </div>--%>
                                <%--<div class="row mb-2 ">
	                                <div class="col-md-12 ">
		                                <asp:UpdatePanel ID="updatePanel2" runat="server" UpdateMode="Always ">
			                                <ContentTemplate>
				                                <asp:GridView ShowHeaderWhenEmpty="true " ID="lbl_appointed_vaccine" runat="server" AutoGenerateColumns="false ">
					                                <Columns>
						                                <asp:TemplateField>
							                                <HeaderTemplate>
                                                                 <div style="width:190px; text-align:center">
                                                                    <label class="d-block mb-0 h4"style="font-size:16.5px; font-family:Tahoma; font-weight:bold">Tên vaccin</label>
                                                                    <span class="text-primary" style="font-size:14.5px; font-family:Tahoma;margin-left: 5px">Drug names</span>
                                                                </div>
							                                </HeaderTemplate>
							                                <ItemTemplate>
								                                <div style="width:190px;font-size: 16.5px; font-family: Tahoma;text-align:justify;margin:5px " >
                                                                    <asp:Label runat="server" Text='<%# Eval("drug_name") %>'></asp:Label>
									                            </div>
							                                </ItemTemplate>
						                                </asp:TemplateField>
						                                <asp:TemplateField>
							                                <HeaderTemplate>
                                                                <div style="width:180px; text-align:center">
                                                                    <label class="d-block mb-0 h4"style="font-size:16.5px; font-family:Tahoma; font-weight:bold">Hàm lượng</label>
                                                                    <span class="text-primary" style="font-size:14.5px; font-family:Tahoma;margin-left: 5px">Strength</span>
                                                                </div>
							                                </HeaderTemplate>
							                                <ItemTemplate>
								                                <div style="width: 180px; font-size: 16.5px; font-family: Tahoma;text-align:center;margin:5px  ">
                                                                    <asp:Label runat="server" Text='<%# Eval("strength") %>'></asp:Label>
                                                                </div>
							                                </ItemTemplate>
						                                </asp:TemplateField>
						                                <asp:TemplateField>
							                                <HeaderTemplate>
								                                <div style="width:180px; text-align:center">
                                                                    <label class="d-block mb-0 h4"style="font-size:16.5px; font-family:Tahoma; font-weight:bold">Đường dùng</label>
                                                                    <span class="text-primary" style="font-size:14.5px; font-family:Tahoma;margin-left: 5px">Route</span>
                                                                </div>
							                                </HeaderTemplate>
							                                <ItemTemplate>
								                                <div style="width: 180px;text-align:center;font-size: 16.5px; font-family: Tahoma;margin:5px ">
									                                <asp:Label runat="server" Text='<%# Eval("router") %>'></asp:Label>
                                                                </div>
							                                </ItemTemplate>
						                                </asp:TemplateField>
                                                        <asp:TemplateField>
							                                <HeaderTemplate>
								                                <div style="width:440px; text-align:center">
                                                                    <label class="d-block mb-0 h4"style="font-size:16.5px; font-family:Tahoma; font-weight:bold">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do</label>
                                                                    <span class="text-primary" style="font-size:14.5px; font-family:Tahoma;margin-left: 5px">Additional instruction/ PRN order with reason</span>
                                                                </div>
							                                </HeaderTemplate>
							                                <ItemTemplate>
								                                <div style="width: 440px;text-align:justify;font-size: 16.5px; font-family: Tahoma;margin:5px ;margin:5px ">
									                                <asp:Label runat="server" Text='<%# Eval("reason") %>'></asp:Label>
                                                                </div>
							                                </ItemTemplate>
						                                </asp:TemplateField>
					                                </Columns>
				                                </asp:GridView>
			                                </ContentTemplate>
		                                </asp:UpdatePanel>
	                                </div>
                                </div>--%>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;margin-left:15px">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">• Khảo sát bổ sung khác/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Additional investigations: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_additional_investigations"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">V. Kết luận/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Conclusion </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;margin-left:15px">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">● Chẩn đoán ban đầu/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Initial diagnosis: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_initial_diagnosis"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;margin-left:15px">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">● Chẩn đoán phân biệt/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Differential diagnosis: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_differential_diagnosis"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify;margin-left:15px">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">● Bệnh kèm theo/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Associated conditions: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_associated_conditions"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
	                                <div class="col-12 " style="margin-left:15px">
		                                <div class="row ">
			                                <div class="col-3 ">
				                                <asp:Label style="font-weight: bold ;font-size: 17.5px; font-family: Tahoma ">● Điều trị/ </asp:Label>
				                                <asp:Label style="font-size: 14.5px; font-family: Tahoma ">Treatment </asp:Label>
			                                </div>
			                                <div class="col-3 ">
                                                <input type="checkbox" id="lbl_treatment_code_OPD" runat="server" disabled="disabled"/>
				                                <label for="lbl_treatment_code_ " style="font-size:14.5px; font-family:Tahoma; ">Ngoại trú</label>
				                                <label style="font-size:14.5px; font-family:Tahoma; ">/ Ambulatory care</label>
			                                </div>
			                                <div class="col-3 ">
                                                <input type="checkbox" id="lbl_treatment_code_IPD" runat="server" disabled="disabled"/>
				                                <label for="lbl_treatment_code_ " style="font-size:14.5px; font-family:Tahoma; ">Nhập viện</label>
				                                <label style="font-size:14.5px; font-family:Tahoma; ">/ Admission</label>
			                                </div>
			                                <div class="col-3 ">
                                                <input type="checkbox" id="lbl_treatment_code_TRF" runat="server" disabled="disabled"/>
				                                <label for="lbl_treatment_code_ " style="font-size:14.5px; font-family:Tahoma; ">Chuyển viện</label>
				                                <label style="font-size:14.5px; font-family:Tahoma; ">/ Transfer</label>
			                                </div>
		                                </div>
	                                </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-7 " style="text-align: justify;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">❖ Yêu cầu ý kiến chuyên khoa/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Specialized opinion requested: </asp:Label>
                                    </div>
                                    <div class="col-3 ">
                                        <input type="checkbox" id="lbl_spec_opinion_req_False" runat="server" disabled="disabled"/>
				                        <label for="lbl_specialist_opinion_False " style="font-size:14.5px; font-family:Tahoma; ">Không</label>
				                        <label style="font-size:14.5px; font-family:Tahoma; ">/ No</label>
			                        </div>
			                        <div class="col-2 ">
                                        <input disabled-for="lbl_specialist_opinion_field"  type="checkbox" id="lbl_spec_opinion_req_True" runat="server" disabled="disabled"/>
				                        <label for="lbl_specialist_opinion_True " style="font-size:14.5px; font-family:Tahoma; ">Có</label>
				                        <label style="font-size:14.5px; font-family:Tahoma; ">/ Yes</label>
			                        </div>
                                </div>
                                <div class="row mb-2 lbl_specialist_opinion_True">
                                    <div class="col-12  " style="text-align: justify;margin-left:15px">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">● Nếu có, nêu rõ/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">If yes, specify: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_spec_opinion_req_text"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 lbl_specialist_opinion_True">
                                    <div class="col-12  " style="text-align: justify;margin-left:15px">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">● Hướng dẫn cụ thể dành cho bệnh nhân/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Specific education required: </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 lbl_specialist_opinion_True">
                                    <div class="col-12  " style="text-align: justify;padding-right:35px;margin-left:20px">
                                        <asp:Label Style="font-size: 17.5px; padding-right:30px" runat="server" ID="lbl_pecific_edu_req"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12  " style="text-align: justify;margin-left:15px;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">● Hẹn lần khám tới/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Next appointment: </asp:Label>
                                        <asp:Label Style="font-size: 17.5px;" runat="server" ID="lbl_next_appointment"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">VI. Xác nhận của người tiêm chủng/người giám hộ hợp pháp/ </asp:Label>
                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma">Confirmation of patient/legal guardian </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12  " style="text-align: justify;margin-left:20px;padding-right:35px">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">● Tôi đã được nghe bác sĩ tư vấn và đồng ý tiêm chủng cho tôi/người mà tôi làm giám hộ hợp pháp.Tôi đã
kiểm tra đúng thuốc tiêm và thuốc còn thời hạn dùng./ </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12  " style="text-align: justify;margin-left:15px">
                                        <asp:Label Style=" font-size: 17.5px; font-family: Tahoma">I have been consulted and agree on vaccination. I checked right medication and medication has still not
expired. </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div style="width:620px;text-align: justify;margin-left:25px">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">• Họ tên người tiêm chủng/người giám hộ/ </asp:Label>
                                        <asp:Label Style="font-size: 17.5px; font-family: Tahoma">Full name of patient / guard: </asp:Label>
                                    </div>
                                    <div style="width:410px">
                                        <hr style="border-bottom: 0.25px solid black">
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div style="width:620px; text-align: justify;margin-left:25px;">
                                        <asp:Label Style="font-weight: bold; font-size: 17.5px; font-family: Tahoma">• Chữ ký người tiêm chủng/người giám hộ/ </asp:Label>
                                        <asp:Label Style=" font-size: 17.5px; font-family: Tahoma">Full name of patient/ guard: </asp:Label>
                                    </div>
                                    <div style="width:410px">
                                        <hr style="border-bottom: 0.25px solid black">
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
        <div class="h-100 w-100 " style="overflow: scroll">
            <div class="cssclsNoPrint">
                
                <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <webUI:AmendReason runat="server" ID="txt_amendReason" />
                        </asp:Panel>

                        <uc1:PatientInfo runat="server" ID="PatientInfo" />

                        <div class="row" style="margin-bottom: 50px">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">MEDICAL RECORD FOR NEONATAL VACCINATION</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-body collapse show" id="collapseOne">
                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1 h4">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1 h4">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">1. Bệnh sử hiện tại/ <span class="text-primary">Current medical history:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_cur_med_history" />
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <label class="control-label mb-1 d-inline-block ">* Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_cur_medications" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Tiền sử bệnh/ <span class="text-primary">Antecedent medical history:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <label class="control-label mb-1">Bản thân/ <span class="text-primary">Personal:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_personal" />
                                                    </div>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_family" />
                                                    </div>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <label class="control-label mb-1 d-block">Dị ứng/ <span class="text-primary">Allergy:</span></label>

                                                    <div class="custom-control custom-radio d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_allergy_False" runat="server" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_False">Không/<span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                        <input disabled-for="required_code_field" type="radio" id="rad_allergy_True" runat="server" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_True">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                            <icon:XSquare runat="server" ID="XSquare2" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group txt_allergy_note mt-2">
                                                        <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1 h4">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                                </legend>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                                    <div class="form-group w-5 d-inline-block">
                                                        <input runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                        <span class="append">Kg</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                    <div class="form-group w-5 d-inline-block">
                                                        <input runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input maxlength="3" id="txt_vs_height" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                    <div class="form-group w-5 d-inline-block">
                                                        <input id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_BMI" class="form-control text-right" disabled="disabled" />
                                                        <span class="append">(Kg/m <sup>2</sup>)</span>
                                                    </div>
                                                    <p class="mt-1">
                                                        (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not applicable for children and pregnant</span>)
                                                    </p>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>

                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Khám sàng lọc trước tiêm chủng/ <span class="text-primary">Screening before vaccination:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">1. Tình trạng sức khỏe chưa ổn định/ <span class="text-primary">Unstable health condition:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_1" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">2. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 37,5°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ <span class="text-primary">Fever / Hypothermia (Fever: temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_2" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">3. Khóc bé hoặc không khóc/ <span class="text-primary">Cry or unable to cry:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_3" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">4. Da, môi không hồng/ <span class="text-primary">Skin and lips are not pink:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_4" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">5. Bú kém hoặc bỏ bú/ <span class="text-primary">Poor breastfeeding or breastfeeding refusal:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_5" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">6. Tuổi thai < 28 tuần/ <span class="text-primary">Gestational age <28 weeks:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_6" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">7. Trẻ < 34 tuần tuổi/ <span class="text-primary">Children <34 weeks old:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_7" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">8. Cân nặng của trẻ < 2000 g, mẹ có HBsAg (-)/ <span class="text-primary">Child's weight < 2000g, his/her morther HbsAg (-):</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_8" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">9. Các chống chỉ định khác, nếu có ghi rõ/ <span class="text-primary">Other contraindications, if yes specified:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_9" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1 h4">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                                </div>
                                                <div class="col-12">
                                                    <asp:UpdatePanel ID="updatePanel_appointed_vaccine" runat="server" UpdateMode="Always">
                                                        <ContentTemplate>
                                                            <asp:GridView ShowHeaderWhenEmpty="true"
                                                                ID="grid_appointed_vaccine" runat="server"
                                                                OnRowDeleting="grid_appointed_vaccine_RowDeleting"
                                                                OnRowUpdating="gridappointed_vaccine_RowUpdating"
                                                                OnRowDataBound="gridappointed_vaccine_RowDataBound"
                                                                CssClass="tb-responsive table-bordered"
                                                                AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 300px">Tên vaccin/ <span class="text-primary">Drug names</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("drug_name") %>' DataKey="drug_name" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 300px">Hàm lượng/ <span class="text-primary">Strength</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("strength") %>' DataKey="strength" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 300px">Đường dùng/ <span class="text-primary">Route</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("router") %>' DataKey="router" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 300px">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do/ <span class="text-primary">Additional instruction/ PRN order with reason</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("reason") %>' DataKey="reason" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                                <icon:trash runat="server" ID="Trash" />
                                                                            </asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                   
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:UpdateProgress ID="updateProgress_appointed_vaccine" runat="server" AssociatedUpdatePanelID="updatePanel_appointed_vaccine">
                                                                <ProgressTemplate>
                                                                    Please wait....
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                            <div class="mt-2">
                                                                <asp:Button ID="btn_grid_appointed_vaccine_add" runat="server" CssClass="btn btn-sm btn-outline-primary " OnClick="btn_grid_appointed_vaccine_add_Click" Text="Add row" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btn_grid_appointed_vaccine_add" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Loại vắc xin tiêm chủng lần này/ <span class="text-primary">Appointed Vaccine:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label>
                                                        </legend>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_additional_investigations" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-12">
                                                    <label class="control-label mb-1 h4">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis (ICD 10):</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis (ICD 10):</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_differential_diagnosis" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Kế hoạch điều trị/ <span class="text-primary">Treatment:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_treatment_code_OPD" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_treatment_code_OPD">
                                                            Ngoại trú/ <span class="text-primary">Ambulatory care</span>
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_treatment_code_IPD" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_treatment_code_IPD">
                                                            Nhập viện/ <span class="text-primary">Admission</span>
                                                        </label>
                                                    </div>
                                                    <div class="custom-control custom-radio  d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_treatment_code_TRF" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_treatment_code_TRF">
                                                            Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_treatment_code" onclick="clear_radiobutton(this)">
                                                            <icon:XSquare runat="server" ID="XSquare1" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <div class="custom-control custom-radio d-inline-block mr-2 d-inline-block">
                                                        <input type="radio" id="rad_spec_opinion_req_False" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_spec_opinion_req_False">Không/<span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block d-inline-block">
                                                        <input disabled-for="spec_opinion_req_text_field" type="radio" id="rad_spec_opinion_req_True" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_spec_opinion_req_True">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_spec_opinion_req" onclick="clear_radiobutton(this)">
                                                            <icon:XSquare runat="server" ID="XSquare3" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group par spec_opinion_req_text_field">
                                                        <webUI:TextField runat="server" ID="txt_spec_opinion_req_text" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <webUI:TextField runat="server" ID="txt_pecific_edu_req" />
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                                </legend>

                                                <div class="col-12 mb-2">
                                                    <webUI:TextField runat="server" ID="txt_next_appointment" />
                                                </div>
                                            </fieldset>

                                        </div>

                                        <fieldset class="row mb-2">
                                            <div class="form-actions">
                                                <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />
                                                <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />
                                                <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                <asp:Button OnClientClick="window.print()" ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                                <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                            </div>
                                        </fieldset>

                                        <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                            <ModalBody>
                                                <div class="text-center">
                                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                    <h4 class="mt-4 mb-4">Delete document?
                                                    </h4>
                                                </div>
                                                <div class="text-right">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <asp:Button runat="server" OnClick="btnDelete_Click" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                                </div>
                                            </ModalBody>
                                        </webUI:PopupModal>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        <asp:PostBackTrigger ControlID="btnAmend" />
                        <asp:PostBackTrigger ControlID="btnCancel" />
                        <asp:PostBackTrigger ControlID="btnComplete" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
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

