<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniMedAssForNeoInp.aspx.cs" Inherits="EMR.IniMedAssForNeoInp"
    ValidateRequest="false" %>

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
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>
<%@ Register Src="~/icons/ArrowRepeat.ascx" TagPrefix="icon" TagName="ArrowRepeat" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
</head>

<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info">
                                        <img src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>BỆNH ÁN SƠ SINH NỘI TRÚ</h4>
                                            <h5>INITIAL MEDICAL ASSESSMENT FOR NEONATAL INPATIENTS</h5>
                                        </div>
                                        <div style="width: 175px;">
                                            <asp:Label runat="server" ID="prt_fullname" CssClass="d-block"></asp:Label>
                                            <asp:Label runat="server" ID="prt_dob" CssClass="d-block"></asp:Label>
                                            <webUI:Barcode runat="server" ID="prt_barcode" Width="120" Height="22" />
                                            <asp:Label runat="server" ID="prt_vpid" CssClass="d-block"></asp:Label>
                                        </div>
                                    </div>
                                    <webUI:Line runat="server" ID="Line" />
                                </th>
                            </tr>
                        </thead>

                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div class="main">
                                        <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">I. Lí do nhập viện:</label>
                                    <span class="text-primary" style="margin-left: 20px;">Admission reason</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="prt_admission_reason"></asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">II. Bệnh sử:</label>
                                    <span class="text-primary" style="margin-left: 25px;">Medical History</span>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">1. Bệnh sử hiện tại:</label>
                                    <span class="text-primary" style="margin-left: 30px;">Current Medical History:</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="prt_cur_med_history"></asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                 <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold; margin-left:20px">❖ Thuốc đang sử dụng: </label>
                                    <span class="text-primary" style="padding-left: 50px;">Current medications:</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="prt_cur_medication"></asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                 <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">2. Tiền sử bệnh: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Antecedent Medical History</span>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold; margin-left:20px">❖ Quá trình sanh: </label>
                                    <span class="text-primary" style="padding-left: 50px;">Delivery</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="prt_delivery"></asp:Label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold; margin-left:20px">❖ Chế độ dinh dưỡng: </label>
                                    <span class="text-primary" style="padding-left: 50px;">Postnatal nutrition</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="prt_post_nutrition"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">3. Tiền sử sản khoa: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Maternal medical history</span>
                                </div>
                                <div>
                                    <asp:Label runat="server" ID="prt_mater_med_history"></asp:Label>
                                </div>
                                
                            </div>

                            <div class="row mb-2">
                                <div class="col: col-auto">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">III. Khám bệnh: </label>
                                    <span class="text-primary" style="margin-left: 35px;">Physical Examination</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-4" style="margin-left: 10px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Cân nặng hiện tại (gr): </label>
                                    <span class="text-primary" style="margin-left: 25px;">Weight</span>
                                </div>
                                <div class="col-4">
                                    <asp:Label runat="server" ID="prt_exam_weight"> </asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 10px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Chiều dài (cm): </label>
                                    <span class="text-primary" style="margin-left: 25px;">Length</span>
                                </div>
                                <div class="col-4">
                                    <asp:Label runat="server" ID="prt_exam_length"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 10px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Vòng đầu (cm): </label>
                                    <span class="text-primary" style="margin-left: 25px;">Head Circumference</span>
                                </div>
                                <div class="col-4">
                                    <asp:Label runat="server" ID="prt_exam_head_circum"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 10px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Mạch (lần/phút): </label>
                                    <span class="text-primary" style="margin-left: 25px;">HR (per minute)</span>
                                </div>
                                <div class="col-4" >
                                    <asp:Label runat="server" ID="prt_exam_hr"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 10px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Nhịp thở/phút: </label>
                                    <span class="text-primary" style="margin-left: 25px;">RR (per minute)</span>
                                </div>
                                <div class="col-4" >
                                    <asp:Label  runat="server" ID="prt_exam_rr"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2"style="margin-left: 10px">
                                <div class="col-12">
                                    <asp:Label runat="server" ID="prt_physical_exam"></asp:Label>
                                </div>
                            </div>
                            
                            <div class="row mb-2">
                                <div class="col-12" >
                                    <label class="d-block mb-0 h4" style="font-weight: bold">IV. Chỉ định và kết quả xét nghiệm: </label>
                                    <span class="text-primary" style="margin-left: 30px;">Laboratory indications and results</span>
                                </div>
                                <div class="col-12"style="margin-left: 30px; text-align:justify" >
                                    <asp:Label  runat="server" ID="prt_laboratory"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" >
                                    <label class="d-block mb-0 h4" style="font-weight: bold">V. Kết luận: </label>
                                    <span class="text-primary" style="margin-left: 30px;">Conclusion</span>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 25px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Chẩn đoán ban đầu: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Initial diagnosis</span>
                                </div>
                                <div class="col-7" style=" text-align:justify">
                                    <asp:Label  runat="server" ID="prt_initial_diagnosis"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 25px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Chẩn đoán phân biệt: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Differential diagnosis</span>
                                </div>
                                <div class="col-7" style=" text-align:justify">
                                    <asp:Label  runat="server" ID="prt_diff_diagnosis"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 25px">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">● Bệnh kèm theo: </label>
                                    <span class="text-primary" style="margin-left: 25px;">Associated conditions</span>
                                </div>
                                <div class="col-7" style=" text-align:justify">
                                    <asp:Label  runat="server" ID="prt_associated_conditions"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">VI. Kế hoạch điều trị: </label>
                                    <span class="text-primary" style="margin-left: 30px;">Treatment Plan</span>
                                </div>
                                <div  class="col-12"style="margin-left: 30px;text-align:justify">
                                    <asp:Label  runat="server" ID="prt_treatment_plan"></asp:Label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12">
                                    <label class="d-block mb-0 h4" style="font-weight: bold">VII. Kế hoạch xuất viện: </label>
                                    <span class="text-primary" style="margin-left: 35px;">Discharge plan</span>
                                </div>
                                <div class="col-12" style="margin-left: 35px;text-align:justify" >
                                    <asp:Label  runat="server" ID="prt_discharge_plan"></asp:Label>
                                </div>
                            </div>
                            <br />

                            <div class="row mb-2">
                                <div class="col-5">
                                </div>
                                <div class="col-7 mb-2">
                                    <div class="col-12"style="text-align: center;">
                                        <label style="font-size:14.5px; font-family:Tahoma;" >Ngày/Date
                                            <asp:Label runat="server" id="lbl_date">
                                            </asp:Label>
                                        </label>
                                        <label style="font-size:14.5px; font-family:Tahoma;"> tháng/month
                                            <asp:Label runat="server" id="lbl_month">
                                            </asp:Label>
                                        </label>
                                        <label  style="font-size:14.5px; font-family:Tahoma;"> năm/year
                                            <asp:Label runat="server" id="lbl_year">
                                            </asp:Label>
                                        </label>
                                    </div>
                                    <div class="col-12" style="text-align: center;>
                                        <label class="d-block mb-0 h4" style="font-size:14.5px; font-family:Tahoma;font-weight:bold">Họ tên bác sĩ và mã số nhân viên/
                                            <span class="text-primary"style="font-size:14.5px">Doctor’s name and ID</span>
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
                                <td class="report-footer-cell" style="font-size: 10px">
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
                    <uc1:PatientInfo runat="server" ID="PatientInfo" />

                    <div class="row" >
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">INITIAL MEDICAL ASSESSMENT FOR NEONATAL INPATIENTS</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 h5">I. Admission reason/<span class="text-primary">Lí do nhập viện:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_admission_reason"></asp:Label>
                                                <div class="form-group" runat="server" id="admission_reason_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_admission_reason" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 h5"> II. Medical History/ <span class="text-primary">Bệnh sử:</span></label>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">1. Current Medical History/ <span class="text-primary">Bệnh sử hiện tại:</span></label>
                                                </div>
                                            <div class="col-md-12 gt-2-a mb-2">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_cur_med_history"></asp:Label>
                                                <div class="form-group" runat="server" id="cur_med_history_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_cur_med_history" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 gt-2-a mb-2">
                                                <label class="control-label mb-2"> Current medications/ <span class="text-primary">Thuốc đang sử dụng:</span></label>
                                                <asp:Label runat="server" ID="lbl_cur_medication"></asp:Label>
                                                <div class="form-group" runat="server" id="cur_medication_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_cur_medication" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1"> 2. Antecedent Medical History/ <span class="text-primary">Tiền sử bệnh:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a mb-2">
                                                <label class="control-label"> a. Delivery/ <span class="text-primary">Quá trình sanh:</span></label>
                                                <asp:Label runat="server" ID="lbl_delivery"></asp:Label>
                                                <div class="form-group" runat="server" id="delivery_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_delivery" />
                                                </div>
                                            </div>
                                            <div class="col-md-12 gt-2-a mb-2">
                                                <label class="control-label">b. Postnatal nutrition/ <span class="text-primary">Chế độ dinh dưỡng:</span></label>
                                                <asp:Label runat="server" ID="lbl_post_nutrition"></asp:Label>
                                                <div class="form-group" runat="server" id="post_nutrition_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_post_nutrition" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">3. Maternal medical history/ <span class="text-primary">Tiền sử sản khoa:</span></label>
                                                </div>
                                            <div class="col-md-12 gt-2-a mb-2">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_mater_med_history"></asp:Label>
                                                <div class="form-group" runat="server" id="mater_med_history_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_mater_med_history" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 h5">III. Physical Examination/ <span class="text-primary">Khám bệnh:</span></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 mb-2 gt-2-a">
                                                <label class="control-label mb-1">Cân nặng hiện tại/ <span class="text-primary">Weight:</span></label>
                                                <asp:Label runat="server" ID="lbl_exam_weight"></asp:Label>
                                                <div class="form-group w-5" runat="server" id="exam_weight_wrapper">
                                                    <input id="txt_exam_weight" data-type="number" runat="server" class="form-control text-right" />
                                                    <span class="append">Gr</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 mb-2 gt-2-a">
                                                <label class="control-label w-6 mb-1">Chiều dài/ <span class="text-primary">Length:</span></label>
                                                <asp:Label runat="server" ID="lbl_exam_length"></asp:Label>
                                                <div class="form-group w-5" runat="server" id="exam_length_wrapper">
                                                    <input id="txt_exam_length" data-type="number" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label class="control-label mb-1">Head Circumference/ <span class="text-primary">Vòng đầu:</span></label>
                                                <asp:Label runat="server" ID="lbl_exam_head_circum"></asp:Label>
                                                <div class="form-group w-5" runat="server" id="exam_head_circum_wrapper">
                                                    <input id="txt_exam_head_circum" data-type="number" runat="server" class="form-control text-right" />
                                                    <span class="append">Cm</span>
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label class="control-label mb-1">HR (per minute)/ <span class="text-primary">Mạch:</span></label>
                                                <asp:Label runat="server" ID="lbl_exam_hr"></asp:Label>
                                                <div class="form-group w-5" runat="server" id="exam_hr_wrapper">
                                                    <input id="txt_exam_hr" data-type="number" runat="server" class="form-control text-right" />
                                                    <span class="append">lần/phút</span>
                                                </div>
                                            </div>
                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label class="control-label mb-1">RR (per minute)/ <span class="text-primary">Nhịp thở:</span></label>
                                                <asp:Label runat="server" ID="lbl_exam_rr"></asp:Label>
                                                <div class="form-group w-5" runat="server" id="exam_rr_wrapper">
                                                    <input id="txt_exam_rr" data-type="number" runat="server" class="form-control text-right" />
                                                    <span class="append">/phút</span>
                                                </div>
                                            </div>
                                            <div class="col-md-12 gt-2-a mb-2">
                                                <label class="control-label"></label>
                                                <asp:Label runat="server" ID="lbl_physical_exam"></asp:Label>
                                                <div class="form-group" runat="server" id="physical_exam_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_physical_exam" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 h5">IV. Laboratory indications and results/ <span class="text-primary">Chỉ định và kết quả xét nghiệm</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label class="control-label"></label>
                                                <asp:Label runat="server" ID="lbl_laboratory"></asp:Label>
                                                <div class="form-group" runat="server" id="laboratory_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_laboratory" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 h5">V. Conclusion/ <span class="text-primary">Kết luận</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 gt-2-a">
                                                <label class="control-label mb-2">Initial diagnosis/ <span class="text-primary">Chẩn đoán ban đầu</span></label>
                                                <asp:Label runat="server" ID="lbl_initial_diagnosis"></asp:Label>
                                                <div class="form-group" runat="server" id="initial_diagnosis_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12 gt-2-a">
                                                <label class="control-label mb-2">Differential diagnosis/ <span class="text-primary">Chẩn đoán phân biệt</span></label>
                                                <asp:Label runat="server" ID="lbl_diff_diagnosis"></asp:Label>
                                                <div class="form-group" runat="server" id="diff_diagnosis_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_diff_diagnosis" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12 gt-2-a">
                                                <label class="control-label mb-2">Associated conditions/ <span class="text-primary">Bệnh kèm theo</span></label>
                                                <asp:Label runat="server" ID="lbl_associated_conditions"></asp:Label>
                                                <div class="form-group" runat="server" id="associated_conditions_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 h5">VI. Treatment Plan/ <span class="text-primary">Kế hoạch điều trị</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_treatment_plan"></asp:Label>
                                                <div class="form-group" runat="server" id="treatment_plan_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_treatment_plan" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 h5">VII. Discharge plan/ <span class="text-primary">Kế hoạch xuất viện</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_discharge_plan"></asp:Label>
                                                <div class="form-group" runat="server" id="discharge_plan_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_discharge_plan" />
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
                                    <webUI:PopupShowDelay runat="server" ID="PopupShowDelay" />
                                        
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
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>
    <script type="text/javascript">

        formGroup_init();

        checkboxRadiobutton_init();
        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            formGroup_init();
            InputFilter();
        }

    </script>
</body>
</html>