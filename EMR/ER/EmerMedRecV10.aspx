<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmerMedRecV10.aspx.cs" Inherits="EMR.ER.EmerMedRecV10" %>


<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
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
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="Trash" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print.css" rel="stylesheet" />
    <script>
        function changeValue(a, b) {
            document.getElementById(b).value = document.getElementById(a).innerHTML;
        }
    </script>
    <style>
        .v10:after {
           content: 'Version: 1.0';
            font-size: 10px;
            color: #343a40;
            position: absolute;
            right: 10px;
            bottom: 4px;
        }
    </style>
</head>

<body>

    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="printContent" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info" style="display: flex; align-items: center; height: 80px;">
                                       <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>PHIẾU ĐÁNH GIÁ BỆNH <br /> NHÂN TẠI KHOA CẤP CỨU</h4>
                                            <h5>EMERGENCY MEDICAL ASSESSMENT</h5>
                                        </div>
                                        <div style="width: 120px; text-align: left; font-size: 11px">
                                            <asp:Label CssClass="d-block" runat="server" ID="prt_fullname"></asp:Label>
                                            <asp:Label class="d-block" CssClass="d-block" runat="server" ID="prt_dob"></asp:Label>
                                            <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
                                            <asp:Label runat="server" ID="prt_vpid" CssClass="d-block font-bold"></asp:Label>
                                        </div>
                                    </div>
                                    <div style="height: 20px;">
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
                                            <div>
                                                (Do bác sĩ cấp cứu điền trước khi bệnh nhân rời khỏi khoa cấp cứu)
                                            </div> 
                                            <span class="font-bold">(To be completed by the Emergency Doctor before discharge from Emergency)</span>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">Ngày, giờ bắt đầu đánh giá</asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> / Starting date, time of the assessment: </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_evaluation_time"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="d-grid mb-2" style="grid-template-columns: 1fr">
                                            <div style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Lý do đến khám/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Chief complaint/ Reason of consultation: </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_chief_complaint"></asp:Label>
                                            </div>
                                        </div>
                                        

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr 1fr 1fr 1fr">
                                            <div>
                                                <asp:Label Style="font-size: 14.5px; text-align: start" ID="lbl_chief_complaint_code_R" runat="server" />
                                                <label for="lbl_chief_complaint_code_R " style="font-size: 14.5px; font-family: Tahoma; font-weight: bold; margin-left: 5px; margin-bottom: 0;">Hồi sức</label>
                                                
                                                <div style="margin-left: 25px;"><span style="font-size: 14.5px; font-family: Tahoma;" class="text-primary d-block mb-0">Resuscitation</span></div>
                                            </div>
                                            <div>
                                                <asp:Label Style="font-size: 14.5px;" ID="lbl_chief_complaint_code_E" runat="server" />
                                                <label for="lbl_chief_complaint_code_E " style="font-size: 14.5px; font-family: Tahoma; font-weight: bold; margin-left: 5px; margin-bottom: 0;">Cấp cứu</label>
                                                <div style="margin-left: 25px;"><span style="font-size: 14.5px; font-family: Tahoma;" class="text-primary d-block mb-0 h4">Emergency</span></div>
                                            </div>
                                            <div>
                                                <asp:Label Style="font-size: 14.5px;" ID="lbl_chief_complaint_code_U" runat="server" />
                                                                    <label for="lbl_chief_complaint_code_U " style="font-size: 14.5px; font-family: Tahoma; font-weight: bold; margin-left: 5px; margin-bottom: 0;">Khẩn trương</label>
                                                            <div style="margin-left: 25px;"><span style="font-size: 14.5px; font-family: Tahoma" class="text-primary d-block mb-0 h4">Urgent</span></div>
                                            </div>
                                            <div>
                                                <asp:Label Style="font-size: 14.5px;" ID="lbl_chief_complaint_code_L" runat="server" />
                                                                    <label for="lbl_chief_complaint_code_L " style="font-size: 14.5px; font-family: Tahoma; font-weight: bold; margin-left: 5px; margin-bottom: 0;">Trì hoãn</label>
                                                            <div style="margin-left: 25px;"><span style="font-size: 14.5px; font-family: Tahoma" class="text-primary d-block mb-0 h4">Less urgent</span></div>
                                            </div>
                                            <div>
                                                <asp:Label Style="font-size: 14.5px;" ID="lbl_chief_complaint_code_N" runat="server" />
                                                                    <label for="lbl_chief_complaint_code_N " style="font-size: 14.5px; font-family: Tahoma; font-weight: bold; margin-left: 5px; margin-bottom: 0;">Không cấp cứu</label>
                                                            <div style="margin-left: 25px;"><span style="font-size: 14.5px; font-family: Tahoma;" class="text-primary d-block mb-0 h4">Non-Urgent</span></div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Bệnh sử </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> / History of present illness </asp:Label>
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> (HPI): </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_history_of_present"></asp:Label>

                                            </div>
                                        </div>
                                        
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">Tiền sử bệnh</asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> / Past medical history <span class="font-bold">(PMH)</span>: </asp:Label>
                                            </div>
                                        </div>
                                        

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                                <asp:Label Style="font-weight: bold;"> Meds: </asp:Label>
                                                <asp:Label runat="server" ID="prt_past_med_his_meds"></asp:Label>

                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                                <asp:Label Style="font-weight: bold;" runat="server"> Surgical: </asp:Label>
                                                <asp:Label  runat="server" ID="prt_past_med_his_surs"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr 1fr 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <div>
                                                <asp:Label runat="server" Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma" Text="Thói quen" /><asp:Label runat="server" Style="font-size: 14.5px; font-family: Tahoma" Text="/ Habits"/>
                                            </div>
                                            <div>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="lbl_habits_A" Text="❏"/><label for="lbl_chief_complaint_code_E " style="font-size: 14.5px; font-family: Tahoma; margin-left: 5px;">Rượu</label><label style="font-size: 14.5px; font-family: Tahoma;">/ Alcohol</label>
                                            </div>
                                            <div>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="lbl_habits_S" Text="❏"/><label for="lbl_chief_complaint_code_E " style="font-size: 14.5px; font-family: Tahoma; margin-left: 5px;">Thuốc lá</label><label style="font-size: 14.5px; font-family: Tahoma;">/ Smoking</label>
                                            </div>
                                            <div>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="lbl_habits_D" Text="❏"/><label for="lbl_chief_complaint_code_E " style="font-size: 14.5px; font-family: Tahoma; margin-left: 5px;">Chất gây nghiện</label><label style="font-size: 14.5px; font-family: Tahoma;">/ Drugs</label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-12 " style="margin-left: 50px; text-align: justify">
                                                <label for="lbl_chief_complaint_code_E " style="font-weight: bold; font-size: 14.5px; font-family: Tahoma">Khác ghi rõ</label>
                                                <label style="font-size: 14.5px; font-family: Tahoma;">/ Other, specify: </label>
                                                <asp:Label Style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" ID="lbl_habits_other"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Thuốc dùng tại nhà/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Home medications: </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_home_medications"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Tiền sử dị ứng/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Allergies: </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_allergies"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Tiền sử bệnh người thân/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Relevant family history: </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_relevant_family_history"></asp:Label>

                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Khám lâm sàng liên quan/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Physical examination: </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Kết quả tìm thấy/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Findings (General and Diagnostic support): </asp:Label>
                                                <asp:Label Style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_finding"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Yêu cầu khám chuyên khoa tâm lý/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Psychological assessment required: </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-2 " style="margin-left: 40px">
                                                        <asp:Label Style="font-size: 14.5px;" ID="lbl_required_code_False" runat="server" Text="❏" />
                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col ">
                                                        <asp:Label Style="font-size: 14.5px;" ID="lbl_required_code_True" runat="server" Text="❏" />
                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 14.5px; font-family: Tahoma;">Có, ghi rõ</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ Yes, specify: </label>
                                                        <asp:Label Style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" ID="lbl_required_text"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Kết quả khảo sát/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Investigations Results (Labs, imaging...): </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_investigations_results"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Chẩn đoán sơ bộ/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Initial diagnosis: </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_initial_diagnosis"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Chẩn đoán phân biệt/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Diferential diagnosis: </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_diferential_diagnosis"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Bệnh kèm theo/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Associated conditions: </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_associated_conditions"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Chẩn đoán xác định/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Comfirmed Diagnosis: </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_comfirmed_diagnosis"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-8 ">
                                                        <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Ý kiến của bác sỹ chuyên khoa: </asp:Label>
                                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> / Specialist opinion: </asp:Label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label Style="font-size: 14.5px;" ID="lbl_specialist_opinion_False" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label  Style="font-size: 14.5px;" ID="lbl_specialist_opinion_True" runat="server" />
                                                        <label for="lbl_specialist_opinion_True " style="font-size: 14.5px; font-family: Tahoma;">Có</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ Yes</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div runat="server" id="div_pecialistopinion">
                                            <div class="row mb-2 ">
                                                <div class="col-5">
                                                    <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: 700; margin-left: 25px;">* Tên của bác sĩ chuyên khoa/ khoa:</label>
                                                    <span style="margin-left: 14.5px; margin-left: 45px;">Name of the specialist/ Department</span>
                                                </div>
                                                <div class="col-7">
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_name_of_specialist"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row mb-2 ">
                                                <div class="col-6">
                                                    <asp:Label Style="font-weight: 700; font-size: 14.5px; font-family: Tahoma; margin-left: 25px;">* Giờ liên hệ/</asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma;">Time contaced:</asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_time_contaced"></asp:Label>
                                                </div>
                                                <div class="col-6">
                                                    <asp:Label Style="font-weight: 700; font-size: 14.5px; font-family: Tahoma; margin-left: 25px;">* Giờ khám/</asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma;">Time provided:</asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_time_provided"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row mb-2 ">
                                                <div class="col-12" style="text-align: justify;">
                                                    <asp:Label Style="font-weight: 700; font-size: 14.5px; font-family: Tahoma; margin-left: 25px;">* Tóm tắt ý kiến của bác sỹ chuyên khoa/</asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma;">Specialist opinion summarised:</asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_spec_opinion_summarised"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Kế hoạch chăm sóc/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Care Plan </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> 1. Treatment in Emergency/ </asp:Label>
                                            <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Điều trị tại khoa cấp cứu: </asp:Label>
                                        </div>

                                        <table class="table-bordered mt-1 mb-1" runat="server" id="prt_treatment">
                                            <tr>
                                                <td style="width: 150px" class="text-center">Time</td>
                                                <td style="width: 200px" class="text-center">Medication and Fluid</td>
                                                <td style="width: 100px" class="text-center">Dose</td>
                                                <td style="width: 100px" class="text-center">Route</td>
                                                <td style="width: 221px" class="text-center">Comment</td>
                                                
                                            </tr>
                                        </table>

                                        <div class="row mb-2 ">
                                            <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 30px"> Progress Note </asp:Label>
                                        </div>

                                        <table class="table-bordered mt-1 mb-1" runat="server" id="prt_progress_note">
                                            <tr>
                                                <td style="width: 150px" class="text-center">Time</td>
                                                <td style="width: 310px" class="text-center">Progress</td>
                                                <td style="width: 310px" class="text-center">Appropriate Order</td>
                                            </tr>
                                        </table>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Kết luận sau điều trị/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Conclusions at termination of treatment: </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_conclusions"> </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-8 " style="margin-left: 15px">
                                                        <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma;"> 2. Xuất viện/ </asp:Label>
                                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Discharge: </asp:Label>
                                                    </div>
                                                    <div class="col-2 " style="margin-left: -15px">
                                                        <asp:Label Style="font-size: 14.5px;" ID="lbl_discharge_False" Text="❏" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label  Style="font-size: 14.5px;" ID="lbl_discharge_True" Text="❏" runat="server" />
                                                        <label for="lbl_specialist_opinion_True " style="font-size: 14.5px; font-family: Tahoma;">Có</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ Yes</label>
                                                        </input>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div runat="server" id="div_discharge_field">
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Toa thuốc/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Prescription: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_prescription"> </asp:Label>
                                                </div>
                                            </div>
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Ghi rõ các hướng dẫn chăm sóc tiếp theo/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Specify follow-up care instructions: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_specify_care_instructions"> </asp:Label>
                                                </div>
                                            </div>
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Giờ rời khỏi khoa cấp cứu/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Discharge Time: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_discharge_time"> </asp:Label>
                                                </div>
                                            </div>
                                           
                                        </div>

                                        <div class="row mb-2 ">
                                            <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> 3. Khám ngoại trú/</asp:Label>
                                            <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Referred to OPD: </asp:Label>
                                        </div>

                                        <div class="row mb-2 " style="margin-left: 35px">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-3 ">
                                                        <asp:Label Style="font-size: 14.5px;" Text="❏" ID="lbl_referred_to_OPD_False" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>

                                                    </div>
                                                    <div class="col-9 ">
                                                        <asp:Label Style="font-size: 14.5px;" Text="❏" ID="lbl_referred_to_OPD_True" runat="server" />
                                                        <label for="lbl_specialist_opinion_True " style="font-size: 14.5px; font-family: Tahoma;">Có, ghi rõ</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ Yes, specify:</label>
                                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="lbl_referred_to_OPD_text"> </asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-8 ">
                                                        <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 15px"> 4. Yêu cầu nhập viện/</asp:Label>
                                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Hospitalisation required:: </asp:Label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label Style="font-size: 14.5px;" Text="❏" ID="lbl_hospitalisation_required_False" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label  Style="font-size: 14.5px;" Text="❏"  ID="lbl_hospitalisation_required_True" runat="server" />
                                                        <label for="lbl_specialist_opinion_True " style="font-size: 14.5px; font-family: Tahoma;">Có</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ Yes</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div runat="server" id="div_hos_req_field">
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Lý do/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Reason: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_reason"> </asp:Label>
                                                </div>
                                            </div>
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Tại khoa/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Ward: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_ward"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Giờ rời khỏi khoa cấp cứu/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Time of leaving Emergency: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_time_of_leaving_emergency"> </asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-8 ">
                                                        <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 15px"> 5. Nếu phẫu thuật cấp cứu/</asp:Label>
                                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> In case of emergency surgery: </asp:Label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label Style="font-size: 14.5px;"  Text="❏"  ID="lbl_emergency_surgery_False" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label disabled-for="lbl_emr_sur_field "  Text="❏"  Style="font-size: 14.5px;" ID="lbl_emergency_surgery_True" runat="server" />
                                                        <label for="lbl_specialist_opinion_True" style="font-size: 14.5px; font-family: Tahoma;">Có</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ Yes</label>
                                                    </div>
                                                </div>
                                                <div style="font-size: 14.5px; font-family: Tahoma; margin-left: 25px">
                                                    Khi không có thời gian để ghi nhận đầy đủ bệnh sử và kết quả khám lâm sàng của bệnh nhân cần phẫu thuật cấp cứu, vui lòng ghi rõ: <br />                                                    When there is no time to record the complete history and physical examination of a patient requiring emergency surgery, indicate
                                                </div>
                                            </div>
                                        </div>

                                        <div runat="server" id="div_emr_sur_field">
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Chuẩn đoán trước phẫu thuật/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Pre-operative diagnosis: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="lbl_preoperative_diagnosis"> </asp:Label>
                                                </div>
                                            </div>
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Tóm tắt bệnh án/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Brief summary: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_brief_summary"> </asp:Label>
                                                </div>
                                            </div>
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Giờ rời khỏi khoa cấp cứu/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Time of leaving Emergency: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_time_of_leaving_emer_e"> </asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row mb-2 ">
                                            <div class="col-12 ">
                                                <div class="row ">
                                                    <div class="col-8 ">
                                                        <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 15px">6. Nếu chuyển đến BV khác/</asp:Label>
                                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> In case of transfer to another hospital: </asp:Label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label Style="font-size: 14.5px;" Text="❏"  ID="lbl_transfer_hospital_False" runat="server" />
                                                        <label for="lbl_specialist_opinion_False " style="font-size: 14.5px; font-family: Tahoma;">Không</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ No</label>
                                                    </div>
                                                    <div class="col-2 ">
                                                        <asp:Label disabled-for="lbl_transfer_hos_field " Text="❏"  Style="font-size: 14.5px;" ID="lbl_transfer_hospital_True" runat="server" />
                                                        <label for="lbl_specialist_opinion_True " style="font-size: 14.5px; font-family: Tahoma;">Có</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ Yes</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div runat="server" id="div_transfer_hos_field">
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Lý do chuyển viện/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> / Reason for transfer: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_reason_for_transfer"> </asp:Label>
                                                </div>
                                            </div>
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Tình trạng trước khi chuyển viện/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Status before transfer: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_status_before_transfer"> </asp:Label>
                                                </div>
                                            </div>
                                            <div class="row mb-2  ">
                                                <div class="col-12 " style="text-align: justify;">
                                                    <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma; margin-left: 25px"> * Giờ rời khỏi khoa cấp cứu/ </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Time of leaving Emergency: </asp:Label>
                                                    <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_time_of_leaving_emer_a"> </asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Tình trạng bệnh nhân khi rời khoa Cấp Cứu/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> Patient's Condition at Discharge from Emergency: </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="margin-left: 35px">
                                                <div class="row ">
                                                    <div class="col-4 ">
                                                        <asp:Label Text="❏" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_patient_discharge_IMP"></asp:Label>

                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 14.5px; font-family: Tahoma;">Có cải thiện</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ Improved</label>
                                                    </div>
                                                    <div class="col-4 ">
                                                        <asp:Label  Text="❏" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_patient_discharge_UNC"></asp:Label>

                                                        <label for="lbl_chief_complaint_code_E "  style="font-size: 14.5px; font-family: Tahoma;">Không thay đổi</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ Unchanged</label>
                                                    </div>
                                                    <div class="col-4 ">
                                                        <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_patient_discharge_UNS"  Text="❏" ></asp:Label>

                                                        <label for="lbl_chief_complaint_code_E " style="font-size: 14.5px; font-family: Tahoma;">Không ổn định</label>
                                                        <label style="font-size: 14.5px; font-family: Tahoma;">/ Unstable</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify; margin-left: 35px">
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_patient_discharge"> </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2 ">
                                            <div class="col-12 " style="text-align: justify;">
                                                <asp:Label Style="font-weight: bold; font-size: 14.5px; font-family: Tahoma"> Mã ICD-10/ </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma"> ICD-10 Code(S): </asp:Label>
                                                <asp:Label Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_icd_10"> </asp:Label>
                                            </div>
                                        </div>
                                        
                                        <br />

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr; grid-gap: 5px">
                                            <div></div>
                                            <div class="text-center" style="break-inside: avoid !important; page-break-inside: avoid !important">
                                                <div id="printedTime"></div>
                                                <div><span style="font-size: 14.5px; font-family: Tahoma" class="font-bold">Họ tên, chữ ký & MSNV của Bác sĩ</span></div>
                                                <div><span style="font-size: 14.5px; font-family: Tahoma" class="text-primary"><i>Doctor’s full name, signature & ID</i></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell">
                                    <img style="width: 100%" src="../images/ExcellentCare.png" />
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

                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="520" MaxHeight="400">
            <Windows>
                <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" Title="Version History" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ShowHeader="false" ID="RadGrid1" runat="server" AllowSorting="true" OnItemCommand="RadGrid1_ItemCommand">
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="document_id,document_log_id">
                                <Columns>
                                    <telerik:GridTemplateColumn>
                                        <ItemTemplate>
                                            <telerik:RadLabel runat="server" ID="RadLabel1" Text='<%# GetHistoryName(Eval("status"),Eval("created_name_e"), Eval("created_date_time"), Eval("modified_name_e"), Eval("modified_date_time"), Eval("amend_reason")) %>'>
