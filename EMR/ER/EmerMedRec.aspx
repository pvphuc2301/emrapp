﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmerMedRec.aspx.cs" Inherits="EMR.ER.EmerMedRec" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="Input" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/DateTime.ascx" TagPrefix="webUI" TagName="DateTime" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="Button" TagName="PopupShowDelay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <style>
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
                /*font-size: 1.05em;*/
                /*line-height: 1.7;*/
                /*cursor: pointer;*/
            }

                /* checkbox aspect */
                [type="checkbox"]:not(:checked) + label:before,
                [type="checkbox"]:checked + label:before {
                    content: '❏';
                    position: absolute;
                    left: 0;
                }

                /* checked mark aspect */

                [type="checkbox"]:checked + label:after {
                    content: '☒';
                    position: absolute;
                    top: .48em;
                    left: .12em;
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
        }

        [type="checkbox"]:disabled:checked + label:after {
            color: #777;
        }

        [type="checkbox"]:disabled + label {
            color: #000000;
        }
    </style>
    <style>
        .alert {
            display: flex;
            align-items: center;
        }

        #MessagePlaceHolder {
            left: 0;
            right: 0;
        }
    </style>
    <script>
        function changeValue(a, b) {
            document.getElementById(b).value = document.getElementById(a).innerHTML;
        }
    </script>
</head>

