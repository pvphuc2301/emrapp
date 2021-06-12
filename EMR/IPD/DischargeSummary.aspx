<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DischargeSummary.aspx.cs" Inherits="EMR.DischargeSummary" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="aih" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label1.ascx" TagPrefix="webUI" TagName="Label1" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature1.ascx" TagPrefix="webUI" TagName="Signature1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PatientLabel1.ascx" TagPrefix="webUI" TagName="PatientLabel1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtDate.ascx" TagPrefix="webUI" TagName="PrtDate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    
</head>
<body>
    <%--class="cssclsNoScreen"--%>

  <div class="cssclsNoScreen">
        <table class="report-container">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info">
                            <img src="../images/AIH_PI_FULL.png" />
                            <div class="header-info-title">
                                <h4>TÓM TẮT XUẤT VIỆN</h4>
                                <h5>DISCHARGE SUMMARY</h5>
                            </div>
                            <div style="width: 175px;">
                                <div runat="server" id="prt_fullname" style="margin-left: 16px"></div>
                                <div runat="server" id="prt_gender" style="margin-left: 16px"></div>
                                <div class="d-block" runat="server" id="prt_DOB" style="margin-left: 16px"></div>
                                <div runat="server" id="prt_vpid" class="d-block" style="margin-left: 16px"></div>
                                <webUI:Barcode runat="server" ID="prt_barcode" Width="120" Height="22" />
                            </div>
                        </div>
                        <webUI:Line runat="server" ID="Line" />
                    </th>
                </tr>
            </thead>

            <tbody class="report-content">
                <tr>
                    <td class="report-content-cell">
                        <div class="main">
                            <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                <div class="d-grid" style="grid-template-columns: 120px auto">
                                    <webUI:PrtRowS1 FontBold="true" FixedWidth="120" Title="Ngày nhập viện" SubTitle="Day of visit" runat="server" />
                                    <asp:Label runat="server" id="prt_date_of_hospital" style="margin-left: 16px"></asp:Label>
                                </div>
                                <div class="d-grid" style="grid-template-columns: 120px auto">
                                <webUI:PrtRowS1 FontBold="true" FixedWidth="120" Title="Ngày xuất viện" SubTitle="Date of Discharge" runat="server" />
                                    <asp:Label runat="server" id="prt_date_of_discharge" style="margin-left: 16px"></asp:Label>
                                </div>
                            </div>

                            <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="1." Title="Lý do nhập viện:" SubTitle="Reason for admission" runat="server"  />
                                <asp:Label runat="server" id="prt_admission_reason" style="margin-left: 16px"></asp:Label>
                            </div>
                                <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="2." Title="Chẩn đoán:" SubTitle="Diagnosis" runat="server" />
                                    <asp:Label runat="server" id="prt_icd10_diagnosis" style="margin-left: 16px"></asp:Label>
                                </div>
                                    <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="3." Title="Bệnh sử:" SubTitle="Medical History" runat="server" />
                                        <asp:Label runat="server" id="prt_cur_med_history" style="margin-left: 16px"></asp:Label>
</div>
                                        <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="4." Title="Khám lâm sàng:" SubTitle="Physical findings on admission" runat="server"/>
                                            <asp:Label runat="server" id="prt_physical_finding" style="margin-left: 16px"></asp:Label>
</div>
                                            <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="5." Title="Kết quả xét nghiệm:" SubTitle="Laboratory investigation results" runat="server" />
                                                <asp:Label runat="server" id="prt_lab_result" style="margin-left: 16px"></asp:Label>
</div>
                                                <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="6." Title="Các quy trình đã được thực hiện:" SubTitle="Procedures performed" runat="server" />
                                                    <asp:Label runat="server" id="prt_proce_performed" style="margin-left: 16px"></asp:Label>
</div>
                                                    <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="7." Title="Điều trị trong quá trình nằm viện:" SubTitle="Treatment during hospitalization" runat="server" />
                                                        <asp:Label runat="server" id="prt_treatment" style="margin-left: 16px"></asp:Label>
</div>
                                                        <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="8." Title="Diễn tiến trong quá trình nằm viện:" SubTitle="Evolution during hospitalization" runat="server"  />
                                                            <asp:Label runat="server" id="prt_evolution" style="margin-left: 16px"></asp:Label>
</div>
                                                            <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="9." Title="Tình trạng của bệnh nhân khi xuất viện:" SubTitle="Patient’s condition on discharge" runat="server"  />
                                                                <asp:Label runat="server" id="prt_disc_condition" style="margin-left: 16px"></asp:Label>
