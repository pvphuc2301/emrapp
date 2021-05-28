<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniMedAssForNeoInp.aspx.cs" Inherits="EMR.IniMedAssForNeoInp"
    ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/icons/PlusCircle.ascx" TagPrefix="Icon" TagName="PlusCircle" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="trash" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
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
                                <div style="color: #007297; font-size: 26.6667px;">BỆNH ÁN SƠ SINH NỘI TRÚ</div>
                                <div style="color: #e20e5a; font-size: 16.6667px;">INITIAL MEDICAL ASSESSMENT FOR NEONATAL INPATIENTS</div>
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
                        <div style="margin-bottom: 20px;">
                            <span style="width: 190px; border-bottom-style: solid; border-bottom-color: #e20e5a; border-bottom-width: 5px; display: inline-block; font-size: 26.6667px;"></span>
                            <span style="display: inline-block; border-bottom-style: solid; border-bottom-color: #007297; border-bottom-width: 5px; width: calc(100% - 191px); margin-left: -5px;"></span>
                        </div>
                    </th>
                </tr>
            </thead>
            <tbody class="report-content" style="font-size: 20.5px; font-family: Tahoma">
                <tr>
                    <td class="report-content-cell">
                        <div class="main" runat="server" id="print_content">
                            <!-- Code printed here -->
                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT" />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau:" SubTitle="Visited and received treatment at our hospital, with the following information" />
                                    <div class="d-inline-block ml-2 align-top"></div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">I. Admission reason:</label>
                                    <span class="text-primary" style="margin-left: 20px;">Lí do nhập viện</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_admission_reason"></asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">II. Medical History:</label>
                                    <span class="text-primary" style="margin-left: 25px;">Bệnh sử</span>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">1. Current Medical History:</label>
                                    <span class="text-primary" style="margin-left: 30px;">Bệnh sử hiện tại:</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_cur_med_history"></asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                 <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold; margin-left:20px">❖ Current medications: </label>
                                    <span class="text-primary" style="padding-left: 50px;">Current medications:</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_cur_medication"></asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                 <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">2. Antecedent Medical History: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Tiền sử bệnh</span>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold; margin-left:20px">❖ Delivery: </label>
                                    <span class="text-primary" style="padding-left: 50px;">Quá trình sanh</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_delivery"></asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold; margin-left:20px">❖ Postnatal nutrition: </label>
                                    <span class="text-primary" style="padding-left: 50px;">Chế độ dinh dưỡng</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_post_nutrition"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">3. Maternal medical history: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Tiền sử sản khoa</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="lbl_mater_med_history"></asp:Label>
                                </div>
                                
                            </div>

                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">III. Physical Examination: </label>
                                    <span class="text-primary" style="margin-left: 35px;">Khám bệnh</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4" style="margin-left: 10px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Weight: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Cân nặng hiện tại (gr)</span>
                                </div>
                                <div class="col-4">
                                    <asp:Label runat="server" ID="lbl_exam_weight"> </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 10px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Length: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Chiều dài (cm)</span>
                                </div>
                                <div class="col-4">
                                    <asp:Label runat="server" ID="lbl_exam_length"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 10px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Head Circumference: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Vòng đầu (cm)</span>
                                </div>
                                <div class="col-4">
                                    <asp:Label runat="server" ID="lbl_exam_head_circum"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 10px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● HR (per minute): </label>
                                    <span class="text-primary" style="margin-left: 25px;">Mạch (lần/phút)</span>
                                </div>
                                <div class="col-4" >
                                    <asp:Label runat="server" ID="lbl_exam_hr"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 10px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● RR (per minute): </label>
                                    <span class="text-primary" style="margin-left: 25px;">Nhịp thở/phút</span>
                                </div>
                                <div class="col-4" >
                                    <asp:Label  runat="server" ID="lbl_exam_rr"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2"style="margin-left: 10px">
                                <div class="col-12">
                                    <asp:Label runat="server" ID="lbl_physical_exam"></asp:Label>
                                </div>
                            </div>
                            
                            <div class="row mb-2">
                                <div class="col-12" >
                                    <label class="d-block mb-0 h4" style="font-weight: bold">IV. Laboratory indications and results: </label>
                                    <span class="text-primary" style="margin-left: 35px;">Chỉ định và kết quả xét nghiệm</span>
                                </div>
                                <div class="col-12"style="margin-left: 35px; text-align:justify" >
                                    <asp:Label  runat="server" ID="lbl_laboratory"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" >
                                    <label class="d-block mb-0 h4" style="font-weight: bold">V. Conclusion: </label>
                                    <span class="text-primary" style="margin-left: 30px;">Kết luận</span>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 25px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Initial diagnosis: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Chẩn đoán ban đầu</span>
                                </div>
                                <div class="col-7" style=" text-align:justify">
                                    <asp:Label  runat="server" ID="lbl_initial_diagnosis"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 25px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Differential diagnosis: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Chẩn đoán phân biệt</span>
                                </div>
                                <div class="col-7" style=" text-align:justify">
                                    <asp:Label  runat="server" ID="lbl_diff_diagnosis"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 25px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Associated conditions: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Bệnh kèm theo</span>
                                </div>
                                <div class="col-7" style=" text-align:justify">
                                    <asp:Label  runat="server" ID="lbl_associated_conditions"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">VI. Treatment Plan: </label>
                                    <span class="text-primary" style="margin-left: 40px;">Kế hoạch điều trị</span>
                                </div>
                                <div  class="col-12"style="margin-left: 40px;text-align:justify">
                                    <asp:Label  runat="server" ID="lbl_treatment_plan"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">VII. Discharge plan: </label>
                                    <span class="text-primary" style="margin-left: 45px;">Kế hoạch xuất viện</span>
                                </div>
                                <div class="col-12" style="margin-left: 45px;text-align:justify" >
                                    <asp:Label  runat="server" ID="lbl_discharge_plan"></asp:Label>
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



    <div class="cssclsNoPrint">
        <form method="post" action="#" id="form2" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
            <div class="scroll-sidebar h-100 w-100">
                <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div id="AmendReasonPlaceHolder" runat="server"></div>
                        <aih:AmendReason runat="server" ID="txt_amendReason" />
                        <uc1:PatientInfo runat="server" ID="PatientInfo1" />
                        <div class="row" style="margin-bottom: 50px;">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">INITIAL MEDICAL ASSESSMENT FOR NEONATAL INPATIENTS</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        I.
                                                                                        Admission reason/<span
                                                                                            class="text-primary">Lí do
                                                                                            nhập viện:</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_admission_reason" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        II.
                                                                                        Medical History/ <span
                                                                                            class="text-primary">Bệnh
                                                                                            sử:</span></label>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        1.Current
                                                                                        Medical History/ <span
                                                                                            class="text-primary">Bệnh sử
                                                                                            hiện tại:</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_cur_med_history" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        Current
                                                                                        medications/ <span
                                                                                            class="text-primary">Thuốc
                                                                                            đang sử dụng:</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_cur_medication" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        2.
                                                                                        Antecedent Medical History/
                                                                                        <span class="text-primary">Tiền
                                                                                            sử bệnh:</span></label>
                                                    <div class="form-group">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        a.
                                                                                        Delivery/ <span
                                                                                            class="text-primary">Quá
                                                                                            trình sanh:</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_delivery" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        b.
                                                                                        Postnatal nutrition/ <span
                                                                                            class="text-primary">Chế độ
                                                                                            dinh dưỡng:</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_post_nutrition" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        3.
                                                                                        Maternal medical history/ <span
                                                                                            class="text-primary">Tiền sử
                                                                                            sản khoa:</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_mater_med_history" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        III.
                                                                                        Physical Examination/ <span
                                                                                            class="text-primary">Khám
                                                                                            bệnh:</span></label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label w-6 mb-1">
                                                        Cân
                                                                                        nặng hiện tại/ <span
                                                                                            class="text-primary">Weight:</span></label>
                                                    <div class="form-group w-4">
                                                        <input id="txt_exam_weight" runat="server" class="form-control text-right" />
                                                        <span class="append">Gr</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label w-6 mb-1">
                                                        Chiều
                                                                                        dài/ <span
                                                                                            class="text-primary">Length:</span></label>
                                                    <div class="form-group w-5">
                                                        <input id="txt_exam_length" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label w-6 mb-1">
                                                        Head
                                                                                        Circumference/ <span
                                                                                            class="text-primary">Vòng
                                                                                            đầu:</span></label>
                                                    <div class="form-group w-4">
                                                        <input id="txt_exam_head_circum" runat="server" class="form-control text-right" />
                                                        <span class="append">Cm</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label w-6 mb-1">
                                                        HR
                                                                                        (per minute)/ <span
                                                                                            class="text-primary">Mạch:</span></label>
                                                    <div class="form-group w-5">
                                                        <input id="txt_exam_hr" runat="server" class="form-control text-right" />
                                                        <span class="append">lần/phút</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label w-6 mb-1">
                                                        RR
                                                                                        (per minute)/ <span
                                                                                            class="text-primary">Nhịp
                                                                                            thở:</span></label>
                                                    <div class="form-group w-4">
                                                        <input id="txt_exam_rr" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_physical_exam" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        IV.
                                                                                        Laboratory indications and
                                                                                        results/ <span
                                                                                            class="text-primary">Chỉ
                                                                                            định và kết quả xét
                                                                                            nghiệm</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_laboratory" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        V.
                                                                                        Conclusion/ <span
                                                                                            class="text-primary">Kết
                                                                                            luận</span></label>
                                                    <%--<div class="form-group">
                                                                                        <aih:TextField runat="server"
                                                                                            ID="txt_initial_diagnosis" />
                                                                                </div>--%>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        Initial
                                                                                    diagnosis/ <span
                                                                                        class="text-primary">Chẩn đoán
                                                                                        ban đầu</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_initial_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        Differential
                                                                                    diagnosis/ <span
                                                                                        class="text-primary">Chẩn đoán
                                                                                        phân biệt</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_diff_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        Associated
                                                                                    conditions/ <span
                                                                                        class="text-primary">Bệnh kèm
                                                                                        theo</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_associated_conditions" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        VI.
                                                                                    Treatment Plan/ <span
                                                                                        class="text-primary">Kế hoạch
                                                                                        điều trị</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_treatment_plan" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">
                                                        VII.
                                                                                    Discharge plan/ <span
                                                                                        class="text-primary">Kế hoạch
                                                                                        xuất viện</span></label>
                                                    <div class="form-group">
                                                        <aih:TextField runat="server" ID="txt_discharge_plan" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-actions mb-3">
                                                <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                                <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                                <asp:Button ID="btnDeleteModal" data-toggle="modal" data-target="#deleteDocumentModal" OnClick="btnAmend_Click" class="btn btn-danger" runat="server" Text="Delete" />

                                                <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                                <asp:Button OnClientClick="window.print()" ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />

                                                <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                                            </div>

                                            <div class="modal fade" id="deleteDocumentModal" tabindex="-1" role="dialog" aria-labelledby="deleteDocumentModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="deleteDocumentModalLabel">Delete document</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span
                                                                    aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p runat="server">Please provide reason for deletion</p>
                                                            <div class="form-group mb-2">
                                                                <aih:TextField runat="server" ID="TextField1" />
                                                            </div>
                                                            <div class="text-danger" runat="server">
                                                                Nội dung lý do xóa phải trên 3 ký tự
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                            <asp:Button runat="server" Text="Delete" ID="btnDelete" class="btn btn-danger" OnClick="btnDelete_Click" />
                                                        </div>
                                                    </div>
                                                </div>

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
