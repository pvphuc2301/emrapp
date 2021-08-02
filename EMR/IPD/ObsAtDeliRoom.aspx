﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObsAtDeliRoom.aspx.cs" Inherits="EMR.ObstetricObservationAtDeliveryRoom" ValidateRequest="false" %>

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
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="Trash" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="Button" TagName="PopupShowDelay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OBSTETRIC OBSERVATION AT DELIVERY ROOM</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <style type="text/css">
        table { page-break-after:auto }
        tr    { page-break-inside:avoid; page-break-after:auto }
        td    { page-break-inside:avoid; page-break-after:auto }
        thead { display:table-header-group }
        tfoot { display:table-footer-group }

        @page {
    padding-top: 0;
    padding-bottom: 0;
    page-break-inside: avoid;

    margin-top: 5px;
    margin-bottom: 5px;
    margin-left: 20px;
    margin-right: 20px;
}
    </style>
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />

        <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <%--<div class="cssclsNoScreen">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info">
                                        <img src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>BỆNH ÁN NGOẠI TRÚ</h4>
                                            <h5>OBSTETRIC OBSERVATION AT DELIVERY ROOM</h5>
                                        </div>
                                        <div style="width: 175px; text-align:center">
                                            <asp:Label CssClass="d-block" runat="server" ID="prt_fullname"></asp:Label>
                                            <asp:Label class="d-block" CssClass="d-block" runat="server" ID="prt_dob"></asp:Label>
                                            <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
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
                                    <div class="main" runat="server">
                                        <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify">
                                        <asp:Label>Nhập phòng sinh lúc/ </asp:Label>
                                        <asp:Label>Admission to Delivery room at: </asp:Label>
                                        <asp:Label runat="server" ID="prt_hour"></asp:Label>
                                        <asp:Label>giờ/ hour </asp:Label>
                                        <asp:Label runat="server" ID="prt_minute"></asp:Label>
                                        <asp:Label>phút/ minute</asp:Label>
                                        <asp:Label>, ngày/date: </asp:Label>
                                        <asp:Label runat="server" ID="prt_date"></asp:Label>

                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-6 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify">
                                        <asp:Label>Người theo dõi/ </asp:Label>
                                        <asp:Label>Observer’s name: </asp:Label>
                                        <asp:Label runat="server" ID="prt_obs_name"></asp:Label>
                                    </div>
                                    <div class="col-6 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label>Chức danh/ </asp:Label>
                                        <asp:Label>Initial: </asp:Label>
                                        <asp:Label runat="server" ID="prt_obs_initial"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label Style="font-weight: bold;">1. Đặc điểm trẻ sơ sinh/ Neonatal features: </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label>- Sinh lúc/ Delivered at:</asp:Label>
                                        <asp:Label runat="server" ID="prt_hour_d"></asp:Label>
                                        <asp:Label>giờ/ hour </asp:Label>
                                        <asp:Label runat="server" ID="prt_minute_d"></asp:Label>s
                                        <asp:Label>phút/ minute</asp:Label>
                                        <asp:Label>, ngày/date:  </asp:Label>
                                        <asp:Label runat="server" ID="prt_date_d"></asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12" style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label>- Điểm số Apgar/ Apgar score: phút thứ nhất/ 1st minute: </asp:Label>
                                        <asp:Label runat="server" ID="prt_apgar_score_1"></asp:Label>
                                        <asp:Label> điểm/ points, phút thứ 5/ 5th minute: </asp:Label>
                                        <asp:Label runat="server" ID="prt_apgar_score_5"></asp:Label>
                                        <asp:Label> điểm/ points, phút thứ 10/ 10th minute:  </asp:Label>
                                        <asp:Label runat="server" ID="prt_apgar_score_10"></asp:Label>
                                        <asp:Label> điểm/ points</asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12" style="font-size: 14.5px; font-family: Tahoma; text-align: justify">
                                        <asp:Label>- Cân nặng lúc sinh/ WOB: </asp:Label>
                                        <asp:Label runat="server" ID="prt_weight_of_birth"></asp:Label>
                                        <asp:Label> gram, Chiều dài/ Length: </asp:Label>
                                        <asp:Label runat="server" ID="prt_length_of_birth"></asp:Label>
                                        <asp:Label> cm, Vòng đầu/ Head circumference:  </asp:Label>
                                        <asp:Label runat="server" ID="prt_head_circum"></asp:Label>
                                        <asp:Label> cm </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                        <div class="row">
                                            <div class="col-3">
                                                <asp:Label>- Trẻ/ Newborn: </asp:Label>
                                            </div>
                                            <div class="col-3">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <asp:Label>- Đơn thai/Singleton: </asp:Label>
                                                    </div>
                                                    <div class="col-12">
                                                        <asp:Label>- Đa thai/ Multiple: </asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="row">
                                                    <div class="col-12" style="font-size: 14.5px; font-family: Tahoma">
                                                        <asp:Label ID="prt_singleton_sex_code_M" runat="server" />
                                                        <asp:Label>- Nam/ Male: </asp:Label>
                                                    </div>
                                                    <div class="col-12" style="font-size: 14.5px; font-family: Tahoma">
                                                        <asp:Label ID="prt_multiple_sex_M" runat="server" />
                                                        <asp:Label>- Nam/ Male: </asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="row">
                                                    <div class="col-12" style="font-size: 14.5px; font-family: Tahoma">
                                                        <asp:Label ID="prt_singleton_sex_code_F" runat="server" />
                                                        <asp:Label>- Nữ/ Female: </asp:Label>
                                                    </div>
                                                    <div class="col-12" style="font-size: 14.5px; font-family: Tahoma">
                                                        <asp:Label ID="prt_multiple_sex_F" runat="server" />
                                                        <asp:Label>- Nữ/ Female: </asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                        <asp:Label>- Dị tật bẩm sinh/ Birth defect: </asp:Label>
                                        <asp:Label ID="prt_birth_defect_False" runat="server" />
                                        <asp:Label>Không/ No: </asp:Label>
                                        <asp:Label ID="prt_birth_defect_True" runat="server" />
                                        <asp:Label>Có, chi tiết/ Yes, specify: </asp:Label>
                                        <asp:Label ID="prt_birth_defect_note" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                        <asp:Label>- Tình trạng trẻ sơ sinh sau sinh/ Neonatal status after birth: </asp:Label>
                                        <asp:Label ID="prt_neonatal_status" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                        <asp:Label>- Can thiệp và kết quả/ Intervention and results: </asp:Label>
                                        <asp:Label ID="prt_intervention_False" runat="server" />
                                        <asp:Label>Không/ No: </asp:Label>
                                        <asp:Label ID="prt_intervention_True" runat="server" />
                                        <asp:Label>Có, chi tiết/ Yes, specify: </asp:Label>
                                        <asp:Label ID="prt_intervention_note" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <div class="row">
                                            <div class="col-5">
                                                <asp:Label Style="font-weight: bold;">2. Sổ nhau/ Placenta delivery: </asp:Label>
                                            </div>
                                            <div class="col-3">
                                                <asp:Label ID="prt_placenta_deli_M" runat="server" />
                                                <asp:Label>Bằng tay/ Manual </asp:Label>
                                            </div>
                                            <div class="col-4">
                                                <asp:Label ID="prt_placenta_deli_S" runat="server" />
                                                <asp:Label>Tự nhiên/ Spontaneous </asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify">
                                        <asp:Label>- Lúc/at </asp:Label>
                                        <asp:Label runat="server" ID="prt_pdt_hour"></asp:Label>
                                        <asp:Label>giờ/ hour </asp:Label>
                                        <asp:Label runat="server" ID="prt_pdt_minute"></asp:Label>
                                        <asp:Label>phút/ minute</asp:Label>
                                        <asp:Label>, ngày/date: </asp:Label>
                                        <asp:Label runat="server" ID="prt_pdt_date"></asp:Label>

                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                        <asp:Label>- Cách sổ nhau/ Placenta delivery mode: </asp:Label>
                                        <asp:Label ID="prt_placenta_deli_mode" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                        <asp:Label>- Cân nặng/ Weight: </asp:Label>
                                        <asp:Label ID="prt_placenta_weight" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:Label>- Dây rốn quấn cổ/ Umbilical coil: </asp:Label>
                                            </div>
                                            <div class="col-3">
                                                <asp:Label ID="prt_umbilical_coil_False" runat="server" Text="❏" />
                                                <asp:Label>Không/ No </asp:Label>
                                            </div>
                                            <div class="col-3">
                                                <asp:Label ID="prt_umbilical_coil_True" runat="server" Text="❏"/>
                                                <asp:Label>Có/ Yes </asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                        <asp:Label>- Chiều dài dây rốn/ Umbilical length: </asp:Label>
                                        <asp:Label ID="prt_umbilical_length" runat="server" />
                                        <asp:Label> cm </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                        <asp:Label>- Lượng máu mất sau khi sổ nhau/ Quantity of blood loss after placenta delivery: </asp:Label>
                                        <asp:Label ID="prt_blood_loss" runat="server" />
                                        <asp:Label> ml </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                        <asp:Label>- Can thiệp và kết quả/ Intervention and results: </asp:Label>
                                        <asp:Label ID="prt_p_intervention_False" runat="server" />
                                        <asp:Label>Không/ No: </asp:Label>
                                        <asp:Label ID="prt_p_intervention_True" runat="server" />
                                        <asp:Label>Có, chi tiết/ Yes, specify: </asp:Label>
                                        <asp:Label ID="prt_p_intervention_note" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label Style="font-weight: bold;">3. Tình trạng sản phụ sau sinh/ Maternal status after delivery: </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:Label>SpO2: </asp:Label>
                                                <asp:Label ID="prt_spO2" runat="server" />
                                                <asp:Label> % </asp:Label>
                                            </div>
                                            <div class="col-6">
                                                <asp:Label>Nhiệt độ: </asp:Label>
                                                <asp:Label ID="prt_temp" runat="server" />
                                                <asp:Label> &#x2103 </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:Label>Huyết áp/ BP: </asp:Label>
                                                <asp:Label ID="prt_BP" runat="server" />
                                                <asp:Label> mmHg </asp:Label>
                                            </div>
                                            <div class="col-6">
                                                <asp:Label>Nhịp tim/ HR: </asp:Label>
                                                <asp:Label ID="prt_HR" runat="server" />
                                                <asp:Label> lần/phút/ bpm </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <asp:Label>Nhịp thở/ RR: </asp:Label>
                                                <asp:Label ID="prt_RR" runat="server" />
                                                <asp:Label> lần/phút/ bpm  </asp:Label>
                                            </div>
                                            <div class="col-6">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label Style="font-weight: bold;">Tổng trạng chung/ General appearance: </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <div class="row">
                                            <div class="col-5">
                                                <asp:Label Style="font-weight: bold;">- Phương pháp sinh/ </asp:Label>
                                                <asp:Label>Delivery mode </asp:Label>
                                            </div>
                                            <div class="col-7">
                                                <asp:Label ID="prt_delivery_mode_desc" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;" id="vaginal_deli_desc">
                                        <div class="row">
                                            <div class="col-5">
                                            </div>
                                            <div class="col-7">
                                                <asp:Label ID="prt_dl_desc" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label>- Lí do can thiệp, nếu có/ Reason for intervention, if yes: </asp:Label>
                                        <asp:Label ID="Label20" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <div class="row">
                                            <div class="col-4">
                                                <asp:Label>- Tầng sinh môn/ Perineum: </asp:Label>
                                            </div>
                                            <div class="col-3">
                                                <asp:Label ID="prt_pre_intact" runat="server" />
                                                <asp:Label>Nguyên vẹn/ Intact</asp:Label>
                                            </div>
                                            <div class="col-5">
                                                <asp:Label ID="prt_pre_lacera" runat="server" />
                                                <asp:Label>Rách, độ/ Laceration, degree</asp:Label>
                                                <asp:Label ID="prt_pre_lacera_degree" runat="server" />

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <div class="row">
                                            <div class="col-4">
                                            </div>
                                            <div class="col-8">
                                                <asp:Label ID="prt_pre_episiotomy" runat="server" />
                                                <asp:Label>Cắt/ Episiotomy. Nếu có, cách khâu và loại chỉ/ If yes, suture and silk type</asp:Label>
                                                <asp:Label ID="prt_pre_episiotomy_st" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <div class="row">
                                            <div class="col-4">
                                                <asp:Label>- Cổ tử cung/ Cervix: </asp:Label>
                                            </div>
                                            <div class="col-3">
                                                <asp:Label ID="prt_cervix_intact_True" runat="server" />
                                                <asp:Label>Nguyên vẹn/ Intact</asp:Label>
                                            </div>
                                            <div class="col-5">
                                                <asp:Label ID="prt_cervix_intact_False" runat="server" />
                                                <asp:Label>Rách/ Laceration</asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label Style="font-weight: bold;">4. Thông tin phẫu thuật (nếu có)/ Operation details (if possible): </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label>- Chẩn đoán tiền phẫu/ Preoperative diagnosis: </asp:Label>
                                        <asp:Label ID="prt_preo_diagnosis" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label>- Chẩn đoán hậu phẫu/ Postoperative diagnosis: </asp:Label>
                                        <asp:Label ID="prt_post_diagnosis" runat="server" />
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-md-12 ">
                                        <asp:UpdatePanel ID="updatePanel2" runat="server" UpdateMode="Always ">
                                            <ContentTemplate>
                                                <asp:GridView ShowHeaderWhenEmpty="true " ID="prt_operations" runat="server" AutoGenerateColumns="false" style="width:100%">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <div style="width: 140px; font-weight: bold; font-size: 14.5px; font-family: Tahoma; text-align: center" class=" pt-2 pb-2 ">Giờ, ngày/ Hour, date</div>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <div style="width: 140px; font-size: 14.5px; font-family: Tahoma; text-align: center" class=" pt-2 pb-2 ">
                                                                    <asp:Label Style="text-align: center" Text='<%# Eval("date_time ", "{0: dd/MM/yyyy HH:mm tt} ") %>' runat="server" />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <div style="width: 250px; font-weight: bold; font-size: 14.5px; font-family: Tahoma; text-align: center" class=" ">Phương pháp phẫu thuật và vô cảm/ Surgical and Anesthesia methods </div>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <div style="width: 250px; font-size: 14.5px; font-family: Tahoma; text-align: justify; margin: 5px" class=" ">
                                                                    <asp:Label runat="server" Text='<%# Eval("surgical_anesthesia") %>' />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <div style="width: 180px; font-weight: bold; font-size: 14.5px; font-family: Tahoma; text-align: center" class=" ">Phẫu thuật viên/ Surgeon </div>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <div style="width: 180px; text-align: justify; font-size: 14.5px; font-family: Tahoma; margin: 5px" class=" ">
                                                                    <asp:Label runat="server" Text='<%# Eval("surgeon ") %>' />
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <div style="width: 180px; font-weight: bold; font-size: 14.5px; font-family: Tahoma; text-align: center" class=" ">Phẫu thuật viên/ Surgeon </div>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <div style="width: 180px; text-align: justify; font-size: 14.5px; font-family: Tahoma; margin: 5px" class=" ">
                                                                    <asp:Label runat="server" Text='<%# Eval("anesthesiologist ") %>' />
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
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <div class="row">
                                            <div class="col-3">
                                                <asp:Label>- Tai biến/ Incident: </asp:Label>
                                            </div>
                                            <div class="col-2">
                                                <asp:Label ID="prt_sur_incident_False" Text="❏" runat="server" />
                                                <asp:Label>Không/ No</asp:Label>
                                            </div>
                                            <div class="col-7">
                                                <asp:Label ID="prt_sur_incident_True"  Text="❏" runat="server" />
                                                <asp:Label>Có, chi tiết/ Yes, specify: </asp:Label>
                                                <asp:Label ID="prt_sur_incident_note" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <div class="row">
                                            <div class="col-3">
                                                <asp:Label>- Biến chứng/ Complication: </asp:Label>
                                            </div>
                                            <div class="col-2">
                                                <asp:Label ID="prt_sur_complication_False"  Text="❏" runat="server" />
                                                <asp:Label>Không/ No</asp:Label>
                                            </div>
                                            <div class="col-7">
                                                <asp:Label ID="prt_sur_complication_True"  Text="❏" runat="server" />
                                                <asp:Label>Có, chi tiết/ Yes, specify: </asp:Label>
                                                <asp:Label ID="prt_sur_complication_note" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label Style="font-weight: bold;">5. Kế hoạch điều trị/ Treatment plan: </asp:Label>
                                    </div>
                                </div>
                                <div class="row mb-2 ">
                                    <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; text-align: justify;">
                                        <asp:Label ID="prt_treatment_plan" runat="server" />
                                    </div>
                                </div>
                                <br />
                                <div class="row mb-2">
                                    <div class="col-6">
                                    </div>
                                    <div class="col-6 mb-2">
                                        <div class="col-12" style="text-align: center;">
                                            <label style="font-size: 14.5px; font-family: Tahoma">
                                                <span style="font-weight: bold">Ngày giờ/ Date & time: </span>
                                                <asp:Label ID="prt_signature_date" runat="server" />
                                            </label>
                                        </div>
                                        <div class="col-12" style="text-align: center;">
                                            <div class="col-12" style="text-align: center;">
                                                <label style="font-size: 14.5px; font-family: Tahoma">
                                                    <span style="font-weight: bold">Họ tên, chữ ký & MSNV/ </span>
                                                    <span class="text-primary">Doctor’s name and ID</span>
                                                </label>
                                            </div>
                                            <div class="col-12" style="text-align: center;">
                                                <label style="font-size: 14.5px; font-family: Tahoma">
                                                    <span class="text-primary"></span>
                                                     <asp:Label ID="prt_signature_name" runat="server" />
                                                </label>
                                            </div>
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
                </div>--%>

                <telerik:RadWindowManager RenderMode="Lightweight"  
                                  EnableShadow="true"  
                                  Behaviors="Close, Move, Resize,Maximize" ID="RadWindowManager" DestroyOnClose="true"
                                  RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" Height="400">
            <Windows>
                <telerik:RadWindow RenderMode="Lightweight" ID="RadWindow1" Title="Version History"   runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ShowHeader="false" ID="RadGrid1" runat="server" AllowSorting="true" OnItemCommand="RadGrid1_ItemCommand">
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="document_id,document_log_id">
                                <Columns>
                                    <telerik:GridTemplateColumn Display="false" HeaderStyle-Width="0" ItemStyle-Width="0" ItemStyle-Wrap="false">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="RadLinkButton1" runat="server" CommandName="Open" Text=""></asp:LinkButton>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>

                                    <telerik:GridTemplateColumn>
                                        <ItemTemplate>
                                            <telerik:RadLabel runat="server" ID="RadLabel1" Text='<%# GetHistoryName(Eval("status"),Eval("created_name_e"), Eval("created_date_time"), Eval("modified_name_e"), Eval("modified_date_time"), Eval("amend_reason")) %>'>