</telerik:RadLabel>
                                            <asp:HyperLink CssClass="btn-link" Text="View Log" runat="server" NavigateUrl='<%# GetLogUrl(Eval("document_log_id")) %>'></asp:HyperLink>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                            <SelectedItemStyle CssClass="SelectedStyle" />
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                            </ClientSettings>
                        </telerik:RadGrid>

                    </ContentTemplate>
                </telerik:RadWindow>
                <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow2" Title="Warning" runat="server">
                            <ContentTemplate>
                                <div class="text-center">
                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                    <h4 class="mt-4 mb-4">Delete document?</h4>
                                </div>

                                <div class="d-grid no-block justify-content-end">
                                    <asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="btnDelete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                                </div>
                            </ContentTemplate>
                        </telerik:RadWindow>
                        <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow3" Title="Warning" runat="server">
                            <ContentTemplate>
                                <div class="text-center">
                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                    <h4 class="mt-4">Denied!</h4>
                                    <label runat="server" id="lblUserBlock" />
                                </div>

                                <div class="d-grid no-block justify-content-end">
                                    <%--<asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="LinkButton1" CssClass="btn btn-danger">Delete</asp:LinkButton>--%>
                                </div>
                            </ContentTemplate>
                        </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>

                <div class="cssclsNoPrint">
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Emergency Medical Assessment</li>
                    </ul>
                    <div style="overflow: scroll; height: calc(100vh - 43px); overflow-x: hidden;">
                        <asp:HiddenField runat="server" ID="DataObj" />
                    <asp:Panel runat="server" ID="messagePlaceHolder">
                            <div class="card" runat="server" id="amendReasonWraper">
                                <div class="card-body">
                                    <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span>
                                        <br />
                                        <span class="text-danger">* </span><small>Nội dung lý do thay đổi phải trên 3 ký tự</small></h5>
                                    <div class="form-group mb-2">

                                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_amend_reason" CssClass="form-control" />

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                        </asp:Panel>

                        <div class="row">
    <div class="col-lg-12" id="accordionExample">
        <div class="card">
            <div class="card-body collapse show" id="collapsePatientInfo" aria-labelledby="headingPatientInfo">
                <h5 class="box-title">Thông tin bệnh nhân/ Patient Detail</h5>
                <hr style="margin: 8px 0 12px 0;" />
                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">First Name:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblFirstName" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>

                    <!--/span-->
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Last Name:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblLastName" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                </div>
                <!--/row-->
                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Gender:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblGender" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Date of Birth:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblDoB" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                    <!--/span-->
                </div>
                <!--/row-->
                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Contact Person:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblContactPerson" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>

                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Relationship:</label>

                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblRelationship" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>

                </div>
                <!--/row-->
                <div class="row">
                    <div class="col-lg-6 d-sm-flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Address:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblPatientAddress" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                </div>
                <!--/row-->
                <!--/row-->
                <!-- Header: Patient Visit Info -->
                <h5 class="box-title">Thông tin lần khám/ Visit Detail <span class="text-danger">*</span></h5>
                <hr style="margin: 8px 0 12px 0;" />

                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Encounter:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblVisitCode" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>

                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Admit Date:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblVisitDate" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                    <!--/span-->
                </div>
            </div>
        </div>
    </div>
