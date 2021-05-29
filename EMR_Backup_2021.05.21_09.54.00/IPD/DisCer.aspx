<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisCer.aspx.cs" Inherits="EMR.DischargeCertificate" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                                    <h4 class="text-primary">Discharge certificate</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row">
                                            <div class="col-md-6 mb-2">
                                                <label class="control-label mb-1">Khoa xuất viện/ <span class="text-primary">Discharge ward:</span></label>
                                                <select class="custom-select" id="ddbtn_disc_ward" runat="server"></select>
                                            </div>
                                            <div class="col-md-6 mb-2 pt-2 pb-2" style="border: 1px solid #ddd; border-radius: 4px;">
                                                <label class="control-label mb-1">BHYT/ <span class="text-primary">HealthInsurance:</span></label>
                                                <div class="form-group mb-3" style="width: 300px">
                                                    <aih:TextField runat="server" ID="txt_no_health_insurance" />
                                                </div>

                                                <label class="control-label mb-1">Giá trị từ/ <span class="text-primary">Valid from: </span></label>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker runat="server" ID="dpk_valid_from" Width="200px" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1"><span class="text-primary">Discharge date time:</span></label>
                                                <div class="form-group" style="width: 300px">
                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_disc_date_time" Width="235px" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán/ <span class="text-primary">Diagnosis:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Phương pháp điều trị/ <span class="text-primary">Treatment:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_disc_medication" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Lời dặn của bác sĩ/ <span class="text-primary">Doctor’s recommendation:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_followup_instruc" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Ghi chú/ <span class="text-primary">Notes:</span></label>
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_notes" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1"><span class="text-primary">Signature Date:</span></label>
                                                <div class="form-group">
                                                    <telerik:RadDatePicker runat="server" ID="dpk_signature_date" Width="200px" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-actions mb-3">
                                            <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                            <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                            <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>

                                            <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                            <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />

                                            <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />

                                            
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
                                                            <aih:TextField runat="server" ID="TextField1" />
                                                        </div>
                                                        <div class="text-danger" runat="server">Nội dung lý do xóa phải trên 3 ký tự</div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <asp:Button runat="server" OnClick="btnDelete_Click" Text="Delete" ID="btnDelete" class="btn btn-danger" />
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

    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>

</body>
</html>
