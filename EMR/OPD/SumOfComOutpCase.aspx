<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SumOfComOutpCase.aspx.cs" Inherits="EMR.SummaryOfComplexOutpatientCases" ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SUMMARY OF COMPLEX OUTPATIENT CASES</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info" style="display: flex; align-items: center;">
                                        <img src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>TÓM TẮT CA BỆNH NGOẠI TRÚ PHỨC TẠP</h4>
                                            <h5>SUMMARY OF COMPLEX OUTPATIENT CASES</h5>
                                        </div>
                                        <div>
                                            <webUI:Barcode runat="server" ID="prt_barcode" Width="120" Height="22" />
                                            <div>
                                                <asp:Label class="font-bold" ID="prt_patient_id" runat="server"></asp:Label>
                                            </div>
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

                                        <div class="d-grid" style="grid-template-columns: 450px 1fr">
                                            <div class="d-grid" style="grid-template-columns: 220px 1fr">
                                                <webUI:Label runat="server" Title="Họ tên bệnh nhân:" SubTitle="Patient's name" />
                                                <asp:Label CssClass="d-inline-block align-top" runat="server" ID="prt_fullname"></asp:Label>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 100px 1fr">
                                                <webUI:Label runat="server" Title="Ngày sinh:" SubTitle="DOB" />
                                                <asp:Label CssClass="d-inline-block align-top" runat="server" ID="prt_dob"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 450px 1fr">
                                            <div class="d-grid" style="grid-template-columns: 220px 100px 100px">
                                                <webUI:Label runat="server" Title="Giới tính:" SubTitle="Gender" />
                                                
                                                <div>
                                                    <span>Nam <br />Male</span>
                                                    <asp:Label CssClass="align-top" runat="server" ID="prt_male" Text="❏"></asp:Label>
                                                </div>

                                                <div>
                                                    <span>Nữ <br />Female</span>
                                                    <asp:Label CssClass="align-top" runat="server" ID="prt_female" Text="❏"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 100px 1fr">
                                                <webUI:Label runat="server" Title="Mã BN:" SubTitle="Patient ID" />
                                                <asp:Label CssClass="d-inline-block ml-2 align-top" runat="server" ID="prt_pid"></asp:Label>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr">
                                            <webUI:Label runat="server" Title="Ngày làm tóm tắt:" SubTitle="Date of summary report" />
                                                <asp:Label CssClass="d-inline-block ml-2 align-top" runat="server" ID="prt_date_of_summary_report"></asp:Label>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 100px 1fr">
                                            <webUI:Label runat="server" Title="Dị ứng:" SubTitle="Allergy" />
                                            <asp:Label CssClass="d-inline-block ml-2 align-top" runat="server" ID="prt_allergy"></asp:Label>
                                        </div>

                                        <div runat="server" id="prt_allergy_note_wrapper" class="d-grid" style="grid-template-columns: 220px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Nếu có, nêu rõ:" SubTitle="If yes, specif" runat="server" />
                                            <asp:Label CssClass="d-inline-block ml-2 align-top" runat="server" ID="prt_allergy_note" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr">
                                            <webUI:Label runat="server" Title="Các cận lâm sàng nổi bật:" SubTitle="Remarkable para-clinical tests" />
                                            <asp:Label CssClass="d-inline-block ml-2 align-top" runat="server" ID="prt_remarkable" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr">
                                            <webUI:Label runat="server" Title="Tiền sử bệnh:" SubTitle="Past history" />
                                                <asp:Label CssClass="d-inline-block ml-2 align-top" runat="server" ID="past_history" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr">
                                            <webUI:Label runat="server" Title="Các chuẩn đoán chính:" SubTitle="Significant diagnosis" />
                                            <asp:Label CssClass="d-inline-block ml-2 align-top" runat="server" ID="prt_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr">
                                            <webUI:Label runat="server" Title="Các thuốc đang dùng:" SubTitle="Current treatment and medications" />
                                            <asp:Label CssClass="d-inline-block ml-2 align-top" runat="server" ID="prt_cur_treatment" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr">
                                            <webUI:Label runat="server" Title="Kế hoạch điều trị:" SubTitle="Current care plans" />
                                            <asp:Label CssClass="d-inline-block ml-2 align-top" runat="server" ID="prt_cur_care_plans" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr">
                                            <webUI:Label runat="server" Title="Lời khuyên và theo dõi:" SubTitle="Recommendation and Follow-up" />
                                            <asp:Label CssClass="d-inline-block ml-2 align-top" runat="server" ID="prt_recommendation" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <div></div>
                                            <div class="text-center" style="break-inside: avoid;">
                                                <div class="font-bold">BÁC SĨ ĐIỀU TRỊ</div>
                                                <div>ATTENDING DOCTOR</div>
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

                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" Height="400">
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
            </Windows>
        </telerik:RadWindowManager>


                <div class="cssclsNoPrint">
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0; border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Summary Of Complex Outpatient Cases</li>
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
            </div>
        </div>
    </div>
