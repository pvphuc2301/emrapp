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
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label1.ascx" TagPrefix="Button" TagName="Label1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtGender.ascx" TagPrefix="webUI" TagName="PrtGender" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature2.ascx" TagPrefix="webUI" TagName="Signature2" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtDate.ascx" TagPrefix="webUI" TagName="PrtDate" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
</head>
<body>
     <%--class="cssclsNoScreen"--%>
    <div class="cssclsNoScreen" style="font-family: Tahoma !important; font-size: 13.3048px !important;">
        <table class="report-container">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info" style="display: flex; align-items: center;">
                            <img width="180px" src="../images/AIH_PI_FULL.png" />
                            <div style="flex-grow: 1; text-align: center">
                                <div style="color: #007297; font-size: 20.6963px;">GIẤY CHỨNG NHẬN PHẪU THUẬT</div>
                                <div style="color: #e20e5a; font-size: 16.6667px;">SURGICAL CERTIFICATE</div>
                            </div>
                            <webUI:PatientLabel1 runat="server" ID="prt_patient_label" />
                        </div>
                        <webUI:Line runat="server" ID="Line" />
                    </th>
                </tr>
            </thead>

            <tbody class="report-content">
                <tr>
                    <td class="report-content-cell">
                        <div class="main">
                            <webUI:PrtRowS1 FixedLeft="30" Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT"  runat="server" id="PrtRowS9"  />

                            <div class="d-grid" style="grid-template-columns: 2fr 1fr">
                                <webUI:PrtRowS1 FixedLeft="30" FixedWidth="141" Title="Họ tên người bệnh:" SubTitle="Patient's name"  runat="server" id="prt_fullname"  />

                                <webUI:PrtRowS1 FixedWidth="114" Title="Ngày sinh:" SubTitle="DOB"  runat="server" id="prt_dob"  />
                            </div>

                            <div class="d-grid" style="grid-template-columns: 2fr 1fr">
                                <webUI:PrtRowS2 FixedLeft="30" ID="prt_gender" FixedWidth="152" Title="Giới tính:" SubTitle="Gender" TitleOption1="Nam<div class='text-primary'>Male</div>" TitleOption2="Nữ<div class='text-primary'>Female</div>" runat="server" />
                            
                                <webUI:PrtRowS1 FixedWidth="114" Title="Mã người bệnh:" SubTitle="Patient ID" runat="server" id="prt_patient_id"  />
                            </div>

                            <webUI:PrtRowS1 FixedWidth="55" FixedLeft="30" Title="Địa chỉ:" SubTitle="Address" runat="server" id="prt_address"  />

                            <webUI:PrtRowS1 Order="1." Title="Ngày nhập viện:" SubTitle="Admission Date" runat="server" id="prt_admission_date"  />

                            <webUI:PrtRowS1 Order="2." Title="Ngày phẫu thuật:" SubTitle="Procedure Date" runat="server" id="prt_procedure_date"  />

                            <webUI:PrtRowS1 Order="3." Title="Ngày xuất viện:" SubTitle="Procedure Date" runat="server" id="prt_discharge_date"  />

                            <webUI:PrtRowS1 Order="4." Title="Chẩn đoán phẫu thuật:" SubTitle="Surgical diagnosis" runat="server" id="prt_preo_diagnosis"  />

                            <webUI:PrtRowS1 Order="5." Title="Phương pháp phẫu thuật:" SubTitle="Name of surgery/ procedure"  runat="server" id="prt_name_of_procedure"  />

                            <webUI:PrtRowS1 Order="6." Title="Cách thức phẫu thuật:" SubTitle="Procedure narrative"  runat="server" id="prt_proce_narrative"  />

                            <webUI:PrtRowS1 Order="7." Title="Nhóm máu:" SubTitle="Blood type"  runat="server" id="prt_blood_type"  />

                            <webUI:PrtRowS1 Order="8." Title="Yếu tố Rh:" SubTitle="Rh" Value="String" runat="server" id="prt_rh"  />
                            
                            <div class="d-grid mt-4" style="grid-template-columns: 1fr 1fr">
                                <div class="text-center" >
                                    <webUI:PrtDate runat="server" />
                                    <webUI:Signature1 runat="server" ID="prt_signature1" />
                                </div>
                                <div class="text-center" >
                                    <webUI:PrtDate runat="server"/>
                                    <webUI:Signature1 runat="server" ID="prt_signature2" />
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>

            <tfoot class="report-footer">
                <tr>
                    <td class="report-footer-cell" style="font-size: 10px">
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
            <div class="h-100 w-100">
                <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>

                        <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <webUI:AmendReason runat="server" ID="txt_amendReason" />
                        </asp:Panel>
                        <webUI:PatientInfo runat="server" ID="PatientInfo1" />

                        <div class="row">
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
                                                    <asp:Label runat="server" ID="lbl_admission_date" />
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Ngày phẫu thuật/ <span class="text-primary">Procedure date:</span></label>
                                                    <asp:Label runat="server" ID="lbl_procedure_date" />
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">3. Ngày xuất viện/ <span class="text-primary">Discharge date:</span></label>
                                                    <telerik:RadDatePicker CssClass="ml-2" runat="server" ID="dpk_discharge_date" Width="120px" />
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">4. Chẩn đoán trước phẫu thuật/ <span class="text-primary">Preoperative diagnosis:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_preo_diagnosis" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">5. Phương pháp phẫu thuật/ <span class="text-primary">Name of surgery/procedure:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_name_of_procedure" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">6. Cách thức phẫu thuật/ <span class="text-primary">Procedure narrative:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_proce_narrative" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">7. Nhóm máu/ <span class="text-primary">BloodType:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_blood_type" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">8. Yếu tố Rh/ <span class="text-primary">Rh:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_rh" />
                                                    </div>
                                                </div>
                                            </div>
                                            <fieldset class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-actions">
                                                        <asp:Button ID="btnComplete" class="btn btn-primary" OnClick="btnComplete_Click" runat="server" Text="Complete" />
                                                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" OnClick="btnSave_Click" Text="Save" />
                                                        <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                        <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                        <asp:Button ID="btnPrint" OnClientClick="window.print()" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                                        <asp:Button ID="btnCancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" runat="server" Text="Cancel" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                                <ModalBody>
                                                    <div class="text-center">
                                                        <icon:ExclamationTriangle cssClass="text-danger" Width="80" Height="80" runat="server" />
                                                        <h4 class="mt-4 mb-4">Delete document?
                                                        </h4>
                                                    </div>
                                                    <div class="text-right">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <asp:Button runat="server" Text="Delete" ID="btnDelete" OnClick="btnDelete_Click" class="btn btn-danger" />
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