</div>

                    <div class="row">
                        <div class="col-12">
                            <div class="card v10">
                                <%--<div class="card-header">
                                    
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                </div>--%>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <h4 class="text-primary">EMERGENCY MEDICAL ASSESSMENT</h4>
                                        <hr />
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="alert alert-warning d-flex align-items-center" runat="server" id="currentLog">
                                                    <span class="mr-2">You are viewing an old version of this document</span>
                                                    <asp:HyperLink OnLoad="LinkViewLastestVersion_Load" ID="LinkViewLastestVersion" CssClass="btn-link" Text="View Latest Version" runat="server" />
                                                </div>

                                                <div class="alert alert-info d-flex align-items-center">
                                                    <telerik:RadLabel runat="server" ID="RadLabel1" />
                                                    <a class="btn-link" href="javascript:void(0)" onclick="showWindow('RadWindow1')">View History</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Ngày, giờ bắt đầu đánh giá<span class="text-primary">/ <span class="text-primary">Starting date, time of the assessmen: <span class="text-danger">*</span></span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_evaluation_time"></asp:Label>
                                                <div  runat="server" id="evaluation_time_wrapper">
                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_evaluation_time" Width="200px" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_evaluation_time" ErrorMessage="Field is required."
                                            ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                </div>
                                                
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <div runat="server" id="lbl_chief_complaint_code">
                                                    <asp:Label runat="server" ID="lbl_chief_complaint"></asp:Label>
                                                    <asp:Label runat="server" ID="lbl_chief_complaint_desc"></asp:Label>
                                                </div>
                                                <div runat="server" id="chief_complaint_code_wrapper">
                                                    <div>
                                                        <div class="custom-control d-inline-block custom-radio">
                                                            <input type="radio" id="rad_chief_complaint_code_R" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_chief_complaint_code_R">
                                                                Hồi sức/ <span class="text-primary">Resuscitation</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control d-inline-block custom-radio">
                                                            <input type="radio" id="rad_chief_complaint_code_E" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_chief_complaint_code_E">
                                                                Cấp cứu/ <span class="text-primary">Emergency</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control d-inline-block custom-radio">
                                                            <input type="radio" id="rad_chief_complaint_code_U" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_chief_complaint_code_U">
                                                                Khẩn trương/ <span class="text-primary">Urgent</span></label>
                                                        </div>
                                                        <div class="custom-control d-inline-block custom-radio">
                                                            <input type="radio" id="rad_chief_complaint_code_L" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_chief_complaint_code_L">
                                                                Trì  hoãn/ <span class="text-primary">Less Urgent</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control d-inline-block custom-radio">
                                                            <input type="radio" id="rad_chief_complaint_code_N" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_chief_complaint_code_N">
                                                                Không cấp cứu/ <span class="text-primary">Non-Urgent</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_triage_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare38" />
                                                            </a>
                                                        </div>
                                                        <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="chief_complaint_code_ServerValidate"></asp:CustomValidator>
                                                    </div>

                                                    <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                        <webUI:TextField runat="server" ClientIDMode="Static" ID="txt_chief_complaint" />
                                                    </div>
                                                    <asp:CustomValidator ID="CustomValidator11" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="chief_complaint_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Bệnh Sử/ <span class="text-primary">History of present illness(HPI):</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_history_of_present"></asp:Label>
                                                <div class="form-group" runat="server" id="history_of_present_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_history_of_present" />
                                                    <asp:CustomValidator ID="CustomValidator12" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="history_of_present_ServerValidate"></asp:CustomValidator>
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
                                                <label class="control-label mb-1">Meds<span class="text-danger">*</span></label></div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_past_med_his_meds"></asp:Label>
                                                <div class="form-group" runat="server" id="past_med_his_meds_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_past_med_his_meds" />
                                                    <asp:CustomValidator ID="CustomValidator13" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="past_med_his_meds_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Surgical<span class="text-danger">*</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_past_med_his_surs"></asp:Label>
                                                <div class="form-group" runat="server" id="past_med_his_surs_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_past_med_his_surs" />
                                                    <asp:CustomValidator ID="CustomValidator33" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="past_med_his_surs_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Thói quen/ <span class="text-primary">Habits:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_habits"></asp:Label>
                                                <div runat="server" id="habits_wrapper">
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox"
                                                            runat="server" id="cb_habits_A"
                                                            class="custom-control-input" />
                                                        <span
                                                            class="custom-control-label">Alcohol/
                                                                                    <span
                                                                                        class="text-primary">Rượu</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox"
                                                            runat="server" id="cb_habits_S"
                                                            class="custom-control-input" />
                                                        <span
                                                            class="custom-control-label">Smoking/
                                                                                    <span
                                                                                        class="text-primary">Thuốc</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox"
                                                            runat="server" id="cb_habits_D"
                                                            class="custom-control-input" />
                                                        <span
                                                            class="custom-control-label">Chất
                                                                                    gây nghiện/ <span
                                                                                        class="text-primary">Drugs</span></span>
                                                    </label>
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
                                                        <webUI:TextField runat="server" ID="txt_habits_other" />
                                                    </div>
                                                    <asp:CustomValidator ID="CustomValidator2" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="habits_ServerValidate"></asp:CustomValidator>
                                                </div>
                                                <div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Thuốc dùng tại nhà/ <span class="text-primary">Home medications:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_home_medications"></asp:Label>

                                                <div class="form-group" runat="server" id="home_medications_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_home_medications" />
                                                    <asp:CustomValidator ID="CustomValidator14" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="home_medications_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tiền sử dị ứng/ <span class="text-primary">Allergies:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_allergies"></asp:Label>
                                                <div class="form-group" runat="server" id="allergies_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_allergies" />
                                                    <asp:CustomValidator ID="CustomValidator15" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="allergies_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tiền sử bệnh người thân/ <span class="text-primary">Relevant family history:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_relevant_family_history"></asp:Label>
                                                <div class="form-group" runat="server" id="relevant_family_history_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_relevant_family_history" />
                                                    <asp:CustomValidator ID="CustomValidator16" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="relevant_family_history_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <h4>Khám lâm sàng liên quan/ <span class="text-primary">Physical examination:</span></h4>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1"> Kết quả tìm thấy/ <span class="text-primary">Findings (General and Diagnostic support):</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_finding"></asp:Label>
                                                <div class="form-group" runat="server" id="finding_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_finding" />
                                                    <asp:CustomValidator ID="CustomValidator17" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="finding_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Yêu cầu khám chuyên khoa tâm lý/ <span  class="text-primary">Psychological assessment required:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_required_code"></asp:Label>
                                                <div runat="server" id="required_code_wrapper">
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" id="rad_required_code_False" runat="server" name="rad_required_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_required_code_False">
                                                            Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio mb-1  d-inline-block">
                                                        <input disabled-for="required_code_field" type="radio" id="rad_required_code_True" runat="server" name="rad_required_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_required_code_True">
                                                            Có,
                                                                                ghi rõ/ <span
                                                                                    class="text-primary">Yes,
                                                                                    specify:</span></label>
                                                        <a href="javascript:void(0)"  data-clear="rad_required_code" onclick="clear_radiobutton(this)">
                                                            <icon:XSquare runat="server" ID="XSquare1" />
                                                        </a>
                                                    </div>
                                                    <div class="row par required_code_field">
                                                        <webUI:TextField runat="server" ID="txt_required_text" />
                                                    </div>
                                                    <asp:CustomValidator ID="CustomValidator3" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="required_code_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1"> Kết quả khảo sát/ <span class="text-primary">Investigations Results (Labs, Imaging...):</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_investigations_results"></asp:Label>
                                                <div class="form-group" runat="server" id="investigations_results_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_investigations_results" />
                                                    <asp:CustomValidator ID="CustomValidator18" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="investigations_results_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán sơ bộ/ <span class="text-primary">Initial diagnosis:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_initial_diagnosis"></asp:Label>
                                                <div class="form-group" runat="server" id="initial_diagnosis_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                    <asp:CustomValidator ID="CustomValidator19" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="initial_diagnosis_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                        </div>
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_diferential_diagnosis"></asp:Label>
                                            <div class="form-group" runat="server" id="diferential_diagnosis_wrapper">
                                                <webUI:TextField runat="server" ID="txt_diferential_diagnosis" />
                                                <asp:CustomValidator ID="CustomValidator20" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="diferential_diagnosis_ServerValidate"></asp:CustomValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1"> Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                        </div>
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_associated_conditions"></asp:Label>
                                            <div class="form-group" runat="server" id="associated_conditions_wrapper">
                                                <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                 <asp:CustomValidator ID="CustomValidator21" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="associated_conditions_ServerValidate"></asp:CustomValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">
                                                Chuẩn đoán xác định/ <span class="text-primary">Confirmed Diagnosis:</span></label>
                                        </div>
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_comfirmed_diagnosis"></asp:Label>
                                            <div class="form-group" runat="server" id="comfirmed_diagnosis_wrapper">
                                                <webUI:TextField runat="server" ID="txt_comfirmed_diagnosis" />
                                            </div>
                                        </div>
                                    </div>

                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <h4>Ý kiến của bác sĩ chuyên khoa/ <span class="text-primary">Specialist opinion:</span></h4>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_specialist_opinion"></asp:Label>
                                                    <div runat="server" id="specialist_opinion_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onclick="__doPostBack('specialist_opinion_change','False')" type="radio" id="rad_specialist_opinion_False" runat="server" name="rad_specialist_opinion" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_specialist_opinion_False">
                                                                Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onclick="__doPostBack('specialist_opinion_change','True')" disabled-for="specialist_opinion_field" type="radio" id="rad_specialist_opinion_True" runat="server" name="rad_specialist_opinion" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_specialist_opinion_True">
                                                                Có/ <span class="text-primary">Yes</span></label>
                                                            <input onclick="__doPostBack('specialist_opinion_change','clear')" hidden="hidden" type="checkbox" id="Radio5" runat="server" />

                                                            <label for="Radio5"><icon:XSquare runat="server" ID="XSquare2" /></label>
                                                        </div>
                                                        <asp:CustomValidator ID="CustomValidator4" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="specialist_opinion_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>

                                                <div class="col-md-12" runat="server" id="specialist_opinion_field">
                                                    <div>
                                                        <label class="control-label mb-1">Tên của bác sĩ chuyên khoa/ Khoa/ <span class="text-primary">Name of the specialist/ Department:</span></label>
                                                    </div>
                                                    <div class="gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_name_of_specialist"></asp:Label>
                                                        <div class="form-group" runat="server" id="name_of_specialist_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_name_of_specialist" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12" runat="server" id="specialist_opinion_field1">
                                                    <div>
                                                        <label class="control-label mb-1">Giờ liên hệ/ <span class="text-primary">Time contacted:</span></label>
                                                    </div>

                                                    <div class="gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_time_contaced"></asp:Label>
                                                        <div class="form-group" runat="server" id="time_contaced_wrapper">
                                                            <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_time_contaced" />
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <label class="control-label mb-1">Giờ khám/ <span class="text-primary">Time provided:</span></label>
                                                    </div>

                                                    <div class="gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_time_provided"></asp:Label>
                                                        <div class="form-group" runat="server" id="time_provided_wrapper">
                                                            <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_time_provided" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12" runat="server" id="specialist_opinion_field2">
                                                    <div>
                                                        <label class="control-label mb-1">Tóm tắt ý kiến của bác sĩ chuyên khoa/ <span class="text-primary">Specialist opinion summarised:</span></label>
                                                    </div>
                                                    <div class="gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_spec_opinion_summarised"></asp:Label>
                                                        <div class="form-group" runat="server" id="spec_opinion_summarised_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_spec_opinion_summarised" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h4>Kế hoạch chăm sóc/ <span  class="text-primary">Care Plan:</span></h4>
                                            <%--<label class="control-label mb-1">Kế hoạch chăm sóc/ <span  class="text-primary">Care Plan:</span></label>--%>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-1 font-bold">1. Điều trị tại khoa cấp cứu/ <span class="text-primary">Treatment in Emergency</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <asp:UpdatePanel ID="updatePanel_Treatment" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <asp:GridView ShowHeaderWhenEmpty="true" ID="grid_Treatment" runat="server" OnRowDeleting="grid_Treatment_RowDeleting" OnRowDataBound="gridTreatment_RowDataBound" CssClass="tb-responsive table-bordered" AutoGenerateColumns="false">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 105px" class="text-primary pt-2 pb-2">
                                                                        Time
                                                                    </div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%--<telerik:RadDateTimePicker Width="200px" ID="time" runat="server" SelectedDate='<%# DBNull.Value.Equals(Eval("time")) ? null : Eval("time") %>'></telerik:RadDateTimePicker>--%>

                                                                    <telerik:RadDateTimePicker Width="200px" ID="time" runat="server" SelectedDate='<%# GetDateTime(Eval("time")) %>'></telerik:RadDateTimePicker>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 285px" class="text-primary">
                                                                        Medication and Fluid
                                                                    </div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField runat="server" Value='<%#Eval("medication") %>' ID="medication" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px" class="text-primary">
                                                                    Dose</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField runat="server" Value='<%#Eval("dose") %>' ID="dose" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px" class="text-primary">
                                                                    Route</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField runat="server" Value='<%#Eval("route") %>' ID="route" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px" class="text-primary">
                                                                    Comment</span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField runat="server" Value='<%#Eval("comment") %>' ID="comment" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                        <icon:Trash runat="server" ID="Trash" />
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:UpdateProgress ID="updateProgress_Treatment" runat="server" AssociatedUpdatePanelID="updatePanel_Treatment">
                                                        <ProgressTemplate>
                                                            Please wait....
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                    <div class="mt-2">
                                                        <asp:Button ID="btn_grid_Treatment_add" runat="server" CssClass="btn btn-sm btn-secondary" OnClick="btn_grid_Treatment_add_Click" Text="+ Add Row" />
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btn_grid_Treatment_add" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-2 font-bold pl-4"> Progress Note</label>
                                        </div>

                                        <div class="col-md-12">
                                            <asp:UpdatePanel ID="updatePanel_ProgressNote" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <asp:GridView ShowHeaderWhenEmpty="true" ID="grid_progress_note" runat="server" OnRowDeleting="grid_progress_note_RowDeleting" OnRowDataBound="gridTreatment_RowDataBound" CssClass="tb-responsive table-bordered" AutoGenerateColumns="false">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 105px" class="text-primary pt-2 pb-2">
                                                                        Time
                                                                    </div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <telerik:RadDateTimePicker Width="200px " ID="time" runat="server" SelectedDate='<%# GetDateTime(Eval("time")) %>'></telerik:RadDateTimePicker>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px" class="text-primary">
                                                                        Progress
                                                                    </div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField runat="server" Value='<%#Eval("progress") %>' ID="progress" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 300px" class="text-primary">
                                                                    Appropriate Order
                                                                                                            </span>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <webUI:TextField runat="server" Value='<%#Eval("appropriate_order") %>' ID="appropriate_order" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                        <icon:Trash runat="server" ID="Trash" />
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                    <asp:UpdateProgress ID="updateProgress_ProgressNote" runat="server" AssociatedUpdatePanelID="updatePanel_ProgressNote">
                                                        <ProgressTemplate>
                                                            Please wait....
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                    <div class="mt-2">
                                                        <asp:Button ID="btn_grid_progress_note_add" runat="server" CssClass="btn btn-sm btn-secondary" Text="+ Add Row" OnClick="btn_grid_progress_note_add_Click" />
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btn_grid_progress_note_add" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>

                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-1"> Kết  luận sau điều trị/ <span class="text-primary">Conclusions at termination of treatmen:</span></label>
                                        </div>
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_conclusions"></asp:Label>
                                            <div class="form-group" runat="server" id="conclusions_wrapper">
                                                <webUI:TextField runat="server" ID="txt_conclusions" />
                                                <asp:CustomValidator ID="CustomValidator22" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="conclusions_ServerValidate"></asp:CustomValidator>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label mb-2 font-bold">2. Xuất viện/ <span class="text-primary">Discharge:</span></label>
                                            </legend>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_discharge"></asp:Label>
                                                <div runat="server" id="discharge_wrapper">
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onclick="__doPostBack('discharge_change','False')" type="radio" id="rad_discharge_False" runat="server" name="rad_discharge" class="custom-control-input" /><label class="custom-control-label" for="rad_discharge_False">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onclick="__doPostBack('discharge_change','True')" disabled-for="discharge_field" type="radio" id="rad_discharge_True" runat="server" name="rad_discharge" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_discharge_True">Có/ <span class="text-primary">Yes</span></label>
                                                            <input onclick="__doPostBack('discharge_change','clear')" hidden="hidden" type="checkbox" id="Radio4" runat="server" />
                                                        <label for="Radio4"><icon:XSquare runat="server" ID="XSquare3" /></label>
                                                    </div>
                                                    <asp:CustomValidator ID="CustomValidator5" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="discharge_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                           
                                            <div class="col-md-12 mb-2 gt-2-a" runat="server" id="discharge_field">
                                                <label class="control-label mb-1">Toa thuốc/ <span class="text-primary">Prescription:</span></label>
                                                <asp:Label runat="server" ID="lbl_prescription"></asp:Label>
                                                <div class="form-group" runat="server" id="prescription_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_prescription" />
                                                    <asp:CustomValidator ID="CustomValidator23" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="prescription_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-12 mb-2 gt-2-a" runat="server" id="discharge_field1">
                                                <label class="control-label mb-1">Ghi rõ các hướng dẫn chăm sóc tiếp theo/ <span class="text-primary">Specify follow-up care instructions:</span></label>
                                                <asp:Label runat="server" ID="lbl_specify_care_instructions"></asp:Label>
                                                <div class="form-group" runat="server" id="specify_care_instructions_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_specify_care_instructions" />
                                                    <asp:CustomValidator ID="CustomValidator24" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="specify_care_instructions_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a" runat="server" id="discharge_field2">
                                                <label class="control-label mb-1">
                                                    Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Discharge Time:</span></label>
                                                <asp:Label runat="server" ID="lbl_discharge_time"></asp:Label>
                                                <div runat="server" id="discharge_time_wrapper">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_discharge_time" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_discharge_time" ErrorMessage="Field is required."
                                                ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label mb-2 font-bold">3. Chuyển sang khám ngoại trú/ <span class="text-primary">Referred to OPD:</span></label>
                                            </legend>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_referred_to_OPD"></asp:Label>
                                                <div runat="server" id="referred_to_OPD_wrapper">
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" id="rad_referred_to_OPD_False" runat="server" name="rad_referred_to_OPD" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_referred_to_OPD_False">Không/ <span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio mb-2 d-inline-block">
                                                        <input disabled-for="referred_to_OPD_field" type="radio" id="rad_referred_to_OPD_True" runat="server" name="rad_referred_to_OPD" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_referred_to_OPD_True">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                        <a href="javascript:void(0)"  data-clear="rad_referred_to_OPD" onclick="clear_radiobutton(this)">
                                                            <icon:XSquare runat="server" ID="XSquare4" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group referred_to_OPD_field">
                                                        <webUI:TextField runat="server" ID="txt_referred_to_OPD_text" />
                                                    </div>

                                                    <asp:CustomValidator ID="CustomValidator6" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="referred_to_OPD_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2 font-bold">4. Yêu cầu nhập viện/ <span class="text-primary">Hospitalisation required:</span></label>
                                                </legend>

                                                    <div class="col-md-12 gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_hospitalisation_required"></asp:Label>
                                                        <div runat="server" id="hospitalisation_required_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" onclick="__doPostBack('hos_req_change','False')" id="rad_hospitalisation_required_False" runat="server" name="rad_hos_req" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_hospitalisation_required_False">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio mb-2 d-inline-block">
                                                                <input onclick="__doPostBack('hos_req_change','True')" type="radio" id="rad_hospitalisation_required_True" runat="server" name="rad_hos_req" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_hospitalisation_required_True">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                                <input onclick="__doPostBack('hos_req_change','clear')"  type="checkbox" id="Radio1" hidden="hidden" runat="server" name="rad_hos_req" class="custom-control-input" />
                                                                <label for="Radio1"><icon:XSquare runat="server" ID="XSquare9" /></label>
                                                            </div>
                                                            <asp:CustomValidator ID="CustomValidator7" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="hos_req_ServerValidate"></asp:CustomValidator>
                                                        </div>
                                                    </div>

                                                <div class="col-md-12" runat="server" id="hos_req_field">
                                                    <div class="mb-2 gt-2-a">
                                                        <label class="control-label mb-1">Lý do/ <span class="text-primary">Reason:</span></label>
                                                        <asp:Label runat="server" ID="lbl_reason"></asp:Label>
                                                        <div class="form-group" runat="server" id="reason_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_reason" />
                                                            <asp:CustomValidator ID="CustomValidator25" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="reason_ServerValidate"></asp:CustomValidator>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="mb-2 gt-2-a">
                                                        <label class="control-label mb-1">
                                                            Tại khoa/ <span class="text-primary">Ward:</span></label>
                                                        <asp:Label runat="server" ID="lbl_ward"></asp:Label>
                                                        <div class="form-group" runat="server" id="ward_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_ward" />
                                                            <asp:CustomValidator ID="CustomValidator26" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="ward_ServerValidate"></asp:CustomValidator>
                                                        </div>
                                                    </div>

                                                    <div class="mb-2 gt-2-a">
                                                        <label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Discharge Time:</span></label>
                                                        <asp:Label runat="server" ID="lbl_time_of_leaving_emergency"></asp:Label>
                                                        <div runat="server" id="time_of_leaving_emergency_wrapper">
                                                            <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_time_of_leaving_emergency" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_time_of_leaving_emergency" ErrorMessage="Field is required."
                                                        ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-1 font-bold">
                                                    5. Nếu phẫu thuật cấp cứu/ <span class="text-primary">In case of emergency surgery:</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    
                                                    <p>
                                                    Khi không có thời gian để ghi nhận đầy đủ bệnh sử và kết quả khám lâm sàng của bệnh nhân cần phẫ̃u thuật cấp cứu, vui lòng ghi rõ:
                                                <br />
                                                    <span class="text-primary">When there is no time to record the complete history and physical examination of a patient requiring emergency surgery, indicate </span>
                                                </p>
                                                </div>

                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_emergency_surgery"></asp:Label>
                                                <div runat="server" id="emergency_surgery_wrapper">
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input onclick="__doPostBack('emergency_surgery_change','False')" type="radio" id="rad_emergency_surgery_False" runat="server" name="rad_emr_sur" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_emergency_surgery_False">
                                                            Không/<span class="text-primary">No</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio mb-2 d-inline-block">
                                                        <input onclick="__doPostBack('emergency_surgery_change','True')" type="radio" id="rad_emergency_surgery_True" runat="server" name="rad_emr_sur" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_emergency_surgery_True">
                                                            Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>

                                                        <input onclick="__doPostBack('emergency_surgery_change','clear')" type="checkbox" hidden="hidden" id="Radio2" runat="server" />

                                                        <label for="Radio2"><icon:XSquare runat="server" ID="XSquare6" /></label>
                                                        
                                                    </div>
                                                    <asp:CustomValidator ID="CustomValidator8" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="emergency_surgery_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        
                                                <div class="col-md-12">
                                        <div class="row par" runat="server" id="emr_sur_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán trước phẫu thuật/ <span class="text-primary">Pre-operative diagnosis:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_pre_operative_diagnosis"></asp:Label>
                                                <div class="form-group" runat="server" id="pre_operative_diagnosis_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_pre_operative_diagnosis" />
                                                    <asp:CustomValidator ID="CustomValidator27" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="pre_operative_diagnosis_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>
                                                    </div>
                                                <div class="col-md-12">
                                        <div class="row mb-2 " runat="server" id="emr_sur_field1">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tóm tắt bệnh án/ <span class="text-primary">Brief summary:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_brief_summary"></asp:Label>
                                                <div class="form-group" runat="server" id="brief_summary_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_brief_summary" />
                                                    <asp:CustomValidator ID="CustomValidator28" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="brief_summary_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                        <div class="row" runat="server" id="emr_sur_field2">
                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Time of leaving Emergency:</span></label>
                                                <asp:Label runat="server" ID="lbl_time_of_leaving_emer_e"></asp:Label>
                                                <div runat="server" id="time_of_leaving_emer_e_wrapper">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_time_of_leaving_emer_e" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_time_of_leaving_emer_e" ErrorMessage="Field is required."
                                                ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                                        </div>
                                                </fieldset>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-1 font-bold">
                                                    6. Nếu chuyển đến BV khác/ <span class="text-primary">In case of transfer to another hospital:</span></label>
                                                </legend>

                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_transfer_hospital"></asp:Label>
                                            <div runat="server" id="transfer_hospital_wrapper">
                                                <div class="custom-control custom-radio d-inline-block">
                                                    <input onclick="__doPostBack('transfer_hospital_change','False')" type="radio" id="rad_transfer_hospital_False" runat="server" name="rad_transfer_hos" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_transfer_hospital_False">
                                                        Không/ <span class="text-primary">No</span></label>
                                                </div>
                                                <div class="custom-control custom-radio mb-2 d-inline-block">
                                                    <input onclick="__doPostBack('transfer_hospital_change','True')"  type="radio" id="rad_transfer_hospital_True" runat="server" name="rad_transfer_hos" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_transfer_hospital_True">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                    <input onclick="__doPostBack('transfer_hospital_change','clear')" hidden="hidden" type="checkbox" id="Radio3" runat="server" />

                                                        <label for="Radio3"><icon:XSquare runat="server" ID="XSquare5" /></label>
                                                </div>
                                                <asp:CustomValidator ID="CustomValidator9" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="transfer_hospital_ServerValidate"></asp:CustomValidator>
                                            </div>
                                        </div>
                                        <div class="col-md-12 gt-2-a"  runat="server" id="transfer_hos_field">
                                            <label class="control-label mb-1">Lý do chuyển viện/ <span class="text-primary">Reason for transfer:</span></label>
                                            <asp:Label runat="server" ID="lbl_reason_for_transfer"></asp:Label>
                                            <div class="form-group" runat="server" id="reason_for_transfer_wrapper">
                                                <webUI:TextField runat="server" ID="txt_reason_for_transfer" />
                                                <asp:CustomValidator ID="CustomValidator29" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="reason_for_transfer_ServerValidate"></asp:CustomValidator>
                                            </div>
                                        </div>

                                        <div class="col-md-12 gt-2-a" runat="server" id="transfer_hos_field1">
                                            <label class="control-label mb-1">Tình trạng trước khi chuyển viện/ <span class="text-primary">Status before transfer:</span></label>
                                            <asp:Label runat="server" ID="lbl_status_before_transfer"></asp:Label>
                                            <div class="form-group" runat="server" id="status_before_transfer_wrapper">
                                                <webUI:TextField runat="server" ID="txt_status_before_transfer" />
                                                <asp:CustomValidator ID="CustomValidator30" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="status_before_transfer_ServerValidate"></asp:CustomValidator>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2 gt-2-a" runat="server" id="transfer_hos_field2">
                                            <label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Time of leaving Emergency:</span></label>
                                            <asp:Label runat="server" ID="lbl_time_of_leaving_emer_a"></asp:Label>
                                            <div runat="server" id="time_of_leaving_emer_a_wrapper">
                                                <telerik:RadDateTimePicker runat="server" Width="200px" ID="dtpk_time_of_leaving_emer_a" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_time_of_leaving_emer_a" ErrorMessage="Field is required."
                                            ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                                </fieldset>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label mb-1 font-bold">Tình trạng của bệnh nhân khi xuất viện/ <span class="text-primary">Patient's Condition at Discharge:</span></label>
                                            </legend>
                                        <div class="col-md-12 gt-2-a">
                                            <label class="control-label mb-1"></label>

                                            <asp:Label runat="server" ID="lbl_patient_discharge"></asp:Label>

                                            <div runat="server" id="patient_discharge_wrapper">
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox"
                                                        runat="server"
                                                        id="cb_patient_discharge_IMP"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Có
                                                                                cải thiện/ <span
                                                                                    class="text-primary">Improved</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox"
                                                        runat="server"
                                                        id="cb_patient_discharge_UNC"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Không
                                                                                thay đổi/ <span
                                                                                    class="text-primary">Unchanged</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox d-inline-block">
                                                    <input type="checkbox" runat="server" id="cb_patient_discharge_UNS"
                                                        class="custom-control-input" />
                                                    <span class="custom-control-label">Không ổn định/ <span class="text-primary">Unstable</span></span>
                                                </label>
                                                <asp:CustomValidator ID="CustomValidator10" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="patient_discharge_ServerValidate"></asp:CustomValidator>
                                            </div>
                                        </div>

                                        <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_txt_patient_discharge"></asp:Label>
                                                <div class="form-group " runat="server" id="txt_patient_discharge_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_patient_discharge" />
                                                    <asp:CustomValidator ID="CustomValidator31" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="patient_discharge_ServerValidate"></asp:CustomValidator>
                                                </div>
                                            </div>
                                    </fieldset>

                                    <div class="row mb-2">
                                        <div class="col-md-12 gt-2-a">
                                            <label class="control-label mb-1">Mã ICD-10/ <span class="text-primary">ICD-10 Code(S):</span></label>
                                            <asp:Label runat="server" ID="lbl_icd_10"></asp:Label>
                                            <div class="form-group " runat="server" id="icd_10_wrapper">
                                                <webUI:TextField runat="server" ID="txt_icd_10" />
                                                <asp:CustomValidator ID="CustomValidator32" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Field is required" CssClass="text-danger" OnServerValidate="icd_10_ServerValidate"></asp:CustomValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-actions">
                                                <asp:LinkButton ValidationGroup="Group2" runat="server" OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

                                                <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>

                                                <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                <asp:LinkButton runat="server" OnClientClick="btnPrint_Click(); return false;" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

                                                <asp:LinkButton runat="server" OnClick="btnCancel_Click" ID="btnCancel" CssClass="btn btn-secondary waves-effect">Cancel</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>

                                    <Button:PopupShowDelay runat="server" ID="PopupShowDelay" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
                <asp:LinkButton runat="server" OnClick="clearSession_Click" ID="clearSession"></asp:LinkButton>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/checkValidFields.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>

    <script>
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        formGroup_init();
        checkboxRadiobutton_init();
        InputFilter();

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function btnPrint_Click() {
            if (document.getElementById('lbl_required_code').innerText.includes("Yes")) {
                document.getElementById("lbl_required_code_True").innerText = "☒";
                document.getElementById("lbl_required_code_False").innerText = "❏";
            } else {
                document.getElementById("lbl_required_code_False").innerText = "☒";
                document.getElementById("lbl_required_code_True").innerText = "❏";
            }

            let printedTime = document.getElementById("printedTime");
            if (printedTime) {
                const date = new Date();
                let day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
                let month = date.getMonth() + 1 > 9 ? date.getMonth() + 1 : "0" + date.getMonth() + 1;
                let hour = date.getHours() > 9 ? date.getHours() : "0" + date.getHours();
                let minute = date.getMinutes() > 9 ? date.getMinutes() : "0" + date.getMinutes();
                printedTime.innerHTML = "Ngày/Date: " + day + "/" + month + "/" + date.getFullYear() + ", Giờ/Time " + hour + ":" + minute;
            }

            let lbl_evaluation_time = document.getElementById("lbl_evaluation_time");
            let prt_evaluation_time = document.getElementById("prt_evaluation_time");
            prt_evaluation_time.innerText = lbl_evaluation_time.innerText;

            window.print();
        }

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter();
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }
    </script>

</body>

</html>

