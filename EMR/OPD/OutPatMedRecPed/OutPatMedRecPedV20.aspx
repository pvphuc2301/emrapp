﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatMedRecPedV20.aspx.cs" Inherits="EMR.OPD.OutPatMedRecPed_v02" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="Button" TagName="PopupShowDelay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Outpatient Medical Record</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print.css" rel="stylesheet" />
    <style>
        .dg-1 {
            display: grid;
            width: 100%;
            grid-template-columns: 200px 1fr;
        }

        @media only screen and (max-width: 600px) {
          .dg-1 {
            display: block !important;
          }
        }

        .v02 {
            /*background-color: #44ff0021;*/
        }

        .version:after {
            content: 'Version: 2.0';
            font-size: 10px;
            color: #343a40;
            position: absolute;
            right: 10px;
            bottom: 4px;
        }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="printContent" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info" style="display: flex; align-items: center; height: 80px;">
                                        <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>BỆNH ÁN NGOẠI TRÚ NHI</h4>
                                            <h5>PEDIATRIC OUTPATIENT MEDICAL RECORD</h5>
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
                                    <div style="position: relative;"  class="main" runat="server" id="print_content">
                                        <img style="height: 1px" src="../images/logo-opacity.png" />

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Title="Ngày khám bệnh" SubTitle="Day of visit" runat="server" />
                                            <asp:Label runat="server" ID="prt_day_of_visit" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="I." Title="Lý do đến khám:" SubTitle="Chief complaint" runat="server" />
                                            <asp:Label runat="server" ID="prt_chief_complaint" />
                                        </div>
 
                                        <div style="margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="II." Title="Bệnh sử:" SubTitle="Medical history" runat="server" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="1." Title="Bệnh sử hiện tại:" SubTitle="Current Medical History" runat="server" />
                                            <asp:Label runat="server" ID="prt_medical_history" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="❖" Title="Thuốc đang sử dụng:" SubTitle="Current medications" runat="server" />
                                            <asp:Label runat="server" ID="prt_current_medication" />
                                        </div>

                                        <div style="margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="2." Title="Tiền sử bệnh:" SubTitle="Atencedent medical history" runat="server" />
                                        </div>
                                        
                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="❖" Title="Bản Thân:" SubTitle="Personal" runat="server" />
                                            <asp:Label runat="server" ID="prt_personal" />
                                        </div>

                                        <div class="row mb-1">
                                            <div class="col-12" style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px">
                                                <asp:Label runat="server">• Đã từng nhiễm COVID-19 trong vòng 6 tháng qua</span>/ <span class="text-primary">Have been infected with COVID-19 within the last 6 months:</span> </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div  class="col-12 ">
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_infected_with_covid_true" Text="❏"/>&nbsp;Có/ <span class="text-primary">Yes</span>
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_infected_with_covid_false" Text="❏"/>&nbsp;Không/ <span class="text-primary">No</span>
                                            </div>
                                        </div>

                                        <div class="row mb-1">
                                            <div class="col-12" style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px">
                                                <asp:Label runat="server">• Tiền sử tiêm chủng</span>/ <span class="text-primary">Immunization history:</span> </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-1">
                                            <div class="col-12" style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px">
                                                <asp:Label runat="server">- Tiêm vắc xin phòng COVID-19/ <span class="text-primary">COVID-19 vaccination:</span> </asp:Label>
                                            </div>
                                        </div>

                                        <div class="row mb-1">
                                            <div  class="col-12 ">
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_received_1_dose_true" Text="❏"/>&nbsp;Đã tiêm mũi 1/ <span class="text-primary">Received 1<sup>st</sup> dose</span>
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_received_2_dose_true" Text="❏"/>&nbsp;Đã tiêm mũi 2/ <span class="text-primary">Received 2<sup>nd</sup> dose</span>
                                            </div>
                                            <div  class="col-12 ">
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_received_additional_true" Text="❏"/>&nbsp;Đã tiêm mũi bổ sung, nhắc lại/ <span class="text-primary">Received additional, booster dose</span>
                                                <asp:Label CssClass="ml-4" Style="font-size: 14.5px; font-family: Tahoma" runat="server" ID="prt_not_yet_vaccinations_true" Text="❏"/>&nbsp;Chưa tiêm/ <span class="text-primary">Not yet</span>
                                            </div>
                                        </div>

                                        <div class="row mb-1">
                                            <div class="col-12" style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px">
                                                <asp:Label runat="server" ID="prt_immunization"/>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="❖" Title="Gia đình:" SubTitle="Family" runat="server" />
                                            <asp:Label runat="server" ID="prt_family" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="❖" Title="Dị ứng:" SubTitle="Allergy" runat="server" />
                                            <asp:Label runat="server" ID="prt_allergy" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;" runat="server" id="prt_allergy_note_wrapper">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Nếu có, nêu rõ:" SubTitle="If yes, specify" runat="server" />
                                            <asp:Label runat="server" ID="prt_allergy_note" />
                                        </div>

                                        <div style="margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="III." Title="Khám bệnh:" SubTitle="Physical examinations" runat="server" />
                                        </div>

                                        <div style="margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="1." Title="Dấu hiệu sinh tồn/ " SubTitle="Vital signs:" runat="server" />
                                        </div>

                                        <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%">
                                            <tr>
                                                <td class="p-2">Nhiệt độ/ Temperature (C degree)</td>
                                                <td class="p-2 text-right" style="width: 100px;">
                                                    <asp:Label runat="server" ID="prt_vs_temperature" /></td>
                                                <td class="p-2">Mạch/ Pulse (/min)</td>
                                                <td class="p-2 text-right" style="width: 100px;">
                                                    <asp:Label runat="server" ID="prt_pulse" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Cân nặng/ Weight (Kg)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_weight" /></td>
                                                <td class="p-2">Nhịp thở/ Respiratory Rate (/min)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_respiratory_rate" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chiều cao/Height (cm)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_height" /></td>
                                                <td class="p-2">Huyết áp/Blood pressure (mmHg)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_blood_pressure" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chỉ số khối cơ thể/ BMI (Kg/m2)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_BMI" /></td>
                                                <td class="p-2">Độ bão hòa Oxy/ SpO2 (%)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_spO2" /></td>
                                            </tr>
                                        </table>

                                        <div style="margin-bottom: 6px;">

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="2." Title="Khám bệnh/ " SubTitle="Physical Examination:" runat="server" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr; margin-bottom: 6px;">
                                            <label></label>
                                            <asp:Label runat="server" ID="prt_physical_examination" />
                                        </div>

                                        <div style="margin-bottom: 6px;">
                                        <webUI:PrtRowS1 FontBold="true" Order="IV." Title="Chỉ định và kết quả xét nghiệm:" SubTitle="Laboratory indications and results" runat="server" />
                                            </div>

                                        <div class="d-grid" style="grid-template-columns: 20px 1fr; margin-bottom: 6px;">
                                            <label></label>
                                            <asp:Label runat="server" ID="prt_laboratory_indications_results" />
                                        </div>

                                        <div style="margin-bottom: 6px;">
                                        <webUI:PrtRowS1 FontBold="true" Order="V." Title="Kết luận:" SubTitle="Conclusion" runat="server" />
                                            </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" Title="Chẩn đoán ban đầu:" SubTitle="Initial diagnosis" runat="server" />
                                            <asp:Label runat="server" ID="prt_initial_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" Title="Chẩn đoán phân biệt:" SubTitle="Differential diagnosis" runat="server" />
                                            <asp:Label runat="server" ID="prt_differential_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" Title="Bệnh kèm theo:" SubTitle="Associated conditions" runat="server" />
                                            <asp:Label runat="server" ID="prt_associated_conditions" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 85px 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Điều trị:" SubTitle="Treatment" runat="server" />
                                            <asp:Label runat="server" ID="prt_treatment" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 90px 1fr; margin-bottom: 6px;">
                                            <label></label>
                                            <asp:Label runat="server" ID="prt_medicine" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 280px 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="5" Order="❖" Title="Yêu cầu ý kiến chuyên khoa:" SubTitle="Specialized opinion requested" runat="server" />
                                            <asp:Label runat="server" ID="prt_spec_opinion_requested" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr; grid-gap: 5px;; margin-bottom: 6px;" runat="server" id="prt_spec_opinion_requested_note_wrapper">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Nếu có, nêu rõ:" SubTitle="If yes, specif" runat="server" />
                                            <asp:Label runat="server" ID="prt_spec_opinion_requested_note" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr; grid-gap: 5px;; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Hướng dẫn cụ thể dành cho bệnh nhân:" SubTitle="Specific education required" runat="server" />
                                            <asp:Label runat="server" ID="prt_specific_education_required" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr; grid-gap: 5px;; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Hẹn lần khám tới:" SubTitle="Next Appointment" runat="server" />
                                            <asp:Label runat="server" ID="prt_next_appointment" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <div></div>
                                            <div class="text-center" style="break-inside: avoid;">
                                                <div class="font-bold">BÁC SĨ ĐIỀU TRỊ</div>
                                                <div style="margin-bottom: 100px;">ATTENDING DOCTOR</div>
                                                <asp:Label runat="server" ID="prt_signature_doctor" />
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

                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" MaxHeight="400">
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
                      <li>Outpatient Medical Record - Pediatric</li>
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

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                        ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <asp:ValidationSummary
                            ID="valSum"
                            DisplayMode="BulletList"
                            CssClass="validationSummary"
                            runat="server" ValidationGroup="Group1"
                            HeaderText="Please complete the highlighted field(s)." />
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
                        <div class="col-lg-12">
                            <div class="card mt-2">
                                <div class="card-header">
                                    <h4 class="text-primary">OUTPATIENT MEDICAL RECORD - PEDIATRIC</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body version">

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

                                        <div><label class="control-label font-bold">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label></div>

                                        <div class="dg-1">
                                            <div></div>
                                            <div>
                                                <asp:Label runat="server" ID="lbl_chief_complaint" />
                                                <div class="form-group" runat="server" id="chief_complaint_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_chief_complaint" />
                                                </div>
                                            </div>
                                        </div>

                                        <div><label class="control-label font-bold">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label></div>

                                        <div><label class="control-label"><span class="font-bold">1. Bệnh sử hiện tại</span>/ <span class="text-primary">Current Medical History:</span></label></div>

                                        <div class="dg-1 mb-1">
                                            <div></div>
                                            <div>
                                                <asp:Label runat="server" ID="lbl_medical_history" />
                                                <div class="form-group" runat="server" id="medical_history_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_medical_history" />
                                                </div>
                                            </div>
                                        </div>

                                        <div><label class="control-label"><span class="font-bold">2. Thuốc đang sử dụng</span>/ <span class="text-primary">Current medications:</span></label></div>

                                        <div class="dg-1 mb-1">
                                            <div></div>
                                            <div>
                                                <asp:Label runat="server" ID="lbl_current_medication" />
                                                <div class="form-group " runat="server" id="current_medication_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_current_medication" />
                                                </div>
                                            </div>
                                        </div>

                                        <div><label class="control-label"><span class="font-bold">3. Tiền sử bệnh</span>/ <span class="text-primary">Antecedent Medical History:</span></label></div>

                                        <div class="dg-1 mb-2">
                                            <label class="control-label">- Bản thân/ <span class="text-primary">Personal:</span></label>
                                            <div>
                                                <div class="form-group " runat="server" id="personal_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_personal" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_personal" />
                                            </div>
                                        </div>

                                        <div class="v02">
                                            <label class="control-label">- Đã từng nhiễm COVID-19 trong vòng 6 tháng qua/ <span class="text-primary">Have been injected with COVID-19 within the last 6 months:</span></label>
                                            <div class="dg-1">
                                                <div></div>
                                                <asp:Label runat="server" ID="lbl_infected_with_covid"></asp:Label>
                                                <div runat="server" id="infected_with_covid_wrapper">
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" onchange="radioButtonChange(this)" runat="server" id="rad_infected_with_covid_true" name="rad_infected_with_covid" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_infected_with_covid_true">Có/ <span class="text-primary">Yes</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input disabled-for="allergy_field" onchange="radioButtonChange(this)" type="radio" runat="server" id="rad_infected_with_covid_false" name="rad_infected_with_covid" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_infected_with_covid_false">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="v02">
                                            <label class="control-label">- Tiền sử tiêm chủng/ <span class="text-primary">Immunization history:</span></label>
                                            <div class="mb-2">
                                                <label class="control-label">• Tiêm vắc xin phòng COVID-19/ <span class="text-primary">COVID-19 vaccination:</span></label>
                                                    
                                                <div>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_received_1_dose_true" />
                                                        <span class="custom-control-label">Đã tiêm mũi 1/ <span class="text-primary">Received 1<sup>st</sup> dose</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_received_2_dose_true" />
                                                        <span class="custom-control-label">Đã tiêm mũi 2/ <span class="text-primary">Received 2<sup>st</sup> dose</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_received_additional_true" />
                                                        <span class="custom-control-label">Đã tiêm mũi bổ sung, nhắc lại/ <span class="text-primary">Received additional, booster dose</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_not_yet_vaccinations_true" />
                                                        <span class="custom-control-label">Chưa tiêm/ <span class="text-primary">Not yet</span></span>
                                                    </label>
                                                </div>

                                                <div class="dg-1">
                                                    <label class="control-label">• Tiêm vắc xin khác (ghi rõ)/ <span class="text-primary">Other vaccinations (specify):</span></label>
                                                    <asp:Label runat="server" ID="lbl_other_vaccinations"></asp:Label>
                                                    <div class="form-group" runat="server" id="other_vaccinations_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_other_vaccinations" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="dg-1">
                                            <label class="control-label">- Gia đình/ <span class="text-primary">Family:</span></label>
                                            <div>
                                                <div class="form-group " runat="server" id="family_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_family" />
                                                </div>
                                                <asp:Label runat="server" ID="lbl_family" />
                                            </div>
                                        </div>

                                        <div class="dg-1 mt-2 mb-2">
                                            <label class="control-label">- Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                            <div>
                                                <asp:Label runat="server" ID="lbl_allergy" />
                                                <div runat="server" id="allergy_wrapper">
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" onchange="radioButtonChange(this)" data-target="allergy_field" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input disabled-for="allergy_field" onchange="radioButtonChange(this)" type="radio" runat="server" id="rad_allergy_true" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_true">Có/ <span class="text-primary">Yes</span></label>
                                                        Nếu có, ghi rõ/ <span class="text-primary">If yes, specify:</span>
                                                        <a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                            <icon:XSquare runat="server" ID="XSquare38" />
                                                        </a>
                                                    </div>
                                                    <div class="form-group allergy_field">
                                                        <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    <div><label class="control-label font-bold">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label></div>

                                        <asp:UpdatePanel ID="updatepnl_vital_sign" runat="server">
                                            <ContentTemplate>
                                                <div class="dg-1 mb-1">
                                                    <label class="control-label">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
                                                    <div>
                                                        <asp:LinkButton OnClick="btnUpdateVitalSign_Click" ID="btnUpdateVitalSign" runat="server" CssClass="btn btn-sm btn-secondary waves-effect">Update</asp:LinkButton>
                                                        <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updatepnl_vital_sign">
                                                            <ProgressTemplate>
                                                                <div class="loader1 ml-2">
                                                                    <div style="width: 28px; height: 28px;" class="loader-wheel"></div>
                                                                </div>
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                    </div>
                                                </div>

                                                <div class="dg-1">
                                                    <div></div>
                                                    <div>
                                                        <div>
                                                            <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                            <asp:Label runat="server" ID="vs_temperature" />&nbsp;°C
                                                        </div>
                                                        <div>
                                                            <label class="control-label mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                            <asp:Label runat="server" ID="vs_weight" />&nbsp;Kg
                                                        </div>
                                                        <div>
                                                            <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                            <asp:Label runat="server" ID="vs_height" />&nbsp;cm
                                                        </div>

                                                        <div>
                                                            <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                            <asp:Label runat="server" ID="vs_bmi" />
                                                        </div>

                                                        <div>
                                                            <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                            <asp:Label runat="server" ID="vs_pulse" />&nbsp;cm
                                                        </div>

                                                        <div>
                                                            <label class="control-label mb-1 mr-2">Nhịp tim/ <span class="text-primary">Heart Rate:</span></label>
                                                            <asp:Label runat="server" ID="vs_heart_rate" />&nbsp;/phút (m)
                                                        </div>
                                                            
                                                        <div>
                                                            <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                            <asp:Label runat="server" ID="vs_respiratory_rate" />&nbsp;/phút (m)
                                                        </div>

                                                        <div>
                                                            <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                            <asp:Label runat="server" ID="vs_blood_pressure" />&nbsp;mmHg
                                                        </div>

                                                        <div>
                                                            <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                            <asp:Label runat="server" ID="vs_spo2" />&nbsp;%
                                                        </div>

                                                            
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnUpdateVitalSign" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                    <div class="dg-1">
                                        <div></div>
                                        <div>
                                            <div class="form-group" runat="server" id="physical_examination_wrapper">
                                                <webUI:TextField runat="server" ID="txt_physical_examination" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_physical_examination" />
                                        </div>
                                    </div>

                                    <div class="mt-2"><label class="control-label font-bold">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label></div>

                                    <div class="dg-1">
                                        <div></div>
                                        <div>
                                            <asp:Label runat="server" ID="lbl_laboratory_indications_results" />
                                            <div class="form-group mb-2 " runat="server" id="laboratory_indications_results_wrapper">
                                                <webUI:TextField runat="server" ID="txt_laboratory_indications_results" />
                                            </div>
                                        </div>
                                    </div>

                                    <div><label class="control-label font-bold">V. Kết luận/ <span class="text-primary">Conclusion:</span></label></div>

                                    <div class="dg-1 mb-2">
                                        <label class="control-label mb-1">- Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label>
                                        <div>
                                            <div class="form-group" runat="server" id="initial_diagnosis_wrapper">
                                                <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_initial_diagnosis" />
                                        </div>
                                    </div>

                                    <div class="dg-1 mb-2 v02" style="display: none;">
                                        <label class="control-label mb-1">- Chẩn đoán xác định/ <span class="text-primary">Initial diagnosis:</span></label>
                                        <div>
                                            <div class="form-group" runat="server" id="Div3">
                                                <webUI:TextField runat="server" ID="TextField2" />
                                            </div>
                                            <asp:Label runat="server" ID="Label1" />
                                        </div>
                                    </div>

                                    <div class="dg-1 mb-2">
                                        <label class="control-label mb-1">- Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                        <div>
                                            <div class="form-group" runat="server" id="differential_diagnosis_wrapper">
                                                <webUI:TextField runat="server" ID="txt_differential_diagnosis" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_differential_diagnosis" />
                                        </div>
                                    </div>
                                        
                                    <div class="dg-1 mb-2">
                                        <label class="control-label mb-1">- Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                        <div>
                                            <div class="form-group" runat="server" id="associated_conditions_wrapper">
                                                <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_associated_conditions" />
                                        </div>
                                    </div>
                                       
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="dg-1 mb-1">
                                                <label class="control-label mb-1">- Điều trị/ <span class="text-primary">Treatment:</span></label>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_treatment_code" />
                                                    <div runat="server" id="treatment_code_wrapper" class="d-inline-block">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onclick="__doPostBack('rad_treatment_code_change','opd')" type="radio" runat="server" id="rad_treatment_code_opd" name="rad_treatment_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_treatment_code_opd">Ngoại trú/ <span class="text-primary">Ambulatory care</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onclick="__doPostBack('rad_treatment_code_change','ipd')" type="radio" runat="server" id="rad_treatment_code_ipd" name="rad_treatment_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_treatment_code_ipd">Nhập viện/ <span class="text-primary">Admission</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onclick="__doPostBack('rad_treatment_code_change','trf')" type="radio" runat="server" id="rad_treatment_code_trf" name="rad_treatment_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_treatment_code_trf">Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                            <input onclick="__doPostBack('rad_treatment_code_change','')" hidden="hidden" type="checkbox" id="Radio3" runat="server" />
                                                            <label for="Radio3"><icon:XSquare runat="server" ID="XSquare5" /></label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dg-1 mb-2" runat="server" id="current_medication_field">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_medicine" />
                                                    <div class="form-group" runat="server" id="medicine_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_medicine" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dg-1 mb-2" runat="server" id="tranfer_field">
                                                <div></div>
                                                <div>
                                                    <asp:Label runat="server" ID="lbl_tranfer" />
                                                    <div class="form-group " runat="server" id="tranfer_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_tranfer" />
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <div class="dg-1 mb-2">
                                        <label class="control-label mb-1">- Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                        <div>
                                            <asp:Label runat="server" ID="lbl_spec_opinion_requested" />
                                            <div runat="server" id="spec_opinion_requested_wrapper">
                                                <div class="custom-control custom-radio d-inline-block">
                                                    <input onchange="radioButtonChange(this)" data-target="spec_opinion_requested_field" type="radio" runat="server" id="rad_spec_opinion_requested_false" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_requested_false">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                                <div class="custom-control custom-radio d-inline-block">
                                                    <input onchange="radioButtonChange(this)" disabled-for="spec_opinion_requested_field" type="radio" runat="server" id="rad_spec_opinion_requested_true" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_requested_true">Có/ <span class="text-primary">Yes</span> Nếu có, ghi rõ/ <span class="text-primary">If yes, specify:</span></label>
                                                    <a href="javascript:void(0)" data-clear="rad_spec_opinion_requested" onclick="clear_radiobutton(this)">
                                                        <icon:XSquare runat="server" ID="XSquare3" />
                                                    </a>
                                                    <%--<asp:CustomValidator ID="CustomValidator1" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="Yêu cầu ý kiến chuyên khoa/ Specialized opinion requested" CssClass="text-danger" OnServerValidate="spec_opinion_requested_ServerValidate"></asp:CustomValidator>--%>
                                                </div>
                                                <div class="form-group spec_opinion_requested_field">
                                                    <webUI:TextField runat="server" ID="txt_spec_opinion_requested_note" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="dg-1 mb-2">
                                        <label class="control-label mb-1">- Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                        <div>
                                            <div class="form-group" runat="server" id="specific_education_required_wrapper">
                                                <webUI:TextField runat="server" ID="txt_specific_education_required" />
                                            </div>
                                            <asp:Label runat="server" ID="lbl_specific_education_required" />
                                        </div>
                                    </div>
                                    
                                    <div class="dg-1 mb-2">
                                        <label class="control-label mb-1">- Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                        <div>
                                            <div class="form-group" runat="server" id="bool_next_appointment_wrapper">
                                                <div class="custom-control custom-radio d-inline-block mr-2">
                                                    <input disabled-for="date_next_appointment_field" type="radio" id="rad_bool_next_appointment_true" runat="server" name="rad_bool_next_appointment" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_bool_next_appointment_true"><span class="text-primary">Calendar</span></label>
                                                </div>
                                                <div class="custom-control custom-radio d-inline-block mr-2">
                                                    <input disabled-for="text_next_appointment_field" type="radio" id="rad_bool_next_appointment_false" runat="server" name="rad_bool_next_appointment" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_bool_next_appointment_false"><span class="text-primary">Text</span></label>
                                                    <a href="javascript:void(0)" data-clear="rad_bool_next_appointment" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare1" />
                                                    </a>
                                                    <%--<asp:CustomValidator ID="CustomValidator3" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="Hẹn lần khám tới/ Next Appointment is required" CssClass="text-danger" OnServerValidate="bool_next_appointment_ServerValidate"></asp:CustomValidator>--%>
                                                </div>
                                                <div class="form-group date_next_appointment_field">
                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_date_next_appointment" Width="200px" />
                                                </div>
                                                <div class="form-group text_next_appointment_field w-n">
                                                    <webUI:TextField runat="server" id="txt_next_appointment" />
                                                </div>
                                            </div>
                                            <div>
                                                <asp:Label runat="server" ID="lbl_date_next_appointment" />
                                            </div>
                                        </div>
                                    </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-actions">
                                                <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                    <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

                                                    <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>


                                                    <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                    <asp:LinkButton runat="server" OnClientClick="btnPrint_Click(); return false;" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

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
                                                <asp:LinkButton OnClick="btnDelete_Click" OnClientClick="window.removeEventListener('beforeunload',comfirm_leave_page,true);" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
                                            </div>
                                        </ModalBody>
                                    </webUI:PopupModal>

                                    <Button:PopupShowDelay runat="server" id="PopupShowDelay" />

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
    <script src="../scripts/alertify.js"></script>

    <script type="text/javascript">
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        checkboxRadiobutton_init();

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            checkboxRadiobutton_init();
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

        function btnPrint_Click() {
            let printContent = document.querySelector("#printContent");
            printContent.setAttribute("style", "display: block");

            let total = Math.ceil(printContent.offsetHeight / 1096);

            for (let i = 1; i <= total; i++) {
                let div = document.createElement("div");
                div.setAttribute("class", "watermark page");
                div.setAttribute("style", "top: " + (1093 * (i - 1)) + "px;");
                div.setAttribute("data-page", "Page " + i + " of " + total);
                document.getElementById("print_content").append(div);

            }

            setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);
            window.print();
        }

        let vs_heart_rate = document.getElementById("vs_heart_rate");
        document.getElementById("prt_pulse").innerText = vs_heart_rate.innerText;
    </script>

</body>
</html>