</div>
                                                                <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="10." Title="Thuốc khi xuất viện:" SubTitle="Discharge medications" runat="server" />
                                                                    <asp:Label runat="server" id="prt_disc_medication" style="margin-left: 16px"></asp:Label>
</div>
                                                                    <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="10." Title="Xuất viện trái lời khuyên bác sỹ:" SubTitle="Discharge against medical advice(DAMA)" runat="server" />                                                                            <asp:Label runat="server" id="prt_dama" style="margin-left: 16px"></asp:Label>
                                                                        <asp:Label runat="server" id="Label11" style="margin-left: 16px"></asp:Label>
</div>
                                                                        <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="11." Title="Chuyển viện:" SubTitle="Transfer to another hospita" runat="server"  />
                                                                            <asp:Label runat="server" id="prt_trans_to_hospital" style="margin-left: 16px"></asp:Label>
</div>
                                                                            <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" FixedLeft="30" Title="Nếu có, nêu rõ lý do:" SubTitle="If yes, specify the reaso" runat="server"/>
                                                                                <asp:Label runat="server" id="prt_transfer_reason" style="margin-left: 16px"></asp:Label>
                                                                                </div>

                                                                                <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="11." Title="Hướng dẫn theo dõi (ghi rõ các dấu hiệu cần tái khám):" SubTitle="Follow-up instructions (signs and symptoms for immediate revisit)" runat="server" />
                                                                                    <asp:Label runat="server" id="prt_follow_up_instruc" style="margin-left: 16px"></asp:Label>
</div>
                                                                                    <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="12." Title="Chế độ ăn uống:" SubTitle="Special diet" runat="server" />
<asp:Label runat="server" id="prt_special_diet" style="margin-left: 16px"></asp:Label>
                        </div>                                                                <div class="d-grid" style="grid-template-columns: 200px auto">
                            <webUI:PrtRowS1 FontBold="true" FixedWidth="200" Order="13." Title="Ngày tái khám (ghi rõ ngày và tên bác sỹ):" SubTitle="Next consultation (specify date and with whom):" runat="server" />
                            <asp:Label runat="server" id="prt_next_consult" style="margin-left: 16px"></asp:Label>
