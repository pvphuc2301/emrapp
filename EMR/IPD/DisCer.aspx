<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisCer.aspx.cs" Inherits="EMR.DischargeCertificate" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/DateTime.ascx" TagPrefix="webUI" TagName="DateTime" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="aih" TagName="Line" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label1.ascx" TagPrefix="webUI" TagName="Label1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="aih" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature2.ascx" TagPrefix="aih" TagName="Signature2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
    <%--139--%>
    <div class="cssclsNoScreen" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
        <table class="report-container">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info" style="display: flex; align-items: center;">
                            <div class="text-center">
                                <div>SỞ Y TẾ TP.HCM</div>
                                <div class="text-primary">HCMC DOH</div>
                                <div>BỆNH VIỆN QUỐC TẾ MỸ</div>
                                <div class="text-primary">AMERICAN INTERNATIONAL HOSPITAL</div>
                                <div class="font-bold">KHOA/<span class="text-primary">DEPARTMENT:</span></div>
                            </div>
                            <div style="flex-grow: 1; text-align: center">
                                <div class="font-bold">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</div>
                                <div class="text-primary">SOCIALIST REPUBLIC OF VIETNAM</div>
                                <div class="font-bold">Độc lập - Tự do - Hạnh phúc</div>
                                <div class="text-primary">Independence – Freedom – Happiness</div>
                            </div>
                            <div>
                                <div>MS: 01/BV-01</div>
                                <div>Số lưu trữ/ <span class="text-primary">No:</span></div>
                                <div>Mã Y tế/ <span class="text-primary">PID:</span>
                                    <asp:Label runat="server" ID="prt_pid" /></div>
                            </div>
                        </div>
                    </th>
                </tr>
            </thead>

            <tbody class="report-content">
                <tr>
                    <td class="report-content-cell">
                        <div class="main">
                            <div class="text-center font-bold h4 mt-4 mb-4">
                                <div>GIẤY RA VIỆN</div>
                                <div class="text-primary">DISCHARGE CERTIFICATE</div>
                            </div>

                            <div class="d-grid" style="grid-template-columns: 1fr 275px 139px">
                                <div>
                                    <webUI:Label runat="server" SubTitle="Patient's Name" Title="Họ tên người bệnh:" />
                                    <asp:Label runat="server" ID="prt_patient_name" />
                                </div>

                                <div>
                                    <webUI:Label runat="server" SubTitle="DOB" Title="Ngày tháng năm sinh:" />
                                    <asp:Label runat="server" ID="prt_dob" />
                                </div>

                                <div>
                                    <webUI:Label runat="server" SubTitle="Gender" Title="Giới tính:" />
                                    <asp:Label runat="server" ID="prt_gender" />
                                </div>
                            </div>

                            <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                <div>
                                    <webUI:Label runat="server" SubTitle="Nationality" Title="Dân tộc:" />
                                    <asp:Label CssClass="align-top" runat="server" ID="prt_nationality" />
                                </div>
                                <div>
                                    <webUI:Label runat="server" SubTitle="Occupation" Title="Nghề nghiệp:" />
                                    <asp:Label CssClass="align-top" runat="server" ID="prt_occupation" />
                                </div>
                            </div>

                            <div class="d-grid" style="grid-template-columns: 1fr 1fr 1fr 1fr">
                                <div>
                                    <webUI:Label runat="server" SubTitle="Health Insurance" Title="BHYT:" />
                                </div>
                                <div>
                                    <webUI:Label runat="server" SubTitle="Valid from" Title="Giá trị từ:" />
                                    <asp:Label CssClass="align-top" runat="server" ID="prt_valid_from" />
                                </div>
                                <div>
                                    <webUI:Label runat="server" SubTitle="to" Title="đến:" />
                                    <asp:Label CssClass="align-top" runat="server" ID="Label5" />
                                </div>
                                <div>
                                    <webUI:Label runat="server" SubTitle="No" Title="Số:" />
                                    <asp:Label CssClass="align-top" runat="server" ID="prt_no_health_insurance" />
                                </div>
                            </div>

                            <div class="d-grid" style="grid-template-columns: 170px 1fr">
                                <webUI:Label runat="server" SubTitle="Address" Title="Địa chỉ:" />
                                <asp:Label CssClass="align-top" runat="server" ID="prt_address" />
                            </div>

                            <div class="d-grid" style="grid-template-columns: 170px 1fr">
                                <webUI:Label runat="server" SubTitle="Admitted time" Title="Vào viện lúc:" />
                                <webUI:DateTime runat="server" ID="prt_" />
                            </div>

                            <div class="d-grid" style="grid-template-columns: 170px 1fr">
                                <webUI:Label runat="server" SubTitle="Discharged time" Title="Ra viện lúc:" />
                                <webUI:DateTime runat="server" ID="prt_disc_date_time" />
                            </div>

                            <div class="d-grid" style="grid-template-columns: 170px 1fr">
                                <webUI:Label runat="server" SubTitle="Diagnosis" Title="Chẩn đoán:" />
                                <asp:Label CssClass="align-top" runat="server" ID="prt_diagnosis" />
                            </div>

                            <div class="d-grid">
                                <webUI:Label runat="server" SubTitle="Treatment" Title="Phương pháp điều trị:" />
                                <asp:Label CssClass="align-top" runat="server" ID="Label11" />
                            </div>

                            <div class="d-grid">
                                <webUI:Label runat="server" SubTitle="Doctor’s recommendation" Title="Lời dặn của bác sĩ:" />
                                <asp:Label CssClass="align-top" runat="server" ID="Label12" />
                            </div>

                            <div class="d-grid">
                                <webUI:Label runat="server" SubTitle="Notes" Title="Ghi chú:" />
                                <asp:Label CssClass="align-top" runat="server" ID="prt_notes" />
                            </div>

                            <div class="d-grid grid-template-2 mt-4">
                                <aih:Signature2 runat="server" ID="prt_signature1" Title="TỔNG GIÁM ĐỐC/ CEO" SubTitle="Họ tên, chữ ký, MSNV/ Full name, Signature, ID" />
                                <aih:Signature2 runat="server" ID="prt_signature2" Title="TRƯỞNG KHOA/ HEAD OF DEPARTMENT" SubTitle="Họ tên, chữ ký, MSNV/ Full name, Signature, ID" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>

            <tfoot class="report-footer">
                <tr>
                    <%--<td class="report-footer-cell" style="font-size: 10px">
                        <img style="width: 100%" src="../images/bottomline.png" />
                        <div class="footer-info">
                            <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                            <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Quận 2, Tp.HCM</div>
                            <div>Tel: 028 3910 9999</div>
                            <div>www.aih.com.vn</div>
                        </div>
                    </td>
                    <td class="report-footer-space"></td>--%>
                </tr>
            </tfoot>
        </table>
    </div>

    <div class="cssclsNoPrint">
        <form method="post" action="#" id="form2" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
            <div class="scroll-sidebar h-100 w-100">
                <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <aih:AmendReason runat="server" ID="txt_amendReason" />
                        </asp:Panel>

                        <uc1:PatientInfo runat="server" ID="PatientInfo1" />

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">Discharge certificate</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">

                                            <div class="row">
                                                <div class="col-md-12 mb-2">
                                                    <label class="control-label mb-1 ml-2">
                                                        <span class="mb-2">Khoa xuất viện/ <span class="text-primary">Discharge ward:</span></span>
                                                        <select class="custom-select" id="ddbtn_disc_ward" style="width: unset;" runat="server"></select>
                                                    </label>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="d-inline-block">
                                                        <label class="control-label mb-1 me-2">BHYT/ <span class="text-primary">HealthInsurance:</span></label>
                                                        <div class="form-group mb-2 d-inline-block" style="width: 300px">
                                                            <aih:TextField runat="server" ID="txt_no_health_insurance" />
                                                        </div>
                                                    </div>
                                                    <div class="d-inline-block">
                                                        <label class="control-label mb-1">Giá trị từ/ <span class="text-primary">Valid from: </span></label>
                                                        <div class="d-inline-block">
                                                            <telerik:RadDatePicker Width="120px" ID="dpk_valid_from" runat="server"></telerik:RadDatePicker>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 mr-2"><span class="text-primary">Discharge date time:</span></label>
                                                    <div class="d-inline-block">
                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_disc_date_time" Width="204px" />
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

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 mr-2"><span class="text-primary">Signature Date:</span></label>
                                                    <div class="d-inline-block">
                                                        <telerik:RadDatePicker Width="120px" ID="dpk_signature_date" runat="server"></telerik:RadDatePicker>
                                                    </div>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <div class="form-actions">
                                                    <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                                    <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>

                                                    <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                    <asp:Button OnClientClick="window.print()" ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />

                                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                                </div>
                                            </fieldset>

                                            <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                                <ModalBody>
                                                    <div class="text-center">
                                                        <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                        <h4 class="mt-4 mb-4">Delete document?
                                                        </h4>
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
</body>
</html>