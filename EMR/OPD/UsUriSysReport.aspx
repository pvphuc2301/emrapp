<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsUriSysReport.aspx.cs" Inherits="EMR.USUrinarySystemReport" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>US URINARY SYSTEM REPORT</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info">
                                        <img src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>KẾT QUẢ SIÊU ÂM HỆ TIẾT NIỆU</h4>
                                            <h5>ULTRASOUND OF URINARY SYSTEM REPORT</h5>
                                        </div>
                                        <div style="width: 150px; text-align: left; font-size: 11px">
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
                                    <div class="main" runat="server" id="print_content">

                                        <div class="d-grid" style="grid-template-columns: 2fr 1fr; margin-bottom: 6px;">
                                            <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="Họ tên" SubTitle="Full Name:" runat="server" />
                                                <div>
                                                    <asp:Label runat="server" CssClass="font-bold" ID="prt_fullname"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="PID:" runat="server" />
                                                <div>
                                                    <asp:Label runat="server" ID="prt_pid"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px; text-align:justify; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true"  Title="Chẩn đoán/Diagnosis:" runat="server" />
                                            <asp:Label runat="server" ID="prt_diagnosis"></asp:Label>
                                        </div>

                                        <div style="margin-bottom: 6px;">

                                        <webUI:PrtRowS1 FontBold="true" Order="❖"  Title="Thận trái/Left kidney:" runat="server" />
                                        </div>
                                        
                                        <div style="margin-left: 13px; text-align:justify; margin-bottom: 6px;">
                                            <asp:Label runat="server" ID="prt_left_kidney"></asp:Label>
                                        </div>

                                        <div style="margin-bottom: 6px;">

                                        <webUI:PrtRowS1 FontBold="true" Order="❖"  Title="Thận phải/Right kidney:" runat="server" />
                                        </div>
                                        
                                        <div style="margin-left: 13px; text-align:justify; margin-bottom: 6px;">
                                            <asp:Label runat="server" ID="prt_right_kidney"></asp:Label>
                                        </div>

                                        <div style="margin-bottom: 6px;">

                                        <webUI:PrtRowS1 FontBold="true" Order="❖"  Title="Bàng quang/Urinary bladder:" runat="server" />
                                        </div>
                                        
                                        <div style="margin-left: 13px; text-align:justify; margin-bottom: 6px;">
                                            <asp:Label runat="server" ID="prt_urinary_bladder"></asp:Label>
                                        </div>

                                        <div style="margin-bottom: 6px;">

                                        <webUI:PrtRowS1 FontBold="true" Order="❖" Title="Tuyến tiền liệt/Prostate:" runat="server" />
                                        </div>

                                        <div style="margin-left: 13px; text-align:justify; margin-bottom: 6px;">
                                            <asp:Label runat="server" ID="prt_prostate"></asp:Label>
                                        </div>

                                        <div class="d-grid  mb-2" style="grid-template-columns: auto 1fr; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="❖"  Title="Nước tiểu tồn lưu/Post void residual volume:" runat="server" />
                                            <asp:Label runat="server" ID="prt_post_void_resi_volume"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-2" style="grid-template-columns: auto 1fr; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Title="KẾT LUẬN/CONCLUSION:" runat="server" />
                                            <asp:Label runat="server" ID="prt_conclusion"></asp:Label>
                                        </div>

                                        <div class="d-grid mb-2" style="grid-template-columns: auto 1fr; margin-bottom: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" Title="ĐỀ NGHỊ/RECOMMENDATION:"  runat="server" />
                                            <asp:Label runat="server" ID="prt_recommendation"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <span></span>
                                            <div class="text-center" style="break-inside: avoid;">
                                                <asp:Label runat="server" ID="prt_signature_date"></asp:Label>
                                                <div style="margin-bottom: 100px;" class="font-bold">Bác sĩ/Physician</div>

                                                <asp:Label runat="server" ID="prt_signature_doctor"></asp:Label>
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
                                    <h4 class="mt-4 mb-4">Denied!</h4>
                                </div>

                                <div class="d-grid no-block justify-content-end">
                                    <%--<asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="LinkButton1" CssClass="btn btn-danger">Delete</asp:LinkButton>--%>
                                </div>
                            </ContentTemplate>
                        </telerik:RadWindow>
            </Windows>
        </telerik:RadWindowManager>

                <div class="cssclsNoPrint">
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>US Urinary System Report</li>
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
                                        <h4 class="text-primary">US URINARY SYSTEM REPORT</h4>
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
                                                    <label class="control-label h5">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                                    <div class="d-grid gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_diagnosis"></asp:Label>
                                                        <div class="form-group" runat="server" id="diagnosis_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_diagnosis" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Thận trái/ <span class="text-primary">Left kidney:</span></label>
                                                    <div class="d-grid gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_left_kidney"></asp:Label>
                                                        <div class="form-group" runat="server" id="left_kidney_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_left_kidney" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Thận phải/ <span class="text-primary">Right kidney:</span></label>
                                                    <div class="d-grid gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_right_kidney"></asp:Label>
                                                        <div class="form-group" runat="server" id="right_kidney_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_right_kidney" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Bàng quang/ <span class="text-primary">Urinary bladder:</span></label>
                                                    <div class="d-grid gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_urinary_bladder"></asp:Label>
                                                        <div class="form-group" runat="server" id="urinary_bladder_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_urinary_bladder" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Tuyến tiền liệt/ <span class="text-primary">Prostate:</span></label>
                                                    <div class="d-grid gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_prostate"></asp:Label>
                                                        <div class="form-group" runat="server" id="prostate_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_prostate" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Nước tiểu tồn lưu/ <span class="text-primary">Post void residual volume:</span></label>
                                                    <div class="d-grid gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_post_void_resi_volume"></asp:Label>
                                                        <div class="form-group" runat="server" id="post_void_resi_volume_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_post_void_resi_volume" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                                    <div class="d-grid gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_conclusion"></asp:Label>
                                                        <div class="form-group" runat="server" id="conclusion_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_conclusion" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Đề nghị/ <span class="text-primary">Recommendation:</span></label>
                                                    <div class="d-grid gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" ID="lbl_recommendation"></asp:Label>
                                                        <div class="form-group" runat="server" id="recommendation_wrapper">
                                                            <webUI:TextField runat="server" ID="txt_recommendation" />
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
                document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

    </script>
</body>
</html>

