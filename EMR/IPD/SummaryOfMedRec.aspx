﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SummaryOfMedRec.aspx.cs" Inherits="EMR.SummaryOfMedicalReport" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>

<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="aih" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label1.ascx" TagPrefix="webUI" TagName="Label1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/Message.ascx" TagPrefix="aih" TagName="Message" %>
<%@ Register Src="~/icons/X.ascx" TagPrefix="aih" TagName="X" %>
<%@ Register Src="~/UserControls/TextField1.ascx" TagPrefix="aih" TagName="TextField1" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="aih" TagName="PopupShowDelay" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
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
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="print_page" runat="server" style="font-family: 'Times New Roman' !important; width: 210mm; overflow: hidden">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div runat="server" id="print_header" style="width: 210mm; height: 2.5cm">
                                        <div style="display: flex; align-items: center; padding: 0 18px">
                                            <img style="width: 180px" src="../images/AIH_PI_FULL.png" />
                                            <div style="text-align: center; align-self: center; flex-grow: 1">
                                                <div><span style="font-size: 12pt; font-weight: bold">TÓM TẮT BỆNH ÁN</span></div>
                                                <div class="en"><i style="font-size: 11pt; font-weight: bold">SUMMARY OF MEDICAL REPORT</i></div>
                                            </div>
                                            <div style="width: 150px; text-align: center; font-size: 11px">
                                                <asp:Label CssClass="d-block" runat="server" ID="prt_fullname"></asp:Label>
                                                <asp:Label class="d-block" CssClass="d-block" runat="server" ID="prt_dob"></asp:Label>
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
                                    <div class="main" runat="server" id="print_content" style="font-size: 12pt; margin: 0 1.5cm 0 2cm; line-height: 1.5">
                                        <div style="display: grid; grid-template-columns: 1fr 1fr;">
                                            <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                                <div></div>
                                                <div><span class="font-bold">Từ ngày/ <span class="en">From: </span></span><asp:Label CssClass="align-top" runat="server" ID="prt_form_date" /></div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                                <div></div>
                                                <div>
                                                    <div><span class="font-bold">Đến ngày/ <span class="en">To: </span></span><asp:Label CssClass="align-top" runat="server" ID="prt_to_date" /></div>
                                                </div>
                                            </div>
                                        </div>
                                        <%--  --%>
                                        <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                            <div></div>
                                            <div><span class="font-bold">Khoa/ <span class="en">Department: </span></span>Khoa Khám Bệnh<asp:Label runat="server" Visible="false" ID="prt_department"></asp:Label></div>
                                        </div>
                                        <%--  --%>
                                        <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                            <div></div>
                                            <div><span class="font-bold">Lý do nhập viện/ <span class="en">Chief complaint: </span></span><asp:Label runat="server" ID="prt_chief_complaint"></asp:Label></div>
                                        </div>
                                        <%--  --%>
                                        <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                            <div></div>
                                            <div><span class="font-bold">Chẩn đoán/ <span class="en">Diagnosis: </span></span><asp:Label runat="server" ID="prt_diagnosis"></asp:Label></div>
                                        </div>
                                        <%--  --%>
                                        <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                            <div>1.</div>
                                            <div>
                                                <div><span class="font-bold">Diễn biến lâm sàng trong đợt điều trị/ <span class="en">Clinical Evolution: </span></span></div>
                                                <div><asp:Label runat="server" ID="prt_clinical_evolution"></asp:Label></div>
                                            </div>
                                        </div>
                                        <%--  --%>
                                        <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                            <div>2.</div>
                                            <div>
                                                <div><span class="font-bold">KQ xét nghiệm cận lâm sàng/ <span class="en">Results of para clinical tests: </span></span></div>
                                                <div><asp:Label runat="server" ID="prt_result_para_clinical"></asp:Label></div>
                                            </div>
                                        </div>
                                        <%--  --%>
                                        <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                            <div>3.</div>
                                            <div>
                                                <div><span class="font-bold">Quá trình điều trị/ <span class="en">Treatment: </span></span></div>
                                                <div><asp:Label runat="server" ID="prt_treatment"></asp:Label></div>
                                            </div>
                                        </div>
                                        <%--  --%>
                                        <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                            <div>4.</div>
                                            <div>
                                                <div><span class="font-bold">Đánh giá kết quả/ <span class="en">Evaluation of treatment: </span></span></div>
                                                <div><asp:Label runat="server" ID="prt_eval_treatment"></asp:Label></div>
                                            </div>
                                        </div>
                                        <%--  --%>
                                        <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                            <div>5.</div>
                                            <div>
                                                <div><span class="font-bold">Hướng dẫn điều trị tiếp và tiên lượng/ <span class="en">Continuous treatment and prognosis: </span></span></div>
                                                <div><asp:Label runat="server" ID="prt_treatment_prognosis"></asp:Label></div>
                                            </div>
                                        </div>
                                        <%--  --%>
                                        <div>&nbsp;</div>
                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <div class="text-center" style=" page-break-inside: avoid !important;">
                                                <div>Ngày/ <span class="en">Date:</span><asp:Label runat="server" ID="prt_signature_date1"></asp:Label></div>
                                                <div class="font-bold">Trưởng khoa (ký và ghi rõ họ tên)</div>
                                                <div class="en">The Head of Department's signature and full name</div>
                                            </div>
                                            <div class="text-center" style="break-inside: avoid;">
                                                <div>Ngày/ <span class="en">Date:</span><asp:Label runat="server" ID="prt_signature_date2"></asp:Label></div>
                                                <div class="font-bold">Bác sĩ điều trị (ký và ghi rõ họ tên)</div>
                                                <div class="en">Physician's signature and full name</div>
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

                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" MaxHeight="400">
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

                <div class="cssclsNoPrint">
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Summary Of Medical Report</li>
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
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">SUMMARY OF MEDICAL REPORT</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="currentLog">
                                                        <span class="mr-2">You are viewing an old version of this document</span>
                                                        <asp:HyperLink OnLoad="LinkViewLastestVersion_Load" ID="LinkViewLastestVersion" CssClass="btn-link" Text="View Latest Version" runat="server" ></asp:HyperLink>
                                                    </div>
                                            
                                                    <div class="alert alert-info d-flex align-items-center">
                                                        <telerik:RadLabel runat="server" ID="RadLabel1"></telerik:RadLabel>
                                                        <a class="btn-link" href="#" onclick="showWindow('RadWindow1')">View History</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label" style="width: 120px">Từ ngày/ <span class="text-primary">From</span><span class="text-danger">*</span></label>
                                                    <asp:Label runat="server" ID="lbl_form_date"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="form_date_wrapper">
                                                        <telerik:RadDatePicker runat="server" ID="dpk_form_date" Width="120px" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Group1" runat="server" ControlToValidate="dpk_form_date" ErrorMessage="Từ ngày/ From is required"
                                                            CssClass="text-danger" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label" style="width: 120px">Đến ngày/ <span class="text-primary">To:</span><span class="text-danger">*</span><span class="text-danger"></span></label>
                                                    <asp:Label runat="server" ID="lbl_to_date"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="to_date_wrapper">
                                                        <telerik:RadDatePicker runat="server" ID="dpk_to_date" Width="120px" />
                                                        <asp:RequiredFieldValidator ID="pass" runat="server" ControlToValidate="dpk_to_date" ValidationGroup="Group1" ErrorMessage="Đến ngày/ To is required"
                                                            CssClass="text-danger" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">

                                                    <label class="control-label mb-2 h5">Lý do nhập viện/ <span class="text-primary">Chief complaint:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_chief_complaint"></asp:Label>
                                                    <div class="form-group " runat="server" id="chief_complaint_wrapper">
                                                        <aih:TextField runat="server" ID="txt_chief_complaint" />

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_diagnosis"></asp:Label>
                                                    <div class="form-group " runat="server" id="diagnosis_wrapper">
                                                        <aih:TextField runat="server" ID="txt_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">1. Diễn biến lâm sàng trong đợt điều trị/ <span class="text-primary">Clinical Evolution:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_clinical_evolution"></asp:Label>
                                                    <div class="form-group " runat="server" id="clinical_evolution_wrapper">
                                                        <aih:TextField runat="server" ID="txt_clinical_evolution" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">2. KQ xét nghiệm cận lâm sàng/ <span class="text-primary">Results of para clinical tests:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_result_para_clinical"></asp:Label>
                                                    <div class="form-group " runat="server" id="result_para_clinical_wrapper">
                                                        <aih:TextField runat="server" ID="txt_result_para_clinical" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">3. Quá trình điều trị/ <span class="text-primary">Treatment:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_treatment"></asp:Label>
                                                    <div class="form-group " runat="server" id="treatment_wrapper">
                                                        <aih:TextField runat="server" ID="txt_treatment" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">4. Đánh giá kết quả/ <span class="text-primary">Evaluation of treatment:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_eval_treatment"></asp:Label>
                                                    <div class="form-group " runat="server" id="eval_treatment_wrapper">
                                                        <aih:TextField runat="server" ID="txt_eval_treatment" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 h5">5. Hướng dẫn điều trị tiếp và tiên lượng/ <span class="text-primary">Continuous treatment and prognosis:</span></label>
                                                </div>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_treatment_prognosis"></asp:Label>
                                                    <div class="form-group " runat="server" id="treatment_prognosis_wrapper">
                                                        <aih:TextField runat="server" ID="txt_treatment_prognosis" />
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


