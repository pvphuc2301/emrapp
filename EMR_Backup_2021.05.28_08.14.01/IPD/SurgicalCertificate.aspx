<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurgicalCertificate.aspx.cs" Inherits="EMR.SurgicalCertificate" ValidateRequest="false" %>





<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />

</head>
<body>
    <div class="cssclsNoScreen">
    <table class="report-container">
        <thead class="report-header">
            <tr>
                <th class="report-header-cell">
                    <div class="header-info" style="display: flex; align-items: center;">
                        <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
            <div style="flex-grow: 1; text-align: center;">
                <div style="color: #007297; font-size: 26.6667px;">GIẤY CHỨNG NHẬN ĐIỀU TRỊ</div>
            <div style="color: #e20e5a; font-size: 16.6667px;">MEDICAL CERTIFICATE - Mr Chung test</div>
            </div>
            <div style="width: 200px; text-align: center">
                <div>MAI MAI MÃI1</div>
                <div>05-10-1960 | Nữ</div>
                <webUI:Barcode runat="server" id="Barcode" Text="900000488" Width="200" Height="40" />
                <div>900000488</div>
            </div>

                    </div>
                    <div style="margin-bottom: 80px;">
                        <span style="width: 190px; border-bottom-style: solid; border-bottom-color: #e20e5a; border-bottom-width: 5px; display: inline-block; font-size: 26.6667px;"></span>
                        <span style="display: inline-block; border-bottom-style: solid; border-bottom-color: #007297; border-bottom-width: 5px; width: calc(100% - 191px); margin-left: -5px;"></span>
                    </div>
                </th>
            </tr>
        </thead>
        <tbody class="report-content">
            <tr>
                <td class="report-content-cell">
                    <div class="main" runat="server" id="print_content">

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
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->


    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <webUI:AmendReason runat="server" ID="txt_amendReason" />

                    <webUI:PatientInfo runat="server" ID="PatientInfo1" />

                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">SURGICAL CERTIFICATE</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Ngày nhập viện/ <span class="text-primary">Admisstion date: </span></label>
                                                <div runat="server" ID="lbl_admission_date" ></div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Ngày phẫu thuật/ <span class="text-primary">Procedure date:</span></label>
                                                <div runat="server" ID="lbl_procedure_date" ></div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Chẩn đoán trước phẫu thuật/ <span class="text-primary">Preoperative diagnosis:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_preo_diagnosis" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Phương pháp phẫu thuật/ <span class="text-primary">Name of surgery/procedure:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_name_of_procedure" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Cách thức phẫu thuật/ <span class="text-primary">Procedure narrative:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_proce_narrative" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Nhóm máu/ <span class="text-primary">BloodType:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_blood_type" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Yếu tố Rh/ <span class="text-primary">Rh:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_rh" />
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-actions mb-3">
                                            <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                            <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                            <asp:Button ID="btnDeleteModal" data-toggle="modal" data-target="#deleteDocumentModal" class="btn btn-danger" runat="server" Text="Delete" />

                                            <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                            <asp:Button ID="btnPrint" CssClass="btn btn-secondary" OnClientClick="Print()" runat="server" Text="Print" />

                                            <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />

                                            <div runat="server" id="messagePlaceHolder"></div>
                                        </div>

                                        <div class="modal fade" id="deleteDocumentModal" tabindex="-1" role="dialog" aria-labelledby="deleteDocumentModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="deleteDocumentModalLabel">Delete document</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p runat="server">Please provide reason for deletion</p>
                                                        <div class="form-group mb-2">
                                                            <webUI:TextField runat="server" ID="TextField1" />
                                                        </div>
                                                        <div class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <asp:Button runat="server" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnAmend" />
                    <asp:PostBackTrigger ControlID="btnCancel" />
                    <%--<asp:PostBackTrigger ControlID="btnSave" />
                    <asp:PostBackTrigger ControlID="btnComplete" />--%>
                </Triggers>
            </asp:UpdatePanel>
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
        function Print() {

        <% LoadDataToPrint(); %>
        window.print();
        }
    </script>
</body>
</html>