</div>
                            <div class="d-grid" style="grid-template-columns: 1fr 1fr">
                                <div></div>
                                <div style="break-inside: avoid;">
                                    <webUI:Signature1 runat="server" ID="prt_signature1" />
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
            <form method="post" action="#" id="form2" runat="server">
                <telerik:RadScriptManager runat="server" ID="RadScriptManage" />
                <asp:Panel runat="server" ID="messagePlaceHolder">
                    <aih:AmendReason runat="server" ID="txt_amendReason" />
                    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ValidationGroup="SaveDoc" ErrorMessage="sdfsdf" CssClass="text-danger" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                </asp:Panel>

                <uc1:PatientInfo runat="server" ID="PatientInfo1" />

                <div class="row">
                    <div class="col-md-12">
                        <div class="card mt-2">
                            <div class="card-header">
                                <h4 class="text-primary">Discharge Summary</h4>
                                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                            </div>
                            <div class="card-body collapse show" id="collapseOne">
                                <div class="form-body">

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1" style="width: 150px">Lý do xuất viện/ <span class="text-primary">Discharge Reason </span></label>                        <div class="d-inline-block align-top">

                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                    <input onclick="__doPostBack('discReasonCode_Change', 'ama')" type="radio" runat="server" id="rad_disc_reason_code_ama" name="rad_disc_reason_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_disc_reason_code_ama"><span class="text-primary">Normal</span></label>
                                                </div>

                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                    <input onclick="__doPostBack('discReasonCode_Change', 'dama')" type="radio" runat="server" id="rad_disc_reason_code_dama" name="rad_disc_reason_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_disc_reason_code_dama"><span class="text-primary">Dama</span></label>
                                                </div>

                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                    <input onclick="__doPostBack('discReasonCode_Change', 'transfer')" type="radio" runat="server" id="rad_disc_reason_code_transfer" name="rad_disc_reason_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_disc_reason_code_transfer"><span class="text-primary">Transfer</span></label>
                                                    <a href="javascript:void(0)" data-clear="rad_disc_reason_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare38" />
                                                    </a>
                                                </div>
                                                <asp:CustomValidator ID="CustomValidator1" ValidationGroup="SaveDoc" runat="server" Display="Dynamic" ErrorMessage="please choose" CssClass="text-danger" ClientValidationFunction="CustomValidator1_ClientValidate" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                                            </div>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1" style="width: 150px">Ngày nhập viện/ <span class="text-primary">Date of hospitalization:</span></label>
                                            <telerik:RadDatePicker runat="server" ID="dpk_date_of_hospital" CssClass="align-top" Width="120px" />
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1" style="width: 150px">Ngày xuất viện/ <span class="text-primary">Date of discharge:</span></label>
                                            <telerik:RadDatePicker CssClass="align-top" runat="server" ID="dpk_date_of_discharge" Width="120px" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">1. Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                        </legend>

                                        <div class="col-md-12">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block align-top" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_admission_reason" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">2. Chẩn đoán chính/ <span class="text-primary">Main diagnosis:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <label style="width: 150px" class="control-label mb-1">Phân loại bệnh theo ICD-10/ <span class="text-primary">ICD-10 Code:</span></label>
                                            <div class="d-inline-block align-top" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_icd10_diagnosis" />

                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1" style="width: 150px">Chẩn đoán kết hợp/ <span class="text-primary">Associated diagnosis:</span></label>
                                            <div class="d-inline-block align-top" style="width: calc(100% - 154px)">
                                                <div class="form-group">
                                                    <aih:TextField runat="server" ID="txt_associated_diagnosis" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">3. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1" style="width: 150px">Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                            <div class="d-inline-block align-top" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_cur_med_history" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1" style="width: 150px">Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                            <div class="d-inline-block align-top" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_ant_med_history" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">4. Dấu hiệu lâm sàng lúc nhập viện/ <span class="text-primary">Physical findings on admission:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_physical_finding" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">5. Kết quả xét nghiệm/ <span class="text-primary">Laboratory investigation results:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_lab_result" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1" style="width: 150px">Giải phẫu bệnh/ <span class="text-primary">Pathology:</span></label>
                                            <div class="d-inline-block align-top">
                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                    <input type="radio" runat="server" id="rad_patho_result_code_be" name="rad_patho_result_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_patho_result_code_be">Lành tính/ <span class="text-primary">Benign</span></label>
                                                </div>
                                                <div class="custom-control custom-radio  d-inline-block ml-2">
                                                    <input type="radio" runat="server" id="rad_patho_result_code_ma" name="rad_patho_result_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_patho_result_code_ma">Ác tính/ <span class="text-primary">Malignant</span></label>
                                                </div>
                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                    <input type="radio" runat="server" id="rad_patho_result_code_uc" name="rad_patho_result_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_patho_result_code_uc">Chưa xác định/ <span class="text-primary">Unconfirmed</span></label>
                                                    <a href="javascript:void(0)" data-clear="rad_patho_result_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare2" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">6. Các quy trình đã được thực hiện/ <span class="text-primary">Procedures performed:</span></label>
                                        </legend>

                                        <div class="col-md-12">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_proce_performed" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">7. Điều trị trong quá trình nằm viện/ <span class="text-primary">Treatment during hospitalization:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_treatment" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">8. Diễn tiến trong quá trình nằm viện/ <span class="text-primary">Evolution during hospitalization:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_evolution" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">9. Tình trạng của bệnh nhân khi xuất viện/ <span class="text-primary">Patient’s condition on discharge:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                 <aih:TextField runat="server" ID="txt_disc_condition" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2" runat="server" id="disc_medication_field">
                                        <legend>
                                            <label class="control-label mb-2">10. Thuốc khi xuất viện/ <span class="text-primary">Discharge medications:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                  <aih:TextField runat="server" ID="txt_disc_medication" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2" runat="server" id="follow_up_field">
                                        <legend>
                                            <label class="control-label mb-2">11. Hướng dẫn theo dõi (ghi rõ các dấu hiệu cần tái khám ngay)/ <span class="text-primary">Follow-up instructions (signs and symptoms for immediate revisit):</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                   <aih:TextField runat="server" ID="txt_follow_up_instruc" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2" runat="server" id="special_diet_field">
                                        <legend>
                                            <label class="control-label mb-2">12. Chế độ ăn uống/ <span class="text-primary">Special Diet:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                <aih:TextField
                               runat="server" ID="txt_special_diet" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2" runat="server" id="next_consultation_field">
                                        <legend>
                                            <label class="control-label mb-2">13. Ngày tái khám (ghi rõ ngày và tên Bác sĩ)/ <span class="text-primary">Next consultation (specify date and with whom):</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                <telerik:RadDatePicker Width="120px" ID="dpk_next_consult_date" runat="server"></telerik:RadDatePicker>
                                                <div class="form-group d-inline-block w-n mb-2">
                                                    <aih:TextField runat="server" ID="txt_next_consult_doctor" runat="server" />                                        </div>

                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 dama_field" runat="server" id="dama_field">
                                        <legend>
                                            <label class="control-label mb-2">10. Xuất viện trái với lời khuyên bác sỹ/ <span class="text-primary">Discharge against medical advice (DAMA):</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_dama" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1" style="width: 150px">
                                                Nếu có, nêu rõ lí do/ <span class="text-primary">If yes, specify the reason
