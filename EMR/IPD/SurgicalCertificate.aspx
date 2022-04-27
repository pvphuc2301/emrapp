<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurgicalCertificate.aspx.cs" Inherits="EMR.SurgicalCertificate" ValidateRequest="false" %>

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
<%@ Register Src="~/UserControls/PrintTemplate/Label1.ascx" TagPrefix="Button" TagName="Label1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtGender.ascx" TagPrefix="webUI" TagName="PrtGender" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature2.ascx" TagPrefix="webUI" TagName="Signature2" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtDate.ascx" TagPrefix="webUI" TagName="PrtDate" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="WebUI" TagName="PopupShowDelay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Surgical Certificate</title>
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
                                            <h4>GIẤY CHỨNG NHẬN PHẪU THUẬT</h4>
                                            <h5>SURGICAL CERTIFICATE</h5>
                                        </div>
                                        <div style="width: 150px; text-align: left; font-size: 11px">
                                            <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
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
                                        <div style="margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FixedLeft="13" Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT" runat="server" FontBold="true" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 2fr 1fr; margin-bottom: 6px;">
                                            <div class="d-grid" style="grid-template-columns: 160px 1fr">
                                                <webUI:PrtRowS1 FixedLeft="13" Title="Họ tên người bệnh:" FontBold="true" SubTitle="Patient's name" runat="server" />
                                                <div style="display: inline-block">
                                                    <asp:Label runat="server" ID="prt_fullname" />
                                                    <asp:Label runat="server" ID="prt_patient_name_e" />
                                                </div>
                                            </div>

                                            <div class="d-grid" style="grid-template-columns: 130px 1fr">
                                                <webUI:PrtRowS1 FontBold="true" Title="Ngày sinh:" SubTitle="DOB" runat="server" />
                                                <asp:Label runat="server" ID="prt_dob" />
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 2fr 1fr; margin-bottom: 6px;">
                                            <div class="d-grid" style="grid-template-columns: 160px 1fr">
                                                <webUI:PrtRowS1 FontBold="true" FixedLeft="13" Title="Giới tính:" SubTitle="Gender" runat="server" />
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
                                            <div class="d-grid" style="grid-template-columns: 130px 1fr">
                                                <webUI:PrtRowS1 FontBold="true" ID="PrtRowS1" Title="Mã người bệnh:" SubTitle="Patient ID" runat="server" />
                                                <asp:Label runat="server" ID="prt_vpid1" />
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FixedLeft="13" FontBold="true" Title="Địa chỉ:" SubTitle="Address" runat="server" />
                                            <div style="display: inline-block">
                                                <asp:Label runat="server" ID="prt_address" />
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_address_e" />
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="1." Title="Ngày nhập viện:" SubTitle="Admission Date" runat="server" />
                                            <asp:Label runat="server" ID="prt_admission_date" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="2." Title="Ngày phẫu thuật:" SubTitle="Procedure Date" runat="server" />
                                            <asp:Label runat="server" ID="prt_procedure_date" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="3." Title="Ngày xuất viện:" SubTitle="Discharge Date" runat="server" />
                                            <asp:Label runat="server" ID="prt_discharge_date" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="4." Title="Chẩn đoán phẫu thuật:" SubTitle="Surgical diagnosis" runat="server" />
                                            <asp:Label runat="server" ID="prt_preo_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="5." Title="Phương pháp phẫu thuật:" SubTitle="Name of surgery/ procedure" runat="server" />
                                            <asp:Label runat="server" ID="prt_name_of_procedure" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="6." Title="Cách thức phẫu thuật:" SubTitle="Procedure narrative" runat="server" />
                                            <asp:Label runat="server" ID="prt_proce_narrative" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="7." Title="Nhóm máu:" SubTitle="Blood type" runat="server" />
                                            <asp:Label runat="server" ID="prt_blood_type" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="8." Title="Yếu tố Rh:" SubTitle="Rh" runat="server" />
                                            <asp:Label runat="server" ID="prt_rh" />
                                        </div>

                                        <div class="d-grid mt-4" style="grid-template-columns: 1fr 1fr">
                                            <div class="text-center">
                                                <div><span class="font-bold">Ngày</span>/ <span class="text-primary">Date</span> __/__/20__</div>
                                                <div class="font-bold">TRƯỞNG KHOA</div>
                                                <div><span class="text-primary">HEAD OF DEPARTMENT</span></div>
                                                <div>(Họ tên, chữ ký & MSNV)</div>
                                                <div><span class="text-primary">(Name, signature & ID)</span></div>
                                            </div>
                                            <div class="text-center">
                                                <div><span class="font-bold">Ngày</span>/ <span class="text-primary">Date</span> __/__/20__</div>
                                                <div class="font-bold">TỔNG GIÁM ĐỐC</div>
                                                <div><span class="text-primary">CHIEF EXECUTIVE OFFICER</span></div>
                                                <div>(Họ tên, chữ ký & MSNV)</div>
                                                <div><span class="text-primary">(Name, signature & ID)</span></div>
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
                            <asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="LinkButton1" CssClass="btn btn-danger">Delete</asp:LinkButton>
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
                <telerik:RadWindow Height="130px" VisibleStatusbar="false" Width="220px" RenderMode="Lightweight" ID="RadWindow4" Title="Chọn ngôn ngữ" runat="server">
                    <ContentTemplate>
                        <div class="text-center" style="margin-top: 20px">
                            <asp:LinkButton runat="server" OnClientClick="printForm(true); return false;" ID="LinkButton2" CssClass="btn btn-secondary waves-effect">Tiếng Việt</asp:LinkButton>
                            <asp:LinkButton runat="server" OnClientClick="printForm(false); return false;" ID="LinkButton3" CssClass="btn btn-secondary waves-effect">Song ngữ</asp:LinkButton>
                        </div>
                    </ContentTemplate>
                </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>

                <div class="cssclsNoPrint">
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Surgical Certificate</li>
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
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">SURGICAL CERTIFICATE</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">

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
                                                <label class="control-label mb-2 h5">1. Ngày nhập viện/ <span class="text-primary">Admisstion date: </span></label>
                                                <asp:Label runat="server" ID="admission_date" />
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 h5">2. Ngày phẫu thuật/ <span class="text-primary">Procedure date:</span></label>
                                                <asp:Label runat="server" ID="procedure_date" />
                                            </div>
                                        </div>

                                        <div class="d-grid mb-4 gt-2-a">
                                            <label class="control-label mb-2 h5">3. Ngày xuất viện/ <span class="text-primary">Discharge date:</span></label>
                                            <div>
                                                <asp:Label runat="server" ID="lbl_discharge_date" />
                                                <span runat="server" id="discharge_date_wrapper">
                                                    <telerik:RadDatePicker runat="server" ID="dpk_discharge_date" Width="120px" />
                                                </span>
                                            </div>

                                            <label class="control-label mb-2 h5">4. Chẩn đoán trước phẫu thuật/ <span class="text-primary">Preoperative diagnosis:</span></label>

                                            <div>
                                                <asp:Label runat="server" ID="lbl_preo_diagnosis" />
                                                <div class="form-group" runat="server" id="preo_diagnosis_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_preo_diagnosis" />
                                                </div>
                                            </div>

                                            <label class="control-label mb-2 h5">5. Phương pháp phẫu thuật/ <span class="text-primary">Name of surgery/procedure:</span></label>
                                            <div>
                                                <asp:Label runat="server" ID="lbl_name_of_procedure" />
                                                <div class="form-group" runat="server" id="name_of_procedure_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_name_of_procedure" />
                                                </div>
                                            </div>

                                            <label class="control-label mb-2 h5">6. Cách thức phẫu thuật/ <span class="text-primary">Procedure narrative:</span></label>
                                            <div>
                                                <asp:Label runat="server" ID="lbl_proce_narrative" />
                                                <div class="form-group" runat="server" id="proce_narrative_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_proce_narrative" />
                                                </div>
                                            </div>

                                            <label class="control-label mb-2 h5">7. Nhóm máu/ <span class="text-primary">BloodType:</span></label>
                                            <div>
                                                <asp:Label runat="server" ID="lbl_blood_type" />
                                                <div class="form-group" runat="server" id="blood_type_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_blood_type" />
                                                </div>
                                            </div>

                                            <label class="control-label mb-2 h5">8. Yếu tố Rh/ <span class="text-primary">Rh:</span></label>
                                            <div>
                                                <asp:Label runat="server" ID="lbl_rh" />
                                                <div class="form-group" runat="server" id="rh_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_rh" />
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

                                                    <asp:LinkButton runat="server" OnClientClick="showWindow('RadWindow4'); return false;" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

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
                                        <WebUI:PopupShowDelay runat="server" ID="PopupShowDelay" />

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

        function printForm(isLocal) {
            let StyleDisplay = isLocal ? "none" : "";

            document.getElementById("prt_patient_name_e").style.display = StyleDisplay;
            document.getElementById("prt_address_e").style.display = StyleDisplay;

            var radWindow = $find('<%=RadWindow4.ClientID %>');
            radWindow.close();

            window.print();
        }

    </script>
</body>
</html>

