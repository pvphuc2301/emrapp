<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniMedAssForNeoInp.aspx.cs" Inherits="EMR.IniMedAssForNeoInp" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <aih:AmendReason runat="server" ID="txt_amendReason" />
                    <uc1:PatientInfo runat="server" ID="PatientInfo1" />
                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">INITIAL MEDICAL ASSESSMENT FOR NEONATAL INPATIENTS</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a></div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">I. Admission reason/<span class="text-primary">Lí do nhập viện:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField1" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">II. Medical History/ <span class="text-primary">Bệnh sử:</span></label>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">1.Current Medical History/ <span class="text-primary">Bệnh sử hiện tại:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField2" />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Current medications/ <span class="text-primary">Thuốc đang sử dụng:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField3" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">2. Antecedent Medical History/ <span class="text-primary">Tiền sử bệnh:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField4" />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">a. Delivery/ <span class="text-primary">Quá trình sanh:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField5" />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">b. Postnatal nutrition/ <span class="text-primary">Chế độ dinh dưỡng:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField6" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">3. Maternal medical history/ <span class="text-primary">Tiền sử sản khoa:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField7" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">III. Physical Examination/ <span class="text-primary">Khám bệnh:</span></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Cân nặng hiện tại/ <span class="text-primary">Weight:</span></label>
                                                <div class="form-group w-4">
                                                    <input id="Text1" runat="server" class="form-control text-right" />
                                                    <span class="append">Gr</span>                                                 </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Chiều dài/ <span class="text-primary">Length:</span></label>
                                                <div class="form-group w-5">
                                                    <input id="Text2" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>                                                 </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Head Circumference/ <span class="text-primary">Vòng đầu:</span></label>
                                                <div class="form-group w-4">
                                                    <input id="txt_vs_weight" runat="server" class="form-control text-right" />
                                                    <span class="append">Kg</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">HR (per minute)/ <span class="text-primary">Mạch:</span></label>
                                                <div class="form-group w-5">
                                                    <input id="Text4" runat="server" class="form-control text-right" />
                                                    <span class="append">lần/phút</span>                                                 </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">RR (per minute)/ <span class="text-primary">Nhịp thở:</span></label>
                                                <div class="form-group w-4">
                                                    <input id="Text5" runat="server" class="form-control text-right" />
                                                    <span class="append">/phút</span>                                                 </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField8" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">IV. Laboratory indications and results/ <span class="text-primary">Chỉ định và kết quả xét nghiệm</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField9" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">V. Conclusion/ <span class="text-primary">Kết luận</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField11" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Initial diagnosis/ <span class="text-primary">Chẩn đoán ban đầu</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField12" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Differential diagnosis/ <span class="text-primary">Chẩn đoán phân biệt</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField13" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Associated conditions/ <span class="text-primary">Bệnh kèm theo</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField14" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">VI. Treatment Plan/  <span class="text-primary">Kế hoạch điều trị</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField15" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">VII. Discharge plan/ <span class="text-primary">Kế hoạch xuất viện</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="TextField16" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions mb-3">
                                            <asp:Button ID="btnComplete" class="btn btn-primary" runat="server" Text="Complete" />
                                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" />
                                            <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                            <asp:Button ID="btnAmend" class="btn btn-secondary" runat="server" Text="Amend" />
                                            <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                            <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                            <div runat="server" id="messagePlaceHolder"></div>
                                        </div>
                                        <div id="myModal" class="modal fade" role="dialog">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title">Delete document</h4>
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p runat="server">Please provide reason for deletion</p>
                                                        <div class="form-group mb-2">
                                                            <aih:TextField runat="server" ID="TextField17" />
                                                        </div>
                                                        <div class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                    <%--<asp:PostBackTrigger ControlID="btnSave" />                     <asp:PostBackTrigger ControlID="btnComplete" />--%>                 </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>
</html>