:</span></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                           <aih:TextField  runat="server" ID="txt_dama_note" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2" runat="server" id="transfer_field">
                                        <legend>
                                            <label class="control-label mb-2">11. Chuyển viện/ <span class="text-primary">Transfer to another hospital:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <label style="width: 150px"></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_trans_to_hospital" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1" style="width: 150px">
                                                Nếu có, nêu rõ lí do/ <span class="text-primary">If yes, specify the reason
:</span></label>
                                            <div class="d-inline-block" style="width: calc(100% - 154px)">
                                                <aih:TextField runat="server" ID="txt_transfer_reason" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label" style="width: 150px">Ngày/ <span class="text-primary">Date</span></label>
                                            <telerik:RadDatePicker Width="120px" ID="dpk_signed_date" runat="server"></telerik:RadDatePicker>

                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label" style="width: 150px">Họ tên bác sỹ và mã số nhân viên/ <span class="text-primary">Doctor’s Name and ID</span></label>
                                            <div class="d-inline-block w-n align-top">
                                                <aih:TextField runat="server" ID="txt_signed_doctor" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-actions">
                                                <button type="button" onserverclick="btnComplete_Click" validationgroup="SaveDoc" runat="server" id="btnComplete" class="btn btn-primary waves-effect">Complete</button>

                                                <button type="button" onserverclick="btnSave_Click" validationgroup="SaveDoc" runat="server" id="btnSave" class="btn btn-primary waves-effect">Save</button>

                                                <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger waves-effect" data-toggle="modal" data-target="myModal"></button>
                                                <button type="button" onserverclick="btnAmend_Click" runat="server" id="btnAmend" class="btn btn-secondary waves-effect">Amend</button>

                                                <button type="button" onserverclick="btnPrint_Click" runat="server" id="btnPrint" class="btn btn-secondary waves-effect">Print</button>

                                                <button type="button" onserverclick="btnCancel_Click" runat="server" id="btnCancel" class="btn btn-default waves-effect">Cancel</button>
                                            </div>
                                        </div>
                                    </div>

                                    <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                        <ModalBody>
                                            <div class="text-center">
                                                <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                <h4 class="mt-4 mb-4">Delete document?
                                                </h4>
                                            </div>
                                            <div class="text-right">
                                                <button data-dismiss="modal" class="btn btn-default waves-effect">Close</button>
                                                <button runat="server" onserverclick="btnDelete_Click" class="btn btn-danger waves-effect">Delete</button>
                                    /div>

    </div>         </form>
         </ModalBody>
                                    </webUI:PopupModal>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </div>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../scripts/custom.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/waves.js"></script>
    <script>
        <%--function validateForm1() {
            validateForm(() => {
                console.log("Passed");
                __doPostBack('<%=btnComplete.UniqueID%>', '');
            });
        };

        function checkradiobutton(ClientValidate) {
            let isChecked = document.querySelector(`input[type='radio'][name='${ClientValidate.getAttribute("data-for")}']:checked`);
            if (!isChecked) {
                let groupName = document.querySelector(`input[type='radio'][name='${ClientValidate.getAttribute("data-for")}']:checked`);
                ClientValidate.innerHTML = ClientValidate.getAttribute('data-message-error');

                groupName.forEach( => {
                    e.addEventListener('change', () => {
                        ClientValidate.
                    });

                })

                return false;
            }
            return true;
        }

        function validateForm(pass) {

            let checks = document.querySelectorAll(`.required`);
            console.log(checks);
            let errors = [];
            checks.forEach(e => {
                e.getAttribute("data-for");
                if (!checkradiobutton(e)) {
                    errors.push(e);
                }
            });

            amend_reason = document.getElementById("txt_amendReason");

            if (amend_reason) {
                if (amend_reason.value.length <= 3) {
                    document.getElementById("messagePlaceHolder").scrollIntoView();
                    document.getElementById("DisplayControl").focus();
                    errors.push(amend_reason);
                }
            }

            if (errors.length <= 0) pass();

        }--%>


        function CustomValidator1_ClientValidate(source, args) {
            if (document.querySelector(`input[type='radio'][name='${ClientValidate.getAttribute("data-for")}']:checked`) != null) {
                args.IsValid = true;
            }
            else {
                args.IsValid = false;
            }

        }
    </script>

</body>
</html>