</div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card mt-2">
                                    <div class="card-header">
                                        <h4 class="text-primary">SUMMARY OF COMPLEX OUTPATIENTS CASES</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body mb-4">

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="currentLog">
                                                        <span class="mr-2">You are viewing an old version of this document</span>
                                                        <asp:HyperLink OnLoad="LinkViewLastestVersion_Load" ID="LinkViewLastestVersion" CssClass="btn-link" Text="View Latest Version" runat="server" ></asp:HyperLink>
                                                    </div>
                                            
                                                    <div class="alert alert-info d-flex align-items-center">
                                                        <telerik:RadLabel runat="server" ID="RadLabel1">
            </telerik:RadLabel>
                                                        <a class="btn-link" href="#" onclick="showWindow()">View History</a>
                                                    </div>
                                                </div>
                                            </div>
<div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <label class="control-label mb-2 h5">Tình trạng dị ứng/ <span class="text-primary">Allergy profile:</span></label>
                                                </div>
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_allergy"></asp:Label>
                                                    <div>
                                                        <div runat="server" id="allergy_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_allergy_false"><span class="text-primary">Không/ </span>No</label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input type="radio" runat="server" id="rad_allergy_true" disabled-for="allery_field" name="rad_allergy" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                                    <icon:XSquare runat="server" ID="XSquare38" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 allery_field mb-2">
                                                            <asp:Label runat="server" ID="lbl_allergy_note"></asp:Label>
                                                            <div class="form-group" runat="server" id="allergy_note_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">Các cận lâm sàng nổi bật/ <span class="text-primary">Remarkable para-clinical tests:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_remarkable"></asp:Label>
                                                    <div class="form-group" runat="server" id="remarkable_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_remarkable" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">Tiền sử bệnh/ <span class="text-primary">Past history:</span></label>
                                                    </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_past_history"></asp:Label>
                                                    <div class="form-group" runat="server" id="past_history_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_past_history" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">Các chẩn đoán chính/<span class="text-primary">Significant diagnosis:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">Các thuốc đang dùng/<span class="text-primary">Current treatment and medications:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_cur_treatment"></asp:Label>
                                                    <div class="form-group" runat="server" id="cur_treatment_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_cur_treatment" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">Kế hoạch điều trị/<span class="text-primary">Current care plans:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_cur_care_plans"></asp:Label>
                                                    <div class="form-group" runat="server" id="cur_care_plans_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_cur_care_plans" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">Lời khuyên và theo dõi/<span class="text-primary">Recommendation and Follow-up:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_recommendation"></asp:Label>
                                                    <div class="form-group" runat="server" id="recommendation_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_recommendation" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-actions">
                                                        <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete"  CssClass="btn btn-primary waves-effect" >Complete</asp:LinkButton>

                                                        <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect" >Save</asp:LinkButton>

                                                        <%--<asp:LinkButton ValidationGroup="Group1" OnClick="btnDelete_Click" OnClientClick="window.removeEventListener('beforeunload',comfirm_leave_page,true);" ID="btnDelete" runat="server" CssClass="btn btn-primary waves-effect" >Delete</asp:LinkButton>--%>

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
                                                    <h4 class="mt-4 mb-4">Delete document?
                                                    </h4>
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
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);
        checkboxRadiobutton_init();

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            checkboxRadiobutton_init();
        }

        function showWindow() {
            var oWnd = $find("<%=RadWindow1.ClientID%>");
            oWnd.show();
        }

    </script>

</body>
</html>