</telerik:RadLabel>
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                            </MasterTableView>
                            <ClientSettings>
                                <Selecting AllowRowSelect="true" />
                                <ClientEvents OnRowDblClick="RowDblClick" />
                            </ClientSettings>
                        </telerik:RadGrid>
                    </ContentTemplate>
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>

                <div class="cssclsNoPrint1">
                    <ul class="breadcrumb cssclsNoPrint" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Obstetric Observation At Delivery Room</li>
                    </ul>
                    <div id="print_content" style="overflow: scroll; height: calc(100vh - 43px); overflow-x: hidden;">
                        <asp:HiddenField runat="server" ID="DataObj" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <div class="card" runat="server" id="amendReasonWraper">
                                <div class="card-body">
                                    <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span>
                                        <br />
                                        <span class="text-danger">* </span><small>Nội dung lý do thay đổi phải trên 3 ký tự</small></h5>
                                    <div class="form-group mb-2">

                                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_amend_reason" CssClass="form-control" />

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                            ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <asp:ValidationSummary
                                ID="valSum"
                                DisplayMode="BulletList"
                                CssClass="validationSummary"
                                runat="server" ValidationGroup="Group2"
                                HeaderText="Please complete the highlighted field(s)." />
                        </asp:Panel>

                        <webUI:PatientInfo runat="server" ID="PatientInfo" />

                        <div class="row" >
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">OBSTETRIC OBSERVATION AT DELIVERY ROOM</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">

                                            <div class="row cssclsNoPrint">
                                                <div class="col-md-12">
                                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="currentLog">
                                                        <telerik:RadLabel runat="server" ID="RadLabel2">
