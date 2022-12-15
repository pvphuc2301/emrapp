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
<%@ Register Src="~/UserControls/UserControlPatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>US URINARY SYSTEM REPORT</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <%--<link href="../styles/print.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <style>
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
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />

        <asp:UpdatePanel ID="uplPrintPage" runat="server">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="print_page" runat="server">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div runat="server" id="print_header">
                                        <div style="display: flex; align-items: center; padding: 0 18px">
                                            <img style="width: 180px" src="../images/AIH_PI_FULL.png" />
                                            <div style="text-align: center; align-self: center; flex-grow: 1">
                                                <div><span style="font-size: 12pt; font-weight: bold">KẾT QUẢ SIÊU ÂM HỆ TIẾT NIỆU</span></div>
                                                <div class="en"><i style="font-size: 11pt; font-weight: bold">ULTRASOUND OF URINARY SYSTEM REPORT</i></div>
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
                                    <div class="main" runat="server" id="print_content">
                                        <div style="display: grid; grid-template-columns: 2fr 1fr; margin-bottom: 6px;">
                                            <div><span style="font-weight: bold">Họ tên</span>/ <span class="en">Full Name: </span><asp:Label runat="server" CssClass="font-bold" ID="prt_fullname"></asp:Label></div>
                                            <div><span style="font-weight: bold">PID: </span><asp:Label runat="server" ID="prt_pid"></asp:Label></div>
                                        </div>
                                        <div><span style="font-weight: bold">Chẩn đoán</span>/ <span class="en">Diagnosis: </span><asp:Label runat="server" ID="prt_diagnosis"></asp:Label></div>
                                        <div style="display: grid; grid-template-columns: auto 1fr; margin-bottom: 6px;">
                                            <div>❖</div>
                                            <div>
                                                <div><span style="font-weight: bold">Thận trái</span>/ <span class="en">Left kidney: </span></div>
                                                <asp:Label runat="server" ID="prt_left_kidney"></asp:Label>
                                            </div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: auto 1fr; margin-bottom: 6px;">
                                            <div>❖</div>
                                            <div>
                                                <div><span style="font-weight: bold">Thận phải</span>/ <span class="en">Right kidney: </span></div>
                                                <asp:Label runat="server" ID="prt_right_kidney"></asp:Label>
                                            </div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: auto 1fr; margin-bottom: 6px;">
                                            <div>❖</div>
                                            <div>
                                                <div><span style="font-weight: bold">Bàng quang</span>/ <span class="en">Urinary bladder: </span></div>
                                                <asp:Label runat="server" ID="prt_urinary_bladder"></asp:Label>
                                            </div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: auto 1fr; margin-bottom: 6px;">
                                            <div>❖</div>
                                            <div>
                                                <div><span style="font-weight: bold">Tuyến tiền liệt</span>/ <span class="en">Prostate: </span></div>
                                                <asp:Label runat="server" ID="prt_prostate"></asp:Label>
                                            </div>
                                        </div>
                                        <div style="display: grid; grid-template-columns: auto 1fr; margin-bottom: 6px;">
                                            <div>❖</div>
                                            <div>
                                                <div><span style="font-weight: bold">Nước tiểu tồn lưu</span>/ <span class="en">Post void residual volume: </span></div>
                                                <asp:Label runat="server" ID="prt_post_void_resi_volume"></asp:Label>
                                            </div>
                                        </div>
                                        <div><span style="font-weight: bold">KẾT LUẬN</span>/ <span class="en">CONCLUSION: </span><asp:Label runat="server" ID="prt_conclusion"></asp:Label></div>
                                        <div><span style="font-weight: bold">ĐỀ NGHỊ</span>/ <span class="en">RECOMMENDATION: </span><asp:Label runat="server" ID="prt_recommendation"></asp:Label></div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <span></span>
                                            <div class="text-center" style="break-inside: avoid;">
                                                <div>Ngày/ <span class="en">Date: </span><asp:Label runat="server" ID="prt_signature_date"></asp:Label></div> 
                                                <div style="margin-bottom: 100px;" class="font-bold">Bác sĩ/ <span class="en">Physician</span></div>
                                                <asp:Label runat="server" ID="prt_signature_doctor"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot class="report-footer">
                            <tr>
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

        <div class="cssclsNoPrint">
            <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;">
                <li><asp:LinkButton runat="server" ID="btnHome" OnClick="RedirectToPatientSummary" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
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
                                            <%-- Update 08/10/2022 --%>
                                            <div class="form-actions" style="display: flex; gap: 6px">
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
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
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel2">
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
        <%--function select_print_language() {
            var oWnd = $find("<%=rwndPrint.ClientID %>");
            oWnd.show();
        }--%>
    </script>

    <script type="text/javascript">
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        function beforeAsyncPostBack()
        {
        
        }

        function afterAsyncPostBack()
        {

        }
    </script>
</body>
</html>

