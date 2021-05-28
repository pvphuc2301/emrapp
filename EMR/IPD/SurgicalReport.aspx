<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurgicalReport.aspx.cs" Inherits="EMR.SurgicalReport" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
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
                                <div style="color: #007297; font-size: 26.6667px;">TƯỜNG TRÌNH PHẪU THUẬT</div>
                                <div style="color: #e20e5a; font-size: 16.6667px;">SURGICAL REPORT</div>
                            </div>
                            <div style="width: 200px; text-align: center">
                                <webUI:Barcode runat="server" ID="Barcode" Text="900000488" Width="200" Height="40" />
                                <label runat="server" style="font-size:20px; " id="lbl_pid"></label>
                            </div>
                        </div>
                        <div style="margin-bottom: 80px;">
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
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT" />
                                </div>
                            </div>

                            <%-- <div class="row mb-2">
                                <div class="col-6">
                                    <webUI:Label runat="server" Title="Họ tên bệnh nhân:" SubTitle="Patient's name" />
                                    <div class="d-inline-block ml-2 align-top">MAI MAI MÃI1</div>
                                </div>
                                <div class="col-6">
                                    <webUI:Label runat="server" Title="Ngày sinh:" SubTitle="DOB" />
                                    <div class="d-inline-block ml-2 align-top">05-10-1960</div>
                                </div>
                            </div>--%>

                            <%-- <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Giới tính:" SubTitle="Gender" />
                                    <webUI:Label runat="server" Title="Nam" SubTitle="Male" />
                                    <webUI:Label runat="server" Title="Nữ " SubTitle="Female" />
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-6">
                                    <webUI:Label runat="server" Title="Khoa:" SubTitle="Dept" />
                                    <div class="d-inline-block ml-2 align-top">Khoa khám bệnh</div>
                                </div>
                                <div class="col-6">
                                    <webUI:Label runat="server" Title="Mã BN:" SubTitle="Patient ID" />
                                    <label class="control-label text-sm-right" runat="server" id="lbl_pid"></label>
                            </div>--%>

                            <%--<div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau:" SubTitle="Visited and received treatment at our hospital, with the following information" />
                                    <div class="d-inline-block ml-2 align-top"></div>
                                </div>
                            </div>--%>

                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4" style="font-size:20px; font-family:Tahoma; font-weight:bold" >1. Họ tên bệnh nhân:</label>
                                    <span class="text-primary" style="margin-left: 20px; " >Patient's name</span>
                                </div>
                                <div class="col-8">
                                    <div class="flex-grow-1">
                                        <label class="control-label text-sm-right" style="font-size:20px; " runat="server" id="lbl_FullName"></label>
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">2. Ngày nhập viện:</label>
                                    <span class="text-primary" style="margin-left: 20px">Admission Date</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label text-sm-right" style="font-size:20px; " runat="server" id="lbl_admission_date"></label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">3. Ngày phẫu thuật:</label>
                                    <span class="text-primary" style="margin-left: 20px">Procedure Date</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label text-sm-right" runat="server" style="font-size:20px; " id="lbl_procedure_date"></label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4" style="margin-left: 10px">
                                    <div class="row">
                                        <div class="col-8">
                                            <label class="d-block mb-0 h4" style="margin-left: 25px;font-size:20px; font-family:Tahoma; font-weight:bold">Giờ bắt đầu:</label>
                                            <span class="text-primary" style="margin-left: 30px">Procedure Date</span>
                                        </div>
                                        <div class="col-4">
                                            <label class="control-label text-sm-right" runat="server" style="font-size:20px; " id="lbl_start_time"></label>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-4" style="margin-left: -10px">
                                    <div class="row">
                                        <div class="col-8">
                                            <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">Giờ kết thúc:</label>
                                            <span class="text-primary" style="margin-left: 5px">Finish time</span>
                                        </div>
                                        <div class="col-4">
                                            <label class="control-label text-sm-right" style="font-size:20px; font-family:Tahoma" runat="server" id="lbl_finish_time"></label>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">4. Chẩn đoán trước phẫu thuật:</label>
                                    <span class="text-primary" style="margin-left: 25px">Preoperative diagnosis</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_preo_diagnosis"></label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">5. Chẩn đoán sau phẫu thuật:</label>
                                    <span class="text-primary" style="margin-left: 25px">Postoperative diagnosis</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_post_diagnosis"></label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">6. Phương pháp phẫu thuật:</label>
                                    <span class="text-primary" style="margin-left: 25px">Procedure</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_name_procedure"></label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">7. Phương pháp vô cảm:</label>
                                    <span class="text-primary" style="margin-left: 25px">Anesthesia</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_anesthesia"></label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">8. Bác sĩ phẫu thuật:</label>
                                    <span class="text-primary" style="margin-left: 25px">Anesthesia</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_surgeon"></label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">9. Phụ mổ:</label>
                                    <span class="text-primary" style="margin-left: 25px">Assistant surgeon</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_assistant_surgeon"></label>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">10. Bác sĩ gây mê:</label>
                                    <span class="text-primary" style="margin-left: 40px">Anesthesiologist</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_anesthesiologist"></label>
                                </div>

                            </div>
                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">11. Điều dưỡng gây mê:</label>
                                    <span class="text-primary" style="margin-left: 40px">Anesthetic nurse</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_anesthetic_nurse"></label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">12. Điều dưỡng vòng trong:</label>
                                    <span class="text-primary" style="margin-left: 40px">Scrub nurse</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_scrub_nurse"></label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">13. Điều dưỡng vòng ngoài:</label>
                                    <span class="text-primary" style="margin-left: 40px">Circulating nurse</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_circulating_nurse"></label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">14. Ước lượng lượng máu mất:</label>
                                    <span class="text-primary" style="margin-left: 40px">Estimated bloodloss</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_estimated_bloodloss"></label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">15. Giải phẫu bệnh:</label>
                                    <span class="text-primary" style="margin-left: 40px">Biopsy pathology</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_biopsy_pathology"></label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-4">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">16. Biến chứng:</label>
                                    <span class="text-primary" style="margin-left: 40px">Complications</span>
                                </div>
                                <div class="col-8">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_complications"></label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12" style="text-align: center">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">LƯỢC ĐỒ PHẪU THUẬT</label>
                                    <span class="text-primary" >PROCEDURE CHART</span>
                                    
                                </div>
                                <div class="col-12">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_procedure_chart"></label>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-12" style="text-align: center">
                                    <label class="d-block mb-0 h4"style="font-size:20px; font-family:Tahoma; font-weight:bold">TƯỜNG TRÌNH PHẪU THUẬT</label>
                                    <span class="text-primary" >PROCEDURE NARRATIVE</span>
                                </div>
                                <div class="col-12">
                                    <label class="control-label " style="text-align: justify;font-size:20px; font-family:Tahoma" runat="server" id="lbl_procedure_narrative"></label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-7">
                                </div>
                                <div class="col-5 mb-2">
                                    <div class="col-12">
                                        <label class="d-block mb-0 h4" style="margin-left:70px;font-size:20px; font-family:Tahoma;">Ngày/
                                            <span class="text-primary">Date:</span> <label runat="server" id="lbl_submited_date"></label>

                                        </label>
                                    </div>
                                    <div class="col-12">
                                        <label class="d-block mb-0 h4" style="margin-left:50px;font-size:20px; font-family:Tahoma;">Dictated by/<span class="text-primary">(Name,Signature):</span></label>
                                    </div>
                                    <div class="col-12"style="margin-left:140px; ">
                                        <label class="control-label " style="text-align: justify; margin-top:50px;font-size:20px; font-family:Tahoma;" runat="server" id="lbl_caregiver_name_l"></label>
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
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">SURGICAL REPORT</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                    </div>
                                    <div class="card-body">
                                        <form action="#" class="form-horizontal form-bordered">
                                            <div class="form-body">

                                                <div class="row">
                                                    <div class="col-sm-6 col-md-4 mb-2">
                                                        <label class="control-label mb-1 font-bold">3. Ngày phẫu thuật/ <span class="text-primary">Procedure Date:</span></label>

                                                        <div class="form-group">
                                                            <telerik:RadDatePicker RenderMode="Classic" ID="rad_procedure_date" runat="server"></telerik:RadDatePicker>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6 col-md-4 mb-2">
                                                        <label class="control-label mb-1">Giờ bắt đầu/ <span class="text-primary">Procedure Date:</span></label>
                                                        <div class="form-group">
                                                            <telerik:RadTimePicker RenderMode="Classic" Width="218px" ID="rad_start_time" runat="server">
                                                            </telerik:RadTimePicker>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6 col-md-4 mb-2">
                                                        <label class="control-label mb-1">Giờ kết thúc/ <span class="text-primary">Finish time:</span></label>
                                                        <div class="form-group">
                                                            <telerik:RadTimePicker RenderMode="Classic" Width="218px" ID="rad_finish_time" runat="server">
                                                            </telerik:RadTimePicker>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">4. Chẩn đoán trước phẫu thuật/ <span class="text-primary">Preoperative diagnosis:</span></label>
                                                            <aih:TextField runat="server" id="txt_preo_diagnosis" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">5. Chẩn đoán sau phẫu thuật/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                                            <aih:TextField runat="server" id="txt_post_diagnosis" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">6. Phương pháp phẫu thuật/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                                            <aih:TextField runat="server" id="txt_name_procedure" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">7. Phương pháp vô cảm/ <span class="text-primary">Type of Anesthesia:</span></label>
                                                            <aih:TextField runat="server" id="txt_anesthesia" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">8. Bác sĩ phẫu thuật/ <span class="text-primary">Surgeon:</span></label>
                                                            <aih:TextField runat="server" id="txt_surgeon" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">9. Phụ mổ/ <span class="text-primary">Assistant surgeon:</span></label>
                                                            <aih:TextField runat="server" id="txt_assistant_surgeon" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">10. Bác sĩ gây mê hồi sức/ <span class="text-primary">Anesthesiologist:</span></label>
                                                            <aih:TextField runat="server" id="txt_anesthesiologist" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">11. Điều dưỡng gây mê/ <span class="text-primary">Anesthetic nurse:</span></label>
                                                            <aih:TextField runat="server" id="txt_anesthetic_nurse" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">12. Điều dưỡng vòng trong/ <span class="text-primary">Scrub nurse:</span></label>
                                                            <aih:TextField runat="server" id="txt_scrub_nurse" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">13. Điều dưỡng vòng ngoài/ <span class="text-primary">Circulating nurse:</span></label>
                                                            <aih:TextField runat="server" id="txt_circulating_nurse" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">14. Ước lượng lượng máu mất/ <span class="text-primary">Estimated bloodloss:</span></label>
                                                            <aih:TextField runat="server" id="txt_estimated_bloodloss" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">15. Giải phẫu bệnh/ <span class="text-primary">Biopsy pathology:</span></label>
                                                            <aih:TextField runat="server" id="txt_biopsy_pathology" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <label class="control-label mb-1 font-bold">16. Biến chứng/ <span class="text-primary">Complications:</span></label>
                                                            <aih:TextField runat="server" id="txt_complications" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1 font-bold">LƯỢC ĐỒ PHẪU THUẬT/ <span class="text-primary">PROCEDURECHART</span></label>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <aih:TextField runat="server" id="txt_procedure_chart" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1 font-bold">TƯỜNG TRÌNH PHẪU THUẬT/ <span class="text-primary">PROCEDURE NARRATIVE</span></label>
                                                    </div>
                                                    <div class="col-md-12 mb-2">
                                                        <div class="form-group">
                                                            <aih:TextField runat="server" id="txt_procedure_narrative" />

                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- End Hospitalisation required -->

                                                <div class="form-actions mb-3">
                                                    <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />
                                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />
                                                    <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                    <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                    <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" OnClientClick="window.print()" Text="Print" />
                                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                                    <div runat="server" id="messagePlaceHolder"></div>
                                                </div>

                                                <div id="myModal" class="modal fade" role="dialog">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Delete document</h4>
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p runat="server">Please provide reason for deletion</p>
                                                                <div class="form-group mb-2">
                                                                    <aih:TextField runat="server" ID="TextField17" />
                                                                </div>
                                                                <div class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                <asp:Button runat="server" OnClick="btnDelete_Click" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </form>
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

