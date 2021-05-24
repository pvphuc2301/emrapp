<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisCer.aspx.cs" Inherits="EMR.DischargeCertificate" ValidateRequest="false" %>

<%@ Register Assembly="Asp.Net.Web.UI" Namespace="Asp.Net.Web.UI" TagPrefix="webUI" %>

<%@ Register Assembly="Bootstrap.Icons" Namespace="Bootstrap.Icons" TagPrefix="Icons" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/DateTime.ascx" TagPrefix="webUI" TagName="DateTime" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>



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
        <PrintTitle>
            <div style="color: #007297; font-size: 26.6667px;">GIẤY RA VIỆN</div>
            <div style="color: #e20e5a; font-size: 16.6667px;">DISCHARGE CERTIFICATE</div>
        </PrintTitle>

        <PrintContent>
            
            <div class="row">
                <div class="col-6">
                    <div class="d-inline-block">
                        <label class="font-bold d-block mb-0 h4">Họ tên người bệnh:</label>
                        Patient's Name
                    </div>
                    <div class="d-inline-block ml-2 align-top">MAI MAI MAI</div>
                </div>
                <div class="col-6">
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Ngày tháng năm sinh:</label>
                            DOB
                        </div>
                        <div class="d-inline-block ml-2 align-top">04-10-1960</div>
                    </div>
                
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Giới tính:</label>
                            Gender
                        </div>
                        <div class="d-inline-block ml-2 align-top">Nam</div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-6">
                    <div class="d-inline-block">
                        <label class="font-bold d-block mb-0 h4">Dân tộc:</label>
                        Nationality
                    </div>
                    <div class="d-inline-block ml-2 align-top">Việt Nam</div>
                </div>
                <div class="col-6">
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Nghề nghiệp:</label>
                            Occupation
                        </div>
                        <div class="d-inline-block ml-2 align-top">Không biết</div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">BHYT:</label>
                            Health Insurance
                        </div>
                        <div class="d-inline-block ml-2 align-top"></div>
                    </div>
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Giá trị từ:</label>
                            Valid from
                        </div>
                        <div class="d-inline-block ml-2 align-top"></div>
                    </div>
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">đến:</label>
                            to
                        </div>
                        <div class="d-inline-block ml-2 align-top"></div>
                    </div>
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Số:</label>
                            No
                        </div>
                        <div class="d-inline-block ml-2 align-top"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Địa chỉ:</label>
                            Address
                        </div>
                        <div class="d-inline-block">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Vào viện lúc:</label>
                            Admitted time
                        </div>
                        <aih:DateTime Minute="23" Hour="10" CssClass="d-inline-block" runat="server" Day="23" Month="01" Year="1997" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Ra viện lúc:</label>
                            Discharged time
                        </div>
                        <aih:DateTime Minute="23" Hour="10" CssClass="d-inline-block" runat="server" Day="23" Month="01" Year="1997" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Chẩn đoán:</label>
                            Diagnosis
                        </div>
                        <div class="d-inline-block">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Phương pháp điều trị:</label>
                            Treatment
                        </div>
                        <div class="d-inline-block">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Lời dặn của bác sĩ:</label>
                            Doctor’s recommendation
                        </div>
                        <div class="d-inline-block">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="d-inline-block">
                        <div class="d-inline-block">
                            <label class="font-bold d-block mb-0 h4">Ghi chú:</label>
                            Notes
                        </div>
                        <div class="d-inline-block">
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-6">
                    <aih:Date CssClass="text-center" runat="server" ID="Date" Day="23" Month="01" Year="1997" />
                    <div class="text-center">
                        <div class="d-inline-block">
                            <div class="d-inline-block">
                                <label class="font-bold d-block mb-0 h4">TỔNG GIÁM ĐỐC/ CEO</label>
                                Họ tên, chữ ký, MSNV/ Full name, Signature, ID
                            </div>
                            <div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-6">
                    <aih:Date CssClass="text-center" runat="server" ID="Date1" Day="23" Month="01" Year="1997" />
                    <div class="text-center">
                        <div class="d-inline-block">
                            <div class="d-inline-block">
                                <label class="font-bold d-block mb-0 h4">TRƯỞNG KHOA/ HEAD OF DEPARTMENT</label>
                                Họ tên, chữ ký, MSNV/ Full name, Signature, ID
                            </div>
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </PrintContent>
    </webUI:PrintWindow>

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
                                                <modalbody>
                                                <div class="text-center">
                                                    <icon:ExclamationTriangle cssClass="text-danger" Width="80" Height="80" runat="server" />
                                                    <h4 class="mt-4 mb-4">Delete document?
                                                    </h4>
                                                </div>
                                                <div class="text-right">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <asp:Button runat="server" OnClick="btnDelete_Click" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                                </div>
                                            </modalbody>
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
