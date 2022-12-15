<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MedicalCertificate.aspx.cs" Inherits="EMR.MedicalCertificate" ValidateRequest="false" %>

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
<%@ Register Src="~/UserControls/UserControlPatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Medical Certificate</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <%--<link href="../styles/print.css" rel="stylesheet" />--%>
    <%--<link href="../styles/print-v1.css" rel="stylesheet" />--%>
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <style>
        .TelerikModalOverlay {
            opacity: 0 !important;
            background-color: unset;
        }
        .RadWindow_Bootstrap {
            border: 1px solid #597189 !important;
            border-radius: 0 !important;
        }
        @page {
            margin-top: 10px;
        }
        .cursor-wait {
            pointer-events: none;
            background-color: #007bff;
            border-color: #007bff;
            opacity: .65;
        }
        #print_content {
		    line-height: initial !important;
	    }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <%-- Print page --%>
        <asp:UpdatePanel runat="server" ID="uplPrintPage">
            <ContentTemplate>
                <%-- Update 08/10/2022 --%>
                <div class="cssclsNoScreen" id="print_page" runat="server">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div runat="server" id="print_header">
                                        <div style="display: flex; align-items: center; padding: 0 18px">
                                            <img style="width: 180px" src="../images/AIH_PI_FULL.png" />
                                            <div style="text-align: center; align-self: center; flex-grow: 1">
                                                <div><span style="font-size: 12pt; font-weight: bold">GIẤY CHỨNG NHẬN ĐIỀU TRỊ</span></div>
                                                <div class="en"><i style="font-size: 11pt; font-weight: bold">MEDICAL CERTIFICATE</i></div>
                                            </div>
                                            <div style="width: 150px; text-align: center; font-size: 11px">
                                                <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
                                                <asp:Label runat="server" ID="prt_vpid" CssClass="d-block font-bold"></asp:Label>
                                            </div>
                                        </div>
                                        <div style="height: 12px; position: relative; margin-top: -4px">
                                            <span style="position:absolute; left: 0; top: 50%; width: 190px; border: 2px solid #e20e5a; display: inline-block;"></span>
                                            <span style="position:absolute; left: 190px; top: 50%; right: 0; border: 2px solid #007297; display: inline-block;"></span>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <%-- Update 08/10/2022 --%>
                                    <div class="main" runat="server" id="print_content">
                                        <div><span style="font-weight: bold">BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN</span></div>
                                        <div class="en" style="margin-bottom: 6px;">AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT</div>
                                        
                                        <div style="display: grid; grid-template-columns: 2fr 1fr; margin-bottom: 6px;">
                                            <div style="display: grid; grid-template-columns: 155px 1fr">
                                                <div>
                                                    <div><span style="font-weight: bold">Họ tên bệnh nhân: </span></div>
                                                    <div class="en"><i>Patient's Name</i></div>
                                                </div>
                                                <div>
                                                    <asp:Label runat="server" ID="prt_patient_name_l" />
                                                    <asp:Label runat="server" ID="prt_patient_name_e" />
                                                </div>
                                            </div>

                                            <div style="display: grid; grid-template-columns: 95px 1fr">
                                                <div>
                                                    <div><span style="font-weight: bold">Ngày sinh: </span></div>
                                                    <div class="en"><i>DOB</i></div>
                                                </div>
                                                <asp:Label runat="server" ID="prt_dob" />
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 155px 1fr; margin-bottom: 6px;">
                                            <div>
                                                <div><span style="font-weight: bold">Giới tính: </span></div>
                                                <div class="en"><i>Gender</i></div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: 1fr 1fr; width: 300px">
                                                <div style='display: grid; grid-template-columns: auto 1fr;'>
                                                    <asp:Label runat="server" ID="prt_male" Text="❏"></asp:Label>
                                                    <div>
                                                        <div>&nbsp;Nam</div>
                                                        <div class="en"><i>&nbsp;Male</i></div>
                                                    </div>
                                                </div>
                                                <div style='display: grid; grid-template-columns: auto 1fr;'>
                                                    <asp:Label runat="server" ID="prt_female" Text="❏"></asp:Label>
                                                    <div>
                                                        <div>&nbsp;Nữ</div>
                                                        <div class="en"><i>&nbsp;Female</i></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 2fr 1fr; margin-bottom: 6px;">
                                            <div style="display: grid; grid-template-columns: 155px 1fr">
                                                <div>
                                                    <div><span style="font-weight: bold">Khoa:</span></div>
                                                    <div class="en"><i>Dept</i></div>
                                                </div>
                                                <%--<webUI:PrtRowS1 FontBold="true" FixedWidth="155" Title="" SubTitle="" runat="server" Value="Khoa khám bệnh" />--%>
                                                <asp:Label runat="server" ID="prt_dept" Text="Khoa khám bệnh" />
                                            </div>
                                            <div style="display: grid; grid-template-columns: 95px 1fr">
                                                <div>
                                                    <div><span style="font-weight: bold">Mã BN:</span></div>
                                                    <div class="en"><i>Patient ID</i></div>
                                                </div>
                                                <asp:Label runat="server" ID="prt_pid" />
                                            </div>
                                        </div>

                                        <div style="">
                                            <div>
                                                <div><span style="font-weight: bold">Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau:</span></div>
                                                <div class="en"><i>Visited and received treatment at our hospital, with the following information</i></div>
                                            </div>
                                        </div>

                                        <div style="display: grid; grid-template-columns: 215px 1fr; grid-gap: 5px; ">
                                            <div>
                                                <div><span style="font-weight: bold">Ngày khám bệnh:</span></div>
                                                <div class="en"><i>Date of visit</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_date_of_visit" />
                                        </div>

                                        <div style="display: grid; grid-template-columns: 215px 1fr; grid-gap: 5px; ">
                                            <div>
                                                <div><span style="font-weight: bold">Lý do đến khám:</span></div>
                                                <div class="en"><i>Chief complaint</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_chief_complain" />
                                        </div>

                                        <div style="display: grid; grid-template-columns: 215px 1fr; grid-gap: 5px; ">
                                            <div>
                                                <div><span style="font-weight: bold">Tóm tắt bệnh sử:</span></div>
                                                <div class="en"><i>History of present illness</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_history_present_illness" />
                                        </div>

                                        <div style="display: grid; grid-template-columns: 215px 1fr; grid-gap: 5px; ">
                                            <div>
                                                <div><span style="font-weight: bold">Tiền sử bệnh: </span></div>
                                                <div class="en"><i>Past history</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_past_history" />
                                        </div>

                                        <div style="display: grid; grid-template-columns: 215px 1fr; grid-gap: 5px; ">
                                            <div>
                                                <div><span style="font-weight: bold">Đặc điểm lâm sàng: </span></div>
                                                <div class="en"><i>Clinical findings</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_clinical_findings" />
                                        </div>

                                        <div style="display: grid; grid-template-columns: 215px 1fr; grid-gap: 5px; ">
                                            <div>
                                                <div><span style="font-weight: bold">Cận lâm sàng được chỉ định: </span></div>
                                                <div class="en"><i>Para-clinical investigations</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_para_clinical_investigations" />
                                        </div>
                                        
                                        <div style="display: grid; grid-template-columns: 215px 1fr; grid-gap: 5px; ">
                                            <div>
                                                <div><span style="font-weight: bold">Chẩn đoán: </span></div>
                                                <div class="en"><i>Diagnosis</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_diagnosis" />
                                        </div>
                                        
                                        <div style="display: grid; grid-template-columns: 215px 1fr; grid-gap: 5px; ">
                                            <div>
                                                <div><span style="font-weight: bold">Phương pháp và thuốc điều trị: </span></div>
                                                <div class="en"><i>Treatment and medications</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_treatment" />
                                        </div>
                                        
                                        <div style="display: grid; grid-template-columns: 215px 1fr; grid-gap: 5px; ">
                                            <div>
                                                <div><span style="font-weight: bold">Thời gian điều trị: </span></div>
                                                <div class="en"><i>Treatment period</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_treatment_period" />
                                        </div>
                                        
                                        <div style="display: grid; grid-template-columns: 215px 1fr; grid-gap: 5px; ">
                                            <div>
                                                <div><span style="font-weight: bold">Lời khuyên và theo dõi: </span></div>
                                                <div class="en"><i>Recommendation and Follow-up</i></div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_recommendation" />
                                        </div>

                                        <div style="display: grid; grid-template-columns: 1fr 1fr; grid-gap: 5px">
                                            <div></div>
                                            <div class="text-center" style="break-inside: avoid !important; page-break-inside: avoid !important">
                                                <div>Ngày/ <span class="en">Date:</span> <asp:Label runat="server" ID="prt_date"></asp:Label></div>
                                                <div><span class="font-bold">BÁC SĨ ĐIỀU TRỊ</span></div>
                                                <div class="en"><i style="font-weight: bold">ATTENDING DOCTOR</i></div>
                                                <div>(Họ tên, chữ ký & MSNV)</div>
                                                <div class="en" style="margin-bottom: 100px;"><i>(Full name, Signature & ID)</i></div>
                                                <asp:Label runat="server" ID="prt_signature_doctor"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot class="report-footer">
                            <tr>
                                <%-- Update 08/10/2022 --%>
                                <td class="report-footer-cell" runat="server" id="print_footer">
                                    <div style="margin-left: -18px"><img style="width: 210mm" src="../images/ExcellentCare.png" /></div>
                                    <div class="footer-info" style="padding: 0 18px">
                                        <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                                        <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Tp. Thủ Đức, Tp.HCM</div>
                                        <div>Tel: 028 3910 9999</div>
                                        <div>www.aih.com.vn</div>
                                    </div>
                                </td>
                                <td class="report-footer-space" runat="server" id="print_footer_space"></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <%-- Select print language --%>
        <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" MaxHeight="400">
            <Windows>
                <telerik:RadWindow CssClass="NoIconUrl" Height="130px" VisibleStatusbar="false" Width="220px" RenderMode="Lightweight" ID="rwndPrint" Title="Chọn ngôn ngữ" runat="server">
                    <ContentTemplate>
                        <div class="text-center" style="margin-top: 20px">
                            <asp:LinkButton runat="server" OnClientClick="printForm(true); return false;" ID="LinkButton1" CssClass="btn btn-secondary">Tiếng Việt</asp:LinkButton>
                            <asp:LinkButton runat="server" OnClientClick="printForm(false); return false;" ID="LinkButton2" CssClass="btn btn-secondary">Song ngữ</asp:LinkButton>
                        </div>
                    </ContentTemplate>
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>

        <div class="cssclsNoPrint">
            <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0; border-bottom: 1px solid #ddd; border-radius: 0;">
                <%-- Update 08/10/2022 --%>
                <li><asp:LinkButton runat="server" ID="btnHome" OnClick="RedirectToPatientSummary" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                <li>Medical Certificate</li>
            </ul>
            <div style="overflow: scroll; height: calc(100vh - 43px); overflow-x: hidden;">
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
                    <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                </asp:Panel>

                <%-- Patient Info --%>
                <webUI:PatientInfo runat="server" ID="uc_patientInfo"></webUI:PatientInfo>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="text-primary">Medical Certificate</h4>
                                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                            </div>
                            <div class="card-body">
                                <div class="form-body collapse show" id="collapseOne">
                                    <%-- Update 08/10/2022 --%>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="alert alert-warning d-flex align-items-center" runat="server" id="LastestVersion">
                                                <span class="mr-2"><i class="fa fa-exclamation-triangle" style="font-size:24px"></i></span>
                                                <span class="mr-2">You are viewing an old version of this document</span>
                                                <asp:LinkButton OnClick="GoToLastestVersion" ID="hlkLastestVersion" Text="[View latest version]" runat="server"></asp:LinkButton>
                                            </div>
                                            <div class="alert alert-info d-flex align-items-center">
                                                <span class="mr-2"><i style="font-size: 24px;" class="fa fa-exclamation-circle"></i></span>
                                                <telerik:RadLabel runat="server" ID="rlblLogHistory" />
                                                <asp:UpdatePanel runat="server" ID="uplViewHistory">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" ID="lbtnViewHistory" OnClick="ViewHistory" Text="[View History]"></asp:LinkButton>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Lý do nhập viện/ <span class="text-primary">Chief complaint:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group" runat="server" id="chief_complain_wrapper">
                                                <webUI:TextField runat="server" ID="txt_chief_complain" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_chief_complain" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Tóm tắt bệnh sử/ <span class="text-primary">History of present illness:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group" runat="server" id="history_present_illness_wrapper">
                                                <webUI:TextField runat="server" ID="txt_history_present_illness" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_history_present_illness" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Tiền sử bệnh/ <span class="text-primary">Past History:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group" runat="server" id="past_history_wrapper">
                                                <webUI:TextField runat="server" ID="txt_past_history" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_past_history" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Khám lâm sàng/ <span class="text-primary">Clinical examination and findings:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group" runat="server" id="clinical_findings_wrapper">
                                                <webUI:TextField runat="server" ID="txt_clinical_findings" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_clinical_findings" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Cận lâm sàng/ <span class="text-primary">Para-clinical Investigations:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group" runat="server" id="para_clinical_investigations_wrapper">
                                                <webUI:TextField runat="server" ID="txt_para_clinical_investigations" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_para_clinical_investigations" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group" runat="server" id="diagnosis_wrapper">
                                                <webUI:TextField runat="server" ID="txt_diagnosis" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_diagnosis" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Phương pháp và thuốc điều trị/ <span class="text-primary">Treatment and medications:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group" runat="server" id="treatment_wrapper">
                                                <webUI:TextField runat="server" ID="txt_treatment" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_treatment" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Thời gian điều trị/ <span class="text-primary">Treatment period:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group" runat="server" id="treatment_period_wrapper">
                                                <webUI:TextField runat="server" ID="txt_treatment_period" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_treatment_period" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">Lời khuyên và theo dõi/ <span class="text-primary">Recommendation & Follow-up:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group" runat="server" id="recommendation_wrapper">
                                                <webUI:TextField runat="server" ID="txt_recommendation" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_recommendation" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2" style="display: none;">
                                        <legend>
                                            <label class="control-label">Lịch điều trị/ <span class="text-primary">Treatment plan:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group" runat="server" id="treatment_plan_wrapper">
                                                <webUI:TextField runat="server" ID="txt_treatment_plan" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_treatment_plan" />
                                        </div>
                                    </fieldset>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <%-- Update 08/10/2022 --%>
                                        <div class="form-actions" style="display: flex; gap: 6px">
                                            <asp:UpdatePanel runat="server" ID="uplPrintDocument">
                                                <ContentTemplate>
                                                    <asp:LinkButton ValidationGroup="Group2" runat="server" OnClick="CompleteDocument" ID="btnComplete" CssClass="btn btn-primary">Complete</asp:LinkButton>
                                                    <asp:LinkButton ValidationGroup="Group1" OnClick="SaveDocument" ID="btnSave" runat="server" CssClass="btn btn-primary">Save</asp:LinkButton>
                                                    <asp:LinkButton runat="server" OnClick="DeleteDocument" ID="btnDelete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <asp:LinkButton runat="server" OnClick="AmendDocument" ID="btnAmend" CssClass="btn btn-secondary">Amend</asp:LinkButton>
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                                <ContentTemplate>
                                                    <asp:LinkButton runat="server" OnClick="PrintDocument" ID="btnPrint" CssClass="btn btn-secondary">Print</asp:LinkButton>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <asp:LinkButton runat="server" OnClick="CancelAmendDocument" ID="btnCancel" CssClass="btn btn-secondary">Cancel</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/alertify.js"></script>

    <script type="text/javascript">
        function print_document() {
            let print_page = document.querySelector("#print_page");
            print_page.style.display = "block";
            setTimeout(() => { print_page.style.display = "none"; }, 100);
            window.print();
        }
        function show_window(rwndID) {
            var oWnd = $find(rwndID);
            oWnd.show();
        }
        function select_print_language()
        {
            var rwndPrint = $find("<%=rwndPrint.ClientID %>");
            rwndPrint.show();
        }
    </script>

    <script type="text/javascript">
        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function printForm(isLocal) {
            let StyleDisplay = isLocal ? "none" : "";

            document.getElementById("prt_patient_name_e").style.display = StyleDisplay;

            var radWindow = $find('<%=rwndPrint.ClientID %>');
            radWindow.close();

            window.print();
        }

        function afterAsyncPostBack() {
            //setTimeout(function () {
            //    if (document.getElementById("alertify-logs"))
            //    document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            //}, 1000);
        }
    </script>
</body>
</html>
