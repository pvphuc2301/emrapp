<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniMedAssForNeoInp.aspx.cs" Inherits="EMR.IniMedAssForNeoInp"
    ValidateRequest="false" %>

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
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <style>
        @page {
            margin-top: 10px;
        }
        #print_content {
		    line-height: initial !important;
	    }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="print_page" runat="server" style="font-family: 'Times New Roman' !important; width: 210mm; overflow: hidden">
                    <table class="report-container">
                        <thead class="report-header" >
                            <tr>
                                <th class="report-header-cell">
                                    <div runat="server" id="print_header" style="width: 210mm; height: 2.5cm">
                                        <div style="display: flex; align-items: center; padding: 0 18px">
                                            <img style="width: 180px" src="../images/AIH_PI_FULL.png" />
                                            <div style="text-align: center; align-self: center; flex-grow: 1">
                                                <div><span style="font-size: 12pt; font-weight: bold">BỆNH ÁN SƠ SINH NỘI TRÚ</span></div>
                                                <div class="en"><i style="font-size: 11pt; font-weight: bold">INITIAL MEDICAL ASSESSMENT FOR NEONATAL INPATIENTS</i></div>
                                            </div>
                                            <div style="width: 130px; text-align: left; font-size: 11px">
                                                <asp:Label runat="server" ID="prt_fullname" CssClass="d-block"></asp:Label>
                                                <asp:Label runat="server" ID="prt_dob" CssClass="d-block"></asp:Label>
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
                                    <div class="main" runat="server" id="print_content" style="font-size: 12pt; margin: 0 1.5cm 0 2cm; line-height: 1.5;">
                                        
                                        <div class="d-grid mb-1" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="I. " Title="Admission reason:" SubTitle="Lí do nhập viện" runat="server" />
                                            <asp:Label runat="server" ID="prt_admission_reason"></asp:Label>
                                        </div>

                                        <div class="mb-1">
                                            <webUI:PrtRowS1 FontBold="true" Order="II. " Title="Medical History:" SubTitle="Bệnh sử" runat="server" />
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="1. " Title="Current Medical History:" SubTitle="Bệnh sử hiện tại" runat="server" />
                                            <asp:Label runat="server" ID="prt_cur_med_history"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="❖ " Title="Current medications:" SubTitle="Thuốc đang sử dụng" runat="server" />
                                            <asp:Label runat="server" ID="prt_cur_medication"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="2. " Title="Antecedent Medical History:" SubTitle="Tiền sử bệnh" runat="server" />
                                            <asp:Label runat="server" ID="Label1"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="❖ " Title="Delivery:" SubTitle="Quá trình sanh" runat="server" />
                                            <asp:Label runat="server" ID="prt_delivery"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="❖ " Title="Postnatal nutrition:" SubTitle="Chế độ dinh dưỡng" runat="server" />
                                            <asp:Label runat="server" ID="prt_post_nutrition"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="3. " Title="Maternal medical history:" SubTitle="Tiền sử sản khoa" runat="server" />
                                            <asp:Label runat="server" ID="prt_mater_med_history"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="III. " Title="Physical Examination:" SubTitle="Khám bệnh" runat="server" />
                                            <asp:Label runat="server" ID="Label2"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: 200px 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="● " Title="Weight:" SubTitle="Cân nặng hiện tại (gr)" runat="server" />
                                            <asp:Label runat="server" ID="prt_exam_weight"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: 200px 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="● " Title="Length:" SubTitle="Chiều dài (cm)" runat="server" />
                                            <asp:Label runat="server" ID="prt_exam_length"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: 200px 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="● " Title="Head Circumference:" SubTitle="Vòng đầu (cm)" runat="server" />
                                            <asp:Label runat="server" ID="prt_exam_head_circum"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: 200px 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="● " Title="HR (per minute):" SubTitle="Mạch (lần/phút)" runat="server" />
                                            <asp:Label runat="server" ID="prt_exam_hr"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: 200px 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="● " Title="RR (per minute):" SubTitle="Nhịp thở/phút" runat="server" />
                                            <asp:Label runat="server" ID="prt_exam_rr"></asp:Label>
                                        </div>

                                        <div class="mb-1">
                                            <asp:Label runat="server" ID="prt_physical_exam"></asp:Label>
                                        </div>

                                        <div class="mb-1">
                                            <webUI:PrtRowS1 FontBold="true" Order="IV. " Title="Laboratory indications and results:" SubTitle="Chỉ định và kết quả xét nghiệm" runat="server" />
                                        </div>
                                        
                                        <div class="mb-1" style="margin-left: 20px">
                                            <asp:Label runat="server" ID="prt_laboratory"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: auto 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="V. " Title="Conclusion:" SubTitle="Kết luận" runat="server" />
                                            <asp:Label runat="server" ID="Label3"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: 200px 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="● " Title="Initial diagnosis:" SubTitle="Chẩn đoán ban đầu" runat="server" />
                                            <asp:Label runat="server" ID="prt_initial_diagnosis"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: 200px 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="● " Title="Differential diagnosis:" SubTitle="Chẩn đoán phân biệt" runat="server" />
                                            <asp:Label runat="server" ID="prt_diff_diagnosis"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-1" style="grid-template-columns: 200px 1fr">
                                            <webUI:PrtRowS1 FontBold="true" Order="● " Title="Associated conditions:" SubTitle="Bệnh kèm theo" runat="server" />
                                            <asp:Label runat="server" ID="prt_associated_conditions"></asp:Label>
                                        </div>

                                        <div class="mb-1">
                                            <webUI:PrtRowS1 FontBold="true" Order="VI. " Title="Treatment Plan:" SubTitle="Kế hoạch điều trị" runat="server" />
                                        </div>

                                        <div class="mb-1" style="margin-left: 20px">
                                            <asp:Label runat="server" ID="prt_treatment_plan"/>
                                        </div>
                                        
                                        <div class="mb-1">
                                            <webUI:PrtRowS1 FontBold="true" Order="VII. " Title="Discharge plan:" SubTitle="Kế hoạch xuất viện" runat="server" />
                                        </div>

                                        <div class="mb-1" style="margin-left: 20px">
                                            <asp:Label runat="server" ID="prt_discharge_plan"/>
                                        </div>
                                        
                                        <div class="d-grid mt-2" style="grid-template-columns: 1fr 1fr; grid-gap: 5px">
                                            <div></div>
                                            <div class="text-center" style="break-inside: avoid !important; page-break-inside: avoid !important">
                                                <div><span style="font-size: 14.5px; font-family: Tahoma" class="font-bold">Họ tên, chữ ký & MSNV của Bác sĩ</span></div>
                                                <div><span style="font-size: 14.5px; font-family: Tahoma" class="text-primary"><i>Doctor’s full name, signature & ID</i></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>

                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell" runat="server" id="print_footer" style="height: 2cm; width: 210mm">
                                    <div style="margin-left: -18px"><img style="width: 210mm" src="../images/ExcellentCare.png" /></div>
                                    <div class="footer-info" style="padding: 0 18px">
                                        <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                                        <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Tp. Thủ Đức, Tp.HCM</div>
                                        <div>Tel: 028 3910 9999</div>
                                        <div>www.aih.com.vn</div>
                                    </div>
                                </td>
                                <td class="report-footer-space" runat="server" id="print_footer_space" style="height: 2cm; width: 210mm"></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" Height="400">
            <Windows>
                <telerik:RadWindow CssClass="NoIconUrl" VisibleStatusbar="false" MinWidth="600" RenderMode="Lightweight" ID="RadWindow1" Title="Version History" runat="server">
                    <ContentTemplate>
                        <telerik:RadGrid ShowHeader="false" ID="RadGrid1" runat="server" AllowSorting="true" OnItemCommand="RadGrid1_ItemCommand">
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="document_id,document_log_id">
                                <Columns>
                                    <telerik:GridTemplateColumn>
                                        <ItemTemplate>
                                            <telerik:RadLabel runat="server" ID="RadLabel1" Text='<%# GetHistoryName(Eval("status"),Eval("created_name_e"), Eval("created_date_time"), Eval("modified_name_e"), Eval("modified_date_time"), Eval("amend_reason")) %>'></telerik:RadLabel>
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
                <telerik:RadWindow CssClass="NoIconUrl" RenderMode="Lightweight" ID="RadWindow2" Title="Warning" runat="server">
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
                <telerik:RadWindow CssClass="NoIconUrl" RenderMode="Lightweight" ID="RadWindow3" Title="Warning" runat="server">
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

                <div class="cssclsNoPrint" style="overflow: scroll; height: 100vh; overflow-x: hidden;">
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Initial Medical Assessment For Neonatal Inpatients</li>
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
                            <div class="col-md-12 cssclsNoScreen">
                                <asp:Label runat="server" ID="lblPid"></asp:Label>
                            </div>
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
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">INITIAL MEDICAL ASSESSMENT FOR NEONATAL INPATIENTS</h4>
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
                                                <label class="control-label mb-2 h5">II. Medical History/ <span class="text-primary">Bệnh sử:</span></label>
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
                                                <label class="control-label mb-2">Current medications/ <span class="text-primary">Thuốc đang sử dụng:</span></label>
                                                <asp:Label runat="server" ID="lbl_cur_medication"></asp:Label>
                                                <div class="form-group" runat="server" id="cur_medication_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_cur_medication" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">2. Antecedent Medical History/ <span class="text-primary">Tiền sử bệnh:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a mb-2">
                                                <label class="control-label">a. Delivery/ <span class="text-primary">Quá trình sanh:</span></label>
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
                                                    <input id="txt_exam_hr" runat="server" class="form-control text-right" />
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

                                                    <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>

                                                    <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                    <asp:LinkButton runat="server" OnClientClick="btnPrint_Click()" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>
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

        InputFilter("data-type='number'");
        formGroup_init();

        checkboxRadiobutton_init();
        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            formGroup_init();
            InputFilter("data-type='number'");
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

        let physical_exam = document.getElementById("lbl_physical_exam").innerText;

        function btnPrint_Click() {
            let printContent = document.querySelector("#print_content");
            printContent.style.display = "block";

            let total = Math.ceil(printContent.offsetHeight / 1096);

            for (let i = 1; i <= total; i++) {
                let div = document.createElement("div");
                div.setAttribute("class", "watermark page");
                div.setAttribute("style", "top: " + (1093 * (i - 1)) + "px;");
                //div.setAttribute("data-page", "Page " + i + " of " + total);
                document.getElementById("print_content").append(div);
                
            }

            setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);
            window.print();
        }
    </script>
</body>
</html>
