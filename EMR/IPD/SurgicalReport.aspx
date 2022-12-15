<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurgicalReport.aspx.cs" ValidateRequest="false" Inherits="EMR.IPD.SurgicalReport" %>

<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <style>
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
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div runat="server" id="print_header" style="width: 210mm; height: 2.5cm">
                                        <div style="display: flex; align-items: center; padding: 0 18px">
                                            <img style="width: 180px" src="../images/AIH_PI_FULL.png" />
                                            <div style="text-align: center; align-self: center; flex-grow: 1">
                                                <div><span style="font-size: 12pt; font-weight: bold">TƯỜNG TRÌNH PHẪU THUẬT</span></div>
                                                <div class="en"><i style="font-size: 11pt; font-weight: bold">SURGICAL REPORT</i></div>
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
                                    <div class="main" runat="server" id="print_content" style="font-size: 12pt; margin: 0 1.5cm 0 2cm; line-height: 1.5">
                                        <div style="display: grid; grid-template-columns: 18px 325px 1fr">
                                            <div>1.</div>
                                            <div>
                                                <div class="font-bold">Họ tên bệnh nhân:</div>
                                                <div class="en">Patient's name</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_FullName" /></div>
                                        </div>
                                        <%--  --%>
                                        <div style="display: grid; grid-template-columns: 18px 325px 1fr">
                                            <div>2.</div>
                                            <div>
                                                <div class="font-bold">Ngày nhập viện:</div>
                                                <div class="en">Admission Date</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_admission_date" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 18px 325px 1fr">
                                            <div>3.</div>
                                            <div>
                                                <div class="font-bold">Ngày phẫu thuật:</div>
                                                <div class="en">Procedure Date</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_procedure_date" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 18px 1fr">
                                            <div></div>
                                            <div style="display: grid; grid-template-columns: 1fr 1fr;">
                                                <div style="display: grid; grid-template-columns: 120px 1fr;">
                                                    <div>
                                                        <div class="font-bold">Giờ bắt đầu:</div>
                                                        <div class="en">Start time</div>
                                                    </div>
                                                    <asp:Label CssClass="align-top" runat="server" ID="prt_start_time" />
                                                </div>
                                                <div style="display: grid; grid-template-columns: 120px 1fr;">
                                                    <div>
                                                        <div class="font-bold">Giờ kết thúc:</div>
                                                        <div class="en">Finish time</div>
                                                    </div>
                                                    <asp:Label CssClass="align-top" runat="server" ID="prt_finish_time" />
                                                </div>
                                            </div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 18px 325px 1fr">
                                            <div>4.</div>
                                            <div>
                                                <div class="font-bold">Chẩn đoán trước phẫu thuật:</div>
                                                <div class="en">Preoperative diagnosis</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_preo_diagnosis" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 18px 325px 1fr">
                                            <div>5.</div>
                                            <div>
                                                <div class="font-bold">Chẩn đoán sau phẫu thuật:</div>
                                                <div class="en">Postoperative diagnosis</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_post_diagnosis" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 18px 325px 1fr">
                                            <div>6.</div>
                                            <div>
                                                <div class="font-bold">Phương pháp phẫu thuật:</div>
                                                <div class="en">Procedure</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_name_procedure" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 18px 325px 1fr">
                                            <div>7.</div>
                                            <div>
                                                <div class="font-bold">Phương pháp vô cảm:</div>
                                                <div class="en">Anesthesia</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_anesthesia" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 18px 325px 1fr">
                                            <div>8.</div>
                                            <div>
                                                <div class="font-bold">Bác sĩ phẫu thuật:</div>
                                                <div class="en">Surgeon</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_surgeon" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 18px 325px 1fr">
                                            <div>9.</div>
                                            <div>
                                                <div class="font-bold">Phụ mổ:</div>
                                                <div class="en">Assistant surgeon</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_assistant_surgeon" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 24px 325px 1fr">
                                            <div>10.</div>
                                            <div>
                                                <div class="font-bold">Bác sĩ gây mê:</div>
                                                <div class="en">Anesthesiologist</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_anesthesiologist" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 24px 325px 1fr">
                                            <div>11.</div>
                                            <div>
                                                <div class="font-bold">Điều dưỡng gây mê:</div>
                                                <div class="en">Anesthetic nurse</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_anesthetic_nurse" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 24px 325px 1fr">
                                            <div>12.</div>
                                            <div>
                                                <div class="font-bold">Điều dưỡng vòng trong:</div>
                                                <div class="en">Scrub nurse</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_scrub_nurse" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 24px 325px 1fr">
                                            <div>13.</div>
                                            <div>
                                                <div class="font-bold">Điều dưỡng vòng ngoài:</div>
                                                <div class="en">Circulating nurse</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_circulating_nurse" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 24px 325px 1fr">
                                            <div>14.</div>
                                            <div>
                                                <div class="font-bold">Ước lượng lượng máu mất:</div>
                                                <div class="en">Estimated bloodloss</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_estimated_bloodloss" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 24px 325px 1fr">
                                            <div>15.</div>
                                            <div>
                                                <div class="font-bold">Giải phẫu bệnh:</div>
                                                <div class="en">Biopsy pathology</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_biopsy_pathology" /></div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 24px 325px 1fr">
                                            <div>16.</div>
                                            <div>
                                                <div class="font-bold">Biến chứng:</div>
                                                <div class="en">Complications</div>
                                            </div>
                                            <div><asp:Label CssClass="align-top" runat="server" ID="prt_complications" /></div>
                                        </div>
                                        <div style="page-break-inside: avoid !important;">
                                            <div class="text-center" style="margin-bottom: 260px;">
                                                <div class="font-bold">LƯỢC ĐỒ PHẪU THUẬT</div>
                                                <div class="en">PROCEDURE CHART</div>
                                            </div>
                                            <div>
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_procedure_chart" />
                                            </div>
                                        </div>
                                        <div style="page-break-inside: avoid !important;">
                                            <div class="text-center">
                                                <div class="font-bold">TƯỜNG TRÌNH PHẪU THUẬT</div>
                                                <div class="en">PROCEDURE NARRATIVE</div>
                                            </div>
                                            <div>
                                                <asp:Label CssClass="align-top" runat="server" ID="prt_procedure_narrative" />
                                            </div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 6px">
                                            <div></div>
                                            <div class="text-center" style="break-inside: avoid !important; page-break-inside: avoid !important">
                                                <div><span class="font-bold">Họ tên, chữ ký & MSNV của Bác sĩ</span></div>
                                                <div class="en">Doctor’s full name, signature & ID</div>
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
                      <li>Surgical Report</li>
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
                                    <h4 class="text-primary">SURGICAL REPORT</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                </div>
                                <div class="card-body">
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

                                        <div class="row">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">3. Ngày phẫu thuật/ <span class="text-primary">Procedure Date:</span></label>
                                            </div>
                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_procedure_date"></asp:Label>
                                                <div runat="server" id="procedure_date_wrapper">
                                                    <telerik:RadDatePicker ID="dpk_procedure_date" runat="server"></telerik:RadDatePicker>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <div>
                                                        <label class="control-label mb-1">Giờ bắt đầu/ <span class="text-primary">Procedure Date:</span></label>
                                                        <asp:Label runat="server" ID="lbl_start_time"></asp:Label>

                                                        <div class="form-group d-inline-block" runat="server" id="start_time_wrapper">
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txt_start_time"></asp:TextBox>
                                                        </div>

                                                        <label class="control-label mb-1">Giờ kết thúc/ <span class="text-primary">Finish time:</span></label>
                                                        <asp:Label runat="server" ID="lbl_finish_time"></asp:Label>

                                                        <div class="form-group  d-inline-block" runat="server" id="finish_time_wrapper">
                                                            <asp:TextBox runat="server" CssClass="form-control" ID="txt_finish_time"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">4. Chẩn đoán trước phẫu thuật/ <span class="text-primary">Preoperative diagnosis:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_preo_diagnosis"></asp:Label>
                                                <div class="form-group" runat="server" id="preo_diagnosis_wrapper">
                                                    <webUI:TextField runat="server" id="txt_preo_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">5. Chẩn đoán sau phẫu thuật/ <span class="text-primary">Postoperative diagnosis:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_post_diagnosis"></asp:Label>
                                                <div class="form-group" runat="server" id="post_diagnosis_wrapper">
                                                    <webUI:TextField runat="server" id="txt_post_diagnosis" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">6. Phương pháp phẫu thuật/ <span class="text-primary">Procedure:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_name_procedure"></asp:Label>
                                                <div class="form-group" runat="server" id="name_procedure_wrapper">
                                                    <webUI:TextField runat="server" id="txt_name_procedure" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">7. Phương pháp vô cảm/ <span class="text-primary">Type of Anesthesia:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_anesthesia"></asp:Label>
                                                <div class="form-group" runat="server" id="anesthesia_wrapper">
                                                    <webUI:TextField runat="server" id="txt_anesthesia" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">8. Bác sĩ phẫu thuật/ <span class="text-primary">Surgeon:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_surgeon"></asp:Label>
                                                <div class="form-group" runat="server" id="surgeon_wrapper">
                                                    <webUI:TextField runat="server" id="txt_surgeon" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">9. Phụ mổ/ <span class="text-primary">Assistant surgeon:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_assistant_surgeon"></asp:Label>
                                                <div class="form-group" runat="server" id="assistant_surgeon_wrapper">
                                                    <webUI:TextField runat="server" id="txt_assistant_surgeon" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">10. Bác sĩ gây mê hồi sức/ <span class="text-primary">Anesthesiologist:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_anesthesiologist"></asp:Label>
                                                <div class="form-group" runat="server" id="anesthesiologist_wrapper">
                                                    <webUI:TextField runat="server" id="txt_anesthesiologist" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">11. Điều dưỡng gây mê/ <span class="text-primary">Anesthetic nurse:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_anesthetic_nurse"></asp:Label>
                                                <div class="form-group" runat="server" id="anesthetic_nurse_wrapper">
                                                    <webUI:TextField runat="server" id="txt_anesthetic_nurse" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">12. Điều dưỡng vòng trong/ <span class="text-primary">Scrub nurse:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_scrub_nurse"></asp:Label>
                                                <div class="form-group" runat="server" id="scrub_nurse_wrapper">
                                                    <webUI:TextField runat="server" id="txt_scrub_nurse" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">13. Điều dưỡng vòng ngoài/ <span class="text-primary">Circulating nurse:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_circulating_nurse"></asp:Label>
                                                <div class="form-group" runat="server" id="circulating_nurse_wrapper">
                                                    <webUI:TextField runat="server" id="txt_circulating_nurse" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">14. Ước lượng lượng máu mất/ <span class="text-primary">Estimated bloodloss:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_estimated_bloodloss"></asp:Label>
                                                <div class="form-group" runat="server" id="estimated_bloodloss_wrapper">
                                                    <webUI:TextField runat="server" id="txt_estimated_bloodloss" />

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">15. Giải phẫu bệnh/ <span class="text-primary">Biopsy pathology:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_biopsy_pathology"></asp:Label>
                                                <div class="form-group" runat="server" id="biopsy_pathology_wrapper">
                                                    <webUI:TextField runat="server" id="txt_biopsy_pathology" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 font-bold">16. Biến chứng/ <span class="text-primary">Complications:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_complications"></asp:Label>
                                                <div class="form-group" runat="server" id="complications_wrapper">
                                                    <webUI:TextField runat="server" id="txt_complications" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">LƯỢC ĐỒ PHẪU THUẬT/ <span class="text-primary">PROCEDURECHART</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_procedure_chart"></asp:Label>
                                                <div class="form-group" runat="server" id="procedure_chart_wrapper">
                                                    <webUI:TextField runat="server" id="txt_procedure_chart" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">TƯỜNG TRÌNH PHẪU THUẬT/ <span class="text-primary">PROCEDURE NARRATIVE</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a">
                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_procedure_narrative"></asp:Label>
                                                <div class="form-group" runat="server" id="procedure_narrative_wrapper">
                                                    <webUI:TextField runat="server" id="txt_procedure_narrative" />
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

                                        <WebUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
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
                                        </WebUI:PopupModal>

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
