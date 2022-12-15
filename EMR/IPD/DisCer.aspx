<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisCer.aspx.cs" Inherits="EMR.DischargeCertificate" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/DateTime.ascx" TagPrefix="webUI" TagName="DateTime" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="aih" TagName="Line" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label1.ascx" TagPrefix="webUI" TagName="Label1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="aih" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature2.ascx" TagPrefix="aih" TagName="Signature2" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtDate.ascx" TagPrefix="aih" TagName="PrtDate" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>
<%@ Register Src="~/UserControls/UserControlPatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <%--<link href="../styles/print-10.2022.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style>
        @page {
            /*margin-left: 65px; 
	        margin-right: 20px;*/

/*            margin-left: 1.8cm; 
	        margin-right: 1.5cm;*/
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
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <%-- Print page --%>
        <asp:UpdatePanel runat="server" ID="uplPrintPage">
            <ContentTemplate>
                <div class="cssclsNoScreen">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info" style="padding-top: 120px; display: flex; width: 210mm;">
                                        <div class="text-center align-top" style="line-height: 16.6667px; height: 90px; width: 270px">
                                            <div>SỞ Y TẾ TP.HCM</div>
                                            <div class="text-primary">HCMC DOH</div>
                                            <div>BỆNH VIỆN QUỐC TẾ MỸ</div>
                                            <div class="text-primary">AMERICAN INTERNATIONAL HOSPITAL</div>
                                            <div style="margin-top: 10px;" class="font-bold">KHOA/<span class="text-primary">DEPARTMENT:</span></div>
                                            <asp:Label runat="server" ID="prt_disc_ward_desc"></asp:Label>
                                        </div>
                                        <div class="text-center ml-2 mr-2  align-top" style="height: 90px; width: 300px">
                                            <div class="font-bold">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</div>
                                            <div class="text-primary">SOCIALIST REPUBLIC OF VIETNAM</div>
                                            <div style="margin-top: 10px;" class="font-bold">Độc lập - Tự do - Hạnh phúc</div>
                                            <div class="text-primary">Independence – Freedom – Happiness</div>
                                        </div>
                                        <div class="align-top" style="height: 90px; flex-grow: 1">
                                            <div>MS: 01/BV-01</div>
                                            <div>Số lưu trữ/ <span class="text-primary">No:</span></div>
                                            <div>
                                                Mã Y tế/ <span class="text-primary">PID: </span><asp:Label runat="server" ID="prt_vpid" />
                                            </div>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div class="main" style="width: 210mm; padding-left: 1.8cm; padding-right: 1.4cm">
                                        <div class="text-center font-bold h4 mt-4 mb-4">
                                            <div>GIẤY RA VIỆN</div>
                                            <div class="text-primary">DISCHARGE CERTIFICATE</div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 300px 250px 1fr;">
                                            <div style="display: grid; grid-gap: 4px; grid-template-columns: auto 1fr">
                                                <webUI:Label runat="server" SubTitle="Patient's Name" Title="Họ tên người bệnh:" />
                                                <div style="display: inline-block">
                                                    <asp:Label runat="server" ID="prt_fullname" />
                                                    <asp:Label runat="server" ID="prt_patient_name_e" />
                                                </div>

                                            </div>

                                            <div>
                                                <webUI:Label runat="server" SubTitle="DOB" Title="Ngày tháng năm sinh:" />
                                                <asp:Label runat="server" ID="prt_dob" />
                                            </div>

                                            <div style="display: grid; grid-gap: 4px; grid-template-columns: auto 1fr">
                                                <webUI:Label runat="server" SubTitle="Gender" Title="Giới tính:" />
                                                <div style="display: inline-block">
                                                    <asp:Label runat="server" ID="prt_gender" />
                                                    <asp:Label runat="server" ID="prt_gender_e" />
                                                </div>

                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 325px 1fr">
                                            <div style="display: grid; grid-gap: 4px; grid-template-columns: auto 1fr">
                                                <webUI:Label runat="server" SubTitle="Nationality" Title="Dân tộc:" />
                                                <div style="display: inline-block">
                                                    <asp:Label CssClass="align-top" runat="server" ID="prt_nationality" />
                                                    <asp:Label runat="server" ID="prt_nationality_e" />
                                                </div>
                                            </div>
                                            <div style="display: grid; grid-gap: 4px; grid-template-columns: auto 1fr">
                                                <webUI:Label runat="server" SubTitle="Occupation" Title="Nghề nghiệp:" />
                                                <div style="display: inline-block">
                                                    <asp:Label CssClass="align-top" runat="server" ID="prt_occupation" />
                                                    <asp:Label CssClass="align-top" runat="server" ID="prt_occupation_e" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 150px 1fr 1fr 200px">
                                            <div>
                                                <webUI:Label runat="server" SubTitle="Health Insurance" Title="BHYT:" />
                                            </div>
                                            <div>
                                                <webUI:Label runat="server" SubTitle="Valid from" Title="Giá trị từ:" />
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_valid_from" />
                                            </div>
                                            <div>
                                                <webUI:Label runat="server" SubTitle="to" Title="đến:" />
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_to" />
                                            </div>
                                            <div>
                                                <webUI:Label runat="server" SubTitle="No" Title="Số:" />
                                                <div class="d-inline-block"><asp:Label runat="server" ID="prt_no" /></div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 150px 1fr">
                                            <webUI:Label runat="server" SubTitle="Address" Title="Địa chỉ:" />
                                            <div style="display: inline-block">
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_address" />
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_address_e" />
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 150px 1fr">
                                            <webUI:Label runat="server" SubTitle="Admitted time" Title="Vào viện lúc:" />
                                            <div runat="server" id="datetimePanel">
                                                <div class="d-inline-block" runat="server" id="lblHour">
                                                    <asp:Label class="d-inline-block align-top text-left" style="width: 20px" runat="server" id="prt_hour"></asp:Label>
                                                    <div class="d-inline-block">
                                                        <label class="d-block mb-0">giờ</label>
                                                        <span class="text-primary">hour</span>
                                                    </div>
                                                </div>
                                                <div class="d-inline-block" runat="server" id="lblMinute">
                                                    <asp:Label class="d-inline-block align-top text-left" style="width: 20px" runat="server" id="prt_minute"></asp:Label>
                                                    <div class="d-inline-block">
                                                        <label class="d-block mb-0">phút,</label>
                                                        <span class="text-primary">minutes,</span>
                                                    </div>
                                                </div>
                                                <div class="d-inline-block" runat="server" id="lblDay">
                                                    <div class="d-inline-block">
                                                        <label class="d-block mb-0">ngày</label>
                                                        <span class="text-primary">day</span>
                                                    </div>
                                                    <asp:Label class="d-inline-block align-top text-center" style="width: 20px" runat="server" id="prt_day"></asp:Label>
                                                </div>
                                                <div class="d-inline-block" runat="server" id="lblMonth">
                                                    <div class="d-inline-block">
                                                        <label class="d-block mb-0">tháng</label>
                                                        <span class="text-primary">month</span>
                                                    </div>
                                                    <asp:Label class="d-inline-block align-top text-center" style="width: 20px" runat="server" id="prt_month"></asp:Label>
                                                </div>
                                                <div class="d-inline-block" runat="server" id="lblYear">
                                                    <div class="d-inline-block">
                                                        <label class="d-block mb-0">năm</label>
                                                        <span class="text-primary">year</span>
                                                    </div>
                                                    <asp:Label class="d-inline-block align-top text-center" style="width: 35px" runat="server" id="prt_year"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 150px 1fr">
                                            <webUI:Label runat="server" SubTitle="Discharged time" Title="Ra viện lúc:" />
                                            <div runat="server" id="Div1">
                                                <div class="d-inline-block" runat="server" id="Div2">
                                                    <asp:Label class="d-inline-block align-top text-left" style="width: 20px" runat="server" id="prt_hour1"></asp:Label>
                                                    <div class="d-inline-block">
                                                        <label class="d-block mb-0">giờ</label>
                                                        <span class="text-primary">hour</span>
                                                    </div>
                                                </div>
                                                <div class="d-inline-block" runat="server" id="Div3">
                                                    <asp:Label class="d-inline-block align-top text-left" style="width: 20px" runat="server" id="prt_minute1"></asp:Label>
                                                    <div class="d-inline-block">
                                                        <label class="d-block mb-0">phút,</label>
                                                        <span class="text-primary">minutes,</span>
                                                    </div>
                                                </div>
                                                <div class="d-inline-block" runat="server" id="Div4">
                                                    <div class="d-inline-block">
                                                        <label class="d-block mb-0">ngày</label>
                                                        <span class="text-primary">day</span>
                                                    </div>
                                                    <asp:Label class="d-inline-block align-top text-center" style="width: 20px" runat="server" id="prt_day1"></asp:Label>
                                                </div>
                                                <div class="d-inline-block" runat="server" id="Div5">
                                                    <div class="d-inline-block">
                                                        <label class="d-block mb-0">tháng</label>
                                                        <span class="text-primary">month</span>
                                                    </div>
                                                    <asp:Label class="d-inline-block align-top text-center" style="width: 20px" runat="server" id="prt_month1"></asp:Label>
                                                </div>
                                                <div class="d-inline-block" runat="server" id="Div6">
                                                    <div class="d-inline-block">
                                                        <label class="d-block mb-0">năm</label>
                                                        <span class="text-primary">year</span>
                                                    </div>
                                                    <asp:Label class="d-inline-block align-top text-center" style="width: 35px" runat="server" id="prt_year1"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 150px 1fr">
                                            <webUI:Label runat="server" SubTitle="Diagnosis" Title="Chẩn đoán:" />
                                            <asp:Label CssClass="align-top" runat="server" ID="prt_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 190px 1fr">
                                            <webUI:Label runat="server" SubTitle="Treatment" Title="Phương pháp điều trị:" />
                                            <asp:Label CssClass="align-top" runat="server" ID="prt_treatment" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 190px 1fr">
                                            <webUI:Label runat="server" SubTitle="Doctor’s recommendation" Title="Lời dặn của bác sĩ:" />
                                            <asp:Label CssClass="align-top" runat="server" ID="prt_followup_instruc" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 80px 1fr">
                                            <webUI:Label runat="server" SubTitle="Notes" Title="Ghi chú:" />
                                            <asp:Label CssClass="align-top" runat="server" ID="prt_notes" />
                                        </div>

                                        <div class="d-grid grid-template-2 mt-4" style="page-break-inside: avoid;">
                                            <div class="text-center">
                                                <webUI:Date runat="server" ID="prt_date" />
                                                <div class="mt-2"><span class="font-bold">TỔNG GIÁM ĐỐC/ </span>CEO</div>
                                                <div><span class="text-primary"><span class="font-bold">Họ tên, chữ ký, MSNV</span>/ Full name, Signature, ID</span></div>
                                                <div style="height: 50px"></div>
                                            </div>

                                            <div class="text-center">
                                                <webUI:Date runat="server" ID="prt_date1" />
                                                <div class="mt-2"><span class="font-bold">TRƯỞNG KHOA/ </span>HEAD OF DEPARTMENT</div>
                                                <div><span class="text-primary"><span class="font-bold">Họ tên, chữ ký, MSNV</span>/ Full name, Signature, ID</span></div>
                                                <div style="height: 50px"></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot class="report-footer">
                            <tr>
                                <%--<td class="report-footer-cell" style="font-size: 10px">
                                <img style="width: 100%" src="../images/ExcellentCare.png" />
                                <div class="footer-info">
                                    <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                                    <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Quận 2, Tp.HCM</div>
                                    <div>Tel: 028 3910 9999</div>
                                    <div>www.aih.com.vn</div>
                                </div>
                            </td>
                            <td class="report-footer-space"></td>--%>
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

        <div class="cssclsNoPrint" >
            <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd;border-radius:0;">
                <li><asp:LinkButton runat="server" ID="btnHome" OnClick="RedirectToPatientSummary" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                <li>Discharge certificate</li>
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

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                    ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                </asp:Panel>
                <%-- Patient Info --%>
                <webUI:PatientInfo runat="server" ID="uc_patientInfo"></webUI:PatientInfo>
                <div class="card">
                    <div class="card-header">
                        <h4 class="text-primary">Discharge certificate</h4>
                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                    </div>
                    <div class="card-body collapse show" id="collapseOne">
                        <div class="form-body">
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
                            <div class="row">
                                <div class="col-md-12 mb-2 gt-2-a">
                                    <label class="control-label mb-1">Khoa xuất viện/ <span class="text-primary">Discharge ward <span class="text-danger">*</span>:</span></label>
                                    <asp:Label runat="server" ID="lbl_disc_ward_desc"></asp:Label>
                                    <div runat="server" id="disc_ward_code_wrapper">
                                        <select class="custom-select" id="select_disc_ward_code" style="width: unset; width: 405px;" runat="server"></select>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-12">
                                    <label class="control-label mb-1">BHYT/ <span class="text-primary">HealthInsurance:</span></label>
                                </div>
                                <div class="col-md-12 gt-2-a">
                                    <label></label>
                                    <div>
                                        <asp:Label runat="server" ID="lbl_no_health_insurance"></asp:Label>
                                        <div class="form-group mb-2 d-inline-block w-n" runat="server" id="no_health_insurance_wrapper">
                                            <aih:TextField runat="server" ID="txt_no_health_insurance" />
                                        </div>
                                        <div class="form-group mb-2 d-inline-block">
                                            <label class="control-label mb-1">Giá trị từ/ <span class="text-primary">Valid from: </span></label>
                                            <asp:Label runat="server" ID="lbl_valid_from"></asp:Label>
                                            <div runat="server" class="d-inline-block" id="valid_from_wrapper">
                                                <telerik:RadDatePicker Width="120px" ID="dpk_valid_from" runat="server"></telerik:RadDatePicker>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-12 gt-2-a">
                                    <label class="control-label mb-1 mr-2"><span class="text-primary">Discharge date time:</span></label>
                                    <asp:Label runat="server" ID="lbl_disc_date_time"></asp:Label>
                                    <div class="d-inline-block" runat="server" id="disc_date_time_wrapper">
                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_disc_date_time" Width="204px" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-12 gt-2-a">
                                    <label class="control-label mb-1">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                    <asp:Label runat="server" ID="lbl_diagnosis"></asp:Label>
                                    <div class="form-group" runat="server" id="diagnosis_wrapper">
                                        <aih:TextField runat="server" ID="txt_diagnosis" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-12 gt-2-a">
                                    <label class="control-label mb-1">Phương pháp điều trị/ <span class="text-primary">Treatment:</span></label>
                                    <asp:Label runat="server" ID="lbl_disc_medication"></asp:Label>
                                    <div class="form-group" runat="server" id="disc_medication_wrapper">
                                        <aih:TextField runat="server" ID="txt_disc_medication" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-12 gt-2-a">
                                    <label class="control-label mb-1">Lời dặn của bác sĩ/ <span class="text-primary">Doctor’s recommendation:</span></label>
                                    <asp:Label runat="server" ID="lbl_followup_instruc"></asp:Label>
                                    <div class="form-group" runat="server" id="followup_instruc_wrapper">
                                        <aih:TextField runat="server" ID="txt_followup_instruc" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-12 gt-2-a">
                                    <label class="control-label mb-1">Ghi chú/ <span class="text-primary">Notes:</span></label>
                                    <asp:Label runat="server" ID="lbl_notes"></asp:Label>
                                    <div class="form-group" runat="server" id="notes_wrapper">
                                        <aih:TextField runat="server" ID="txt_notes" />
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-5">
                                <div class="col-md-12 gt-2-a">
                                    <label class="control-label mb-1 mr-2"><span class="text-primary">Signature Date:</span></label>
                                    <asp:Label runat="server" ID="lbl_signature_date"></asp:Label>
                                    <div class="d-inline-block" runat="server" id="signature_date_wrapper">
                                        <telerik:RadDatePicker Width="120px" ID="dpk_signature_date" runat="server"></telerik:RadDatePicker>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-12">
                                    <div class="form-actions" style="display: flex; gap: 6px">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                            <ContentTemplate>
                                                <asp:LinkButton ValidationGroup="Group2" runat="server" OnClick="CompleteDocument" ID="btnComplete" CssClass="btn btn-primary">Complete</asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:LinkButton ValidationGroup="Group1" OnClick="SaveDocument" ID="btnSave" runat="server" CssClass="btn btn-primary">Save</asp:LinkButton>
                                        <asp:UpdatePanel runat="server" ID="uplPrintDocument">
                                            <ContentTemplate>
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
    </form>
    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>
    <script type="text/javascript">
        function show_window(rwndID) {
            var oWnd = $find(rwndID);
            oWnd.show();
        }
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }
        function print_document() {
            let print_page = document.querySelector("#print_page");
            print_page.style.display = "block";
            setTimeout(() => { print_page.style.display = "none"; }, 100);
            window.print();
        }
        function select_print_language() {
            var rwndPrint = $find("<%=rwndPrint.ClientID %>");
            rwndPrint.show();
        }

        function printForm(isLocal) {
            let StyleDisplay = isLocal ? "none" : "";

            document.getElementById("prt_patient_name_e").style.display = StyleDisplay;
            document.getElementById("prt_gender_e").style.display = StyleDisplay;
            document.getElementById("prt_nationality_e").style.display = StyleDisplay;
            document.getElementById("prt_occupation_e").style.display = StyleDisplay;
            document.getElementById("prt_address_e").style.display = StyleDisplay;

            let lbl_signature_date = document.getElementById("lbl_signature_date").innerText;
            
            var date = new Date(lbl_signature_date);
            let day = date.getDate();
            let month = String(date.getMonth() + 1);
            let year = date.getFullYear();
            console.log(month + " " + month.length);
            if (month.length <= 1) {
                month = "0" + month;
            }

            document.getElementById("prt_date_prt_day").innerHTML += day;
            document.getElementById("prt_date_prt_month").innerHTML += month;
            document.getElementById("prt_date_prt_year").innerHTML += year;

            document.getElementById("prt_date1_prt_day").innerHTML += day;
            document.getElementById("prt_date1_prt_month").innerHTML += month;
            document.getElementById("prt_date1_prt_year").innerHTML += year;

            var radWindow = $find('<%=rwndPrint.ClientID %>');
            radWindow.close();

            window.print();
        }
    </script>
</body>
</html>