<body>

    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <div class="cssclsNoScreen">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info" style="display: flex; align-items: center;">
                                        <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                                        <div style="flex-grow: 1; text-align: center;">
                                            <div style="color: #007297; font-size: 26.6667px; font-family: Tahoma">PHIẾU ĐÁNH GIÁ BỆNH NHÂN TẠI KHOA CẤP CỨU</div>
                                            <div style="color: #e20e5a; font-size: 16.6667px; font-family: Tahoma;">EMERGENCY MEDICAL ASSESSMENT</div>
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
                                        <div style="text-align: center; font-size: 13.5px; margin-bottom: 15px">
                                            <label class="d-block mb-0 h4">(Do bác sĩ cấp cứu điền trước khi bệnh nhân rời khỏi khoa cấp cứu)</label>
                                            <span class="text-primary">(To be completed by the Emergency Doctor before discharge from Emergency)</span>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma">Giờ bắt đầu đánh giá</asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> / Starting time of the assessment: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_evaluation_time"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 " style="text-align: justify;">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Lý do đến khám/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Chief complaint/ Reason of consultation: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_chief_complaint"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12">
                                                <div class="custom-control custom-radio">
                                                    <div class="row">
                                                        <div class="col-2" style="margin-left: -15px;">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label Style="font-size: 25.5px; text-align: start" ID="lbl_chief_complaint_code_R" runat="server" />
                                                                    <label for="lbl_chief_complaint_code_R " style="font-size: 16.5px; font-family: Tahoma; font-weight: bold; margin-left: 5px;">Hồi sức</label>
                                                                </div>
                                                            </div>
                                                            <div style="margin-left: 30px;"><span style="font-size: 16.5px; font-family: Tahoma; margin-top: -5px;" class="text-primary d-block mb-0 h4">Resuscitation</span></div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label Style="font-size: 25.5px;" ID="lbl_chief_complaint_code_E" runat="server" />

                                                                    <label for="lbl_chief_complaint_code_E " style="font-size: 16.5px; font-family: Tahoma; font-weight: bold; margin-left: 5px;">Cấp cứu</label>
                                                                </div>
                                                            </div>
                                                            <div style="margin-left: 35px;"><span style="font-size: 16.5px; font-family: Tahoma; margin-top: -5px;" class="text-primary d-block mb-0 h4">Emergency</span></div>
                                                        </div>
                                                        <div class="col-3">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label Style="font-size: 25.5px;" ID="lbl_chief_complaint_code_U" runat="server" />
                                                                    <label for="lbl_chief_complaint_code_U " style="font-size: 16.5px; font-family: Tahoma; font-weight: bold; margin-left: 5px;">Khẩn trương</label>
                                                                </div>
                                                            </div>
                                                            <div style="margin-left: 35px;"><span style="font-size: 16.5px; font-family: Tahoma; margin-top: -5px;" class="text-primary d-block mb-0 h4">Urgent</span></div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label Style="font-size: 25.5px;" ID="lbl_chief_complaint_code_L" runat="server" />
                                                                    <label for="lbl_chief_complaint_code_L " style="font-size: 16.5px; font-family: Tahoma; font-weight: bold; margin-left: 5px;">Trì hoãn</label>
                                                                </div>
                                                            </div>
                                                            <div style="margin-left: 35px;"><span style="font-size: 16.5px; font-family: Tahoma; margin-top: -5px;" class="text-primary d-block mb-0 h4">Less urgent</span></div>
                                                        </div>
                                                        <div class="col-3">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label Style="font-size: 25.5px;" ID="lbl_chief_complaint_code_N" runat="server" />
                                                                    <label for="lbl_chief_complaint_code_N " style="font-size: 16.5px; font-family: Tahoma; font-weight: bold; margin-left: 5px;">Không cấp cứu</label>
                                                                </div>
                                                            </div>
                                                            <div style="margin-left: 35px;"><span style="font-size: 16.5px; font-family: Tahoma; margin-top: -5px;" class="text-primary d-block mb-0 h4">Non-Urgent</span></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Bệnh sử </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> / History of present illness </asp:Label>
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> (HPI): </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_history_of_present"></asp:Label>

                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Meds: </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_past_med_his_meds"></asp:Label>

                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Surgical: </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_past_med_his_surs"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-3 ">
                                                        <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Thói quen </asp:Label>
                                                        <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> / Habits </asp:Label>
                                                    </div>
                                                    <div class="col-3 ">
                                                        <asp:Label Style="font-size: 25.5px; font-family: Tahoma" runat="server" ID="lbl_habits_A"></asp:Label>
                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 16.5px; font-family: Tahoma;">Rượu</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Alcohol</label>
                                                    </div>
                                                    <div class="col-3 ">
                                                        <asp:Label Style="font-size: 25.5px; font-family: Tahoma" runat="server" ID="lbl_habits_S"></asp:Label>
                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 16.5px; font-family: Tahoma;">Thuốc lá</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Smoking</label>
                                                    </div>
                                                    <div class="col-3 ">
                                                        <asp:Label Style="font-size: 25.5px; font-family: Tahoma" runat="server" ID="lbl_habits_D"></asp:Label>
                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 16.5px; font-family: Tahoma;">Chất gây nghiện</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Drugs</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="margin-left: 50px; text-align: justify">
                                                <label for="lbl_chief_complaint_code_E " style="font-weight: bold; font-size: 16.5px; font-family: Tahoma">Khác ghi rõ</label>
                                                <label style="font-size: 16.5px; font-family: Tahoma;">/ Other, specify: </label>
                                                <asp:Label Style="text-align: justify; font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_habits_other"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Thuốc dùng tại nhà/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Home medications: </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_home_medications"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Tiền sử dị ứng/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Allergies: </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_allergies"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Tiền sử bệnh người thân/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Relevant family history: </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_relevant_family_history"></asp:Label>

                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Khám lâm sàng liên quan/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Physical examination: </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Kết quả tìm thấy/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Findings (General and Diagnostic support): </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_finding"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Yêu cầu khám chuyên khoa tâm lý/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Psychological assessment required: </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-2 " style="margin-left: 40px">
                                                        <asp:Label Style="font-size: 25.5px;" ID="lbl_required_code_False" runat="server" />
                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 16.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col ">
                                                        <asp:Label Style="font-size: 25.5px;" ID="lbl_required_code_True" runat="server" />
                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 16.5px; font-family: Tahoma;">Có, ghi rõ</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Yes, specify: </label>
                                                        <asp:Label Style="text-align: justify; font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_required_text"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Kết quả khảo sát/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Investigations Results (Labs, imaging...): </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_investigations_results"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Chẩn đoán sơ bộ/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Initial diagnosis: </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_initial_diagnosis"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Chẩn đoán phân biệt/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Diferential diagnosis: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_diferential_diagnosis"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Bệnh kèm theo/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Associated conditions: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_associated_conditions"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Chẩn đoán xác định/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Comfirmed Diagnosis: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_comfirmed_diagnosis"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-7 ">
                                                        <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Ý kiến của bác sỹ chuyên khoa: </asp:Label>
                                                        <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> / Specialist opinion: </asp:Label>
                                                    </div>
                                                    <div class="col-3 ">
                                                        <asp:Label Style="font-size: 25.5px;" ID="lbl_specialist_opinion_False" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 16.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label disabled-for="lbl_specialist_opinion_field" Style="font-size: 25.5px;" ID="lbl_specialist_opinion_True" runat="server" />
                                                        <label for="lbl_specialist_opinion_True " style="font-size: 16.5px; font-family: Tahoma;">Có</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Yes</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 lbl_specialist_opinion_field">
                                            <div class="col-5">
                                                <label class="d-block mb-0 h4" style="font-size: 16.5px; font-family: Tahoma; font-weight: 700; margin-left: 25px;">* Tên của bác sĩ chuyên khoa/ khoa:</label>
                                                <span class="text-primary" style="margin-left: 16.5px; margin-left: 50px;">Name of the specialist/ Department</span>
                                            </div>
                                            <div class="col-7">
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_name_of_specialist"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_specialist_opinion_field">
                                            <div class="col-5">
                                                <asp:Label Style="font-weight: 700; font-size: 16.5px; font-family: Tahoma; margin-left: 25px;">* Giờ liên hệ/</asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma;">Time contaced:</asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_time_contaced"></asp:Label>
                                            </div>
                                            <div class="col-7">
                                                <asp:Label Style="font-weight: 700; font-size: 16.5px; font-family: Tahoma; margin-left: 25px;">* Giờ khám/</asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma;">Time provided:</asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_time_provided"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_specialist_opinion_field">
                                            <div class="col-12" style="text-align: justify;">
                                                <asp:Label Style="font-weight: 700; font-size: 16.5px; font-family: Tahoma; margin-left: 25px;">* Tóm tắt ý kiến của bác sỹ chuyên khoa/</asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma;">Specialist opinion summarised:</asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_spec_opinion_summarised"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Kế hoạch chăm sóc/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Care Plan </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> 1. Treatment in Emergency/ </asp:Label>
                                            <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Điều trị tại khoa cấp cứu: </asp:Label>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-md-12 ">
                                                <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:GridView ShowHeaderWhenEmpty="true " ID="lbl_Treatment" runat="server" AutoGenerateColumns="false ">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 85px; font-weight: bold; font-size: 16.5px; font-family: Tahoma; text-align: center" class="text-primary pt-2 pb-2 ">Time </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div style="font-size: 16.5px; font-family: Tahoma; text-align: center" class="text-primary pt-2 pb-2 ">
                                                                            <asp:Label Style="text-align: center" Text='<%# Eval("time ", "{0:dd/MM/yyyy hh:mm tt} ") %>' runat="server" />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px; font-weight: bold; font-size: 16.5px; font-family: Tahoma; text-align: center" class="text-primary ">Medication and Fluid </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div style="width: 300px; font-size: 16.5px; font-family: Tahoma; text-align: justify; margin: 5px" class="text-primary ">
                                                                            <asp:Label runat="server" Text='<%# Eval("medication ") %>' />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 150px; font-weight: bold; font-size: 16.5px; font-family: Tahoma; text-align: center" class="text-primary ">Dose </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div style="width: 150px; text-align: center; font-size: 16.5px; font-family: Tahoma" class="text-primary ">
                                                                            <asp:Label runat="server" Text='<%# Eval("dose ") %>' />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 130px; font-weight: bold; font-size: 16.5px; font-family: Tahoma; text-align: center" class="text-primary ">Route </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div style="width: 130px; font-size: 16.5px; font-family: Tahoma; text-align: justify; margin: 5px" class="text-primary ">
                                                                            <asp:Label runat="server" Text='<%# Eval("route ") %>' />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 328px; font-weight: bold; font-size: 16.5px; font-family: Tahoma; text-align: center" class="text-primary ">Comment </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div style="width: 328px; font-size: 16.5px; font-family: Tahoma; text-align: justify; margin: 5px">
                                                                            <asp:Label runat="server" Text='<%# Eval("comment ") %>' />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 30px"> Progress Note </asp:Label>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-md-12 ">
                                                <asp:UpdatePanel ID="updatePanel2" runat="server" UpdateMode="Always ">
                                                    <ContentTemplate>
                                                        <asp:GridView ShowHeaderWhenEmpty="true " ID="lbl_progress_note" runat="server" AutoGenerateColumns="false ">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 130px; font-weight: bold; font-size: 16.5px; font-family: Tahoma; text-align: center" class="text-primary pt-2 pb-2 ">Time </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div style="width: 130px; font-size: 16.5px; font-family: Tahoma; text-align: center" class="text-primary pt-2 pb-2 ">
                                                                            <asp:Label Style="text-align: center" Text='<%# Eval("time ", "{0: dd/MM/yyyy hh:mm tt} ") %>' runat="server" />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 445px; font-weight: bold; font-size: 16.5px; font-family: Tahoma; text-align: center" class="text-primary ">Progress </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div style="width: 445px; font-size: 16.5px; font-family: Tahoma; text-align: justify; margin: 5px" class="text-primary ">
                                                                            <asp:Label runat="server" Text='<%# Eval("progress ") %>' />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 460px; font-weight: bold; font-size: 16.5px; font-family: Tahoma; text-align: center" class="text-primary ">Appropriate Order </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div style="width: 460px; text-align: justify; font-size: 16.5px; font-family: Tahoma; margin: 5px" class="text-primary ">
                                                                            <asp:Label runat="server" Text='<%# Eval("appropriate_order ") %>' />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Kết luận sau điều trị/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Conclusions at termination of treatment: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_conclusions"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-7 " style="margin-left: 15px">
                                                        <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma;"> 2. Xuất viện/ </asp:Label>
                                                        <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Discharge: </asp:Label>
                                                    </div>
                                                    <div class="col-3 " style="margin-left: -15px">
                                                        <asp:Label Style="font-size: 25.5px;" ID="lbl_discharge_False" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 16.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label disabled-for="lbl_discharge_field" Style="font-size: 25.5px;" ID="lbl_discharge_True" runat="server" />
                                                        <label for="lbl_specialist_opinion_True " style="font-size: 16.5px; font-family: Tahoma;">Có</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Yes</label>
                                                        </input>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_discharge_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Toa thuốc/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Prescription: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_prescription"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_discharge_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Ghi rõ các hướng dẫn chăm sóc tiếp theo/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Specify follow-up care instructions: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_specify_care_instructions"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_discharge_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Giờ rời khỏi khoa cấp cứu/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Discharge Time: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_discharge_time"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> 3. Khám ngoại trú/</asp:Label>
                                            <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Referred to OPD: </asp:Label>
                                        </div>
                                        <div class="row mb-2 " style="margin-left: 35px">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-3 ">
                                                        <asp:Label Style="font-size: 25.5px;" ID="lbl_referred_OPD_False" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 16.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ No</label>

                                                    </div>
                                                    <div class="col-9 ">
                                                        <asp:Label Style="font-size: 25.5px;" ID="lbl_referred_OPD_True" runat="server" />
                                                        <label for="lbl_specialist_opinion_True " style="font-size: 16.5px; font-family: Tahoma;">Có, ghi rõ</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Yes, specify:</label>
                                                        <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_referred_to_OPD_text"> </asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-7 ">
                                                        <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 15px"> 4. Yêu cầu nhập viện/</asp:Label>
                                                        <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Hospitalisation required:: </asp:Label>
                                                    </div>
                                                    <div class="col-3 ">
                                                        <asp:Label Style="font-size: 25.5px;" ID="lbl_hospitalisation_required_False" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 16.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label disabled-for="lbl_hos_req_field" Style="font-size: 25.5px;" ID="lbl_hospitalisation_required_True" runat="server" />
                                                        <label for="lbl_specialist_opinion_True " style="font-size: 16.5px; font-family: Tahoma;">Có</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Yes</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_hos_req_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Lý do/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Reason: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_reason"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_hos_req_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Tại khoa/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Ward: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_ward"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_hos_req_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Giờ rời khỏi khoa cấp cứu/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Time of leaving Emergency: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_time_of_leaving_emergency"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-7 ">
                                                        <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 15px"> 5. Nếu phẫu thuật cấp cứu/</asp:Label>
                                                        <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> In case of emergency surgery: </asp:Label>
                                                    </div>
                                                    <div class="col-3 ">
                                                        <asp:Label Style="font-size: 25.5px;" ID="lbl_emergency_surgery_False" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 16.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label disabled-for="lbl_emr_sur_field " Style="font-size: 25.5px;" ID="lbl_emergency_surgery_True" runat="server" />
                                                        <label for="lbl_specialist_opinion_True" style="font-size: 16.5px; font-family: Tahoma;">Có</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Yes</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_emr_sur_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Chuẩn đoán trước phẫu thuật/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Pre-operative diagnosis: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_preoperative_diagnosis"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_emr_sur_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Tóm tắt bệnh án/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Brief summary: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_brief_summary"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_emr_sur_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Giờ rời khỏi khoa cấp cứu/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Time of leaving Emergency: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_time_of_leaving_emer_e"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-7 ">
                                                        <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 15px">6. Nếu chuyển đến BV khác/</asp:Label>
                                                        <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> In case of transfer to another hospital: </asp:Label>
                                                    </div>
                                                    <div class="col-3 ">
                                                        <asp:Label Style="font-size: 25.5px;" ID="lbl_transfer_hospital_False" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 16.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label disabled-for="lbl_transfer_hos_field " Style="font-size: 25.5px;" ID="lbl_transfer_hospital_True" runat="server" />
                                                        <label for="lbl_specialist_opinion_True " style="font-size: 16.5px; font-family: Tahoma;">Có</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Yes</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_transfer_hos_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Lý do chuyển viện/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> / Reason for transfer: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_reason_for_transfer"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_transfer_hos_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Tình trạng trước khi chuyển viện/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Status before transfer: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_status_before_transfer"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 lbl_transfer_hos_field ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma; margin-left: 25px"> * Giờ rời khỏi khoa cấp cứu/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Time of leaving Emergency: </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_time_of_leaving_emer_a"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Tình trạng bệnh nhân khi rời khoa Cấp Cứu/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> Patient's Condition at Discharge from Emergency: </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="margin-left: 35px">
                                                <div class="row ">
                                                    <div class="col-4 ">
                                                        <asp:Label Style="font-size: 25.5px; font-family: Tahoma" runat="server" ID="lbl_patient_discharge_IMP"></asp:Label>

                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 16.5px; font-family: Tahoma;">Có cải thiện</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Improved</label>
                                                    </div>
                                                    <div class="col-4 ">
                                                        <asp:Label Style="font-size: 25.5px; font-family: Tahoma" runat="server" ID="lbl_patient_discharge_UNC"></asp:Label>

                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 16.5px; font-family: Tahoma;">Không thay đổi</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Unchanged</label>
                                                    </div>
                                                    <div class="col-4 ">
                                                        <asp:Label Style="font-size: 25.5px; font-family: Tahoma" runat="server" ID="lbl_patient_discharge_UNS"></asp:Label>

                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 16.5px; font-family: Tahoma;">Không ổn định</label>
                                                        <label style="font-size: 16.5px; font-family: Tahoma;">/ Unstable</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify; margin-left: 35px">
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_patient_discharge"> </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 16.5px; font-family: Tahoma"> Mã ICD-10/ </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> ICD-10 Code(S): </asp:Label>
                                                <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_icd_10"> </asp:Label>
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
                                                        Doctor in charge/
                                                    </label>
                                                    <asp:Label Style="font-size: 16.5px; font-family: Tahoma"> (name and signature): </asp:Label>
                                                </div>
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <div class="col-12" style="text-align: center;">
                                                    <asp:Label Style="font-size: 16.5px; font-family: Tahoma" runat="server" ID="lbl_created_name_l"> </asp:Label>

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

                <div class="cssclsNoPrint" style="overflow: scroll; height: calc(100vh - 52px); overflow-x: hidden;">
                    <asp:Panel runat="server" ID="Panel1">
                        <div class="card" runat="server" id="amendReasonWraper">
                            <div class="card-body">
                                <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span>
                                    <br />
                                    <span class="text-danger">* </span><small>Nội dung lý do thay đổi phải trên 3 ký tự</small></h5>
                                <div class="form-group mb-2">

                                    <asp:TextBox runat="server" Text="MultiLine" ID="txt_amend_reason" CssClass="form-control" />

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                        ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                    </asp:Panel>
                    <uc1:PatientInfo runat="server" ID="PatientInfo" />

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">EMERGENCY MEDICAL ASSESSMENT
                                    </h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    <span class="text-primary">Ngày, giờ bắt đầu đánh giá/ 
                                                <span class="text-primary">Starting date, time of the assessmen:
                                                <span class="text-danger">*</span>
                                                </span>
                                                </label>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" ID="rad_evaluation_time" Width="200px" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtChiefComplaint" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_chief_complaint_code_R" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_chief_complaint_code_R">
                                                        Hồi sức/ <span class="text-primary">Resuscitation</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_chief_complaint_code_E" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_chief_complaint_code_E">
                                                        Cấp cứu/ <span class="text-primary">Emergency</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_chief_complaint_code_U" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_chief_complaint_code_U">
                                                        Khẩn trương/ <span class="text-primary">Urgent</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_chief_complaint_code_L" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_chief_complaint_code_L">
                                                        Trì  hoãn/ <span class="text-primary">Less Urgent</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_chief_complaint_code_N" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_chief_complaint_code_N">
                                                        Không cấp cứu/ <span class="text-primary">Non-Urgent</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Bệnh Sử/ <span class="text-primary">History of present illness(HPI):</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtHistoryofPresent" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tiền sử bệnh/ <span class="text-primary">Past medical history (PMH):</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Meds
                                                                            <span
                                                                                class="text-danger">*</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtpastmedhismeds" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Surgical
                                                                            <span
                                                                                class="text-danger">*</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtpastmedhissurs" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Thói
                                                                            quen/ <span
                                                                                class="text-primary">Habits:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server" id="cb_habits_A"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Alcohol/
                                                                                <span
                                                                                    class="text-primary">Rượu</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server" id="cb_habits_S"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Smoking/
                                                                                <span
                                                                                    class="text-primary">Thuốc</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server" id="cb_habits_D"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Chất
                                                                                gây nghiện/ <span
                                                                                    class="text-primary">Drugs</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="custom-control custom-checkbox">
                                                    <input
                                                        disabled-for="habit_other_field"
                                                        type="checkbox" runat="server"
                                                        id="cb_habits_O"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Khác,
                                                                                ghi rõ/ <span
                                                                                    class="text-primary">Other,
                                                                                    specify</span></span>
                                                </label>

                                                <div class="form-group habit_other_field">
                                                    <aih:TextField runat="server" ID="txthabitsother" />
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Thuốc
                                                                            dùng tại nhà/ <span
                                                                                class="text-primary">Home
                                                                                medications:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txthomemedications" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tiền
                                                                            sử dị ứng/ <span
                                                                                class="text-primary">Allergies:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtallergies" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tiền
                                                                            sử bệnh người thân/ <span
                                                                                class="text-primary">Relevant
                                                                                family history:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtrelevantfamilyhistory" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Khám
                                                                            lâm sàng liên quan/ <span
                                                                                class="text-primary">Physical
                                                                                examination:</span></label>

                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Kết
                                                                            quả tìm thấy/ <span
                                                                                class="text-primary">Findings
                                                                                (General and Diagnostic
                                                                                support):</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtfinding" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Yêu
                                                                            cầu khám chuyên khoa tâm lý/<span
                                                                                class="text-primary">Psychological
                                                                                assessment
                                                                                required:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_required_code_False" runat="server" name="rad_required_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_required_code_False">
                                                        Không/
                                                                                <span
                                                                                    class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="required_code_field" type="radio" id="rad_required_code_True" runat="server" name="rad_required_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_required_code_True">
                                                        Có,
                                                                                ghi rõ/ <span
                                                                                    class="text-primary">Yes,
                                                                                    specify:</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_required_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare1" />
                                                    </a>
                                                </div>
                                                <div class="row par required_code_field">
                                                    <aih:TextField runat="server" ID="txtrequiredtext" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Kết
                                                                            quả khảo sát/ <span
                                                                                class="text-primary">Investigations
                                                                                Results (Labs,
                                                                                Imaging...):</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtinvestigationsresults" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Chẩn
                                                                            đoán sơ bộ/ <span
                                                                                class="text-primary">Initial
                                                                                diagnosis:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtinitialdiagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Chẩn
                                                                            đoán phân biệt/ <span
                                                                                class="text-primary">Differential
                                                                                diagnosis:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtdiferentialdiagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Bệnh
                                                                            kèm theo/ <span
                                                                                class="text-primary">Associated
                                                                                conditions:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtassociatedconditions" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Chuẩn
                                                                            đoán xác định/ <span
                                                                                class="text-primary">Confirmed
                                                                                Diagnosis:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtcomfirmeddiagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Ý kiến
                                                                            của bác sĩ chuyên khoa/ <span
                                                                                class="text-primary">Specialist
                                                                                opinion:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_specialist_opinion_False" runat="server" name="rad_specialist_opinion" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_specialist_opinion_False">
                                                        Không/
                                                                                <span
                                                                                    class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="specialist_opinion_field" type="radio" id="rad_specialist_opinion_True" runat="server" name="rad_specialist_opinion" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_specialist_opinion_True">
                                                        Có/
                                                                                <span
                                                                                    class="text-primary">Yes</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_specialist_opinion" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare2" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 specialist_opinion_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tên
                                                                            của bác sĩ chuyên khoa/ Khoa/ <span
                                                                                class="text-primary">Name of the
                                                                                specialist/
                                                                                Department:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtnameofspecialist" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row specialist_opinion_field">
                                            <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                liên hệ/ <span
                                                                                    class="text-primary">Time
                                                                                    contacted:</span></label>

                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_time_contaced" />
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                khám/ <span
                                                                                    class="text-primary">Time
                                                                                    provided:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_time_provided" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 specialist_opinion_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tóm
                                                                            tắt ý kiến của bác sĩ chuyên
                                                                            khoa/ <span
                                                                                class="text-primary">Specialist
                                                                                opinion
                                                                                summarised:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtspecopinionsummarised" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Kế
                                                                            hoạch chăm sóc/ <span
                                                                                class="text-primary">Care
                                                                                Plan:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    1.
                                                                            Điều trị tại khoa cấp cứu/ <span
                                                                                class="text-primary">Treatment
                                                                                in Emergency</span></label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:UpdatePanel ID="updatePanel_Treatment" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:GridView ShowHeaderWhenEmpty="true" ID="grid_Treatment" runat="server" OnRowDeleting="grid_Treatment_RowDeleting" OnRowUpdating="gridTreatment_RowUpdating" OnRowDataBound="gridTreatment_RowDataBound" CssClass="tb-responsive" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 105px" class="text-primary pt-2 pb-2">
                                                                            Time
                                                                        </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <telerik:RadDateTimePicker Width="200px " ID="time" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "time") %>'>
                                                                            <TimeView TimeFormat="hh:mm " runat="server"></TimeView>
                                                                            <DateInput DisplayDateFormat="dd/MM/yyyy HH:mm tt " runat="server"></DateInput>
                                                                        </telerik:RadDateTimePicker>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 285px" class="text-primary">
                                                                            Medication and Fluid
                                                                        </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <aih:TextField runat="server" Value='<%#Eval("medication") %>' DataKey="medication" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 80px" class="text-primary">
                                                                        Dose</span>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <aih:TextField runat="server" Value='<%#Eval("dose") %>' DataKey="dose" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 80px" class="text-primary">
                                                                        Route</span>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <aih:TextField runat="server" Value='<%#Eval("route") %>' DataKey="route" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px" class="text-primary">
                                                                        Comment</span>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <aih:TextField runat="server" Value='<%#Eval("comment") %>' DataKey="comment" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:UpdateProgress ID="updateProgress_Treatment" runat="server" AssociatedUpdatePanelID="updatePanel_Treatment">
                                                            <ProgressTemplate>
                                                                Please wait....
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                        <div class="mt-2">
                                                            <asp:Button ID="btn_grid_Treatment_add" runat="server" CssClass="btn btn-sm btn-outline-primary " OnClick="btn_grid_Treatment_add_Click" Text="Add row" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btn_grid_Treatment_add" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold pl-4">
                                                    Progress
                                                                            Note</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:UpdatePanel ID="updatePanel_ProgressNote" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:GridView ShowHeaderWhenEmpty="true" ID="grid_progress_note" runat="server" OnRowDeleting="grid_progress_note_RowDeleting" OnRowUpdating="gridTreatment_RowUpdating" OnRowDataBound="gridTreatment_RowDataBound" CssClass="tb-responsive" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 105px" class="text-primary pt-2 pb-2">
                                                                            Time
                                                                        </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <telerik:RadDateTimePicker Width="200px " ID="time" runat="server" SelectedDate='<%# DataBinder.Eval(Container.DataItem, "time") %>'>
                                                                            <TimeView TimeFormat="hh:mm " runat="server"></TimeView>
                                                                            <DateInput DisplayDateFormat="dd/MM/yyyy HH:mm tt " runat="server"></DateInput>
                                                                        </telerik:RadDateTimePicker>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px" class="text-primary">
                                                                            Progress
                                                                        </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <aih:TextField runat="server" Value='<%#Eval("progress") %>' DataKey="progress" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px" class="text-primary">
                                                                        Appropriate Order
                                                                                                            </span>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <aih:TextField runat="server" Value='<%#Eval("appropriate_order") %>' DataKey="appropriate_order" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:UpdateProgress ID="updateProgress_ProgressNote" runat="server" AssociatedUpdatePanelID="updatePanel_ProgressNote">
                                                            <ProgressTemplate>
                                                                Please wait....
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                        <div class="mt-2">
                                                            <asp:Button ID="btn_grid_progress_note_add" runat="server" CssClass="btn btn-sm btn-outline-primary" Text="Add row" OnClick="btn_grid_progress_note_add_Click" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btn_grid_progress_note_add" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </div>

                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Kết
                                                                            luận sau điều trị/ <span
                                                                                class="text-primary">Conclusions
                                                                                at termination of
                                                                                treatmen:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtconclusions" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">
                                                    2.
                                                                            Xuất viện/ <span
                                                                                class="text-primary">Discharge:</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_discharge_False" runat="server" name="rad_discharge" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_discharge_False">
                                                        Không/
                                                                                <span
                                                                                    class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="discharge_field" type="radio" id="rad_discharge_True" runat="server" name="rad_discharge" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_discharge_True">
                                                        Có/
                                                                                <span
                                                                                    class="text-primary">Yes</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_discharge" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare3" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 discharge_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Toa
                                                                            thuốc/ <span
                                                                                class="text-primary">Prescription:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtprescription" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 discharge_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Ghi rõ
                                                                            các hướng dẫn chăm sóc tiếp theo/
                                                                            <span class="text-primary">Specify
                                                                                follow-up care
                                                                                instructions:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtspecifycareinstructions" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row discharge_field">
                                            <div class="col-md-12 mb-2 d-lg-flex ">
                                                <div class="w-lg-8">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                rời khỏi khoa cấp cứu/ <span
                                                                                    class="text-primary">Discharge
                                                                                    Time:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_discharge_time" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">
                                                    3.
                                                                            Chuyển sang khám ngoại trú/ <span
                                                                                class="text-primary">Referred to
                                                                                OPD:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_referred_OPD_False" runat="server" name="rad_referred_opd" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_referred_OPD_False">
                                                        Không/
                                                                                <span
                                                                                    class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="referred_opd_field" type="radio" id="rad_referred_OPD_True" runat="server" name="rad_referred_opd" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_referred_OPD_True">
                                                        Có,
                                                                                Giải thích/ <span
                                                                                    class="text-primary">Yes,
                                                                                    Explain</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_referred_opd" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare4" />
                                                    </a>
                                                </div>
                                                <div class="form-group referred_opd_field">
                                                    <aih:TextField runat="server" ID="txtreferredtoOPDtext" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">
                                                    4.
                                                                            Yêu cầu nhập viện/ <span
                                                                                class="text-primary">Hospitalisation
                                                                                required:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_hospitalisation_required_False" runat="server" name="rad_hos_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_hospitalisation_required_False">
                                                        Không/
                                                                                <span
                                                                                    class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group m-0 p-0 border-0">
                                                    <div class="custom-control custom-radio mb-2">
                                                        <input disabled-for="hos_req_field" type="radio" id="rad_hospitalisation_required_True" runat="server" name="rad_hos_req" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_hospitalisation_required_True">
                                                            Có,
                                                                                    Giải
                                                                                    thích/ <span
                                                                                        class="text-primary">Yes,
                                                                                        Explain</span></label>
                                                        <a href="javascript:void(0)" style="display: none;" data-clear="rad_hos_req" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare5" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row par hos_req_field">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">
                                                    Lý do/
                                                                            <span
                                                                                class="text-primary">Reason:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtreason" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row hos_req_field">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">
                                                    Tại
                                                                            khoa/ <span
                                                                                class="text-primary">Ward:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtward" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row hos_req_field">
                                            <div class="col-md-12 mb-2 d-lg-flex">
                                                <div class="w-lg-8">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                rời khỏi khoa cấp cứu/ <span
                                                                                    class="text-primary">Discharge
                                                                                    Time:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_timeofleavingemergency" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">
                                                    5.
                                                                            Nếu phẫu thuật cấp cứu/ <span
                                                                                class="text-primary">In case of
                                                                                emergency
                                                                                surgery:</span></label>
                                                <p>
                                                    Khi không có thời gian để ghi nhận đầy đủ bệnh sử và kết quả khám lâm sàng của bệnh nhân cần phẫ̃u thuật cấp cứu, vui lòng ghi rõ:
                                            <br />
                                                    <span class="text-primary">When
                                                                                there is no time to record the
                                                                                complete history and physical
                                                                                examination of a patient
                                                                                requiring emergency surgery,
                                                                                indicate </span>
                                                </p>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_emergency_surgery_False" runat="server" name="rad_emr_sur" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_emergency_surgery_False">
                                                        Không/
                                                                                <span
                                                                                    class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group m-0 p-0 border-0">
                                                    <div class="custom-control custom-radio mb-2">
                                                        <input disabled-for="emr_sur_field" type="radio" id="rad_emergency_surgery_True" runat="server" name="rad_emr_sur" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_emergency_surgery_True">
                                                            Có,
                                                                                    Giải
                                                                                    thích/ <span
                                                                                        class="text-primary">Yes,
                                                                                        Explain</span></label>
                                                        <a href="javascript:void(0)" style="display: none;" data-clear="rad_emr_sur" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare6" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row par emr_sur_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Chẩn
                                                                            đoán trước phẫu thuật/ <span
                                                                                class="text-primary">Pre-operative
                                                                                diagnosis:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtpreoperative_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 emr_sur_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tóm
                                                                            tắt bệnh án/ <span
                                                                                class="text-primary">Brief
                                                                                summary:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtprebrief_summary" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row emr_sur_field">
                                            <div class="col-md-12 mb-2 d-lg-flex">
                                                <div class="w-lg-8">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                rời khỏi khoa cấp cứu/ <span
                                                                                    class="text-primary">Time of
                                                                                    leaving
                                                                                    Emergency:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_time_of_leaving_emer_e" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">
                                                    6.
                                                                            Nếu chuyển đến BV khác/ <span
                                                                                class="text-primary">In case of
                                                                                transfer to another
                                                                                hospital:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_transfer_hospital_False" runat="server" name="rad_transfer_hos" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_transfer_hospital_False">
                                                        Không/
                                                                                <span
                                                                                    class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group m-0 p-0 border-0">
                                                    <div class="custom-control custom-radio mb-2">
                                                        <input disabled-for="transfer_hos_field" type="radio" id="rad_transfer_hospital_True" runat="server" name="rad_transfer_hos" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_transfer_hospital_True">
                                                            Có,
                                                                                    Giải thích/ <span
                                                                                        class="text-primary">Yes,
                                                                                        Explain</span></label>
                                                        <a href="javascript:void(0)" style="display: none;" data-clear="rad_transfer_hos" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare7" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 transfer_hos_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Lý do
                                                                            chuyển viện/ <span
                                                                                class="text-primary">Reason for
                                                                                transfer:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" id="txtreasonfor_transfer" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 transfer_hos_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tình
                                                                            trạng trước khi chuyển viện/ <span
                                                                                class="text-primary">Status
                                                                                before transfer:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txtstatus_before_transfer" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row transfer_hos_field">
                                            <div class="col-md-12 mb-2 d-lg-flex">
                                                <div class="w-lg-9">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                rời khỏi khoa cấp cứu/ <span
                                                                                    class="text-primary">Time of
                                                                                    leaving
                                                                                    Emergency:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_time_of_leaving_emer_a" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tình
                                                                            trạng của bệnh nhân khi xuất viện/
                                                                            <span class="text-primary">Patient's
                                                                                Condition at
                                                                                Discharge:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server"
                                                        id="cb_patient_discharge_IMP"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Có
                                                                                cải thiện/ <span
                                                                                    class="text-primary">Improved</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server"
                                                        id="cb_patient_discharge_UNC"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Không
                                                                                thay đổi/ <span
                                                                                    class="text-primary">Unchanged</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server"
                                                        id="cb_patient_discharge_UNS"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Không
                                                                                ổn định/ <span
                                                                                    class="text-primary">Unstable</span></span>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="row mb-2 ">
                                            <div class="col-md-12 ">
                                                <div class="form-group ">
                                                    <aih:TextField runat="server" ID="txt_patient_discharge" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Mã
                                                                            ICD-10/ <span
                                                                                class="text-primary">ICD-10
                                                                                Code(S):</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txticd_10" />
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
                                                <h4 class="mt-4 mb-4">Delete document?</h4>
                                            </div>
                                            <div class="text-right">
                                                <div class="btn btn-default waves-effect" data-dismiss="modal">Close</div>
                                                <asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
                                            </div>
                                        </ModalBody>
                                    </webUI:PopupModal>

                                    <Button:PopupShowDelay runat="server" ID="PopupShowDelay" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <%--<script>
        let alertBox = document.getElementById("MessagePlaceHolder");

        setTimeout(function () {
            alertBox.style.top = "0";
        }, 2000);
    </script>--%>
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>

</html>
