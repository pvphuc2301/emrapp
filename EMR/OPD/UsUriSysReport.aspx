<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UsUriSysReport.aspx.cs" Inherits="EMR.USUrinarySystemReport" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
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
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
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
                                    <div class="header-info" style="display: flex; align-items: center;">
                                        <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4>KẾT QUẢ SIÊU ÂM HỆ TIẾT NIỆU</h4>
                                            <h5>ULTRASOUND OF URINARY SYSTEM REPORT</h5>
                                        </div>
                                        <div>
                                            <webUI:Barcode runat="server" ID="prt_barcode" Width="120" Height="22" />
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

                                        <div class="d-grid" style="grid-template-columns: 2fr 1fr">
                                            <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="Họ tên" SubTitle="Full Name:" runat="server" />
                                                <p>
                                                    <asp:Label runat="server" CssClass="font-bold" ID="prt_fullname"></asp:Label>
                                                </p>
                                            </div>

                                            <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                                <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="PID:" runat="server" />
                                                <p>
                                                    <asp:Label runat="server" ID="prt_pid"></asp:Label>
                                                </p>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Title="Chẩn đoán/" SubTitle="Diagnosis:" runat="server" />
                                            <asp:Label runat="server" ID="prt_diagnosis"></asp:Label>
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" Order="❖" CssClass="text-inline" Title="Thận trái" SubTitle="Left kidney:" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_left_kidney"></asp:Label>
                                        </p>

                                        <webUI:PrtRowS1 FontBold="true" Order="❖" CssClass="text-inline" Title="Thận phải" SubTitle="Right kidney" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_right_kidney"></asp:Label>
                                        </p>

                                        <webUI:PrtRowS1 FontBold="true" Order="❖" CssClass="text-inline" Title="Bàng quang:" SubTitle="Urinary bladder" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_urinary_bladder"></asp:Label>
                                        </p>

                                        <webUI:PrtRowS1 FontBold="true" Order="❖" CssClass="text-inline" Title="Tuyến tiền liệt:" SubTitle="Prostate" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_prostate"></asp:Label>
                                        </p>


                                        <webUI:PrtRowS1 FontBold="true" Order="❖" CssClass="text-inline" Title="Nước tiểu tồn lưu:" SubTitle="Post void residual volume" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_post_void_resi_volume"></asp:Label>
                                        </p>


                                        <webUI:PrtRowS1 FontBold="true" Order="❖" CssClass="text-inline" Title="KẾT LUẬN: " SubTitle="CONCLUSION" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_conclusion"></asp:Label>
                                        </p>

                                        <webUI:PrtRowS1 FontBold="true" Order="❖" CssClass="text-inline" Title="ĐỀ NGHỊ: " SubTitle="RECOMMENDATION" runat="server" />
                                        <p style="margin-left: 13px;">
                                            <asp:Label runat="server" ID="prt_recommendation"></asp:Label>
                                        </p>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                            <span></span>
                                            <div class="text-center" style="break-inside: avoid;">
                                                <div>Ngày/ Date: 25-02-2021</div>
                                                <div class="font-bold">Bác sĩ/Physician</div>
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

                <div class="cssclsNoPrint">
                    <div style="overflow: scroll; height: 100vh; overflow-x: hidden;">

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
                        <uc1:PatientInfo runat="server" ID="PatientInfo1" />

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">US URINARY SYSTEM REPORT</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>

                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_diagnosis"></asp:Label>
                                                    </div>
                                                    <div class="form-group" runat="server" id="diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Thận trái/ <span class="text-primary">Left kidney:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_left_kidney"></asp:Label>
                                                    </div>
                                                    <div class="form-group" runat="server" id="left_kidney_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_left_kidney" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Thận phải/ <span class="text-primary">Right kidney:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_right_kidney"></asp:Label>
                                                    </div>
                                                    <div class="form-group" runat="server" id="right_kidney_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_right_kidney" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Bàng quang/ <span class="text-primary">Urinary bladder:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_urinary_bladder"></asp:Label>
                                                    </div>
                                                    <div class="form-group" runat="server" id="urinary_bladder_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_urinary_bladder" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Tuyến tiền liệt/ <span class="text-primary">Prostate:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_prostate"></asp:Label>
                                                    </div>
                                                    <div class="form-group" runat="server" id="prostate_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_prostate" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Nước tiểu tồn lưu/ <span class="text-primary">Post void residual volume:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_post_void_resi_volume"></asp:Label>
                                                    </div>
                                                    <div class="form-group" runat="server" id="post_void_resi_volume_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_post_void_resi_volume" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_conclusion"></asp:Label>
                                                    </div>
                                                    <div class="form-group" runat="server" id="conclusion_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_conclusion" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h5">Đề nghị/ <span class="text-primary">Recommendation:</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_recommendation"></asp:Label>
                                                    </div>
                                                    <div class="form-group" runat="server" id="recommendation_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_recommendation" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-actions">
                                                        <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                        <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

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
                                                        <h4 class="mt-4 mb-4">Delete document?</h4>
                                                    </div>
                                                    <div class="text-right">
                                                        <div class="btn btn-default waves-effect" data-dismiss="modal">Close</div>
                                                        <asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
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

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {

        }

    </script>
</body>
</html>