</telerik:RadLabel>
                                                        <telerik:RadButton  RenderMode="Mobile"  OnClick="RadButton1_Click" ID="RadButton1" runat="server" CssClass="btn-sm" Text="View Latest Version"  />
                                                    </div>

                                                    <div class="alert alert-info d-flex align-items-center">
                                                        <telerik:RadLabel runat="server" ID="RadLabel1">
</telerik:RadLabel>
                                                        <telerik:RadButton  RenderMode="Mobile" AutoPostBack="false" ID="Button1" runat="server" OnClientClicked="showWindow" CssClass="btn-sm" Text="View History"  />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 mb-2">
                                                    <label class="h5">VI. Theo dõi thai phụ tại phòng sinh/ <span class="text-primary">Observation at delivery room</span></label>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-2">Nhập phòng sinh lúc/ <span class="text-primary">Admission to Delivery room at:</span></label>
                                                    <div class="align-top">
                                                        <asp:Label  runat="server"  id="lbl_admis_delivery"></asp:Label>
                                                        <div class="form-group d-inline-block" runat="server" id="admis_delivery_wrapper">
                                                            <telerik:RadDateTimePicker runat="server" ID="dtpk_admis_delivery" Width="200px" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_admis_delivery" ErrorMessage="Please enter amend reason"
                                        ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Người theo dõi/ <span class="text-primary">Observer’s name:</span></label>
                                                    <asp:Label  runat="server"  id="lbl_obs_name"></asp:Label>
                                                    <div class="form-group d-inline-block w-n" runat="server" id="obs_name_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_obs_name" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Chức danh/ <span class="text-primary">Initial:</span></label>
                                                    <asp:Label  runat="server"  id="lbl_obs_initial"></asp:Label>
                                                    <div class="form-group d-inline-block w-n" runat="server" id="obs_initial_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_obs_initial" />
                                                    </div>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">1. Đặc điểm trẻ sơ sinh/ <span class="text-primary">Neonatal features:</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Sinh lúc/ <span class="text-primary">Delivered at:</span></label>
                                                    <asp:Label runat="server" ID="lbl_delivery_at"></asp:Label>
                                                    <div class="form-group d-inline-block" runat="server" id="delivery_at_wrapper">
                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_delivery_at" Width="200px" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_delivery_at" ErrorMessage="Please enter amend reason"
                                    ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label">Điểm số Apgar/ <span class="text-primary">Apgar score:</span></label>
                                                    <div>
                                                        <div class="mb-2">
                                                            <label class="control-label mb-1">Phút thứ nhất/ <span class="text-primary">1st minute:</span></label>
                                                            <asp:Label runat="server" ID="lbl_apgar_score_1"></asp:Label>
                                                            <div class="form-group d-inline-block" runat="server" id="apgar_score_1_wrapper">
                                                                <input id="txt_apgar_score_1" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                                <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="control-label mb-1">Phút thứ 5/ <span class="text-primary">5st minute:</span></label>
                                                            <asp:Label runat="server" ID="lbl_apgar_score_5"></asp:Label>
                                                            <div class="form-group d-inline-block" runat="server" id="apgar_score_5_wrapper">
                                                                <input id="txt_apgar_score_5" data-type="number" runat="server" style="width: 160px" class="form-control text-right" />
                                                                <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="control-label mb-1">Phút thứ 10/ <span class="text-primary">10st minute:</span></label>
                                                            <asp:Label runat="server" ID="lbl_apgar_score_10"></asp:Label>
                                                            <div class="form-group d-inline-block" runat="server" id="apgar_score_10_wrapper">
                                                                <input id="txt_apgar_score_10" data-type="number" runat="server" style="width: 160px" class="form-control text-right" />
                                                                <span class="append">điểm/ <span class="text-primary">points</span></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Cân nặng lúc sinh/ <span class="text-primary">WOB:</span></label>

                                                    <div>
                                                        <div class="mb-2">
                                                            <asp:Label runat="server" ID="lbl_weight_of_birth"></asp:Label>
                                                            <div class="form-group d-inline-block " runat="server" id="weight_of_birth_wrapper">
                                                                <input id="txt_weight_of_birth" data-type="number" style="width: 100px" runat="server" class="form-control text-right" />
                                                                <span class="append">gram</span>
                                                            </div>
                                                        </div>
                                                        <div class="mb-2">
                                                            <label class="control-label mb-1">Chiều dài/ <span class="text-primary">Length:</span></label>
                                                            <asp:Label runat="server" ID="lbl_length_of_birth"></asp:Label>
                                                            <div class="form-group d-inline-block" runat="server" id="length_of_birth_wrapper">
                                                                <input id="txt_length_of_birth" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                                <span class="append">cm</span>
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="control-label mb-1">Vòng đầu/ <span class="text-primary">Head circumference:</span></label>
                                                            <asp:Label runat="server" ID="lbl_head_circum"></asp:Label>
                                                            <div class="form-group d-inline-block" runat="server" id="head_circum_wrapper">
                                                                <input id="txt_head_circum" data-type="number" style="width: 160px" runat="server" class="form-control text-right" />
                                                                <span class="append">cm</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Trẻ/ <span class="text-primary">Newborn:</span></label>
                                                    <div>
                                                        <div class="mb-2">
                                                            <label class="control-label">Đơn thai/ <span class="text-primary">Signleton:</span></label>
                                                            <asp:Label runat="server" ID="lbl_singleton_sex_code"></asp:Label>
                                                            <div class="d-inline-block" runat="server" id="singleton_sex_code_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block" >
                                                                    <input type="radio" id="rad_singleton_sex_code_m" name="rad_singleton_sex_code" class="custom-control-input" runat="server" />
                                                                    <label class="custom-control-label" for="rad_singleton_sex_code_m">Nam/ <span class="text-primary">Male</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" id="rad_singleton_sex_code_f" name="rad_singleton_sex_code" class="custom-control-input" runat="server" />
                                                                    <label class="custom-control-label" for="rad_singleton_sex_code_f">Nữ/ <span class="text-primary">Female</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_singleton_sex_code" onclick="clear_radiobutton(this)">
                                                                        <icon:XSquare runat="server" ID="XSquare38" />
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="control-label">Đa thai/ <span class="text-primary">Multiple:</span></label>
                                                            <asp:Label runat="server" ID="lbl_multiple_sex"></asp:Label>
                                                            <div runat="server" id="multiple_sex_wrapper">
                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_multiple_sex_m" />
                                                                    <span class="custom-control-label">Nam/ <span class="text-primary">Male</span></span>
                                                                </label>

                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_multiple_sex_f" />
                                                                    <span class="custom-control-label">Nữ/ <span class="text-primary">Female</span></span>
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Dị tật bẩm sinh/ <span class="text-primary">Birth defect:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_birth_defect"></asp:Label>
                                                        <div class="mb-2" runat="server" id="birth_defect_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_birth_defect_false" name="rad_birth_defect" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_birth_defect_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_birth_defect_true" name="rad_birth_defect" class="custom-control-input" disabled-for="txt_birth_defect_note" />
                                                                <label class="custom-control-label" for="rad_birth_defect_true">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_birth_defect" onclick="clear_radiobutton(this)">
                                                                    <icon:XSquare runat="server" ID="XSquare1" />
                                                                </a>
                                                            </div>

                                                            <div class="form-group txt_birth_defect_note">
                                                                <webUI:TextField runat="server" ID="txt_birth_defect_note" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Tình trạng trẻ sơ sinh sau sinh/ <span class="text-primary">Neonatal status after birth:</span></label>
                                                    <asp:Label runat="server" ID="lbl_neonatal_status"></asp:Label>
                                                    <div class="form-group" runat="server" id="neonatal_status_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_neonatal_status" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label mb-1">Can thiệp và kết quả/ <span class="text-primary">Intervention and results:</span></label>
                                                    <div>
                                                        <label class="align-top">Intervention</label>
                                                        <asp:Label runat="server" ID="lbl_intervention"></asp:Label>
                                                        <div  runat="server" id="intervention_wrapper">
                                                            <div class="d-inline-block">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" id="rad_intervention_false" name="rad_intervention" class="custom-control-input" runat="server" />
                                                                    <label class="custom-control-label" for="rad_intervention_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" id="rad_intervention_true" name="rad_intervention" class="custom-control-input" runat="server" disabled-for="intervention_note_field" />
                                                                    <label class="custom-control-label" for="rad_intervention_true">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_intervention" onclick="clear_radiobutton(this)">
                                                                        <icon:XSquare runat="server" ID="XSquare2" />
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="intervention_note_field">
                                                                <label>Intervention note</label>
                                                                <div class="form-group">
                                                                    <webUI:TextField runat="server" ID="txt_intervention_note" />
                                                                </div>
                                                            </div>  
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Sổ nhau/ <span class="text-primary">Placenta delivery:</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label"></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_placenta_deli"></asp:Label>
                                                        <div class="mb-2" runat="server" id="placenta_deli_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_placenta_deli_true" name="rad_placenta_deli" class="custom-control-input" runat="server" />
                                                                <label class="custom-control-label" for="rad_placenta_deli_true">Bằng tay/ <span class="text-primary">Manual</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_placenta_deli_false" name="rad_placenta_deli" class="custom-control-input" runat="server" />
                                                                <label class="custom-control-label" for="rad_placenta_deli_false">Tự nhiên/ <span class="text-primary">Spontaneous</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_placenta_deli" onclick="clear_radiobutton(this)">
                                                                    <icon:XSquare runat="server" ID="XSquare3" />
                                                                </a>
                                                            </div>

                                                            <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Placenta delivery is required" CssClass="text-danger" OnServerValidate="placenta_deli_ServerValidate"></asp:CustomValidator>
                                                        </div>
                                                        <label class="control-label mb-1">vào lúc/ At</label>
                                                        <asp:Label runat="server" ID="lbl_pacental_deli_dt"></asp:Label>
                                                        <div class="d-inline-block mb-2" runat="server" id="pacental_deli_dt_wrapper">
                                                            <div class="form-group d-inline-block">
                                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_pacental_deli_dt" Width="200px" />
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="dtpk_pacental_deli_dt" ErrorMessage="vào lúc/ At is required"
                                    ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Cách sổ nhau/ <span class="text-primary">Placenta delivery mode:</span></label>
                                                    <asp:Label runat="server" ID="lbl_placenta_deli_mode"></asp:Label>
                                                    <div class="form-group" runat="server" id="placenta_deli_mode_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_placenta_deli_mode" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Cân nặng/ <span class="text-primary">Weight:</span></label>
                                                    <asp:Label runat="server" ID="lbl_placenta_weight"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="placenta_weight_wrapper">
                                                        <input id="txt_placenta_weight" data-type="number" style="width: 120px" runat="server" class="form-control text-right" />
                                                        <span class="append">gram</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Dây rốn quấn cổ/ <span class="text-primary">Umbilical coil:</span></label>
                                                    <asp:Label runat="server" ID="lbl_umbilical_coil"></asp:Label>
                                                    <div runat="server" id="umbilical_coil_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" data-type="number" id="rad_umbilical_coil_false" name="rad_umbilical_coil" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_umbilical_coil_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" data-type="number" id="rad_umbilical_coil_true" name="rad_umbilical_coil" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_umbilical_coil_true">Có/ <span class="text-primary">Yes</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_umbilical_coil" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare4" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Chiều dài dây rốn/ <span class="text-primary">Umbilical length:</span></label>
                                                    <asp:Label runat="server" ID="lbl_umbilical_length"></asp:Label>
                                                    <div class="form-group mb-2" data-type="number" runat="server" id="umbilical_length_wrapper">
                                                        <input id="txt_umbilical_length" data-type="number" style="width: 120px" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Lượng máu mất sau khi sổ nhau/ <span class="text-primary">Quantity of blood loss after placenta delivery:</span></label>
                                                    <asp:Label runat="server" ID="lbl_blood_loss"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="blood_loss_wrapper">
                                                        <input id="txt_blood_loss" data-type="number" style="width: 120px" runat="server" class="form-control text-right" />
                                                        <span class="append">ml</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Can thiệp và kết quả/ <span class="text-primary">Intervention and results:</span></label>
                                                    <asp:Label runat="server" ID="lbl_p_intervention"></asp:Label>
                                                    <div runat="server" id="p_intervention_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_p_intervention_false" name="rad_p_intervention" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_p_intervention_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_p_intervention_true" name="rad_p_intervention" class="custom-control-input" disabled-for="p_intervention_note_field" runat="server" />
                                                            <label class="custom-control-label" for="rad_p_intervention_true">Có, chi tiết/ <span class="text-primary">Yes, specify</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_p_intervention" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare5" />
                                                            </a>
                                                        </div>
                                                        <asp:CustomValidator ID="CustomValidator2" ValidationGroup="Group2" runat="server" Display="Dynamic" ErrorMessage="Can thiệp và kết quả/ Intervention and results is required" CssClass="text-danger" OnServerValidate="p_intervention_ServerValidate"></asp:CustomValidator>
                                                        <div class="form-group p_intervention_note_field">
                                                            <webUI:TextField runat="server" ID="txt_p_intervention_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">3. Tình trạng sản phụ sau sinh/ <span class="text-primary">Maternal status after delivery:</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">SpO2:</label>
                                                    <asp:Label runat="server" ID="lbl_spO2"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="spO2_wrapper">
                                                        <input id="txt_spO2" data-type="number" runat="server" style="width: 120px" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">T°:</span></label>
                                                    <asp:Label runat="server" ID="lbl_temp"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="temp_wrapper">
                                                        <input id="txt_temp" data-type="number" style="width: 120px" runat="server" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Huyết áp/ <span class="text-primary">BP</span></label>
                                                    <asp:Label runat="server" ID="lbl_BP"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="BP_wrapper">
                                                        <input id="txt_bp" data-type="number" runat="server" style="width: 120px" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Nhịp tim/ <span class="text-primary">HR</span></label>
                                                    <asp:Label runat="server" ID="lbl_HR"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="HR_wrapper">
                                                        <input id="txt_hr" data-type="number" runat="server" style="width: 160px" class="form-control text-right" />
                                                        <span class="append">lần/phút/bpm</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Nhịp thở/ <span class="text-primary">RR</span></label>
                                                    <asp:Label runat="server" ID="lbl_RR"></asp:Label>
                                                    <div class="form-group mb-2" runat="server" id="RR_wrapper">
                                                        <input id="txt_rr" data-type="number" runat="server" style="width: 160px" class="form-control text-right" />
                                                        <span class="append">lần/phút/bpm</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">Tổng trạng chung/ <span class="text-primary">General appearance:</span></label>
                                                        </legend>

                                                        <div class="col-md-12 gt-2-a">
                                                            <label  class="control-label">Phương pháp sinh/ <span class="text-primary">Delivery mode:</span></label>
                                                            <div class="mb-2">
                                                                <asp:Label runat="server" ID="lbl_delivery_mode_desc"></asp:Label>
                                                                <div  runat="server" id="delivery_mode_code_wrapper">
                                                                    <div class="mb-2">
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input disabled-for="vaginal_deli_field" type="radio" id="rad_delivery_mode_code_v" name="rad_delivery_mode_code" class="custom-control-input" runat="server" />
                                                                            <label class="custom-control-label" for="rad_delivery_mode_code_v">Sanh ngã âm đạo/ <span class="text-primary">Vaginal delivery</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio d-inline-block">
                                                                            <input disabled-for="section_field" type="radio" id="rad_delivery_mode_code_s" name="rad_delivery_mode_code" class="custom-control-input" runat="server" />
                                                                            <label class="custom-control-label" for="rad_delivery_mode_code_s">Sanh mổ/ <span class="text-primary">C-Section:</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_delivery_mode_code" onclick="clear_radiobutton(this)">
                                                                                <icon:XSquare runat="server" ID="XSquare6" />
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                
                                                                    <div>
                                                                        <div class="vaginal_deli_field">
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="rad_vaginal_deli_code_s" name="rad_vaginal_deli_code" class="custom-control-input" runat="server" />
                                                                                <label class="custom-control-label" for="rad_vaginal_deli_code_s">Sanh tự nhiên/ <span class="text-primary">Spontaneous</span></label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="rad_vaginal_deli_code_v" name="rad_vaginal_deli_code" class="custom-control-input" runat="server" />
                                                                                <label class="custom-control-label" for="rad_vaginal_deli_code_v">Sanh hút/ <span class="text-primary">Vacuum-assisted</span></label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="rad_vaginal_deli_code_f" name="rad_vaginal_deli_code" class="custom-control-input" runat="server" />
                                                                                <label class="custom-control-label" for="rad_vaginal_deli_code_f">Sanh kềm/ <span class="text-primary">Forceps-assisted</span></label>
                                                                            </div>
                                                                        </div>

                                                                        <div class="section_field">
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="rad_section_code_el" name="rad_section_code" class="custom-control-input" runat="server" />
                                                                                <label class="custom-control-label" for="rad_section_code_el">Mổ chương trình/ <span class="text-primary">Elective</span></label>
                                                                            </div>
                                                                            <div class="custom-control custom-radio">
                                                                                <input type="radio" id="rad_section_code_em" name="rad_section_code" class="custom-control-input" runat="server" />
                                                                                <label class="custom-control-label" for="rad_section_code_em">Mổ cấp cứu/ <span class="text-primary">Emergency</span></label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 gt-2-a">
                                                            <label  class="control-label">Lí do can thiệp, nếu có/ <span class="text-primary">Reason for intervention, if yes:</span></label>
                                                            <asp:Label runat="server" ID="lbl_interven_reason"></asp:Label>
                                                            <div class="form-group" runat="server" id="interven_reason_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_interven_reason" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 gt-2-a">
                                                            <label  class="control-label">Tầng sinh môn/ <span class="text-primary">Perineum:</span></label>
                                                            <asp:Label runat="server" ID="lbl_pre_intact"></asp:Label>

                                                            <div runat="server" id="pre_intact_wrapper">

                                                                <label class="custom-control custom-checkbox d-inline-block">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_intact_true" />
                                                                    <span class="custom-control-label">Nguyên vẹn/ <span class="text-primary">Intact</span></span>
                                                                </label>

                                                                <div class="d-inline-block">
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_lacera_true" disabled-for="pre_lacera_degree" />
                                                                        <span class="custom-control-label">Rách, độ/ <span class="text-primary">Laceration, degree:</span></span>
                                                                    </label>
                                                                    <div class="d-inline-block">
                                                                        <div class="form-group pre_lacera_degree">
                                                                            <webUI:TextField runat="server" ID="txt_pre_lacera_degree" Width="120px" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="d-inline-block">
                                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_episiotomy_true" disabled-for="pre_episiotomy_st_field" />
                                                                        <span class="custom-control-label">Cắt/ <span class="text-primary">Episiotomy. Nếu có, cách khâu và loại chỉ/ If yes, suture and silk type:</span></span>
                                                                    </label>
                                                                    <div class="d-inline-block">
                                                                        <div style="width: 120px" class="form-group pre_episiotomy_st_field">
                                                                            <webUI:TextField Width="120px" runat="server" ID="txt_pre_episiotomy_st" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 gt-2-a">
                                                            <label  class="control-label">Cổ tử cung/ <span class="text-primary">Cervix:</span></label>
                                                            <asp:Label runat="server" ID="lbl_cervix_intact"></asp:Label>
                                                            <div runat="server" id="cervix_intact_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" id="rad_cervix_intact_true" name="rad_cervix_intact" class="custom-control-input" runat="server" />
                                                                    <label class="custom-control-label" for="rad_cervix_intact_true">Nguyên vẹn/ <span class="text-primary">Intact</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" id="rad_cervix_intact_false" name="rad_cervix_intact" class="custom-control-input" runat="server" />
                                                                    <label class="custom-control-label" for="rad_cervix_intact_false">Rách/ <span class="text-primary">Laceration</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_cervix_intact" onclick="clear_radiobutton(this)">
                                                                        <icon:XSquare runat="server" ID="XSquare7" />
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">4. Thông tin phẫu thuật (nếu có)/ <span class="text-primary">Operation details (if possible):</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Chẩn đoán tiền phẫu/ <span class="text-primary">Preoperative diagnosis:</span></label>
                                                    <asp:Label runat="server" ID="lbl_preo_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="preo_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_preo_diagnosis" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Chẩn đoán hậu phẫu/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                                    <asp:Label runat="server" ID="lbl_post_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="post_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_post_diagnosis" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-2">
                                                    <div  class="mb-2 table-responsive">
                                                        <asp:UpdatePanel ID="updatePanel_operations" runat="server" UpdateMode="Always">
                                                        <ContentTemplate>
                                                    <div >
                                                            <asp:GridView
                                                                ID="grid_operations"
                                                                OnRowDeleting="grid_operations_RowDeleting" 
                                                                runat="server"
                                                                ShowHeaderWhenEmpty="true"
                                                                ShowHeader="true"
                                                                CssClass="table-bordered"
                                                                AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 105px" class="pt-2 pb-2">Ngày/ <span class="text-primary">Date</span> - Giờ/ <span class="text-primary">hour</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <div class="form-group">
                                                                                <telerik:RadDateTimePicker ID="date_time" SelectedDate='<%# DBNull.Value.Equals(Eval("date_time")) ? null : Eval("date_time") %>' Width="200px" runat="server" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 220px">Phương pháp phẫu thuật và vô cảm/ <span class="text-primary">Surgical and Anesthesia methods</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("surgical_anesthesia") %>' ID="surgical_anesthesia" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 180px">Phẫu thuật viên/ <span class="text-primary">Surgeon</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("surgeon") %>' ID="surgeon" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div style="width: 210px">Bác sĩ gây mê/ <span class="text-primary">Anesthesiologist</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("anesthesiologist") %>' ID="anesthesiologist" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                                <icon:Trash runat="server"/>
                                                                            </asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:UpdateProgress ID="updateProgress_operations" runat="server" AssociatedUpdatePanelID="updatePanel_operations">
                                                                <ProgressTemplate>
                                                                    Please wait....
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                            
                                                        
                                                    </div>
                                                        <div class="mt-2">
                                                                <asp:Button ID="btn_grid_operations_add" OnClick="btn_grid_operations_add_Click" runat="server" CssClass="btn btn-sm btn-outline-primary" Text="Add row" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btn_grid_operations_add" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Tai biến/ <span class="text-primary">Incident:</span></label>
                                                    <asp:Label runat="server" ID="lbl_sur_incident"></asp:Label>
                                                    <div runat="server" id="sur_incident_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_sur_incident_false" name="rad_sur_incident" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_sur_incident_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" id="rad_sur_incident_true" name="rad_sur_incident" class="custom-control-input" disabled-for="sur_incident_note_field" runat="server" />
                                                            <label class="custom-control-label" for="rad_sur_incident_true">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_sur_incident" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare8" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group sur_incident_note_field mb-2">
                                                            <webUI:TextField runat="server" ID="txt_sur_incident_note" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label  class="control-label">Biến chứng/ <span class="text-primary">Complication:</span></label>
                                                    <asp:Label runat="server" ID="lbl_sur_complication"></asp:Label>
                                                    <div runat="server" id="sur_complication_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_sur_complication_false" name="rad_sur_complication" class="custom-control-input" runat="server" />
                                                            <label class="custom-control-label" for="rad_sur_complication_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_sur_complication_true" name="rad_sur_complication" class="custom-control-input" disabled-for="sur_complication_note_field" runat="server" />
                                                            <label class="custom-control-label" for="rad_sur_complication_true">Có, chi tiết/ <span class="text-primary">Yes, specify:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_sur_complication" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare9" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group sur_complication_note_field">
                                                            <webUI:TextField runat="server" ID="txt_sur_complication_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-4">
                                                <legend>
                                                    <label class="control-label">5. Kế hoạch điều trị/ <span class="text-primary">Treatment plan:</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <span></span>
                                                    <asp:Label runat="server" ID="lbl_treatment_plan"></asp:Label>
                                                    <div class="form-group" runat="server" id="treatment_plan_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_treatment_plan" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2 cssclsNoPrint">
                                                <div class="col-md-12">
                                                    <div class="form-actions">
                                                        <asp:LinkButton ValidationGroup="Group2" runat="server" OnClick="btnComplete_Click" ID="btnComplete"  CssClass="btn btn-primary waves-effect" >Complete</asp:LinkButton>

                                                        <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect" >Save</asp:LinkButton>

                                                        <div data-toggle="modal" runat="server" data-target="#myModal" id="btnDeleteModal"  class="btn btn-danger waves-effect">Delete</div>

                                                        <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                        <asp:LinkButton runat="server" OnClientClick="printDiv(); return false;" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

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
                                                        <asp:LinkButton OnClick="btnDelete_Click" OnClientClick="window.removeEventListener('beforeunload',comfirm_leave_page,true);" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
                                                    </div>
                                                </ModalBody>
                                            </webUI:PopupModal>

                                            <Button:PopupShowDelay runat="server" ID="PopupShowDelay" />

                                        </div>
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
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>

    <script type="text/javascript">
        checkboxRadiobutton_init();
        formGroup_init();

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            formGroup_init();
            InputFilter();
            checkboxRadiobutton_init();
        }

        function showWindow(sender, eventArgs) {
            var oWnd = $find("<%=RadWindow1.ClientID%>");
            oWnd.show();
        }


       function RowDblClick(sender, eventArgs) {
            console.log('sdfsdf');

           var grid = $find("<%= RadGrid1.ClientID %>");
           var masterTable = grid.get_masterTableView();
           var item = eventArgs.get_itemIndexHierarchical();

           var row = masterTable.get_dataItems()[item];

           var button = row.findElement("RadLinkButton1");
           button.click();

           //console.log(row);
        }

        function printDiv() {
            var printContents = document.getElementById("print_content").innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }

    </script>

</body>
</html>

