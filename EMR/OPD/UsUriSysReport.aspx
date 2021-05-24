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


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    <webUI:PrintWindow runat="server" ID="PrintWindow">
        <PrintHeader>
            <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
            <div style="flex-grow: 1; text-align: center;">
                <div style="color: #007297; font-size: 26.6667px;">KẾT QUẢ SIÊU ÂM HỆ TIẾT NIỆU</div>
                <div style="color: #e20e5a; font-size: 16.6667px;">ULTRASOUND OF URINARY SYSTEM REPORT</div>
            </div>
            <div style="width: 200px; text-align: center">
                <div>MAI MAI MÃI1</div>
                <div>05-10-1960 | Nữ</div>
                <webUI:Barcode runat="server" id="Barcode" Text="900000488" Width="200" Height="40" />
                <div>900000488</div>
            </div>
        </PrintHeader>
        <PrintContent>

            <div class="row mb-2">
                <div class="col-6">
                    <webUI:Label runat="server" Title="Họ tên:" SubTitle="Full Name" />
                    <div class="d-inline-block ml-2 align-top">MAI MAI MAI</div>
                </div>
                <div class="col-6">
                    <webUI:Label runat="server" Title="PID:" />
                    <div class="d-inline-block ml-2 align-top">900000488</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <webUI:Label runat="server" Title="Chẩn đoán:" SubTitle="Diagnosis" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <span class="align-top h4">❖ </span>
                    <webUI:Label runat="server" Title="Thận trái" SubTitle="Left kidney" />
                    <div class="d-inline-block ml-2 align-top">Normal size, shape and location. Normal echogeneous of the parenchyma. No dilatation of pelvic cavity andureter. No stone seen.</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <span class="align-top h4">❖ </span>
                    <webUI:Label runat="server" Title="Thận phải:" SubTitle="Right kidney" />
                    <div class="d-inline-block ml-2 align-top">Normal size, shape and location. Normal echogeneous of the parenchyma. No dilatation of pelvic cavity andureter. No stone seen.</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <span class="align-top h4">❖ </span>
                    <webUI:Label runat="server" Title="Bàng quang:" SubTitle="Urinary bladder" />
                    <div class="d-inline-block ml-2 align-top">Nearly empty. No abnormal image visualized inside.</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <span class="align-top h4">❖ </span>
                    <webUI:Label runat="server" Title="Tuyến tiền liệt:" SubTitle="Prostate" />
                    <div class="d-inline-block ml-2 align-top">Measures of 47x36x43mm. The prostatic parenchyma is normal echogeneous. Presence of calcification in thecentre. The weight of prostate ~ 38gr.</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <span class="align-top h4">❖ </span>
                    <webUI:Label runat="server" Title="Nước tiểu tồn lưu:" SubTitle="Post void residual volume" />
                    <div class="d-inline-block ml-2 align-top">30 ml</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <webUI:Label runat="server" Title="KẾT LUẬN: " SubTitle="CONCLUSION" />
                    <div class="d-inline-block ml-2 align-top">Phì đại tuyến tiền liệt/Hypertrophy of the prostate gland.</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                    <webUI:Label runat="server" Title="ĐỀ NGHỊ: " SubTitle="RECOMMENDATION" />
                    <div class="d-inline-block ml-2 align-top">Kiểm tra PSA / PSA test</div>
                </div>
            </div>

            <div class="row">
                <div class="col-6">
                </div>
                <div class="col-6 mb-2">
                    <div>
                        <webUI:Signature runat="server" Title="Bác sĩ" SubTitle="Physician" FullName="HIS User">
                            <ItemTemplate>
                                <webUI:Date runat="server" Day="23" Month="5" Year="2021" />
                            </ItemTemplate>
                        </webUI:Signature>
                    </div>
                </div>
            </div>

        </PrintContent>
    </webUI:PrintWindow>

    <div class="cssclsNoPrint">
        <form method="post" action="#" id="form2" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
            <div class="scroll-sidebar h-100 w-100">
                <%--<asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                <asp:Panel runat="server" ID="messagePlaceHolder">
                    <webUI:AmendReason runat="server" ID="txt_amendReason" />
                </asp:Panel>
                <uc1:PatientInfo runat="server" ID="PatientInfo1" />

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="text-primary">ULTRASOUND OF URINARY SYSTEM REPORT</h4>
                                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                            </div>

                            <div class="card-body collapse show" id="collapseOne">
                                <div class="form-body">
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_diagnosis" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Thận trái/ <span class="text-primary">Left kidney:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_left_kidney" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Thận phải/ <span class="text-primary">Right kidney:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_right_kidney" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Bàng quang/ <span class="text-primary">Urinary bladder:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_urinary_bladder" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Tuyến tiền liệt/ <span class="text-primary">Prostate:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_prostate" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Nước tiểu tồn lưu/ <span class="text-primary">Post void residual volume:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_post_void_resi_volume" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_conclusion" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Đề nghị/ <span class="text-primary">Recommendation:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_recommendation" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-actions mb-3">
                                        <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                        <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                        <asp:Button ID="btnDeleteModal" data-toggle="modal" data-target="#deleteDocumentModal" class="btn btn-danger" runat="server" Text="Delete" />

                                        <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                        <asp:Button ID="btnPrint" OnClientClick="window.print()" CssClass="btn btn-secondary" runat="server" Text="Print" />

                                        <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                    </div>

                                    <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                        <ModalBody>
                                            <div class="text-center">
                                                <icon:ExclamationTriangle cssClass="text-danger" Width="80" Height="80" runat="server" />
                                                <h4 class="mt-4 mb-4">Delete document?</h4>
                                            </div>
                                            <div class="text-right">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <asp:Button runat="server" OnClick="btnDelete_Click" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                            </div>
                                        </ModalBody>
                                    </webUI:PopupModal>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--</ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnAmend" />
                        <asp:PostBackTrigger ControlID="btnCancel" />
                    </Triggers>
                </asp:UpdatePanel>--%>
            </div>
        </form>
    </div>

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>

    <script>
        console.log(document.querySelector("#RequiredFieldValidator").value, document.querySelector("#RequiredFieldValidator").value == true);

        if (document.querySelector("#RequiredFieldValidator").value) {
            if (!document.querySelector('input[name="rad_disc_reason_code"]:checked')) {
                document.querySelector("#rad_disc_reason_code_error").innerHTML = "Lý do xuất viện/ Discharge Reason is required.";
            }
        }
    </script>

</body>
</html>

