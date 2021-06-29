<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurgicalReport.aspx.cs" ValidateRequest="false" Inherits="EMR.IPD.SurgicalReport" %>

<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>

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
                                    <div class="header-info" style="display: flex; align-items: center;">
                                        <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                                        <div style="flex-grow: 1; text-align: center;">
                                            <div style="color: #007297; font-size: 26.6667px; font-weight: bold; font-family: Tahoma">TƯỜNG TRÌNH PHẪU THUẬT</div>
                                            <div style="color: #e20e5a; font-size: 16.6667px; font-family: Tahoma;">SURGICAL REPORT</div>
                                        </div>
                                        <div style="width: 200px; text-align: center">
                                            <WebUI:Barcode runat="server" ID="prt_barcode" Text="900000488" Width="200" Height="40" />
                                            <label runat="server" style="font-size: 14.5px; font-family: Tahoma;" id="prt_pid"></label>
                                        </div>
                                    </div>
                                    <div style="margin-bottom: 20px;">
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

                                        <div class="row mb-2">
                                            <div class="col-5">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">1. Họ tên bệnh nhân:</label>
                                                <span class="text-primary" style="margin-left: 14.5px;">Patient's name</span>
                                            </div>
                                            <div class="col-7">
                                                <div class="flex-grow-1">
                                                    <label class="control-label text-sm-right" style="font-size: 14.5px;" runat="server" id="prt_FullName"></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-5">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">2. Ngày nhập viện:</label>
                                                <span class="text-primary" style="margin-left: 14.5px">Admission Date</span>
                                            </div>
                                            <div class="col-7">
                                                <label class="control-label text-sm-right" style="font-size: 14.5px;" runat="server" id="prt_admission_date"></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-5">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">3. Ngày phẫu thuật:</label>
                                                <span class="text-primary" style="margin-left: 14.5px">Procedure Date</span>
                                            </div>
                                            <div class="col-7">
                                                <label class="control-label text-sm-right" runat="server" style="font-size: 14.5px;" id="prt_procedure_date"></label>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-5" style="margin-left: 10px">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <label class="d-block mb-0 h4" style="margin-left: 25px; font-size: 14.5px; font-family: Tahoma; font-weight: bold">Giờ bắt đầu:</label>
                                                        <span class="text-primary" style="margin-left: 30px">Start time:</span>
                                                    </div>
                                                    <div class="col-6">
                                                        <label class="control-label text-sm-right" runat="server" style="font-size: 14.5px;" id="prt_start_time"></label>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col-6" style="margin-left: -10px">
                                                <div class="row">
                                                    <div class="col-5">
                                                        <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">Giờ kết thúc:</label>
                                                        <span class="text-primary" style="margin-left: 5px; font-size: 14.5px">Finish time</span>
                                                    </div>
                                                    <div class="col-7">
                                                        <label class="control-label text-sm-right" style="font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_finish_time"></label>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-4">
                                                <label class="d-block h4" style="font-size: 14.5px; font-family: Tahoma; margin-bottom: 0px; padding-bottom: 0px; font-weight: bold">4. Chẩn đoán trước phẫu thuật:</label>
                                                <span class="text-primary" style="margin-left: 25px; margin-top: 0px; padding-top: 0px; font-size: 14.5px;">Preoperative diagnosis</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_preo_diagnosis"></label>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-4" style="padding-right: 0px; margin-right: 0px">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">5. Chẩn đoán sau phẫu thuật:</label>
                                                <span class="text-primary" style="margin-left: 25px; font-size: 14.5px;">Postoperative diagnosis</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_post_diagnosis"></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-4">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">6. Phương pháp phẫu thuật:</label>
                                                <span class="text-primary" style="margin-left: 25px; font-size: 14.5px">Procedure</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_name_procedure"></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-4">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">7. Phương pháp vô cảm:</label>
                                                <span class="text-primary" style="margin-left: 25px; font-size: 14.5px">Anesthesia</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_anesthesia"></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-4">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">8. Bác sĩ phẫu thuật:</label>
                                                <span class="text-primary" style="margin-left: 25px; font-size: 14.5px">Surgeon</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_surgeon"></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-4">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">9. Phụ mổ:</label>
                                                <span class="text-primary" style="margin-left: 25px; font-size: 14.5px">Assistant surgeon</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_assistant_surgeon"></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-4">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">10. Bác sĩ gây mê:</label>
                                                <span class="text-primary" style="margin-left: 40px; font-size: 14.5px">Anesthesiologist</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_anesthesiologist"></label>
                                            </div>

                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-4">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">11. Điều dưỡng gây mê:</label>
                                                <span class="text-primary" style="margin-left: 40px; font-size: 14.5px">Anesthetic nurse</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_anesthetic_nurse"></label>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-4">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">12. Điều dưỡng vòng trong:</label>
                                                <span class="text-primary" style="margin-left: 40px; font-size: 14.5px">Scrub nurse</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_scrub_nurse"></label>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-4">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">13. Điều dưỡng vòng ngoài:</label>
                                                <span class="text-primary" style="margin-left: 40px; font-size: 14.5px">Circulating nurse</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_circulating_nurse"></label>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-4">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">14. Ước lượng lượng máu mất:</label>
                                                <span class="text-primary" style="margin-left: 40px; font-size: 14.5px">Estimated bloodloss</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_estimated_bloodloss"></label>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-4">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">15. Giải phẫu bệnh:</label>
                                                <span class="text-primary" style="margin-left: 40px; font-size: 14.5px">Biopsy pathology</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_biopsy_pathology"></label>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-4">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">16. Biến chứng:</label>
                                                <span class="text-primary" style="margin-left: 40px; font-size: 14.5px">Complications</span>
                                            </div>
                                            <div class="col-8">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_complications"></label>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-12" style="text-align: center">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">LƯỢC ĐỒ PHẪU THUẬT</label>
                                                <span class="text-primary">PROCEDURE CHART</span>

                                            </div>
                                            <div class="col-12">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_procedure_chart"></label>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-12" style="text-align: center">
                                                <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma; font-weight: bold">TƯỜNG TRÌNH PHẪU THUẬT</label>
                                                <span class="text-primary" style="font-size: 14.5px">PROCEDURE NARRATIVE</span>
                                            </div>
                                            <div class="col-12">
                                                <label class="control-label " style="text-align: justify; font-size: 14.5px; font-family: Tahoma" runat="server" id="prt_procedure_narrative"></label>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row mb-2">
                                            <div class="col-6">
                                            </div>
                                            <div class="col-6 mb-2">
                                                <div class="col-12" style="text-align: center;">
                                                    <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma;">
                                                        Ngày/
                                            <span class="text-primary" style="font-size: 14.5px">Date:</span>
                                                        <label runat="server" id="lbl_submited_date"></label>
                                                    </label>
                                                </div>
                                                <div class="col-12" style="text-align: center;">
                                                    <label class="d-block mb-0 h4" style="font-size: 14.5px; font-family: Tahoma;">Dictated by/<span class="text-primary" style="font-size: 14.5px">(Name,Signature):</span></label>
                                                </div>
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <div class="col-12" style="text-align: center;">
                                                    <label class="control-label " style="font-size: 14.5px; font-family: Tahoma;" runat="server" id="lbl_caregiver_name_l"></label>
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

                    <uc1:PatientInfo runat="server" ID="PatientInfo1" />

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">SURGICAL REPORT</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                </div>
                                <div class="card-body">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">3. Ngày phẫu thuật/ <span class="text-primary">Procedure Date:</span></label>
                                            </div>
                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_procedure_date"></asp:Label>
                                                <div runat="server" id="procedure_date_wrapper">
                                                    <telerik:RadDatePicker ID="dpk_procedure_date" runat="server"></telerik:RadDatePicker>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <div>
                                                        <label class="control-label mb-1">Giờ bắt đầu/ <span class="text-primary">Procedure Date:</span></label>
                                                        <asp:Label runat="server" ID="lbl_start_time"></asp:Label>

                                                        <div class="form-group d-inline-block" runat="server" id="start_time_wrapper">
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txt_start_time"></asp:TextBox>
                                                        </div>

                                                        <label class="control-label mb-1">Giờ kết thúc/ <span class="text-primary">Finish time:</span></label>
                                                        <asp:Label runat="server" ID="lbl_finish_time"></asp:Label>

                                                        <div class="form-group  d-inline-block" runat="server" id="finish_time_wrapper">
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txt_finish_time"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">4. Chẩn đoán trước phẫu thuật/ <span class="text-primary">Preoperative diagnosis:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_preo_diagnosis"></asp:Label>
                                                <div class="form-group" runat="server" id="preo_diagnosis_wrapper">
                                                    <webUI:TextField runat="server" id="txt_preo_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">5. Chẩn đoán sau phẫu thuật/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_post_diagnosis"></asp:Label>
                                                <div class="form-group" runat="server" id="post_diagnosis_wrapper">
                                                    <webUI:TextField runat="server" id="txt_post_diagnosis" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">6. Phương pháp phẫu thuật/ <span class="text-primary">Procedure:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_name_procedure"></asp:Label>
                                                <div class="form-group" runat="server" id="name_procedure_wrapper">
                                                    <webUI:TextField runat="server" id="txt_name_procedure" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">7. Phương pháp vô cảm/ <span class="text-primary">Type of Anesthesia:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_anesthesia"></asp:Label>
                                                <div class="form-group" runat="server" id="anesthesia_wrapper">
                                                    <webUI:TextField runat="server" id="txt_anesthesia" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">8. Bác sĩ phẫu thuật/ <span class="text-primary">Surgeon:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_surgeon"></asp:Label>
                                                <div class="form-group" runat="server" id="surgeon_wrapper">
                                                    <webUI:TextField runat="server" id="txt_surgeon" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">9. Phụ mổ/ <span class="text-primary">Assistant surgeon:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_assistant_surgeon"></asp:Label>
                                                <div class="form-group" runat="server" id="assistant_surgeon_wrapper">
                                                    <webUI:TextField runat="server" id="txt_assistant_surgeon" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">10. Bác sĩ gây mê hồi sức/ <span class="text-primary">Anesthesiologist:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_anesthesiologist"></asp:Label>
                                                <div class="form-group" runat="server" id="anesthesiologist_wrapper">
                                                    <webUI:TextField runat="server" id="txt_anesthesiologist" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">11. Điều dưỡng gây mê/ <span class="text-primary">Anesthetic nurse:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_anesthetic_nurse"></asp:Label>
                                                <div class="form-group" runat="server" id="anesthetic_nurse_wrapper">
                                                    <webUI:TextField runat="server" id="txt_anesthetic_nurse" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">12. Điều dưỡng vòng trong/ <span class="text-primary">Scrub nurse:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_scrub_nurse"></asp:Label>
                                                <div class="form-group" runat="server" id="scrub_nurse_wrapper">
                                                    <webUI:TextField runat="server" id="txt_scrub_nurse" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">13. Điều dưỡng vòng ngoài/ <span class="text-primary">Circulating nurse:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_circulating_nurse"></asp:Label>
                                                <div class="form-group" runat="server" id="circulating_nurse_wrapper">
                                                    <webUI:TextField runat="server" id="txt_circulating_nurse" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">14. Ước lượng lượng máu mất/ <span class="text-primary">Estimated bloodloss:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_estimated_bloodloss"></asp:Label>
                                                <div class="form-group" runat="server" id="estimated_bloodloss_wrapper">
                                                    <webUI:TextField runat="server" id="txt_estimated_bloodloss" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">15. Giải phẫu bệnh/ <span class="text-primary">Biopsy pathology:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_biopsy_pathology"></asp:Label>
                                                <div class="form-group" runat="server" id="biopsy_pathology_wrapper">
                                                    <webUI:TextField runat="server" id="txt_biopsy_pathology" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">16. Biến chứng/ <span class="text-primary">Complications:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_complications"></asp:Label>
                                                <div class="form-group" runat="server" id="complications_wrapper">
                                                    <webUI:TextField runat="server" id="txt_complications" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">LƯỢC ĐỒ PHẪU THUẬT/ <span class="text-primary">PROCEDURECHART</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_procedure_chart"></asp:Label>
                                                <div class="form-group" runat="server" id="procedure_chart_wrapper">
                                                    <webUI:TextField runat="server" id="txt_procedure_chart" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">TƯỜNG TRÌNH PHẪU THUẬT/ <span class="text-primary">PROCEDURE NARRATIVE</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_procedure_narrative"></asp:Label>
                                                <div class="form-group" runat="server" id="procedure_narrative_wrapper">
                                                    <webUI:TextField runat="server" id="txt_procedure_narrative" />
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

                                        <WebUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
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
                                        </WebUI:PopupModal>

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

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
        }

    </script>
</body>
</html>
