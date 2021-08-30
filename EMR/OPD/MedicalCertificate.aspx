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
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Medical Certificate</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
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
                                            <h4>GIẤY CHỨNG NHẬN ĐIỀU TRỊ</h4>
                                            <h5>MEDICAL CERTIFICATE</h5>
                                        </div>
                                        <div style="width: 150px; text-align: center; font-size: 11px">
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
                                    <div class="main">

                                        <div style="margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT" runat="server" />
                                        </div>

                                        <div class="d-grid mt-1" style="grid-template-columns: 2fr 1fr; margin-bottom: 6px;">
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <webUI:PrtRowS1 FontBold="true" FixedWidth="155" Title="Họ tên bệnh nhân:" SubTitle="Patient's Name" runat="server" />
                                                <asp:Label runat="server" ID="prt_patient_name" />
                                            </div>

                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <webUI:PrtRowS1 FontBold="true" FixedWidth="95" Title="Ngày sinh:" SubTitle="DOB" runat="server" />
                                                <asp:Label runat="server" ID="prt_dob" />
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="155" Title="Giới tính:" SubTitle="Gender" runat="server" />
                                            <div style='display: grid; grid-template-columns: 1fr 1fr; width: 300px'>
                                                <div style='display: grid; grid-template-columns: auto 1fr;'>
                                                    <asp:Label runat="server" ID="prt_male" Text="❏"></asp:Label>
                                                    <span class='ml-1'>Nam <div class='text-primary'>Male</div></span>
                                                </div>
                                                <div style='display: grid; grid-template-columns: auto 1fr;'>
                                                    <asp:Label runat="server" ID="prt_female" Text="❏"></asp:Label>
                                                    <span class='ml-1'>Nữ <div class='text-primary'>Female</div></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 2fr 1fr; margin-bottom: 6px;">
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <webUI:PrtRowS1 FontBold="true" FixedWidth="155" Title="Khoa:" SubTitle="Dept" runat="server" Value="Khoa khám bệnh" />
                                                <asp:Label runat="server" ID="prt_dept" />
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: auto 1fr">
                                                <webUI:PrtRowS1 FontBold="true" FixedWidth="95" Title="Mã BN:" SubTitle="Patient ID" runat="server" />
                                                <asp:Label runat="server" ID="prt_pid" />
                                            </div>

                                        </div>

                                        <div style="margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Title="Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau:" SubTitle="Visited and received treatment at our hospital, with the following information" runat="server" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="210" Title="Ngày khám bệnh:" SubTitle="Date of visit" runat="server" />
                                            <asp:Label runat="server" ID="prt_date_of_visit" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="210" Title="Lý do đến khám:" SubTitle="Chief complaint" runat="server" />
                                            <asp:Label runat="server" ID="prt_chief_complain" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="210" Title="Tóm tắt bệnh sử:" SubTitle="History of present illness" runat="server" />
                                            <asp:Label runat="server" ID="prt_history_present_illness" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="210" Title="Tiền sử bệnh:" SubTitle="Past history" runat="server" />
                                            <asp:Label runat="server" ID="prt_past_history" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="210" Title="Đặc điểm lâm sàng:" SubTitle="Clinical findings" runat="server" />
                                            <asp:Label runat="server" ID="prt_clinical_findings" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="210" Title="Cận lâm sàng được chỉ định:" SubTitle="Para-clinical investigations" runat="server" />
                                            <asp:Label runat="server" ID="prt_para_clinical_investigations" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="210" Title="Chẩn đoán:" SubTitle="Diagnosis" runat="server" />
                                            <asp:Label runat="server" ID="prt_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="210" Title="Phương pháp và thuốc điều trị:" SubTitle="Treatment and medications" runat="server" />
                                            <asp:Label runat="server" ID="prt_treatment" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="210" Title="Thời gian điều trị:" SubTitle="Treatment period" runat="server" />
                                            <asp:Label runat="server" ID="prt_treatment_period" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px">
                                            <webUI:PrtRowS1 FontBold="true" FixedWidth="210" Title="Lời khuyên và theo dõi:" SubTitle="Recommendation and Follow-up" runat="server" />
                                            <asp:Label runat="server" ID="prt_recommendation" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr; grid-gap: 5px">
                                            <div></div>
                                            <div class="text-center" style="break-inside: avoid !important; page-break-inside: avoid !important">
                                                <div>Ngày/ <span class="text-primary">Date:</span> <asp:Label runat="server" ID="prt_date"></asp:Label></div>
                                                <div><span class="font-bold">BÁC SĨ ĐIỀU TRỊ</span></div>
                                                <div><span class="font-bold text-primary">ATTENDING DOCTOR</span></div>
                                                <div>(Họ tên, chữ ký & MSNV)</div>
                                                <div style="margin-bottom: 100px;"><span class="text-primary">(Full name, Signature & ID)</span></div>
                                                <asp:Label runat="server" ID="prt_signature_doctor"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell" style="font-size: 10px">
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
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0; border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Medical Certificate</li>
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
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">Medical Certificate</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                </div>
                                <div class="card-body">
                                    <div class="form-body collapse show" id="collapseOne">

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
                                            <div class="form-actions">
                                                <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

                                                <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>

                                                <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                <asp:LinkButton runat="server" OnClientClick="window.print(); return false;" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

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

                                    <webUI:PopupShowDelay runat="server" ID="PopupShowDelay" />
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
    <script src="../scripts/alertify.js"></script>

    <script type="text/javascript">
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
    </script>
</body>
</html>
