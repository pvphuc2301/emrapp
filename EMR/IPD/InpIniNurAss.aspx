<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InpIniNurAss.aspx.cs" Inherits="EMR.InpIniNurAss" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="Trash" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/icons/Calculator.ascx" TagPrefix="icon" TagName="Calculator" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>
<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="icon" TagName="PopupShowDelay" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <style>
        canvas {
            border: 2px solid #000;
        }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <asp:UpdatePanel ID="UpPrintForm" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div class="header-info">
                                        <img src="../images/AIH_PI_FULL.png" />
                                        <div class="header-info-title">
                                            <h4></h4>
                                            <h5>INPATIENT INITIAL NURSING ASSESSMENT</h5>
                                            <div style="font-size: 12px" class="text-primary">
                                                <%--( Áp dụng cho các đối tượng ≥1 tháng tuổi/ For person ≥ 1 month old)--%>
                                            </div>
                                        </div>
                                        <div style="font-size: 13.3333px">
                                            <div>
                                                <asp:Label ID="lbPatientName" runat="server"></asp:Label>MAI MAI MÃI1
                                            </div>
                                            <div>
                                                <asp:Label ID="lbBirthday" runat="server" Text='<%# Eval("date_of_birth") %>'></asp:Label>
                                                |
                                    <asp:Label ID="lbSex" runat="server"></asp:Label>
                                            </div>
                                            <div>
                                                <asp:Label ID="lbPID" runat="server" Font-Bold="true"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <webUI:Line runat="server" />
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
                    <div style="overflow: scroll; height: calc(100vh - 52px); overflow-x: hidden;">
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

                            <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                        </asp:Panel>

                        <webUI:PatientInfo runat="server" ID="PatientInfo2" />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card mt-2">
                                    <div class="card-header">
                                        <h4 class="text-primary">INPATIENT INITIAL NURSING ASSESSMENT
                                        </h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">A. THÔNG TIN TỔNG QUÁT VỀ NGƯỜI BỆNH/ <span class="text-primary">GENERAL PATIENT INFORMATION</span></label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Quốc gia cư trú/ <span class="text-primary">Country of residence:</span></label>

                                                    <asp:Label runat="server" ID="lbl_residence_desc"></asp:Label>
                                                    <div runat="server" id="residence_desc_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_residence_code_vnm" name="rad_residence_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_residence_code_vnm">Việt Nam</label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="residence_other_field" type="radio" runat="server" id="rad_residence_code_oth" name="rad_residence_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_residence_code_oth">Khác</label>
                                                            <a href="javascript:void(0)" data-clear="rad_residence_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare2" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group d-inline-block w-n residence_other_field">
                                                            <webUI:TextField runat="server" ID="txt_residence_other" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Ngôn ngữ/ <span class="text-primary">Language:</span></label>
                                                    <asp:Label runat="server" ID="lbl_language_desc"></asp:Label>
                                                    <div runat="server" id="language_desc_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_language_code_vi" name="rad_language_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_language_code_vi">Tiếng Việt</label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_language_code_en" name="rad_language_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_language_code_en">Tiếng Anh</label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="language_other_field" type="radio" runat="server" id="rad_language_code_oth" name="rad_language_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_language_code_oth">Tiếng khác</label>
                                                            <a href="javascript:void(0)" data-clear="rad_language_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare4" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group language_other_field w-n d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_language_other" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Cần phiên dịch/ <span class="text-primary">Requires Interpreter:</span></label>
                                                    <asp:Label runat="server" ID="lbl_req_interpreter"></asp:Label>
                                                    <div runat="server" id="req_interpreter_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_req_interpreter_true" name="rad_req_interpreter" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_interpreter_true">Có/ <span class="text-primary">Yes</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_req_interpreter_false" name="rad_req_interpreter" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_interpreter_false">Không/ <span class="text-primary">No</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_req_interpreter" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare5" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Tôn giáo/ <span class="text-primary">Religion:</span></label>
                                                    <asp:Label runat="server" ID="lbl_religion_code"></asp:Label>
                                                    <div runat="server" id="religion_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_religion_code_bh" name="rad_religion_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_religion_code_bh">Phật giáo/ <span class="text-primary">Buddhism</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_religion_code_ch" name="rad_religion_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_religion_code_ch">Thiên chúa giáo</label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="religion_other_field" type="radio" runat="server" id="rad_religion_code_oth" name="rad_religion_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_religion_code_oth">Khác</label>
                                                            <a href="javascript:void(0)" data-clear="rad_religion_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare6" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group religion_other_field w-n d-inline-block">
                                                            <webUI:TextField runat="server" ID="TextField3" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Nhu cầu tín ngưỡng/ <span class="text-primary">Spiritual counselling:</span></label>
                                                    <asp:Label runat="server" ID="lbl_spiritual_couns"></asp:Label>
                                                    <div runat="server" id="spiritual_couns_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_spiritual_couns_true" name="rad_spiritual_couns" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_spiritual_couns_true">Có/ <span class="text-primary">Yes</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_spiritual_couns_false" name="rad_spiritual_couns" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_spiritual_couns_false">Không/ <span class="text-primary">No</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_spiritual_couns" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare7" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-inline-block">Nghề nghiệp/ <span class="text-primary">Occupation:</span></label>
                                                    <asp:Label runat="server" ID="lbl_occupation"></asp:Label>
                                                    <div class="form-group d-inline-block w-n" runat="server" id="occupation_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_occupation" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Hoàn cảnh sống/ <span class="text-primary">Living Status:</span></label>
                                                    <asp:Label runat="server" ID="lbl_living_status_desc"></asp:Label>
                                                    <div runat="server" id="living_status_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_living_status_code_aln" name="rad_living_status_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_living_status_code_aln">Một mình/ <span class="text-primary">Alone</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_living_status_code_wth" name="rad_living_status_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_living_status_code_wth">Với vợ, chồng, con, anh, chị, em ruột/ <span class="text-primary">With spouse, children, sibling</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="living_status_note_field" type="radio" runat="server" id="rad_living_status_code_oth" name="rad_living_status_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_living_status_code_oth">Khác</label>
                                                            <a href="javascript:void(0)" data-clear="rad_living_status_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare8" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group living_status_note_field w-n d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_living_status_note" />
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Mối quan tâm khi nằm viện/ <span class="text-primary">Concerns related to hospitalization:</span></label>
                                                    <asp:Label runat="server" ID="lbl_hospital_concern_desc"></asp:Label>
                                                    <div runat="server" id="hospital_concern_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hospital_concern_code_non" name="rad_hospital_concern_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hospital_concern_code_non">Không/ <span class="text-primary">None</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hospital_concern_code_rel" name="rad_hospital_concern_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hospital_concern_code_rel">Gia đình, các mối quan hệ/ <span class="text-primary">Family, relationship issues</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hospital_concern_code_fin" name="rad_hospital_concern_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hospital_concern_code_fin">Tài chính/ <span class="text-primary">Financial</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hospital_concern_code_wor" name="rad_hospital_concern_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hospital_concern_code_wor">Lo âu/ <span class="text-primary">Worriedness</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="hospital_concern_other_field" type="radio" runat="server" id="rad_hospital_concern_code_oth" name="rad_hospital_concern_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hospital_concern_code_oth">Khác/ <span class="text-primary">Others</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_hospital_concern_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare13" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group w-n d-inline-block hospital_concern_other_field">
                                                            <webUI:TextField runat="server" ID="txt_hospital_concern_other" />
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 d-inline-block">Người đi cùng/ <span class="text-primary">Accompanied by:</span></label>
                                                    <asp:Label runat="server" ID="lbl_accompanied"></asp:Label>
                                                    <div class="form-group w-n d-inline-block" runat="server" id="accompanied_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_accompanied" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1 d-inline-block mr-2">Quan hệ/ <span class="text-primary">Relationship:</span></label>
                                                    <asp:Label runat="server" ID="lbl_relationship"></asp:Label>
                                                    <div class="form-group w-n d-inline-block" runat="server" id="relationship_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_relationship" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">B. BỆNH SỬ/ <span class="text-primary">MEDICAL HISTORY</span></label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Bệnh nhân nhập viện từ/ <span class="text-primary">Patient admitted from:</span></label>
                                                    <asp:Label runat="server" ID="lbl_admit_from_desc"></asp:Label>
                                                    <div runat="server" id="admit_from_desc_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_admit_from_code_opd" name="rad_admit_from_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_admit_from_code_opd">Khoa khám bệnh/ <span class="text-primary">OPD</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_admit_from_code_er" name="rad_admit_from_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_admit_from_code_er">Khoa cấp cứu/ <span class="text-primary">ER</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_admit_from_code_vd" name="rad_admit_from_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_admit_from_code_vd">Bác sĩ hơp tác/ <span class="text-primary">Visiting Doctor</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_admit_from_code_oth" disabled-for="admit_from_other_field" name="rad_admit_from_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_admit_from_code_oth">Khác/ <span class="text-primary">Referral</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_admit_from_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare9" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group admit_from_other_field w-n d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_admit_from_other" />
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Tình trang khi đến</label>
                                                    <asp:Label runat="server" ID="lbl_arrived"></asp:Label>
                                                    <div runat="server" id="arrived_wrapper">

                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_code_w" />
                                                            <span class="custom-control-label">Tự đi được/ <span class="text-primary">Walking</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_code_s" />
                                                            <span class="custom-control-label">Bằng băng ca/ <span class="text-primary">Stretcher</span></span>
                                                        </label>

                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_code_wc" />
                                                            <span class="custom-control-label">Bằng xe lăn/ <span class="text-primary">Wheelchair</span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label">Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                                    <asp:Label runat="server" ID="lbl_admission_reason"></asp:Label>
                                                    <div class="form-group" runat="server" id="admission_reason_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_admission_reason" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label">Lần nhập viện trước tại bệnh viện Quốc tế Mỹ</label>
                                                    <asp:Label CssClass="ml-2" runat="server" ID="lbl_previous_admission"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Tiền sử bệnh/ <span class="text-primary">Past medical history:</span></label>
                                                    <asp:Label runat="server" ID="lbl_past_med_history"></asp:Label>
                                                    <div runat="server" id="past_med_history_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_past_med_history_false" name="rad_past_med_history" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_past_med_history_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_past_med_history_true" disabled-for="past_med_history_note_field" name="rad_past_med_history" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_past_med_history_true">Có/ <span class="text-primary">Yes</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_past_med_history" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare10" />
                                                            </a>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator11" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="past_med_history_ServerValidate"></asp:CustomValidator>--%>
                                                        <div class="form-group past_med_history_note_field d-inline-block w-n">
                                                            <webUI:TextField runat="server" ID="txt_past_med_history_note" />
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Tiền sử phẫu thuật/ <span class="text-primary">Past Surgical History:</span></label>
                                                    <asp:Label runat="server" ID="lbl_past_sur_history"></asp:Label>
                                                    <div runat="server" id="past_sur_history_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_past_sur_history_false" name="rad_past_sur_history" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_past_sur_history_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_past_sur_history_true" disabled-for="past_sur_history_note_field" name="rad_past_sur_history" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_past_sur_history_true">Có/ <span class="text-primary">Yes</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_past_sur_history" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare11" />
                                                            </a>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator10" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="past_sur_history_ServerValidate"></asp:CustomValidator>--%>
                                                        <div class="form-group past_sur_history_note_field d-inline-block w-n">
                                                            <webUI:TextField runat="server" ID="txt_past_sur_history_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Lạm dụng chất kích thích/ <span class="text-primary">Substance abuse</span></label>
                                                    <asp:Label runat="server" ID="lbl_substance_abuse"></asp:Label>
                                                    <div runat="server" id="substance_abuse_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_substance_abuse_s" />
                                                            <span class="custom-control-label">Hút thuốc/ <span class="text-primary">Smoking</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_substance_abuse_a" />
                                                            <span class="custom-control-label">Rượu bia/ <span class="text-primary">Acohol</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" disabled-for="substance_abuse_other_field" class="custom-control-input" runat="server" id="cb_substance_abuse_oth" />
                                                            <span class="custom-control-label">Khác/ <span class="text-primary">Other</span></span>
                                                        </label>
                                                        <div class="form-group substance_abuse_other_field d-inline-block w-n mb-2">
                                                            <webUI:TextField runat="server" ID="txt_substance_abuse_other" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Hồ sơ bệnh án kèm theo/ <span class="text-primary">Previous test results/documents:</span></label>
                                                    <asp:Label runat="server" ID="lbl_previous_document"></asp:Label>
                                                    <div runat="server" id="previous_document_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_previous_document_false" name="rad_previous_document" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_previous_document_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_previous_document_true" disabled-for="previous_document_note_field" name="rad_previous_document" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_previous_document_true">Yes/ <span class="text-primary">Có</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_previous_document" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare14" />
                                                            </a>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator12" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="previous_document_ServerValidate"></asp:CustomValidator>--%>
                                                        <div class="form-group previous_document_note_field d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_previous_document_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Thuốc hiện đang dùng tại nhà/ <span class="text-primary">Current home medication:</span></label>
                                                    <asp:Label runat="server" ID="lbl_cur_home_medication"></asp:Label>
                                                    <div runat="server" id="cur_home_medication_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_cur_home_medication_false" name="rad_cur_home_medication" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_cur_home_medication_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_cur_home_medication_true" name="rad_cur_home_medication" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_cur_home_medication_true">Có/ Yes (Tham khảo đơn thuốc đính kèm)/ <span class="text-primary">If, yes please refer to the prescription attached</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_cur_home_medication" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare15" />
                                                            </a>
                                                            <%--<asp:CustomValidator ID="CustomValidator5" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="cur_home_medication_ServerValidate"></asp:CustomValidator>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Dị ứng/ Phản ứng / <span class="text-primary">Allergy/ Reaction:</span></label>
                                                    <asp:Label runat="server" ID="lbl_allergy"></asp:Label>
                                                    <div runat="server" id="allergy_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_allergy_true" disabled-for="allergy_note_field" name="rad_allergy" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_allergy_true">Có (ghi rõ)/ <span class="text-primary">Yes (specify)</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare16" />
                                                            </a>
                                                            <%--<asp:CustomValidator ID="CustomValidator3" CssClass="text-danger" ValidationGroup="Group1"
                                                                OnServerValidate="allergy_ServerValidate"
                                                                Display="Dynamic"
                                                                ErrorMessage="Dị ứng/ Allergy is required"
                                                                runat="server" />
                                                        </div>--%>

                                                        <div class="form-group allergy_note_field w-n d-inline-block">
                                                            <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Người bệnh có nguy cơ cao/ <span class="text-primary">High-risk patient</span></label>
                                                    <asp:Label runat="server" ID="lbl_high_risk_patient"></asp:Label>
                                                    <div runat="server" id="high_risk_patient_wrapper">
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_ch" />
                                                            <span class="custom-control-label">Trẻ em (< hoặc 8 tuổi)/ <span class="text-primary">Children (<8 years old)</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_sdp" />
                                                            <span class="custom-control-label">Những người bệnh tàn tật năng/ <span class="text-primary">Severely disabled patients</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_eld" />
                                                            <span class="custom-control-label">Người cao tuổi (80 tuổi hoặc hơn)/ <span class="text-primary">Elderly people (80 years old or above)</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_hrf" />
                                                            <span class="custom-control-label">Những người bệnh có nguy cơ té ngã cao/ <span class="text-primary">Patients with high risk of falls</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_ccp" />
                                                            <span class="custom-control-label">Những người bệnh lú lẫn/hôn mê/ <span class="text-primary">Confused or comatose patients</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_res" />
                                                            <span class="custom-control-label">Người bệnh bị kìm giữ/ <span class="text-primary">Restrained patients</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_high_risk_patient_hrt" />
                                                            <span class="custom-control-label">Người bệnh đang điều trị có nguy cơ cao (như chạy thận nhân tạo, hóa trị liệu..)/ <span class="text-primary">Patients that receiving high-risk treatments (such as dialysis, chemotherapy…)</span></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <h4>C. ĐÁNH GIÁ CỦA ĐIỀU DƯỠNG/ <span class="text-primary">NURSING ASSESSMENT</span></h4>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">1. Dấu hiệu sinh tồn và các chỉ số đo lường/ <span class="text-primary">vital signs and standard measurements</span></label>
                                                </legend>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_temperature"></asp:Label>
                                                    <div class="form-group w-4 d-inline-block" runat="server" id="vs_temperature_wrapper">
                                                        <input data-type="number" runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_heart_rate"></asp:Label>
                                                    <div class="form-group w-5 d-inline-block" runat="server" id="vs_heart_rate_wrapper">
                                                        <input data-type="number" runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_weight"></asp:Label>
                                                    <div class="form-group w-4 d-inline-block" runat="server" id="vs_weight_wrapper">
                                                        <input data-type="number" onchange="CalculateBmi()" runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                        <span class="append">Kg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_respiratory_rate"></asp:Label>
                                                    <div class="form-group w-5 d-inline-block" runat="server" id="vs_respiratory_rate_wrapper">
                                                        <input data-type="number" runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_height"></asp:Label>
                                                    <div class="form-group w-4 d-inline-block" runat="server" id="vs_height_wrapper">
                                                        <input data-type="number" onchange="CalculateBmi()" maxlength="3" id="txt_vs_height" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_blood_pressure"></asp:Label>
                                                    <div class="form-group w-5 d-inline-block" runat="server" id="vs_blood_pressure_wrapper">
                                                        <input data-type="number" id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_BMI"></asp:Label>
                                                    <div class="form-group w-5 mb-1 d-inline-block" runat="server" id="vs_BMI_wrapper">
                                                        <input runat="server" id="txt_vs_bmi" class="form-control text-right" disabled="disabled" />
                                                        <span class="append">(Kg/m <sup>2</sup>)</span>
                                                    </div>
                                                    <div>
                                                        (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
applicable for children and pregnant</span>)
                                                    </div>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_spO2"></asp:Label>
                                                    <div class="form-group w-4 d-inline-block" runat="server" id="vs_spO2_wrapper">
                                                        <input data-type="number" runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-2">
                                                    <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                    <asp:Label runat="server" ID="lbl_vs_pulse"></asp:Label>
                                                    <div class="form-group w-4 d-inline-block" runat="server" id="vs_pulse_wrapper">
                                                        <input data-type="number" runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">2. Hệ hô hấp/ <span class="text-primary">Respiratory system</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_respiratory_system"></asp:Label>

                                                        <div runat="server" id="respiratory_system_wrapper">
                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_n" />
                                                                <span class="custom-control-label">Không có vấn đề/ <span class="text-primary">Normal</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_d" />
                                                                <span class="custom-control-label">Khó thở/ <span class="text-primary">Dyspnea</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_o" />
                                                                <span class="custom-control-label">Khó thở nằm/ <span class="text-primary">Orthopnea</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_w" />
                                                                <span class="custom-control-label">Khó thở khò khè/ <span class="text-primary">Wheeze</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_c" />
                                                                <span class="custom-control-label">Da xanh tái/ <span class="text-primary">Cyanosis</span></span>
                                                            </label>
                                                        </div>

                                                        <div>
                                                            <label class="control-label mb-2">Ho/ <span class="text-primary">Cough:</span></label>
                                                            <asp:Label runat="server" ID="lbl_cough"></asp:Label>

                                                            <div runat="server" class="d-inline-block" id="cough_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_cough_false" name="rad_cough" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_cough_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_cough_true" name="rad_cough" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_cough_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_cough" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare12" />
                                                                    </a>
                                                                    <%--<asp:CustomValidator ID="CustomValidator4" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="rad_cough_ServerValidate"></asp:CustomValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_pro_cough"></asp:Label>
                                                            <div runat="server" id="pro_cough_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_pro_cough_false" name="rad_pro_cough" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_pro_cough_false">Không có đờm/ <span class="text-primary">Unproductive cough</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_pro_cough_true" name="rad_pro_cough" class="custom-control-input" disabled-for="pro_cough_note_field" />
                                                                    <label class="custom-control-label" for="rad_pro_cough_true">Có đờm (ghi rõ màu/ tính chất/ số lượng)/ <span class="text-primary">Productive (Specify color/ nature/ amount)</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_pro_cough" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare17" />
                                                                    </a>
                                                                </div>

                                                                <%--<asp:CustomValidator ID="CustomValidator13" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="pro_cough_ServerValidate"></asp:CustomValidator>--%>

                                                                <div class="form-group pro_cough_note_field d-inline-block w-n">
                                                                    <webUI:TextField runat="server" ID="txt_pro_cough_note" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">3. Hệ tim mạch/ <span class="text-primary">Cardiovascular system</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Mạch/ <span class="text-primary">Pulse:</span></label>
                                                    <asp:Label runat="server" ID="lbl_pulse_desc"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="pulse_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_pulse_code_r" name="rad_pulse_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_pulse_code_r">Đều/ <span class="text-primary">Regular</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_pulse_code_i" name="rad_pulse_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_pulse_code_i">Không đều/ <span class="text-primary">Irregular</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_pulse_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare18" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Tình trạng hiện có/ <span class="text-primary">Presence with</span></label>

                                                    <asp:Label runat="server" ID="lbl_presence"></asp:Label>
                                                    <div runat="server" id="presence_wrapper" class="d-inline-block">
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_cp" />
                                                            <span class="custom-control-label">Đau ngực/ <span class="text-primary">Chest pain</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_di" />
                                                            <span class="custom-control-label">Chóng mặt/ <span class="text-primary">Dizzinness</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_ca" />
                                                            <span class="custom-control-label">Đau bắp chân/ <span class="text-primary">Calf pain</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_pe" />
                                                            <span class="custom-control-label">Phù ngoại biên/  <span class="text-primary">Peripheral edema</span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a  mb-2">
                                                    <label class="control-label mb-2 d-block">Tứ chi/ <span class="text-primary">Extremities</span></label>
                                                    <asp:Label runat="server" ID="lbl_extremities"></asp:Label>
                                                    <div runat="server" id="extremities_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_wa" />
                                                            <span class="custom-control-label">Ấm/ <span class="text-primary">Warm</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_co" />
                                                            <span class="custom-control-label">Lạnh/ <span class="text-primary">Cold</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_cl" />
                                                            <span class="custom-control-label">Ẩm ướt/ <span class="text-primary">Clammy</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_cy" />
                                                            <span class="custom-control-label">Xanh tái/ <span class="text-primary">Cyanosed</span></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">4. Hệ thần kinh cảm giác/ <span class="text-primary">Neurosensory system</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Định hướng được/ <span class="text-primary">Oriented</span></label>
                                                    <asp:Label runat="server" ID="lbl_oriented"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="oriented_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_day" />
                                                            <span class="custom-control-label">Ngày/ <span class="text-primary">Day</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_time" />
                                                            <span class="custom-control-label">Thời gian/ <span class="text-primary">Time</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_per" />
                                                            <span class="custom-control-label">Người/ <span class="text-primary">Person</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_pla" />
                                                            <span class="custom-control-label">Nơi/ <span class="text-primary">Place</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_na" />
                                                            <span class="custom-control-label">Không định hướng được/ <span class="text-primary">Not all all</span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Tình trạng tinh thần/ <span class="text-primary">Mental status</span></label>
                                                    <asp:Label runat="server" ID="lbl_mental_status"></asp:Label>
                                                    <div runat="server" id="mental_status_wrapper">
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_al" />
                                                            <span class="custom-control-label">Tỉnh táo/ <span class="text-primary">Alert</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_cf" />
                                                            <span class="custom-control-label">Nhầm lẫn/ <span class="text-primary">Confused</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_ag" />
                                                            <span class="custom-control-label">Kích động/ <span class="text-primary">Agitated</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_an" />
                                                            <span class="custom-control-label">Lo âu/ <span class="text-primary">Anxious</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_fr" />
                                                            <span class="custom-control-label">Quấy/ <span class="text-primary">Fretful</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_le" />
                                                            <span class="custom-control-label">Lơ mơ/ <span class="text-primary">Lethargic</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_de" />
                                                            <span class="custom-control-label">Trầm cảm/ <span class="text-primary">Depressed</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox d-inline-block">
                                                            <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="cb_mental_status_oth" />
                                                            <span class="custom-control-label">Khác/ <span class="text-primary">Other</span></span>
                                                        </label>

                                                        <div class="form-group mental_status_other_field w-n">
                                                            <webUI:TextField runat="server" ID="txt_mental_status_other" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Thính giác/ <span class="text-primary">Hearing:</span></label>
                                                    <asp:Label runat="server" ID="lbl_hearing_code"></asp:Label>
                                                    <div runat="server" id="hearing_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hearing_code_n" name="rad_hearing_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hearing_code_n">Bình thường/ <span class="text-primary">Normal</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hearing_code_hi" name="rad_hearing_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hearing_code_hi">Khiếm thính/ <span class="text-primary">Hearing impaired</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_hearing_code_ha" name="rad_hearing_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_hearing_code_ha">Dùng máy trợ thính (Trái/Phải)/ <span class="text-primary">Uses hearing aid (Left/Right)</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_hearing_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare20" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a mb-2">
                                                    <label class="control-label mb-2 d-block">Thị giác/ <span class="text-primary">Vision:</span></label>
                                                    <asp:Label runat="server" ID="lbl_vision_code"></asp:Label>
                                                    <div runat="server" id="vision_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_vision_code_nm" name="rad_vision_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_vision_code_nm">Bình thường/ <span class="text-primary">Normal</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_vision_code_gl" name="rad_vision_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_vision_code_gl">Đeo kính/ <span class="text-primary">Glasses</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_vision_code_cl" name="rad_vision_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_vision_code_cl">Kính sát tròng/ <span class="text-primary">Contact lenses</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" disabled-for="vision_other_field" runat="server" id="rad_vision_code_oth" name="rad_vision_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_vision_code_oth">Khác/ <span class="text-primary">Other</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_vision_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare21" />
                                                            </a>
                                                        </div>

                                                        <div class="form-group vision_other_field w-n">
                                                            <webUI:TextField runat="server" ID="txt_vision_other" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2 d-block">Khả năng ngôn ngữ/ <span class="text-primary">Speech:</span></label>
                                                    <asp:Label runat="server" ID="lbl_speech_code"></asp:Label>
                                                    <div runat="server" id="speech_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_nm" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_nm">Bình thường/ <span class="text-primary">Normal</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_sl" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_sl">Nói lắp/ <span class="text-primary">Slurred</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_ap" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_ap">Chứng mất ngôn ngữ/ <span class="text-primary">Aphasic</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_nc" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_nc">Không giao tiếp (Bất tỉnh or mê)/ <span class="text-primary">Non-communicative(Unconscious )</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_si" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_si">Khiếm ngôn/ <span class="text-primary">Speech impaired</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_speech_code_nv" name="rad_speech_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_speech_code_nv">Chưa biết nói/ <span class="text-primary">Non-verbal</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_speech_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare19" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                            </fieldset>


                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">5. Hệ tiêu hóa/ <span class="text-primary">Gastrointestinal system</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">Chế độ ăn uống/ <span class="text-primary">Diet</span></label>
                                                    <asp:Label runat="server" ID="lbl_diet_desc"></asp:Label>
                                                    <div runat="server" id="diet_code_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_diet_code_nm" name="rad_diet_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_diet_code_nm">Bình thường/ <span class="text-primary">Normal</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_diet_code_bf" name="rad_diet_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_diet_code_bf">Bú bình/ <span class="text-primary">Bottle feeding</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" runat="server" id="rad_diet_code_tbf" name="rad_diet_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_diet_code_tbf">Bú mẹ hoàn toàn/ <span class="text-primary">Total breast feeding</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" disabled-for="diet_other_field" runat="server" id="rad_diet_code_oth" name="rad_diet_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_diet_code_oth">Khác/ <span class="text-primary">Other</span></label>

                                                            <a href="javascript:void(0)" data-clear="rad_diet_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare22" />
                                                            </a>

                                                            <div class="form-group w-n diet_other_field mt-2">
                                                                <webUI:TextField runat="server" ID="txt_diet_other" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a mb-2">
                                                    <label class="control-label d-block">Tình trạng hiện có/ <span class="text-primary">Presence of</span></label>
                                                    <div>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_diet_pre_desc"></asp:Label>
                                                        </div>
                                                        <div class="mb-2" runat="server" id="diet_pre_code_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_diet_pre_code_v" name="rad_diet_pre_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_diet_pre_code_v">Nôn/ <span class="text-primary">Vomiting</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_diet_pre_code_n" name="rad_diet_pre_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_diet_pre_code_n">Buồn nôn/ <span class="text-primary">Nausea</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_diet_pre_code_s" name="rad_diet_pre_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_diet_pre_code_s">Nuốt khó (chuyển đến chuyên gia trị liệu)/ <span class="text-primary">Swalloing difficulties (refer to therapist)</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_diet_pre_code" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare23" />
                                                                </a>
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_ng_tube"></asp:Label>

                                                            <div runat="server" id="ng_tube_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_ng_tube_true" name="rad_ng_tube" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_ng_tube_true">Ống thông/ <span class="text-primary">NG Tube</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_ng_tube_false" name="rad_ng_tube" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_ng_tube_false">Không/ <span class="text-primary">No</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_ng_tube" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare24" />
                                                                    </a>
                                                                </div>

                                                                <%--<asp:CustomValidator ID="CustomValidator9" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="ng_tube_ServerValidate"></asp:CustomValidator>--%>
                                                            </div>

                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_gastrostomy_true" />
                                                                <span class="custom-control-label">Mở dạ dày/ <span class="text-primary">Gastrostomy</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" disabled-for="size_note_field" class="custom-control-input" runat="server" id="cb_size_true" />
                                                                <span class="custom-control-label">Kích cỡ/ <span class="text-primary">Size</span></span>
                                                            </label>

                                                            <asp:Label runat="server" ID="lbl_size_note"></asp:Label>

                                                            <div runat="server" id="size_note_wrapper" class="form-group w-s size_note_field d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_size_note" />
                                                            </div>

                                                            <label class="control-label">Ngày thay ống gần nhất/ <span class="text-primary">Last Date Changed</span></label>

                                                            <asp:Label runat="server" ID="lbl_last_date_changed"></asp:Label>

                                                            <div class="d-inline-block" runat="server" id="last_date_changed_wrapper">
                                                                <telerik:RadDatePicker CssClass="ml-2" runat="server" ID="dpk_last_date_changed" Width="120px" />

                                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="dpk_last_date_changed" ErrorMessage="field is required"
                                                                    ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label d-block">Thức ăn không ưa thích/ <span class="text-primary">Food dislikes</span></label>

                                                    <asp:Label runat="server" ID="lbl_food_dislike"></asp:Label>
                                                    <div class="form-group" runat="server" id="food_dislike_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_food_dislike" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">Bài tiết/ <span class="text-primary">Bowel elimination</span></label>
                                                    <asp:Label runat="server" ID="lbl_bowel_elimination_desc"></asp:Label>
                                                    <div class="d-inline-block" runat="server" id="bowel_elimination_code_wrapper">
                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_bowel_elimination_code_two" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_bowel_elimination_code_two">2 lần/ ngày <span class="text-primary">(2 times/day)</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_bowel_elimination_code_one" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_bowel_elimination_code_one">1 lần/ ngày <span class="text-primary">(1 times/day)</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_bowel_elimination_code_eod" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_bowel_elimination_code_eod">Cách ngày/ <span class="text-primary">Every other day</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_bowel_elimination_code_oth" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_bowel_elimination_code_oth">Khác/ <span class="text-primary">Other</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_bowel_elimination_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare27" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">Tính chất phân/ <span class="text-primary">Consistency of stool</span></label>
                                                    <asp:Label runat="server" ID="lbl_stool_consistency_desc"></asp:Label>

                                                    <div class="d-inline-block" runat="server" id="stool_consistency_code_wrapper">
                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_stool_consistency_code_h" name="rad_stool_consistency_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stool_consistency_code_h">Cứng/ <span class="text-primary">Hard</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_stool_consistency_code_f" name="rad_stool_consistency_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stool_consistency_code_f">Có hình dạng/ <span class="text-primary">Formed</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_stool_consistency_code_l" name="rad_stool_consistency_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stool_consistency_code_l">Lỏng/ <span class="text-primary">Loose</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_stool_consistency_code_w" name="rad_stool_consistency_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stool_consistency_code_w">Phân nước/ <span class="text-primary">Watery</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_stool_consistency_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare25" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">
                                                        Tình trạng hiện có/ <span class="text-primary">Presence with
                                                        </span>
                                                    </label>

                                                    <asp:Label runat="server" ID="lbl_gas_presence_desc"></asp:Label>

                                                    <div runat="server" id="gas_presence_code_wrapper">
                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_gas_presence_code_n" name="rad_gas_presence_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_gas_presence_code_n">Bình thường/ <span class="text-primary">Normal</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_gas_presence_code_i" name="rad_gas_presence_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_gas_presence_code_i">Không kiểm soát/ <span class="text-primary">Incontinence</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_gas_presence_code_s" name="rad_gas_presence_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_gas_presence_code_s">Hậu môn nhân tạo/ <span class="text-primary">Stoma</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_gas_presence_code" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare26" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>

                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">6. Đánh giá dinh dưỡng ban đầu/ <span class="text-primary">Initial Nutrition Assessment</span></label>
                                                </legend>
                                                <div class="col-md-12">

                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>

                                                            <fieldset class="row mb-2">
                                                                <legend>
                                                                    <label class="control-label mb-2">Bảng 1: Khảo sát dinh dưỡng ban đầu/ <span class="text-primary">Table 1: Initial screening</span></label>
                                                                </legend>
                                                                <div class="col-md-12">
                                                                    <label class="control-label">1. Chỉ số BMI < 20.5/ <span class="text-primary">Is BMI < 20.5?</span></label>
                                                                    <asp:Label runat="server" ID="lbl_bmi_out_range"></asp:Label>
                                                                    <div class="d-inline-block" runat="server" id="bmi_out_range_wrapper">
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input type="radio" onchange="__doPostBack('initial_screening_change', '')" runat="server" id="rad_bmi_out_range_true" name="rad_bmi_out_range" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_bmi_out_range_true">Có/ <span class="text-primary">Yes</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input type="radio" runat="server" id="rad_bmi_out_range_false" onchange="__doPostBack('initial_screening_change', '')" name="rad_bmi_out_range" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_bmi_out_range_false">Không/ <span class="text-primary">No</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_bmi_out_range" onclick="clear_radiobutton(this)">
                                                                                <icon:xsquare runat="server" ID="XSquare28" />
                                                                            </a>
                                                                            <%--<asp:CustomValidator ID="CustomValidator2" CssClass="text-danger" ValidationGroup="Group1" OnServerValidate="bmi_out_range_ServerValidate" Display="Dynamic" ErrorMessage="field is required" runat="server" />--%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <label class="control-label">2. NB có sụt cân trong vòng 3 tháng gần đây không?/ <span class="text-primary">Has the patient lost weight within the last 3 months?</span></label>
                                                                    <asp:Label runat="server" ID="lbl_loss_weight"></asp:Label>
                                                                    <div runat="server" id="loss_weight_wrapper" class="d-inline-block">
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input type="radio" onchange="__doPostBack('initial_screening_change', '')" runat="server" id="rad_loss_weight_true" name="rad_loss_weight" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_loss_weight_true">Có/ <span class="text-primary">Yes</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input type="radio" runat="server" id="rad_loss_weight_false" onchange="__doPostBack('initial_screening_change', '')" name="rad_loss_weight" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_loss_weight_false">Không/ <span class="text-primary">No</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_loss_weight" onclick="clear_radiobutton(this)">
                                                                                <icon:xsquare runat="server" ID="XSquare29" />
                                                                            </a>
                                                                        </div>
                                                                        <%--<asp:CustomValidator ID="CustomValidator8" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="loss_weight_ServerValidate"></asp:CustomValidator>--%>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <label class="control-label">3. NB có chán ăn trong 1 tuần qua không?/ <span class="text-primary">Has the patient had a reduced dietary intake in the last week?</span></label>
                                                                    <asp:Label runat="server" ID="lbl_reduce_dietary"></asp:Label>
                                                                    <div runat="server" id="reduce_dietary_wrapper" class="d-inline-block">
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input onchange="__doPostBack('initial_screening_change', '')" type="radio" runat="server" id="rad_reduce_dietary_true" name="rad_reduce_dietary" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_reduce_dietary_true">Có/ <span class="text-primary">Yes</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input type="radio" onchange="__doPostBack('initial_screening_change', '')" runat="server" id="rad_reduce_dietary_false" name="rad_reduce_dietary" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_reduce_dietary_false">Không/ <span class="text-primary">No</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_reduce_dietary" onclick="clear_radiobutton(this)">
                                                                                <icon:xsquare runat="server" ID="XSquare30" />
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <label class="control-label">4. NB có bị bệnh gì nghiêm trọng không?/ <span class="text-primary">Is the patient severely ill?</span></label>
                                                                    <asp:Label runat="server" ID="lbl_severely_ill"></asp:Label>
                                                                    <div runat="server" id="severely_ill_wrapper" class="d-inline-block">
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input onchange="__doPostBack('initial_screening_change', '')" type="radio" runat="server" id="rad_severely_ill_true" name="rad_severely_ill" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_severely_ill_true">Có/ <span class="text-primary">Yes</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                            <input onchange="__doPostBack('initial_screening_change', '')" type="radio" runat="server" id="rad_severely_ill_false" name="rad_severely_ill" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_severely_ill_false">Không/ <span class="text-primary">No</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_severely_ill" onclick="clear_radiobutton(this)">
                                                                                <icon:xsquare runat="server" ID="XSquare31" />
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    Ghi chú: Thức ăn bao gồm ăn qua miệng và các đường khác (qua ống thông dạ dày hoặc dinh dưỡng qua đường TM)<br />
                                                                    <span class="text-primary">Note: Food intake includes food taken by mouth, and other route (tube feeding or parenteral nutrition)</span><br />
                                                                    - Nếu trả lời “có” cho bất kỳ câu hỏi nào ở bảng 1 thì vui lòng đánh giá tiếp ở bảng 2
                                                                <br />
                                                                    <span class="text-primary">The answer is ‘Yes’ to any question: go to the final screening in Table 2</span><br />
                                                                    - Nếu trả lời “không” cho bất kỳ câu hỏi nào ở bảng 1 thì vui lòng đánh giá lại mỗi tuần.<br />
                                                                    <span class="text-primary">The answer is ‘No’ to all questions: the patient is re-screened weekly
                                                                </div>
                                                            </fieldset>
                                                            <asp:PlaceHolder runat="server" ID="final_screening_field">
                                                                <fieldset class="row mb-2">
                                                                    <legend>
                                                                        <label class="control-label mb-2">Bảng 2: Khảo sát dinh dưỡng tiếp theo/ <span class="text-primary">Table 2: Final screening</span></label>
                                                                    </legend>
                                                                    <div class="col-md-12 mb-2">
                                                                        <fieldset class="row">
                                                                            <legend>
                                                                                <label class="control-label mb-2"><span class="text-primary">Nutrition status</span></label>
                                                                            </legend>
                                                                            <div class="col-md-12 gt-2-a">
                                                                                <label class="control-label mb-1 d-block">Điểm = 0/ <span class="text-primary">Score = 0</span></label>

                                                                                <label class="custom-control custom-checkbox" runat="server">
                                                                                    <input onchange="__doPostBack('nutrition_status_change', '0')" type="checkbox" class="custom-control-input" runat="server" id="cb_nutrition_normal_true" />
                                                                                    <span class="custom-control-label">Tình trạng dinh dưỡng bình thường/ <span class="text-primary">Normal nutritional status</span></span>
                                                                                </label>
                                                                            </div>

                                                                            <div class="col-md-12 gt-2-a">
                                                                                <label class="control-label mb-1 d-block">Điểm = 1/ <span class="text-primary">Score = 1</span></label>
                                                                                <asp:Label runat="server" ID="lbl_nutrition_score1"></asp:Label>

                                                                                <div runat="server" id="nutrition_score1_wrapper">
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" runat="server" onchange="__doPostBack('nutrition_status_change', '1')" id="cb_nutrition_score1_1" />
                                                                                        <span class="custom-control-label">Sụt cân > 5% trong 3 tháng/ <span class="text-primary">Weight loss > 5% in 3 months</span></span>
                                                                                    </label>

                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" onchange="__doPostBack('nutrition_status_change', '1')" class="custom-control-input" runat="server" id="cb_nutrition_score1_2" />
                                                                                        <span class="custom-control-label">Ăn ít 50%-75% so với nhu cầu ăn bình thường trong tuần qua/ <span class="text-primary">Food intake below 50 - 75% of normal requirement in preceding week</span></span>
                                                                                    </label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-12 gt-2-a">
                                                                                <label class="control-label mb-1 d-block">Điểm = 2/ <span class="text-primary">Score = 2</span></label>
                                                                                <asp:Label runat="server" ID="lbl_nutrition_score2"></asp:Label>
                                                                                <div runat="server" id="nutrition_score2_wrapper">
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" onchange="__doPostBack('nutrition_status_change', '2')" class="custom-control-input" runat="server" id="cb_nutrition_score2_1" />
                                                                                        <span class="custom-control-label">Sụt cân > 5% trong 2 tháng/ <span class="text-primary">Weight loss > 5% in 2 months</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" onchange="__doPostBack('nutrition_status_change', '2')" class="custom-control-input" runat="server" id="cb_nutrition_score2_2" />
                                                                                        <span class="custom-control-label">BMI 18.5-20.5 và tổng trạng suy yếu/ <span class="text-primary">BMI 18.5 - 20.5 and impaired general condition</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" onchange="__doPostBack('nutrition_status_change', '2')" class="custom-control-input" runat="server" id="cb_nutrition_score2_3" />
                                                                                        <span class="custom-control-label">Ăn ít 25%-50% so với nhu cầu ăn bình thường trong tuần qua/ <span class="text-primary">Food intake 25–50% of normal requirement in preceding week</span></span>
                                                                                    </label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-12 gt-2-a">
                                                                                <label class="control-label mb-1 d-block">Điểm = 3/ <span class="text-primary">Score = 3</span></label>

                                                                                <asp:Label runat="server" ID="lbl_nutrition_score3"></asp:Label>
                                                                                <div runat="server" id="nutrition_score3_wrapper">
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" onchange="__doPostBack('nutrition_status_change','')" runat="server" id="cb_nutrition_score3_1" />
                                                                                        <span class="custom-control-label">Sụt cân > 5% trong 1 tháng/ <span class="text-primary">Weight loss > 5% in 1 month</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" onchange="__doPostBack('nutrition_status_change', '')" runat="server" id="cb_nutrition_score3_2" />
                                                                                        <span class="custom-control-label">BMI < 18.5 và tổng trạng suy yếu/ <span class="text-primary">BMI < 18.5 and impaired general condition</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" onchange="__doPostBack('nutrition_status_change', '')" runat="server" id="cb_nutrition_score3_3" />
                                                                                        <span class="custom-control-label">Ăn ít 0-25% so với nhu cầu ăn bình thường trong tuần qua/ <span class="text-primary">Food intake 0-25% of normal requirement in preceding week</span></span>
                                                                                    </label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-12 gt-2-a">
                                                                                <label class="control-label mb-1 mr-2">
                                                                                    Điểm/ <span class="text-primary">Score</span>
                                                                                    <icon:Calculator runat="server" Width="16" Height="16" />
                                                                                </label>
                                                                                <asp:Label Text="—" runat="server" ID="nutrition_score"></asp:Label>
                                                                            </div>
                                                                        </fieldset>
                                                                    </div>

                                                                    <div class="col-md-12 mb-2">
                                                                        <fieldset class="row">
                                                                            <legend>
                                                                                <label class="control-label mb-2"><span class="text-primary">Severity of disease</span></label>
                                                                            </legend>
                                                                            <div class="col-md-12 gt-2-a">
                                                                                <label class="control-label mb-1 d-block">Điểm = 0/ <span class="text-primary">Score = 0</span></label>
                                                                                <label class="custom-control custom-checkbox">
                                                                                    <input type="checkbox" id="cb_nutrition_requiredment_true" class="custom-control-input" runat="server" />
                                                                                    <span class="custom-control-label">Yêu cầu dinh dưỡng đặc biệt/ <span class="text-primary">Normal nutritional requirements</span></span>
                                                                                </label>
                                                                            </div>
                                                                            <div class="col-md-12 gt-2-a">
                                                                                <label class="control-label mb-1 d-block">Điểm = 1/ <span class="text-primary">Score = 1</span></label>
                                                                                <asp:Label runat="server" ID="lbl_severity_score1"></asp:Label>
                                                                                <div runat="server" id="severity_score1_wrapper">
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input onchange="__doPostBack('severity_of_disease_change', '')" type="checkbox" class="custom-control-input" runat="server" id="cb_severity_score1_1" />
                                                                                        <span class="custom-control-label">Gãy khớp háng/ <span class="text-primary">Hip fracture</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" onchange="__doPostBack('severity_of_disease_change', '')" runat="server" id="cb_severity_score1_2" />
                                                                                        <span class="custom-control-label">Bệnh mãn tính có kèm theo biến chứng/ <span class="text-primary">Chronic disease with complications</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" onchange="__doPostBack('severity_of_disease_change', '')" runat="server" id="cb_severity_score1_3" />
                                                                                        <span class="custom-control-label">Viêm phổi tắc nghẽn mãn tính/ <span class="text-primary">COPD</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" onchange="__doPostBack('severity_of_disease_change', '')" runat="server" id="cb_severity_score1_4" />
                                                                                        <span class="custom-control-label">NB yếu nhưng có thể di chuyển được/ <span class="text-primary">The patient is weak but can move out of bed</span></span>
                                                                                    </label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-12 gt-2-a">
                                                                                <label class="control-label mb-1 d-block">Điểm = 2/ <span class="text-primary">Score = 2</span></label>
                                                                                <asp:Label runat="server" ID="lbl_severity_score2"></asp:Label>
                                                                                <div runat="server" id="severity_score2_wrapper">
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" onchange="__doPostBack('severity_of_disease_change', '')" runat="server" id="cb_severity_score2_1" />
                                                                                        <span class="custom-control-label">Có phẫu thuật ở bụng/ <span class="text-primary">Major abdominal surgery</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" onchange="__doPostBack('severity_of_disease_change', '')" class="custom-control-input" runat="server" id="cb_severity_score2_2" />
                                                                                        <span class="custom-control-label">Đột quị/ <span class="text-primary">Stroke</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" onchange="__doPostBack('severity_of_disease_change', '')" class="custom-control-input" runat="server" id="cb_severity_score2_3" />
                                                                                        <span class="custom-control-label">Viêm phổi nặng/ <span class="text-primary">Severe pneumonia</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="cb_severity_score2_4" />
                                                                                        <span class="custom-control-label">Bệnh ác tính huyết học/ <span class="text-primary">Hematologic malignancy</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" onchange="__doPostBack('severity_of_disease_change', '')" class="custom-control-input" runat="server" id="cb_severity_score2_5" />
                                                                                        <span class="custom-control-label">NB nằm liệt giường/ <span class="text-primary">The patient is bedridden</span></span>
                                                                                    </label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-12 gt-2-a">
                                                                                <label class="control-label mb-1 d-block">Điểm = 3/ <span class="text-primary">Score = 3</span></label>
                                                                                <asp:Label runat="server" ID="lbl_severity_score3"></asp:Label>
                                                                                <div runat="server" id="severity_score3_wrapper">
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" onchange="__doPostBack('severity_of_disease_change', '')" runat="server" id="cb_severity_score3_1" />
                                                                                        <span class="custom-control-label">Chấn thương đầu/ <span class="text-primary">Head injury</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" onchange="__doPostBack('severity_of_disease_change', '')" runat="server" id="cb_severity_score3_2" />
                                                                                        <span class="custom-control-label">Ghép tủy xương/ <span class="text-primary">Bone marrow transplantation</span></span>
                                                                                    </label>
                                                                                    <label class="custom-control custom-checkbox">
                                                                                        <input type="checkbox" class="custom-control-input" onchange="__doPostBack('severity_of_disease_change', '')" runat="server" id="cb_severity_score3_3" />
                                                                                        <span class="custom-control-label">Bệnh nhân chăm sóc chuyên sâu (APACHE> 10)/ <span class="text-primary">Intensive care patients (APACHE > 10)</span></span>
                                                                                    </label>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-12 gt-2-a">
                                                                                <label class="control-label mb-1 mr-2">
                                                                                    Điểm/ <span class="text-primary">Score</span>
                                                                                    <icon:Calculator runat="server" Width="16" Height="16" />
                                                                                </label>

                                                                                <asp:Label Text="—" class="d-inline-block" runat="server" ID="severity_score"></asp:Label>
                                                                            </div>

                                                                        </fieldset>
                                                                    </div>

                                                                    <div class="col-md-12 mb-2">
                                                                        <fieldset class="row">
                                                                            <legend>
                                                                                <label class="control-label mb-2"><span class="text-primary">Age</span></label>
                                                                            </legend>
                                                                            <div class="col-md-12  gt-2-a">
                                                                                <label class="control-label mb-1 d-block">Điểm = 0/ <span class="text-primary">Score = 0</span></label>
                                                                                <label class="custom-control custom-checkbox">
                                                                                    <input type="checkbox" class="custom-control-input" id="cb_younger_70_true" runat="server" />
                                                                                    <span class="custom-control-label">< 70 tuổi/ <span class="text-primary">< 70 years old</span></span>
                                                                                </label>
                                                                            </div>
                                                                            <div class="col-md-12  gt-2-a">
                                                                                <label class="control-label mb-1 d-block">Điểm = 1/ <span class="text-primary">Score = 1</span></label>
                                                                                <label class="custom-control custom-checkbox">
                                                                                    <input type="checkbox" class="custom-control-input" onchange="__doPostBack('age_change', '')" runat="server" id="cb_older_70_true" />
                                                                                    <span class="custom-control-label">≥ 70 tuổi/ <span class="text-primary">≥ 70 years old</span></span>
                                                                                </label>
                                                                            </div>

                                                                            <div class="col-md-12 gt-2-a">
                                                                                <label class="control-label mb-1 mr-2">
                                                                                    Điểm/ <span class="text-primary">Score</span>
                                                                                    <icon:Calculator runat="server" Width="16" Height="16" />
                                                                                </label>
                                                                                <asp:Label runat="server" ID="age_score"></asp:Label>
                                                                            </div>

                                                                        </fieldset>
                                                                    </div>

                                                                    <div class="col-md-12">
                                                                        <label class="control-label mb-1 mr-2">
                                                                            TỔNG SỐ ĐIỂM/ <span class="text-primary">TOTAL SCORE</span>
                                                                            <icon:Calculator runat="server" Width="16" Height="16" />
                                                                        </label>
                                                                        <asp:Label Text="—" runat="server" ID="total_nutri_score"></asp:Label>
                                                                        <p>
                                                                            *Ghi chú: Khi đánh giá điểm cho mỗi tiêu chí thì luôn luôn chọn điểm cao nhất. Sau đó Sau đó cộng tất cả các điểm số ở cuối để có điểm số cuối cùng<br />
                                                                            <span class="text-primary">Notes: When assessing the score for each criterion, always choose the highest score. Then add up all scores at the end to get the final score</span><br />
                                                                            - Nếu điểm <3: đánh giá lại Nb mỗi tuần/ <span class="text-primary">If score < 3: weekly re-screening of the patient</span><br />
                                                                            - Nếu điểm ≥ 3: giới thiệu NB đến khám chuyên gia dinh dưỡng/ <span class="text-primary">If score ≥ 3: refer patients to the nutritionists</span>
                                                                        </p>
                                                                    </div>
                                                                </fieldset>
                                                            </asp:PlaceHolder>

                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">7. Hệ tiết niệu sinh dục/ <span class="text-primary">Genitourinary system</span></label>
                                                </legend>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">Tiểu/ <span class="text-primary">Urination</span></label>
                                                    <div>
                                                        <div class="mb-2">
                                                            <asp:Label runat="server" ID="lbl_urination"></asp:Label>
                                                        </div>

                                                        <div class="mb-2" runat="server" id="urination_wrapper">
                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_nm" />
                                                                <span class="custom-control-label">Không có vấn đề/ <span class="text-primary">Normal</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_no" />
                                                                <span class="custom-control-label">Tiểu đêm/ <span class="text-primary">Nocturia</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_fr" />
                                                                <span class="custom-control-label">Thường xuyên/ <span class="text-primary">Frequency</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_dy" />
                                                                <span class="custom-control-label">Khó tiểu/ <span class="text-primary">Dysuria</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_in" />
                                                                <span class="custom-control-label">Không kiểm soát/ <span class="text-primary">Incontinece</span></span>
                                                            </label>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_inter_catheter_true" />
                                                                <span class="custom-control-label">Thông tiểu ngắt quãng (lần/ ngày)/ <span class="text-primary">Intermittent catheterization</span></span>
                                                            </label>
                                                            <asp:Label runat="server" ID="lbl_inter_catheter"></asp:Label>
                                                            <div class="form-group w-s d-inline-block" runat="server" id="inter_catheter_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_inter_catheter_note" />
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_ind_catheter_true" />
                                                                <span class="custom-control-label">Ống thông tiểu lưu/ <span class="text-primary">Indwelling catheter</span></span>
                                                            </label>
                                                            <label class="mr-2">Kích cỡ/ <span class="text-primary">Size</span></label>
                                                            <asp:Label runat="server" ID="lbl_ind_catheter_size"></asp:Label>
                                                            <div class="form-group w-s mr-2 d-inline-block" runat="server" id="ind_catheter_size_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_ind_catheter_size" />
                                                            </div>

                                                            <div class="d-inline-block">
                                                                <label class="control-label mr-2">Ngày thay gần nhất/ <span class="text-primary">Fr, Date last changed</span></label>
                                                                <asp:Label runat="server" ID="lbl_ind_catheter_date"></asp:Label>
                                                                <div runat="server" id="ind_catheter_date_wrapper" class="d-inline-block">
                                                                    <telerik:RadDatePicker runat="server" ID="dpk_ind_catheter_date" Width="120px" />
                                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="dpk_ind_catheter_date" ErrorMessage="field is required"
                                                                        ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="mb-2">
                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_sup_catheter_true" />
                                                                <span class="custom-control-label">Ống thông bàng quang qua da/ <span class="text-primary">Suprapubic catheter</span></span>
                                                            </label>

                                                            <label class="mr-2">Kích cỡ/ <span class="text-primary">Size</span></label>
                                                            <asp:Label runat="server" ID="lbl_sup_catheter_size"></asp:Label>
                                                            <div class="form-group w-s mr-2 size_note_field d-inline-block" runat="server" id="sup_catheter_size_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_sup_catheter_size" />
                                                            </div>

                                                            <label class="control-label mr-2">Ngày thay gần nhất/ <span class="text-primary">Fr, Date last changed</span></label>
                                                            <asp:Label runat="server" ID="lbl_last_sup_catheter_date"></asp:Label>
                                                            <div runat="server" id="last_sup_catheter_date_wrapper" class="d-inline-block">
                                                                <telerik:RadDatePicker runat="server" ID="dpk_last_sup_catheter_date" Width="120px" />
                                                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="dpk_last_sup_catheter_date" ErrorMessage="field is required"
                                                                    ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="control-label d-block">Đối với người bệnh nữ/ <span class="text-primary">For female patients only:</span></label>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <div></div>
                                                    <div>
                                                        <label class="control-label d-block">Kinh nguyệt/ <span class="text-primary">Menstruation:</span></label>

                                                        <asp:Label runat="server" ID="lbl_menstruation_code"></asp:Label>

                                                        <div class="d-inline-block" runat="server" id="menstruation_code_wrapper">
                                                            <div class="custom-control custom-radio mr-2 d-inline-block">
                                                                <input disabled-for="final_screening" type="radio" runat="server" id="rad_menstruation_code_am" name="rad_menstruation_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_menstruation_code_am">Vô kinh/ <span class="text-primary">Amenorrhea</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio mr-2 d-inline-block">
                                                                <input disabled-for="final_screening" type="radio" runat="server" id="rad_menstruation_code_me" name="rad_menstruation_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_menstruation_code_me">Mãn kinh/ <span class="text-primary">Menopause</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio mr-2 d-inline-block">
                                                                <input disabled-for="final_screening" type="radio" runat="server" id="rad_menstruation_code_cy" name="rad_menstruation_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_menstruation_code_cy">Chu kỳ (ngày)/ <span class="text-primary">Cycle (day)</span></label>
                                                            </div>

                                                            <div class="form-group mr-2 w-s d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_cycle_day" />
                                                            </div>

                                                            <label class="control-label mr-2">Ngày đầu của kỳ kinh cuối/ <span class="text-primary">Last menstrual period started:</span></label>

                                                            <div class="form-group w-s mr-2 d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_last_mens_period" />
                                                            </div>
                                                        </div>

                                                        <label class="control-label d-block">Có thai/ <span class="text-primary">Pregnancy:</span></label>

                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_not_pregnancy"></asp:Label>
                                                        </div>

                                                        <div runat="server" id="not_pregnancy_wrapper">
                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_not_pregnancy_true" />
                                                                <span class="custom-control-label">Không/ <span class="text-primary">No</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_pregnancy_true" />
                                                                <span class="custom-control-label">Đã từng mang thai trước đây/ <span class="text-primary">Previous pregnancy</span></span>
                                                            </label>

                                                            <label class="control-label mr-2"><span class="text-primary">PARA</span></label>

                                                            <div class="form-group w-s mr-2 d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_para" />
                                                            </div>

                                                            <label class="custom-control custom-checkbox mr-2 d-inline-block">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_cur_pregnancy_True" />
                                                                <span class="custom-control-label">Hiện đang mang thai/ <span class="text-primary">Current pregnancy</span></span>
                                                            </label>

                                                            <div class="form-group w-5 d-inline-block">
                                                                <input id="txt_pregnancy_week" runat="server" class="form-control text-right" />
                                                                <span class="append">tuần/ week</span>
                                                            </div>
                                                        </div>

                                                        <label class="control-label mb-1 d-block">Ngừa thai/ <span class="text-primary">Contraception</span></label>

                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_contraception_code"></asp:Label>
                                                        </div>

                                                        <div runat="server" id="contraception_code_wrapper">
                                                            <div class="custom-control custom-radio mr-2 d-inline-block">
                                                                <input disabled-for="final_screening" type="radio" runat="server" id="rad_contraception_code_no" name="rad_contraception_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_contraception_code_no">Không/ <span class="text-primary">No</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio mr-2 d-inline-block">
                                                                <input disabled-for="final_screening" type="radio" runat="server" id="rad_contraception_code_pill" name="rad_contraception_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_contraception_code_pill">Thuốc ngừa thai/ <span class="text-primary">Contraceptive pill</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio mr-2 d-inline-block">
                                                                <input disabled-for="final_screening" type="radio" runat="server" id="rad_contraception_code_dev" name="rad_contraception_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_contraception_code_dev">Dụng cụ ngừa thai đặt trong tử cung/ <span class="text-primary">Intrauterine Device</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio mr-2 d-inline-block">
                                                                <input disabled-for="final_screening" type="radio" runat="server" id="rad_contraception_code_oth" name="rad_contraception_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_contraception_code_oth">Khác/ <span class="text-primary">Other</span></label>
                                                            </div>

                                                            <div class="form-group w-5 d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_contraception_other" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">8. Hệ cơ xương khớp/ <span class="text-primary">Musculoskeletal System</span></label>
                                                </legend>
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label d-block">Tiền sử/ <span class="text-primary">History</span></label>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_mus_history"></asp:Label>
                                                        <div runat="server" id="mus_history_wrapper">
                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_nm" />
                                                                <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_jp" />
                                                                <span class="custom-control-label">Đau khớp/ <span class="text-primary">Joint pain</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_js" />
                                                                <span class="custom-control-label">Sưng khớp/ <span class="text-primary">Joint swelling</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_ms" />
                                                                <span class="custom-control-label">Sự co rút cơ/ <span class="text-primary">Muscle spasms</span></span>
                                                            </label>
                                                        </div>

                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_paralysis"></asp:Label>
                                                        </div>

                                                        <div runat="server" class="mb-2" id="paralysis_wrapper">
                                                            <label class="custom-control custom-checkbox d-inline mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_paralysis_true" />
                                                                <span class="custom-control-label">Liệt/ (1/2 người/2 chi/4 chi)/ <span class="text-primary">Paralysis (Hemi/Para/Tetra)</span></span>
                                                            </label>

                                                            <div class="form-group w-s mt-1 d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_paralysis_note" />
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_amputation"></asp:Label>
                                                        </div>

                                                        <div runat="server" class="mb-2" id="amputation_wrapper">
                                                            <label class="custom-control custom-checkbox d-inline">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_amputation_true" />
                                                                <span class="custom-control-label">Đoạn chi/ <span class="text-primary">Amputation</span></span>
                                                            </label>

                                                            <div class="form-group w-s d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_amputation_note" />
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_contracture"></asp:Label>
                                                        </div>

                                                        <div runat="server" class="mb-2" id="contracture_wrapper">
                                                            <label class="custom-control custom-checkbox mb-1 d-inline mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_contracture_true" />
                                                                <span class="custom-control-label">Cơ bắp co rút/ <span class="text-primary">Contracture</span></span>

                                                            </label>

                                                            <div class="form-group w-s d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_contracture_note" />
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_prosthesis"></asp:Label>
                                                        </div>

                                                        <div runat="server" id="prosthesis_wrapper">
                                                            <label class="custom-control custom-checkbox mb-1 d-inline">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_prosthesis_true" />
                                                                <span class="custom-control-label">Lắp bộ phận giả/ <span class="text-primary">Prosthesis</span></span>
                                                            </label>

                                                            <div class="form-group w-s d-inline-block">
                                                                <webUI:TextField runat="server" ID="txt_prosthesis_note" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">9. Đau/ <span class="text-primary">Pain</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label d-inline-block mr-2">Hiện đang đau/ <span class="text-primary">Currently in pain</span></label>
                                                    <asp:Label runat="server" ID="lbl_cur_in_pain"></asp:Label>

                                                    <div class="d-inline-block" runat="server" id="cur_in_pain_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_cur_in_pain_false" runat="server" name="rad_cur_in_pain" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_cur_in_pain_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_cur_in_pain_true" runat="server" name="rad_cur_in_pain" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_cur_in_pain_true">
                                                                Có(báo bác sỹ)/ <span class="text-primary">Yes (inform doctor)</span>
                                                            </label>

                                                            <a href="javascript:void(0)" data-clear="rad_cur_in_pain" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare43" />
                                                            </a>
                                                            <%--<asp:CustomValidator ID="CustomValidator6" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="cur_in_pain_ServerValidate"></asp:CustomValidator>--%>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <table class="table table-bordered">
                                                        <tbody>
                                                            <tr>
                                                                <th scope="row" style="width: 376px;">
                                                                    <div class="mt-2 mb-2">Pain Assessment Description</div>
                                                                </th>
                                                                <td>
                                                                    <div class="mt-2 mb-2">Location 1</div>
                                                                </td>
                                                                <td>
                                                                    <div class="mt-2 mb-2">Location 2</div>
                                                                </td>
                                                                <td>
                                                                    <div class="mt-2 mb-2">Location 3</div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">P Provoking factors (what factors precipitated the discomfort?)</th>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_p_location_1"></asp:Label>
                                                                    <div class="form-group" runat="server" id="p_location_1_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_p_location_1" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_p_location_2"></asp:Label>
                                                                    <div class="form-group" runat="server" id="p_location_2_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_p_location_2" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_p_location_3"></asp:Label>
                                                                    <div class="form-group" runat="server" id="p_location_3_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_p_location_3" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">Q Quality (describe the pain,discomfort, & characteristics of pain).</th>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_q_location_1"></asp:Label>
                                                                    <div class="form-group" runat="server" id="q_location_1_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_q_location_1" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_q_location_2"></asp:Label>
                                                                    <div class="form-group" runat="server" id="q_location_2_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_q_location_2" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_q_location_3"></asp:Label>
                                                                    <div class="form-group" runat="server" id="q_location_3_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_q_location_3" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">R Region/ Radiation (where is the pain?does it radiate?) </th>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_r_location_1"></asp:Label>
                                                                    <div class="form-group" runat="server" id="r_location_1_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_r_location_1" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_r_location_2"></asp:Label>
                                                                    <div class="form-group" runat="server" id="r_location_2_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_r_location_2" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_r_location_3"></asp:Label>
                                                                    <div class="form-group" runat="server" id="r_location_3_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_r_location_3" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">S Severity (rate pain score) </th>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_s_location_1"></asp:Label>
                                                                    <div class="form-group" runat="server" id="s_location_1_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_s_location_1" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_s_location_2"></asp:Label>
                                                                    <div class="form-group" runat="server" id="s_location_2_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_s_location_2" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_s_location_3"></asp:Label>
                                                                    <div class="form-group" runat="server" id="s_location_3_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_s_location_3" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th scope="row">T Time (how long the patient had the pain?</th>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_t_location_1"></asp:Label>
                                                                    <div class="form-group" runat="server" id="t_location_1_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_t_location_1" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_t_location_2"></asp:Label>
                                                                    <div class="form-group" runat="server" id="t_location_2_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_t_location_2" />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <asp:Label runat="server" ID="lbl_t_location_3"></asp:Label>
                                                                    <div class="form-group" runat="server" id="t_location_3_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_t_location_3" />
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label></label>
                                                    <img src="" id="pain_annotation_img" runat="server" style="display: none;" />
                                                        <asp:HiddenField runat="server" ID="pain_annotation_base64" />

                                                        <div style="width: 500px;">
                                                            <div id="controllers">
                                                                <span runat="server" class="controller btn btn-secondary" id="pain_annotation_undo">undo</span>
                                                                <span runat="server" class="controller btn btn-secondary" id="pain_annotation_redo">redo</span>
                                                                <div runat="server" id="pain_annotation_pencilWrapper"  class=" btn btn-secondary">
                                                                    <svg id="pain_annotation_pencil" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                    </svg>
                                                                </div>
                                                                <%--<span class="controller btn btn-secondary" id="note">note</span>--%>
                                                            </div>
                                                            <canvas id="pain_annotation_canvas" runat="server"></canvas>
                                                        </div>
                                                    </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1 mr-2">Sử dụng thuốc giảm đau/ <span class="text-primary">Using painkiller:</span></label>

                                                    <asp:Label runat="server" ID="lbl_using_pain_killer"></asp:Label>

                                                    <div runat="server" id="using_pain_killer_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block mr-2" runat="server" id="sing_pain_killer_wrapper">
                                                            <input type="radio" id="rad_using_pain_killer_false" runat="server" name="rad_using_pain_killer" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_using_pain_killer_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_using_pain_killer_true" runat="server" name="rad_using_pain_killer" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_using_pain_killer_true">
                                                                Có(báo bác sỹ)/ <span class="text-primary">Yes (inform doctor)</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_using_pain_killer" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare44" />
                                                            </a>
                                                            <%--<asp:CustomValidator ID="CustomValidator15" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="this field is requested" CssClass="text-danger" OnServerValidate="using_pain_killer_ServerValidate"></asp:CustomValidator>--%>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Tên thuốc/ <span class="text-primary">Name of painkiller:</span></label>
                                                    <asp:Label runat="server" ID="lbl_pain_killer_name"></asp:Label>
                                                    <div class="form-group w-n mt-1 d-inline-block mb-2" runat="server" id="pain_killer_name_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_pain_killer_name" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Nhận xét/ <span class="text-primary">Comments:</span></label>
                                                    <asp:Label runat="server" ID="lbl_pa_comment"></asp:Label>
                                                    <div class="form-group" runat="server" id="pa_comment_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_pa_comment" />
                                                    </div>
                                                </div>

                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">10. Da & Nguy cơ loét tỳ đè/ <span class="text-primary">Skin & Pressure Sore Risk</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-2">Tình trạng/ <span class="text-primary">Condition</span></label>

                                                    <asp:Label runat="server" ID="lbl_condition"></asp:Label>

                                                    <div runat="server" id="condition_wrapper">
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_nm" />
                                                            <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_pa" />
                                                            <span class="custom-control-label">Tái/ <span class="text-primary">Pale</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_fl" />
                                                            <span class="custom-control-label">Đỏ/ <span class="text-primary">Flush</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_ja" />
                                                            <span class="custom-control-label">Vàng da/ <span class="text-primary">Jaundiced</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_dr" />
                                                            <span class="custom-control-label">Khô/ <span class="text-primary">Dry</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_oi" />
                                                            <span class="custom-control-label">Nhờn/ <span class="text-primary">Oily</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_sw" />
                                                            <span class="custom-control-label">Nhiều mồ hôi/ <span class="text-primary">Sweaty</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_ra" />
                                                            <span class="custom-control-label">Phát ban/ <span class="text-primary">Rash</span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-2">Vết thương/ <span class="text-primary">Wounds</span></label>

                                                    <asp:Label runat="server" ID="lbl_wounds"></asp:Label>

                                                    <div runat="server" id="wounds_wrapper">
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_1" />
                                                            <span class="custom-control-label">Máu tụ (1)/ <span class="text-primary">Haematoma</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_2" />
                                                            <span class="custom-control-label">Sự thâm tím (2)/ <span class="text-primary">Bruises</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_3" />
                                                            <span class="custom-control-label">Rách (3)/ <span class="text-primary">Laceration</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_4" />
                                                            <span class="custom-control-label">Sẹo (4)/ <span class="text-primary">Scar</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_5" />
                                                            <span class="custom-control-label">Phỏng (5)/ <span class="text-primary">Burn</span></span>
                                                        </label>
                                                        <label class="custom-control custom-checkbox mb-1 d-inline">
                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_6" />
                                                            <span class="custom-control-label">Loét do tỳ đè (6)/ <span class="text-primary">Pressure sore</span></span>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label></label>
                                                    <div>
                                                        Biểu thị vùng da với chỉ số tương ứng trên sơ đồ cơ thể và mô tả vết thương dưới dây<br />
                                                        <span class="text-primary">Indicate the location with the corresponding number in the body diagram and describe the wound below.</span><br />
                                                        Chỉ rõ vùng của vết thương bằng chỉ số tương ứng (1-6) dưới đây<br />
                                                        <span class="text-primary">Specify location of wound with the corresponding number (1-6) below</span>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <asp:UpdatePanel ID="updatePanel_skin_anno" runat="server" UpdateMode="Always">
                                                        <ContentTemplate>
                                                            <asp:GridView ShowHeaderWhenEmpty="true" ShowHeader="true" ID="grid_skin_anno" runat="server" CssClass="tb-responsive table-bordered" OnRowDeleting="grid_skin_anno_RowDeleting" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div class="w-s pt-2 pb-2">Vùng/ <span class="text-primary">Location</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <div class="form-group">
                                                                                <webUI:TextField runat="server" ID="location" Value='<%#Eval("location") %>' />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField>
                                                                        <HeaderTemplate>
                                                                            <div class="w-n">Loại vết thương và mô tả vết thương (vd: kích cỡ, độ sâu, màu…)/ <span class="text-primary">Wound type and description (i.e. size, depth, colour…)</span></div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <webUI:TextField Value='<%#Eval("type") %>' ID="type" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                                <icon:Trash runat="server" ID="Trash" />
                                                                            </asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>

                                                            </asp:GridView>
                                                            <asp:UpdateProgress ID="updateProgress_skin_anno" runat="server" AssociatedUpdatePanelID="updatePanel_skin_anno">
                                                                <ProgressTemplate>
                                                                    Please wait....
                                                                </ProgressTemplate>
                                                            </asp:UpdateProgress>
                                                            <div class="mt-2">
                                                                <asp:Button ID="btn_grid_skin_anno_add" runat="server" CssClass="btn btn-sm btn-outline-primary" OnClick="btn_grid_skin_anno_add_Click" Text="Add row" />
                                                            </div>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="btn_grid_skin_anno_add" EventName="Click" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>


                                                <div class="col-md-12 mb-2">
                                                    <img src="" id="skin_anno_data_img" runat="server" style="display: none;" />
                                                        <asp:HiddenField runat="server" ID="skin_anno_data_base64" />

                                                        <div style="width: 500px;">
                                                            <div id="controllers1">
                                                                <span runat="server" class="controller btn btn-secondary" id="skin_anno_data_undo">undo</span>
                                                                <span runat="server" class="controller btn btn-secondary" id="skin_anno_data_redo">redo</span>
                                                                <div runat="server" id="skin_anno_data_pencil_wrapper"  class=" btn btn-secondary">
                                                                    <svg id="skin_anno_data_pencil" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                        <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                    </svg>
                                                                </div>
                                                                <%--<span class="controller btn btn-secondary" id="note">note</span>--%>
                                                            </div>
                                                            <canvas id="skin_anno_data_canvas" runat="server"></canvas>
                                                            <%--<div>
                                                                <div style="display: flex; align-items: center;">
                                                                    2
                                                                    <webUI:TextField runat="server" ID="TextField1" />
                                                                    <div class="btn btn-outline-secondary ml-1">
                                                                        <icon:Trash runat="server" ID="Trash" />
                                                                    </div>
                                                                </div>
                                                            </div>--%>
                                                        </div>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <img src="../images/2021-05-25_21-54-42.png" />
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    Đánh giá nguy cơ loét tỳ đè được cải tiến thang Braden<br />
                                                    <span class="text-primary">Pressure Sore risk assessment-Modified Braden</span><br />
                                                    Hướng dẫn: So sánh tình trạng của người bệnh với mô tả phù hợp nhất của từng loại. Ghi điểm (bằng số) ở cột bên phải. Cộng lại ở bên dưới để tính.<br />
                                                    <span class="text-primary">Guidance: Compare the patient’s condition to the most appropriate description for each category. Note the score (written as a number) at the right column. Add up at the bottom to receive the total score.</span>
                                                </div>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Nhận thức giác quan/ <span class="text-primary">Sensory perception</span></label>
                                                            <asp:Label runat="server" ID="lbl_sensory_code"></asp:Label>
                                                            <div runat="server" id="sensory_code_wrapper">
                                                                <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_sensory_code" class="custom-select d-inline-block w-n mb-2">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Độ ẩm/ <span class="text-primary">Moisture</span></label>
                                                            <asp:Label runat="server" ID="lbl_moisture_code"></asp:Label>
                                                            <div runat="server" id="moisture_code_wrapper">
                                                                <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_moisture_code" class="custom-select d-inline-block w-n mb-2">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Vận động/ <span class="text-primary">Activity</span></label>
                                                            <asp:Label runat="server" ID="lbl_activity_code"></asp:Label>
                                                            <div runat="server" id="activity_code_wrapper">
                                                                <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_activity_code" class="custom-select d-inline-block w-n mb-2">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Di chuyển/ <span class="text-primary">Mobility</span></label>
                                                            <asp:Label runat="server" ID="lbl_mobility_code"></asp:Label>
                                                            <div runat="server" id="mobility_code_wrapper">
                                                                <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_mobility_code" class="custom-select d-inline-block w-n mb-2">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Dinh dưỡng/ <span class="text-primary">Nutrition</span></label>
                                                            <asp:Label runat="server" ID="lbl_nutrition_code"></asp:Label>
                                                            <div runat="server" id="nutrition_code_wrapper">
                                                                <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_nutrition_code" class="custom-select d-inline-block w-n mb-2">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Sự ma sát & trượt da/ <span class="text-primary">Friction & shear</span></label>
                                                            <asp:Label runat="server" ID="lbl_friction_code"></asp:Label>
                                                            <div runat="server" id="friction_code_wrapper">
                                                                <select onchange="__doPostBack('total_score_change', '')" runat="server" id="select_friction_code" class="custom-select d-inline-block w-n">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">
                                                                Tổng số điểm/ <span class="text-primary">Total Score</span>
                                                                <icon:Calculator runat="server" Width="16" Height="16" />
                                                            </label>
                                                            <asp:Label Text="—" runat="server" ID="total_score"></asp:Label>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label">Nguy cơ loát tỳ đè/ <span class="text-primary">Pressure sore risk</span></label>
                                                            <asp:Label Text="—" runat="server" ID="pres_sore_risk_desc"></asp:Label>
                                                        </div>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label">Cách phòng ngừa tương ứng với những nguy cơ xác định/ <span class="text-primary">Take preventive actions according to the identified risk</span></label>
                                                    <asp:Label Text="—" runat="server" ID="lbl_preven_action"></asp:Label>
                                                    <div class="form-group" runat="server" id="preven_action_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_preven_action" />
                                                    </div>
                                                </div>

                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2">11. Khả năng thực hiện những sinh hoạt hàng ngày/ <span class="text-primary">Ability to perform daily activities</span></label>
                                                </legend>

                                                <div class="col-md-12">
                                                    <div runat="server" id="lbl_bathing_code" class="gt-2-a">
                                                        <label>Tắm/ <span class="text-primary">Bathing:</span></label>
                                                        <asp:Label Text="—" runat="server" ID="lbl_bathing_desc"></asp:Label>
                                                    </div>

                                                    <fieldset class="row mb-2" runat="server" id="bathing_code_wrapper">
                                                        <legend>
                                                            <label class="control-label mb-1 ">Tắm/ <span class="text-primary">Bathing:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_bathing_code_in" runat="server" name="rad_bathing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_bathing_code_in">
                                                                    Tự tắm/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_bathing_code_as" runat="server" name="rad_bathing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_bathing_code_as">
                                                                    Cần sự hỗ trợ khi tắm/ <span class="text-primary">Assisted in shower</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_bathing_code_ab" runat="server" name="rad_bathing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_bathing_code_ab">
                                                                    Hỗ trợ tắm tại giường/ <span class="text-primary">Assisted in bed</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_bathing_code_db" runat="server" name="rad_bathing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_bathing_code_db">
                                                                    Tự tắm tại giường/ <span class="text-primary">Dependent in bed</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_bathing_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare1" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <div runat="server" id="lbl_oral_care_code" class="gt-2-a">
                                                        <label>Chăm sóc răng miệng/ <span class="text-primary">Oral care:</span></label>
                                                        <asp:Label Text="—" runat="server" ID="lbl_oral_care_desc"></asp:Label>
                                                    </div>

                                                    <fieldset class="row mb-2" runat="server" id="oral_care_code_wrapper">
                                                        <legend>
                                                            <label class="control-label mb-1 ">Chăm sóc răng miệng/ <span class="text-primary">Oral care:</span></label>
                                                        </legend>

                                                        <div class="col-md-12">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_oral_care_code_oc" runat="server" name="rad_oral_care_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_oral_care_code_oc">
                                                                    Tự làm/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_oral_care_code_pu" runat="server" name="rad_oral_care_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_oral_care_code_pu">
                                                                    Chỉ chuẩn bị đồ dùng/ <span class="text-primary">Prepare utensils only</span>
                                                                </label>
                                                            </div>


                                                            <div class="d-inline-block mr-2">
                                                                <div class="custom-control custom-radio d-inline-block mr-2">
                                                                    <input type="radio" id="rad_oral_care_code_ab" runat="server" name="rad_oral_care_code" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_oral_care_code_ab">
                                                                        Hỗ trợ đánh răng/ <span class="text-primary">Assisted to brush teeth</span>
                                                                    </label>
                                                                </div>
                                                                <div class="form-group w-6 d-inline-block">
                                                                    <input runat="server" id="Text1" class="form-control text-right" />
                                                                    <span class="append">lần/ngày (times/day)</span>
                                                                </div>
                                                            </div>


                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_oral_care_code_oth" runat="server" name="rad_oral_care_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_oral_care_code_oth">.</label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_oral_care_code_db" runat="server" name="rad_oral_care_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_oral_care_code_db">
                                                                    Tự tắm tại giường/ <span class="text-primary">Dependent in bed</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_oral_care_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare3" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <div runat="server" id="lbl_dentures_code" class="gt-2-a">
                                                        <label>Răng giả/ <span class="text-primary">Dentures:</span></label>
                                                        <asp:Label Text="—" runat="server" ID="lbl_dentures_desc"></asp:Label>
                                                    </div>

                                                    <fieldset class="row mb-2" runat="server" id="dentures_code_wrapper">
                                                        <legend>
                                                            <label class="control-label mb-1 ">Răng giả/ <span class="text-primary">Dentures:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_dentures_code_n" runat="server" name="rad_dentures_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dentures_code_n">
                                                                    Không có/ <span class="text-primary">None</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_dentures_code_u" runat="server" name="rad_dentures_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dentures_code_u">
                                                                    Hàm trên/ <span class="text-primary">Upper</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_dentures_code_l" runat="server" name="rad_dentures_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dentures_code_l">
                                                                    Hàm dưới/ <span class="text-primary">Lower</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_dentures_code_p" runat="server" name="rad_dentures_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dentures_code_p">
                                                                    Từng phần/ <span class="text-primary">Partial</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_dentures_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare32" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <div runat="server" id="lbl_toilet_use_code" class="gt-2-a">
                                                        <label>Đi vệ sinh/ <span class="text-primary">Toilet use:</span></label>
                                                        <asp:Label Text="—" runat="server" ID="lbl_toilet_use_desc"></asp:Label>
                                                    </div>

                                                    <fieldset class="row mb-2" runat="server" id="toilet_use_code_wrapper">
                                                        <legend>
                                                            <label class="control-label">Đi vệ sinh/ <span class="text-primary">Toilet use:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_in" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_in">
                                                                    Tự vệ sinh/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_at" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_at">
                                                                    Cần hỗ trợ khi đi vệ sinh/ <span class="text-primary">Assisted to the toilet</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_ac" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_ac">
                                                                    Cần hỗ trợ trên ghế dùng để tiểu tiện trong phòng/ <span class="text-primary">Assisted on the commode</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_di" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_di">
                                                                    Tã/ <span class="text-primary">Diaper</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_bu" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_bu">
                                                                    Bô dùng tại giường/ <span class="text-primary">Bedpan/urine bottle</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_uc" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_uc">
                                                                    Ống thông tiểu đặt ngoài bàng quang/ <span class="text-primary">Urinary condom</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_toilet_use_code_ca" runat="server" name="rad_toilet_use_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_toilet_use_code_ca">
                                                                    Ống thông tiểu/ <span class="text-primary">Urinary catheter</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_toilet_use_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare33" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <div runat="server" id="lbl_dressing_code" class="gt-2-a">
                                                        <label>Trang phục/ <span class="text-primary">Dressing:</span></label>
                                                        <asp:Label Text="—" runat="server" ID="lbl_dressing_desc"></asp:Label>
                                                    </div>

                                                    <fieldset class="row mb-2" runat="server" id="dressing_code_wrapper">
                                                        <legend>
                                                            <label class="control-label">Trang phục/ <span class="text-primary">Dressing:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_dressing_code_in" runat="server" name="rad_dressing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dressing_code_in">
                                                                    Tự làm/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_dressing_code_wa" runat="server" name="rad_dressing_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_dressing_code_wa">
                                                                    Cần hỗ trợ/ <span class="text-primary">With assistance</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_dressing_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare34" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <div runat="server" id="lbl_eating_code" class="gt-2-a">
                                                        <label>Ăn/ Cho ăn/ <span class="text-primary">Eating/ Feeding:</span></label>
                                                        <asp:Label Text="—" runat="server" ID="lbl_eating_desc"></asp:Label>
                                                    </div>

                                                    <fieldset class="row mb-2" runat="server" id="eating_code_wrapper">
                                                        <legend>
                                                            <label class="control-label">Ăn/ Cho ăn/ <span class="text-primary">Eating/ Feeding:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_eating_code_in" runat="server" name="rad_eating_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_eating_code_in">
                                                                    Tự ăn/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_eating_code_dp" runat="server" name="rad_eating_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_eating_code_dp">
                                                                    Phụ thuộc về tư thế/ <span class="text-primary">Dependon position</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_eating_code_da" runat="server" name="rad_eating_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_eating_code_da">
                                                                    Phụ thuộc về ăn uống/ <span class="text-primary">Dependent to eat</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_eating_code_tu" runat="server" name="rad_eating_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_eating_code_tu">
                                                                    Cho ăn qua ống/ <span class="text-primary">NG tube/Gastrostomy</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_eating_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare35" />
                                                                </a>

                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <div runat="server" id="lbl_turning_bed_code" class="gt-2-a">
                                                        <label>Xoay sở tư thế trên giường/ <span class="text-primary">Turning in bed:</span></label>
                                                        <asp:Label Text="—" runat="server" ID="lbl_turning_bed_desc"></asp:Label>
                                                    </div>

                                                    <fieldset class="row mb-2" runat="server" id="turning_bed_code_wrapper">
                                                        <legend>
                                                            <label class="control-label">Xoay sở tư thế trên giường/ <span class="text-primary">Turning in bed:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_turning_bed_code_in" runat="server" name="rad_turning_bed_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_turning_bed_code_in">
                                                                    Tự làm/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_turning_bed_code_dn" runat="server" name="rad_turning_bed_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_turning_bed_code_dn">
                                                                    Không tự xoay sở/ <span class="text-primary">Does not turn independently</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_turning_bed_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare36" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <div runat="server" id="lbl_ambulation_code" class="gt-2-a">
                                                        <label>Đi lại/ <span class="text-primary">Ambulation:</span></label>
                                                        <asp:Label Text="—" runat="server" ID="lbl_ambulation_desc"></asp:Label>
                                                    </div>

                                                    <fieldset class="row mb-2" runat="server" id="ambulation_code_wrapper">
                                                        <legend>
                                                            <label class="control-label">Đi lại/ <span class="text-primary">Ambulation:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_ambulation_code_in" runat="server" name="rad_ambulation_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_ambulation_code_in">
                                                                    Tự làm/ <span class="text-primary">Independent</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_ambulation_code_bf" runat="server" name="rad_ambulation_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_ambulation_code_bf">
                                                                    Liệt giường/ <span class="text-primary">Bedfast</span>
                                                                </label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_ambulation_code_na" runat="server" name="rad_ambulation_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_ambulation_code_na">
                                                                    Cần hỗ trợ (ghi rõ)/ <span class="text-primary">Need assistance (specify)</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_ambulation_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare37" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12">
                                                    <div runat="server" id="lbl_sleep_code" class="gt-2-a">
                                                        <label>Ngủ/ <span class="text-primary">Sleep:</span></label>
                                                        <asp:Label Text="—" runat="server" ID="lbl_sleep_desc"></asp:Label>
                                                    </div>

                                                    <fieldset class="row mb-2" runat="server" id="sleep_code_wrapper">
                                                        <legend>
                                                            <label class="control-label">Ngủ/ <span class="text-primary">Sleep:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_sleep_code_nm" runat="server" name="rad_sleep_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_sleep_code_nm">
                                                                    Bình thường/ <span class="text-primary">Normal</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                                <input type="radio" id="rad_sleep_code_ae" runat="server" name="rad_sleep_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_sleep_code_ae">
                                                                    Thức sớm/ <span class="text-primary">Awake early</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block  mr-2">
                                                                <input type="radio" id="rad_sleep_code_pfa" runat="server" name="rad_sleep_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_sleep_code_pfa">
                                                                    Khó ngủ/ <span class="text-primary">Problem to fall asleep</span>
                                                                </label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" id="rad_sleep_code_pst" runat="server" name="rad_sleep_code" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_sleep_code_pst">
                                                                    Khó ngủ say/ <span class="text-primary">Problem to sleep through</span>
                                                                </label>
                                                                <a href="javascript:void(0)" data-clear="rad_sleep_code" onclick="clearRadioButton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare38" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Thuốc đã sử dụng/ <span class="text-primary">Medication used:</span></label>
                                                    <asp:Label runat="server" ID="lbl_medication_used"></asp:Label>
                                                    <div class="form-group" runat="server" id="medication_used_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_medication_used" />
                                                    </div>
                                                </div>

                                            </fieldset>

                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label mb-2">12. Đánh giá nguy cơ té ngã sử dụng Bảng Morse Scale/ <span class="text-primary">High risk of fall assessment using Morse Scale</span></label>
                                                        </legend>

                                                        <div class="col-md-12 mb-2">
                                                            <div runat="server" id="lbl_fall_history_code" class="gt-2-a">
                                                                <label>Tiền sử bị ngã/ <span class="text-primary">History of falling</span></label>
                                                                <asp:Label Text="—" runat="server" ID="lbl_fall_history_desc"></asp:Label>
                                                            </div>

                                                            <fieldset class="row mb-2" runat="server" id="fall_history_code_wrapper">
                                                                <legend>
                                                                    <label class="control-label">Tiền sử bị ngã/ <span class="text-primary">History of falling</span></label>
                                                                </legend>

                                                                <div class="col-md-12">
                                                                    <div class="custom-control custom-radio mr-2 d-inline-block">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_fall_history_code_25" runat="server" name="rad_fall_history_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_fall_history_code_25">
                                                                            Có/ <span class="text-primary">Yes</span>  = 25
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_fall_history_code_0" runat="server" name="rad_fall_history_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_fall_history_code_0">
                                                                            Không/ <span class="text-primary">No</span>  = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_fall_history_code" onclick="clear_fall_history_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare39" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <div runat="server" id="lbl_secon_diagnosis_code" class="gt-2-a">
                                                                <label>Có từ 2 bệnh lý trở lên/ <span class="text-primary">Secondary diagnosis</span></label>
                                                                <asp:Label Text="—" runat="server" ID="lbl_secon_diagnosis_desc"></asp:Label>
                                                            </div>

                                                            <fieldset class="row mb-2" runat="server" id="secon_diagnosis_code_wrapper">
                                                                <legend>
                                                                    <label class="control-label">Có từ 2 bệnh lý trở lên/ <span class="text-primary">Secondary diagnosis</span></label>
                                                                </legend>
                                                                <div class="col-md-12">
                                                                    <div class="custom-control custom-radio mr-2 d-inline-block">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_secon_diagnosis_code_15" runat="server" name="rad_secon_diagnosis_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_secon_diagnosis_code_15">
                                                                            Có/ <span class="text-primary">Yes</span>  = 15
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_secon_diagnosis_code_0" runat="server" name="rad_secon_diagnosis_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_secon_diagnosis_code_0">
                                                                            Không/ <span class="text-primary">No</span>  = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_secon_diagnosis_code" onclick="clear_secon_diagnosis_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare40" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <div runat="server" id="lbl_ambula_aids_code" class="gt-2-a">
                                                                <label>Khả năng di chuyển/ <span class="text-primary">Ambulatory Aids</span></label>
                                                                <asp:Label Text="—" runat="server" ID="lbl_ambula_aids_desc"></asp:Label>
                                                            </div>

                                                            <fieldset class="row mb-2" runat="server" id="ambula_aids_code_wrapper">
                                                                <legend>
                                                                    <label class="control-label">Khả năng di chuyển/ <span class="text-primary">Ambulatory Aids</span></label>
                                                                </legend>
                                                                <div class="col-md-12">
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_ambula_aids_code_30" runat="server" name="rad_ambula_aids_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_ambula_aids_code_30">
                                                                            Sử dụng vật dụng hỗ trợ/ <span class="text-primary">Furniture</span>  = 30
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_ambula_aids_code_15" runat="server" name="rad_ambula_aids_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_ambula_aids_code_15">
                                                                            Nạng, thiết bị hỗ trợ đi lại/ <span class="text-primary">Crutches, cane walker</span> = 15
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_ambula_aids_code_0" runat="server" name="rad_ambula_aids_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_ambula_aids_code_0">
                                                                            Không di chuyển, nằm tại giường, điều dưỡng hỗ trợ/ <span class="text-primary">None, bedrest, wheelchair, nurse assist</span> = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_ambula_aids_code" onclick="clear_ambula_aids_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare42" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <div runat="server" id="lbl_intra_therapy_code" class="gt-2-a">
                                                                <label>Liệu pháp tiêm tĩnh mạch/ có khóa heparin <span class="text-primary">Intravenous therapy/heparin locked</span></label>
                                                                <asp:Label Text="—" runat="server" ID="lbl_intra_therapy_desc"></asp:Label>
                                                            </div>

                                                            <fieldset class="row mb-2" runat="server" id="intra_therapy_code_wrapper">
                                                                <legend>
                                                                    <label class="control-label">Liệu pháp tiêm tĩnh mạch/ có khóa heparin <span class="text-primary">Intravenous therapy/heparin locked</span></label>
                                                                </legend>
                                                                <div class="col-md-12">
                                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_intra_therapy_code_20" runat="server" name="rad_intra_therapy_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_intra_therapy_code_20">
                                                                            Có/ <span class="text-primary">Yes</span> = 20
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_intra_therapy_code_0" runat="server" name="rad_intra_therapy_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_intra_therapy_code_0">
                                                                            Không/ <span class="text-primary">No</span> = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_intra_therapy_code" onclick="clear_intra_therapy_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare41" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <div runat="server" id="lbl_gait_trans_code" class="gt-2-a">
                                                                <label>Dáng đi/ di chuyển/ <span class="text-primary">Gait/ transferring</span></label>
                                                                <asp:Label Text="—" runat="server" ID="lbl_gait_trans_desc"></asp:Label>
                                                            </div>

                                                            <fieldset class="row mb-2" runat="server" id="gait_trans_code_wrapper">
                                                                <legend>
                                                                    <label class="control-label">Dáng đi/ di chuyển/ <span class="text-primary">Gait/ transferring</span></label>
                                                                </legend>
                                                                <div class="col-md-12">
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_gait_trans_code_20" runat="server" name="rad_gait_trans_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gait_trans_code_20">
                                                                            Suy yếu/ <span class="text-primary">Impaired</span> = 20
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_gait_trans_code_10" runat="server" name="rad_gait_trans_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gait_trans_code_10">
                                                                            Yếu/ <span class="text-primary">Weak</span> = 10
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_gait_trans_code_0" runat="server" name="rad_gait_trans_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gait_trans_code_0">
                                                                            Bình thường, nằm tại giường/ <span class="text-primary">Normal, bedrest</span> = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_gait_trans_code" onclick="clear_gait_trans_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare45" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <div runat="server" id="lbl_fr_mental_status_code" class="gt-2-a">
                                                                <label>Trạng thái tâm thần/ <span class="text-primary">Mental status</span></label>
                                                                <asp:Label Text="—" runat="server" ID="lbl_fr_mental_status_desc"></asp:Label>
                                                            </div>

                                                            <fieldset class="row mb-2" runat="server" id="fr_mental_status_code_wrapper">
                                                                <legend>
                                                                    <label class="control-label">Trạng thái tâm thần/ <span class="text-primary">Mental status</span></label>
                                                                </legend>
                                                                <div class="col-md-12">
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_fr_mental_status_code_15" runat="server" name="rad_fr_mental_status_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_fr_mental_status_code_15">
                                                                            Không hiểu được giới hạn bản thân/ <span class="text-primary">Does not understand limitation</span> = 15
                                                                        </label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio">
                                                                        <input onchange="__doPostBack('fr_total_score_change', '')" type="radio" id="rad_fr_mental_status_code_0" runat="server" name="rad_fr_mental_status_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_fr_mental_status_code_0">
                                                                            Hiểu được giới hạn bản thân/ <span class="text-primary">Understands limitations</span> = 0
                                                                        </label>
                                                                        <a href="javascript:void(0)" data-clear="rad_fr_mental_status_code" onclick="clear_fr_mental_status_score(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare46" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mr-2">
                                                                TỔNG ĐIỂM/ <span class="text-primary">TOTAL SCORE:</span><icon:Calculator Width="16" Height="16" runat="server" ID="Calculator" />
                                                            </label>
                                                            <asp:Label runat="server" ID="fr_total_score"></asp:Label>
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label class="control-label mr-2">0-24: Nguy cơ thấp/ <span class="text-primary">low risk:</span></label>
                                                            <label class="control-label mb-1 mr-2">25-44: Nguy cơ trung bình/ <span class="text-primary">medium risk:</span></label>
                                                            <label class="control-label mb-1">45+: Nguy cơ cao/ <span class="text-primary">high risk:</span></label>
                                                        </div>
                                                    </fieldset>

                                                </ContentTemplate>
                                            </asp:UpdatePanel>

                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1 h4">D. KẾ HOẠCH XUẤT VIỆN (HOÀN TẤT TRONG VÒNG 24 GIỜ SAU KHI NHẬP VIỆN)/ <span class="text-primary">DISCHARGE PLAN (TO BE COMPLETED WITHIN 24HOURS OF ADMISSION):</span></label>
                                                <p>
                                                    Đánh giá lại và mời hội chẩn nếu tình trạng sức khỏe của người bệnh thay đổi. Nếu cần, chuyển bệnh đến khoa thích hợp. Nếu có nghi vấn, thảo luận với bác sĩ phụ trách.<br />
                                                    <span class="text-primary">Reassess and inform if patient’s condition charges. If there is “ Yes” refer to the respective unit. In doubt, discuss with doctor in charge</span>
                                                </p>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Nhiều chuyên khoa cùng tham gia điều trị/ <span class="text-primary">Multidisciplinary team involvement:</span></label>
                                                    <asp:Label runat="server" ID="lbl_involvement"></asp:Label>
                                                    <div runat="server" id="involvement_wrapper" class="d-inline-block">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_involvement_true" runat="server" name="rad_involvement" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_involvement_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_involvement_false" runat="server" name="rad_involvement" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_involvement_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_involvement" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare48" />
                                                            </a>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator7" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="involvement_ServerValidate"></asp:CustomValidator>--%>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Yêu cầu thiết bị y tế, máy tạo oxy và dịch vụ giúp đỡ chăm sóc tại nhà/ <span class="text-primary">Requires medical equipment, oxygen concentrator and home care help services:</span></label>
                                                    <asp:Label runat="server" ID="lbl_req_med_equipment"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="req_med_equipment_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_med_equipment_true" runat="server" name="rad_req_med_equipment" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_med_equipment_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_med_equipment_false" runat="server" name="rad_req_med_equipment" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_med_equipment_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_req_med_equipment" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare49" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Yêu cầu theo dõi điều trị/ <span class="text-primary">Requires follow-up care:</span></label>
                                                    <asp:Label runat="server" ID="lbl_req_foll_care"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="req_foll_care_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_foll_care_true" runat="server" name="rad_req_foll_care" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_foll_care_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_foll_care_false" runat="server" name="rad_req_foll_care" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_foll_care_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_req_foll_care" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare50" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Các trường hợp tự tử (cần hội chẩn khẩn cấp)/ <span class="text-primary">Suicidal cases (Urgent referral):</span></label>
                                                    <asp:Label runat="server" ID="lbl_suicidal_referral"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="suicidal_referral_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_suicidal_referral_true" runat="server" name="rad_suicidal_referral" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_suicidal_referral_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_suicidal_referral_false" runat="server" name="rad_suicidal_referral" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_suicidal_referral_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_suicidal_referral" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare51" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Sống một mình với tình trạng suy giảm chức năng và không được chăm sóc điều trị hay hỗ trợ từ gia đình/ <span class="text-primary">Lives alone with reduced functional status and no other care giver or family support:</span></label>
                                                    <asp:Label runat="server" ID="lbl_alone_reduce_functional"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="alone_reduce_functional_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_alone_reduce_functional_true" runat="server" name="rad_alone_reduce_functional" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_alone_reduce_functional_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_alone_reduce_functional_false" runat="server" name="rad_alone_reduce_functional" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_alone_reduce_functional_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_alone_reduce_functional" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare47" />
                                                            </a>
                                                            <%--<asp:CustomValidator ID="CustomValidator1" CssClass="text-danger" ValidationGroup="Group1"
                                                                OnServerValidate="alone_reduce_functional_ServerValidate"
                                                                Display="Dynamic"
                                                                ErrorMessage=" is required"
                                                                runat="server" />--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Mời bác sĩ vật lý trị liệu hội chẩn (nếu có, báo bác sĩ)/ <span class="text-primary">Referral to Physiotherapist (if yes, inform Doctor):</span></label>
                                                    <asp:Label runat="server" ID="lbl_ref_physiotherapist"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="ref_physiotherapist_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_physiotherapist_true" runat="server" name="rad_ref_physiotherapist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_physiotherapist_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_physiotherapist_false" runat="server" name="rad_ref_physiotherapist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_physiotherapist_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_ref_physiotherapist" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare52" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Mời chuyên gia ngôn ngữ trị liệu hội chẩn (nếu có, báo bác sĩ)/ <span class="text-primary">Referral to speech therapist (if yes, inform doctor):</span></label>
                                                    <asp:Label runat="server" ID="lbl_ref_speech_therapist"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="ref_speech_therapist_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_speech_therapist_true" runat="server" name="rad_ref_speech_therapist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_speech_therapist_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_speech_therapist_false" runat="server" name="rad_ref_speech_therapist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_speech_therapist_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_ref_speech_therapist" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare53" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Giới thiệu đến chuyên gia dinh dưỡng/ <span class="text-primary">Referral to Dietician:</span></label>
                                                    <asp:Label runat="server" ID="lbl_ref_dietician"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="ref_dietician_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_dietician_true" runat="server" name="rad_ref_dietician" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_dietician_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_dietician_false" runat="server" name="rad_ref_dietician" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_dietician_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_ref_dietician" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare54" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Giới thiệu đến chuyên gia tâm lý/ <span class="text-primary">Referral to Psychologist:</span></label>
                                                    <asp:Label runat="server" ID="lbl_ref_psychologist"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="ref_psychologist_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_psychologist_True" runat="server" name="rad_ref_psychologist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_psychologist_True">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_psychologist_False" runat="server" name="rad_ref_psychologist" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_psychologist_False">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_ref_psychologist" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare55" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Yêu cầu chuyển đến bệnh viện khác/ <span class="text-primary">Requires referral to other hospital:</span></label>
                                                    <asp:Label runat="server" ID="lbl_ref_other_hospital"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="ref_other_hospital_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_other_hospital_true" runat="server" name="rad_other_hospital" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_other_hospital_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_ref_other_hospital_false" runat="server" name="rad_other_hospital" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ref_other_hospital_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_other_hospital" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare56" />
                                                            </a>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator14" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="field is required" CssClass="text-danger" OnServerValidate="rad_ref_other_hospital_ServerValidate"></asp:CustomValidator>--%>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Người nhà hỗ trợ tại nhà/ <span class="text-primary">Support system at home:</span></label>
                                                    <asp:Label runat="server" ID="lbl_support_at_home"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="support_at_home_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_support_at_home_true" runat="server" name="rad_support_at_home" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_support_at_home_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_support_at_home_false" runat="server" name="rad_support_at_home" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_support_at_home_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_support_at_home" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare57" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Người bệnh yêu cầu phương tiện vận chuyển về nhà/ <span class="text-primary">Will patient require transportation arrangements to go home:</span></label>
                                                    <asp:Label runat="server" ID="lbl_req_transportation"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="req_transportation_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_transportation_true" runat="server" name="rad_req_transportation" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_transportation_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_req_transportation_false" runat="server" name="rad_req_transportation" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_req_transportation_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_req_transportation" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare58" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label></label>
                                                <div>
                                                    <label class="control-label mb-1">Cầu thang bộ tại nhà/ <span class="text-primary">Stairs to climb at home:</span></label>
                                                    <asp:Label runat="server" ID="lbl_stairs_climb_home"></asp:Label>
                                                    <div runat="server" class="d-inline-block" id="stairs_climb_home_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_stairs_climb_home_true" runat="server" name="rad_stairs_climb_home" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stairs_climb_home_true">
                                                                Có/ <span class="text-primary">Yes</span>
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_stairs_climb_home_false" runat="server" name="rad_stairs_climb_home" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_stairs_climb_home_false">
                                                                Không/ <span class="text-primary">No</span>
                                                            </label>
                                                            <a href="javascript:void(0)" data-clear="rad_stairs_climb_home" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare59" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-1 h4">E. KẾ HOẠCH XUẤT VIỆN- ĐÁNH GIÁ LẠI/ <span class="text-primary">DISCHARGE PLANNING - REASSESSMENT:</span></label>
                                            </div>
                                            <div class="col-md-12 gt-2-a mb-2">

                                                <label></label>

                                                <asp:Label runat="server" ID="lbl_dis_planning"></asp:Label>

                                                <div class="form-group" runat="server" id="dis_planning_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_dis_planning" />
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-1 h4">F. QUẢN LÝ XUẤT VIỆN (HOÀN THÀNH SỚM NHẤT CÓ THỂ TRONG NGÀY NHẬP VIỆN)/ <span class="text-primary">DISCHARGE MANAGEMENT (TO BE DONE AS EARLY AT THE DAY OF ADMISSION):</span></label>
                                            </div>

                                            <div class="col-md-12 gt-2-a mb-2">

                                                <label></label>
                                                <asp:Label runat="server" ID="lbl_dis_management"></asp:Label>
                                                <div class="form-group" runat="server" id="dis_management_wrapper">
                                                    <webUI:TextField runat="server" ID="txt_dis_management" />
                                                </div>
                                            </div>

                                            <div class="col-md-12 mb-2 gt-2-a">
                                                <label class="control-label mb-1 mr-2">Ngày giờ/ <span class="text-primary">Date & Time:</span></label>
                                                <asp:Label runat="server" ID="lbl_assess_date_time"></asp:Label>
                                                <div class="form-group d-inline-block" runat="server" id="assess_date_time_wrapper">
                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_assess_date_time" Width="200px" />
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="dtpk_assess_date_time" ErrorMessage="field is required"
                                                        ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <div class="form-actions">
                                                        <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                        <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

                                                        <div data-toggle="modal" runat="server" data-target="#myModal" id="btnDeleteModal" class="btn btn-danger waves-effect">Delete</div>

                                                        <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                        <asp:LinkButton OnClientClick="return false;" runat="server" OnClick="btnPrint_Click" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

                                                        <asp:LinkButton runat="server" OnClick="btnCancel_Click" ID="btnCancel" CssClass="btn btn-secondary waves-effect">Cancel</asp:LinkButton>
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
                                                        <div class="btn btn-default waves-effect" data-dismiss="modal">Close</div>
                                                        <asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
                                                    </div>
                                                </ModalBody>
                                            </webUI:PopupModal>

                                            <icon:PopupShowDelay runat="server" ID="PopupShowDelay" />

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
    <script src="../scripts/checkValidFields.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>

    <script>
        function load_pain_annotation_Image() {
            const pain_annotation_canvas = document.querySelector('#pain_annotation_canvas');

            const ctx = pain_annotation_canvas.getContext("2d");
            pain_annotation_canvas.height = 500;
            pain_annotation_canvas.width = 500;
            ctx.strokeStyle = "red";
            
            let pain_annotation_img = new Image();

            pain_annotation_img.onload = function () {
                ctx.drawImage(pain_annotation_img, 0, 0);

                ctx.beginPath();
                ctx.moveTo(119, 220);
                ctx.lineTo(119, 220);
                ctx.lineWidth = 3;
                ctx.strokeStyle = '#ff0000';
                ctx.lineCap = 'round';
                ctx.stroke();
            }

            pain_annotation_img.src = document.getElementById("pain_annotation_img").src;

            var pain_annotation_history = {
                redo_list: [],
                undo_list: [],
                saveState: function (canvas, list, keep_redo) {
                    keep_redo = keep_redo || false;
                    if (!keep_redo) {
                        this.redo_list = [];
                    }

                    (list || this.undo_list).push(canvas.toDataURL());
                },
                undo: function (canvas, ctx) {
                    this.restoreState(canvas, ctx, this.undo_list, this.redo_list);
                },
                redo: function (canvas, ctx) {
                    this.restoreState(canvas, ctx, this.redo_list, this.undo_list);
                },
                restoreState: function (canvas, ctx, pop, push) {
                    if (pop.length) {
                        this.saveState(canvas, push, true);
                        var restore_state = pop.pop();
                        var img = document.createElement("img");
                        img.src = restore_state;

                        img.onload = function () {
                            ctx.clearRect(0, 0, canvas.width, 400);
                            ctx.drawImage(img, 0, 0, canvas.width, canvas.height, 0, 0, canvas.width, canvas.height);
                        }
                    }
                }
            }

            var pain_annotation_pencil = {
                options: {
                    stroke_color: "red",
                    dim: 4
                },
                init: function (canvas, ctx) {
                    this.canvas = canvas;
                    this.ctx = ctx;
                    this.ctx.strokeColor = this.options.stroke_color;
                    this.drawing = false;
                    this.addCanvasEvents();
                },
                addCanvasEvents: function () {
                    this.canvas.addEventListener('mousedown', this.start.bind(this));
                    this.canvas.addEventListener('mousemove', this.stroke.bind(this));
                    this.canvas.addEventListener('mouseup', this.stop.bind(this));
                    this.canvas.addEventListener('mouseout', this.stop.bind(this));
                },
                start: function (e) {
                    if (currentAct != act.PEN) return;
                    this.ctx.beginPath();
                    pain_annotation_history.saveState(this.canvas);
                    this.drawing = true;
                },
                stroke: function (e) {
                    if (currentAct != act.PEN) return;

                    if (this.drawing) {
                        let rect = pain_annotation_canvas.getBoundingClientRect();

                        var x = e.clientX - rect.left;
                        var y = e.clientY - rect.top;

                        this.ctx.lineTo(x, y);
                        this.ctx.stroke(); // draw line
                        this.ctx.beginPath();
                        this.ctx.moveTo(x, y);
                    }
                },
                stop: function (e) {
                    if (currentAct != act.PEN) return;

                    if (this.drawing) {
                        this.drawing = false;
                        this.ctx.beginPath();
                    }
                    var image = document.getElementById("pain_annotation_canvas").toDataURL("image/png");
                    image = image.replace('data:image/png;base64,', '');

                    document.getElementById("pain_annotation_base64").value = image;
                }
            };

            const act = { PEN: 1, NOTE: 2 };
            Object.freeze(act);

            let currentAct;

            $('#pain_annotation_pencil').click(function () {
                currentAct = act.PEN;
                pain_annotation_pencil.init(pain_annotation_canvas, ctx);
            });

            $('#pain_annotation_undo').click(function () {
                pain_annotation_history.undo(pain_annotation_canvas, ctx);
            });

            $('#pain_annotation_redo').click(function () {
                pain_annotation_history.redo(pain_annotation_canvas, ctx);
            });
        };

        function load_skin_anno_data_Image() {
            const skin_anno_data_canvas = document.querySelector('#skin_anno_data_canvas');

            const ctx = skin_anno_data_canvas.getContext("2d");
            skin_anno_data_canvas.height = 500;
            skin_anno_data_canvas.width = 500;
            ctx.strokeStyle = "red";

            let skin_anno_data_img = new Image();

            skin_anno_data_img.onload = function () {
                ctx.drawImage(skin_anno_data_img, 0, 0);

                ctx.beginPath();
                ctx.moveTo(119, 220);
                ctx.lineTo(119, 220);
                ctx.lineWidth = 3;
                ctx.strokeStyle = '#ff0000';
                ctx.lineCap = 'round';
                ctx.stroke();
            }

            skin_anno_data_img.src = document.getElementById("skin_anno_data_img").src;

            var skin_anno_data_history = {
                redo_list: [],
                undo_list: [],
                saveState: function (canvas, list, keep_redo) {
                    keep_redo = keep_redo || false;
                    if (!keep_redo) {
                        this.redo_list = [];
                    }

                    (list || this.undo_list).push(canvas.toDataURL());
                },
                undo: function (canvas, ctx) {
                    this.restoreState(canvas, ctx, this.undo_list, this.redo_list);
                },
                redo: function (canvas, ctx) {
                    this.restoreState(canvas, ctx, this.redo_list, this.undo_list);
                },
                restoreState: function (canvas, ctx, pop, push) {
                    if (pop.length) {
                        this.saveState(canvas, push, true);
                        var restore_state = pop.pop();
                        var img = document.createElement("img");
                        img.src = restore_state;

                        img.onload = function () {
                            ctx.clearRect(0, 0, canvas.width, 400);
                            ctx.drawImage(img, 0, 0, canvas.width, canvas.height, 0, 0, canvas.width, canvas.height);
                        }
                    }
                }
            }

            var skin_anno_data_pencil = {
                options: {
                    stroke_color: "red",
                    dim: 4
                },
                init: function (canvas, ctx) {
                    this.canvas = canvas;
                    this.ctx = ctx;
                    this.ctx.strokeColor = this.options.stroke_color;
                    this.drawing = false;
                    this.addCanvasEvents();
                },
                addCanvasEvents: function () {
                    this.canvas.addEventListener('mousedown', this.start.bind(this));
                    this.canvas.addEventListener('mousemove', this.stroke.bind(this));
                    this.canvas.addEventListener('mouseup', this.stop.bind(this));
                    this.canvas.addEventListener('mouseout', this.stop.bind(this));
                },
                start: function (e) {
                    if (currentAct != act.PEN) return;
                    this.ctx.beginPath();
                    skin_anno_data_history.saveState(this.canvas);
                    this.drawing = true;
                },
                stroke: function (e) {
                    if (currentAct != act.PEN) return;

                    if (this.drawing) {
                        let rect = skin_anno_data_canvas.getBoundingClientRect();

                        var x = e.clientX - rect.left;
                        var y = e.clientY - rect.top;

                        this.ctx.lineTo(x, y);
                        this.ctx.stroke(); // draw line
                        this.ctx.beginPath();
                        this.ctx.moveTo(x, y);
                    }
                },
                stop: function (e) {
                    if (currentAct != act.PEN) return;

                    if (this.drawing) {
                        this.drawing = false;
                        this.ctx.beginPath();
                    }
                    var image = document.getElementById("skin_anno_data_canvas").toDataURL("image/png");
                    image = image.replace('data:image/png;base64,', '');

                    document.getElementById("skin_anno_data_base64").value = image;
                }
            };

            const act = { PEN: 1, NOTE: 2 };
            Object.freeze(act);

            let currentAct;

            $('#skin_anno_data_pencil').click(function () {
                currentAct = act.PEN;
                skin_anno_data_pencil.init(skin_anno_data_canvas, ctx);
            });

            $('#skin_anno_data_undo').click(function () {
                skin_anno_data_history.undo(skin_anno_data_canvas, ctx);
            });

            $('#skin_anno_data_redo').click(function () {
                skin_anno_data_history.redo(skin_anno_data_canvas, ctx);
            });
        };
    </script>

    <script>

        load_pain_annotation_Image();
        load_skin_anno_data_Image();
        formGroup_init();
        checkboxRadiobutton_init();
        InputFilter();

        function beforeAsyncPostBack() {
            var curtime = new Date();
            console.log(curtime);
        }

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter();
            load_pain_annotation_Image();
            load_skin_anno_data_Image();
        }

    </script>

</body>
</html>
