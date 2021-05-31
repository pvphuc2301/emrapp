<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InpIniNurAss.aspx.cs" Inherits="EMR.InpatientInitialNursingAssessment" ValidateRequest="false" %>

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


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <style>
        .custom-checkbox {
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="cssclsNoScreen">
        <table class="report-container">
            <thead class="report-header">
                <tr>
                    <th class="report-header-cell">
                        <div class="header-info" style="display: flex; align-items: center;">
                            <img width="200px" src="../images/AIH_PI_FULL.png" />
                            <div style="flex-grow: 1">
                                <div style="color: #007297; font-size: 26.6667px;">BỆNH ÁN NGOẠI TRÚ</div>
                                <div style="color: #e20e5a; font-size: 16.6667px;">OUTPATIENT MEDICAL RECORD</div>
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
                            <div class="row mb-2">
                                <div class="col-12">
                                    <webUI:Label runat="server" Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT" />
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
        <form method="post" action="#" id="form2" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
            <div class="scroll-sidebar h-100 w-100">
                <%--<asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                        <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <webUI:AmendReason runat="server" ID="txt_amendReason" />
                        </asp:Panel>
                        <webUI:PatientInfo runat="server" ID="PatientInfo1" />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card mt-2">
                                    <div class="card-header">
                                        <h4 class="text-primary">INPATIENT INITIAL NURSING ASSESSMENT
                                        </h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label h4">A. THÔNG TIN TỔNG QUÁT VỀ NGƯỜI BỆNH/ <span class="text-primary">GENERAL PATIENT INFORMATION</span></label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Quốc gia cư trú/ <span class="text-primary">Country of residence:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_residence_code_vnm" name="rad_residence_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_residence_code_vnm">Việt Nam</label>
                                                    </div>
                                                    <div class="custom-control custom-radio mb-1 mr-2 d-inline-block">
                                                        <input disabled-for="residence_other_field" type="radio" runat="server" id="rad_residence_code_oth" name="rad_residence_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_residence_code_oth">Khác</label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_residence_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare2" />
                                                        </a>
                                                    </div>
                                                    <div class="form-group d-inline-block w-n residence_other_field">
                                                        <webUI:TextField runat="server" ID="txt_residence_other" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Ngôn ngữ/ <span class="text-primary">Language:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_language_code_vi" name="rad_language_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_language_code_vi">Tiếng Việt</label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_language_code_en" name="rad_language_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_language_code_en">Tiếng Anh</label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input disabled-for="language_other_field" type="radio" runat="server" id="rad_language_code_oth" name="rad_language_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_language_code_oth">Tiếng khác</label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_language_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare4" />
                                                        </a>
                                                    </div>
                                                    <div class="form-group language_other_field w-n d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_language_other" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Cần phiên dịch/ <span class="text-primary">Requires Interpreter:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_req_interpreter_True" name="rad_req_interpreter" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_req_interpreter_True">Có/ <span class="text-primary">Yes</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" runat="server" id="rad_req_interpreter_False" name="rad_req_interpreter" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_req_interpreter_False">Không/ <span class="text-primary">No</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_req_interpreter" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare5" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Tôn giáo/ <span class="text-primary">Religion:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_religion_code_bh" name="rad_religion_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_religion_code_bh">Phật giáo/ <span class="text-primary">Buddhism</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_religion_code_ch" name="rad_religion_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_religion_code_ch">Thiên chúa giáo</label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input disabled-for="religion_other_field" type="radio" runat="server" id="rad_religion_code_oth" name="rad_religion_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_religion_code_oth">Khác</label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_religion_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare6" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group religion_other_field w-n d-inline-block">
                                                        <webUI:TextField runat="server" ID="TextField3" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Nhu cầu tín ngưỡng/ <span class="text-primary">Spiritual counselling:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_spiritual_couns_True" name="rad_spiritual_couns" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_spiritual_couns_True">Có/ <span class="text-primary">Yes</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" runat="server" id="rad_spiritual_couns_False" name="rad_spiritual_couns" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_spiritual_couns_False">Không/ <span class="text-primary">No</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_spiritual_couns" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare7" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label d-inline-block mr-2">Nghề nghiệp/ <span class="text-primary">Occupation:</span></label>
                                                    <div class="form-group d-inline-block w-n">
                                                        <webUI:TextField runat="server" ID="txt_occupation" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Hoàn cảnh sống/ <span class="text-primary">Living Status:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_living_status_code_aln" name="rad_living_status_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_living_status_code_aln">Một mình/ <span class="text-primary">Alone</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_living_status_code_wth" name="rad_living_status_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_living_status_code_wth">Với vợ, chồng, con, anh, chị, em ruột/ <span class="text-primary">With spouse, children, sibling</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input disabled-for="living_status_note_field" type="radio" runat="server" id="rad_living_status_code_oth" name="rad_living_status_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_living_status_code_oth">Khác</label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_living_status_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare8" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group living_status_note_field w-n d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_living_status_note" />
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Mối quan tâm khi nằm viện/ <span class="text-primary">Concerns related to hospitalization:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_hospital_concern_code_non" name="rad_hospital_concern_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_hospital_concern_code_non">Không/ <span class="text-primary">None</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_hospital_concern_code_rel" name="rad_hospital_concern_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_hospital_concern_code_rel">Gia đình, các mối quan hệ/ <span class="text-primary">Family, relationship issues</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_hospital_concern_code_fin" name="rad_hospital_concern_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_hospital_concern_code_fin">Tài chính/ <span class="text-primary">Financial</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_hospital_concern_code_wor" name="rad_hospital_concern_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_hospital_concern_code_wor">Lo âu/ <span class="text-primary">Worriedness</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input disabled-for="hospital_concern_other_field" type="radio" runat="server" id="rad_hospital_concern_code_oth" name="rad_hospital_concern_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_hospital_concern_code_oth">Khác/ <span class="text-primary">Others</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_hospital_concern_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare13" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group w-n d-inline-block hospital_concern_other_field">
                                                        <webUI:TextField runat="server" ID="txt_hospital_concern_other" />
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 d-inline-block mr-2">Người đi cùng/ <span class="text-primary">Accompanied by:</span></label>
                                                    <div class="form-group w-n d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_accompanied" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 d-inline-block mr-2">Quan hệ/ <span class="text-primary">Relationship:</span></label>
                                                    <div class="form-group w-n d-inline-block">
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
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Bệnh nhân nhập viện từ/ <span class="text-primary">Patient admitted from:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_admit_from_code_opd" name="rad_admit_from_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_admit_from_code_opd">Khoa khám bệnh/ <span class="text-primary">OPD</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_admit_from_code_er" name="rad_admit_from_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_admit_from_code_er">Khoa cấp cứu/ <span class="text-primary">ER</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_admit_from_code_vd" name="rad_admit_from_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_admit_from_code_vd">Bác sĩ hơp tác/ <span class="text-primary">Visiting Doctor</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" runat="server" id="rad_admit_from_code_oth" disabled-for="admit_from_other_field" name="rad_admit_from_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_admit_from_code_oth">Khác/ <span class="text-primary">Referral</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_admit_from_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare9" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group admit_from_other_field w-n d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_admit_from_other" />
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Tình trang khi đến</label>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_code_w" />
                                                        <span class="custom-control-label">Tự đi được/ <span class="text-primary">Walking</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_code_s" />
                                                        <span class="custom-control-label">Bằng băng ca/ <span class="text-primary">Stretcher</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_code_wc" />
                                                        <span class="custom-control-label">Bằng xe lăn/ <span class="text-primary">Wheelchair</span></span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label">Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_admission_reason" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 mr-2">Lần nhập viện trước tại bệnh viện Quốc tế Mỹ</label>
                                                    <div class="form-group d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_previous_admission" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Tiền sử bệnh/ <span class="text-primary">Past medical history:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_past_med_history_False" name="rad_past_med_history" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_past_med_history_False">Không/ <span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_past_med_history_True" disabled-for="past_med_history_note_field" name="rad_past_med_history" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_past_med_history_True">Có/ <span class="text-primary">Yes</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_past_med_history" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare10" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group past_med_history_note_field d-inline-block w-n">
                                                        <webUI:TextField runat="server" ID="txt_past_med_history_note" />
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Tiền sử phẫu thuật/ <span class="text-primary">Past Surgical History:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_past_sur_history_False" name="rad_past_sur_history" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_past_sur_history_False">Không/ <span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_past_sur_history_True" disabled-for="past_sur_history_note_field" name="rad_past_sur_history" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_past_sur_history_True">Có/ <span class="text-primary">Yes</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_past_sur_history" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare11" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group past_sur_history_note_field d-inline-block w-n">
                                                        <webUI:TextField runat="server" ID="txt_past_sur_history_note" />
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Lạm dụng chất kích thích/ <span class="text-primary">Substance abuse</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_substance_abuse_s" />
                                                        <span class="custom-control-label">Hút thuốc/ <span class="text-primary">Smoking</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_substance_abuse_a" />
                                                        <span class="custom-control-label">Rượu bia/ <span class="text-primary">Acohol</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" disabled-for="substance_abuse_other_field" class="custom-control-input" runat="server" id="cb_substance_abuse_oth" />
                                                        <span class="custom-control-label">Khác/ <span class="text-primary">Other</span></span>
                                                    </label>
                                                    <div class="form-group substance_abuse_other_field d-inline-block w-n">
                                                        <webUI:TextField runat="server" ID="txt_substance_abuse_other" />
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Hồ sơ bệnh án kèm theo/ <span class="text-primary">Previous test results/documents:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_previous_document_False" name="rad_previous_document" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_previous_document_False">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_previous_document_True" disabled-for="previous_document_note_field" name="rad_previous_document" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_previous_document_True">Yes/ <span class="text-primary">Có</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_previous_document" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare14" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group previous_document_note_field d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_previous_document_note" />
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Thuốc hiện đang dùng tại nhà/ <span class="text-primary">Current home medication:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_cur_home_medication_False" name="rad_cur_home_medication" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_cur_home_medication_False">Không/ <span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" runat="server" id="rad_cur_home_medication_True" name="rad_cur_home_medication" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_cur_home_medication_True">Có/ Yes (Tham khảo đơn thuốc đính kèm)/ <span class="text-primary">If, yes please refer to the prescription attached</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_cur_home_medication" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare15" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Dị ứng/ Phản ứng / <span class="text-primary">Allergy/ Reaction:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_allergy_False" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_False">Không/ <span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_allergy_True" disabled-for="allergy_note_field" name="rad_allergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_allergy_True">Có (ghi rõ)/ <span class="text-primary">Yes (specify)</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare16" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group allergy_note_field w-n d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_allergy_note" />
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Người bệnh có nguy cơ cao/ <span class="text-primary">High-risk patient</span></label>
                                                </div>

                                                <div class="col-md-12">
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

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <h4>C. ĐÁNH GIÁ CỦA ĐIỀU DƯỠNG/ <span class="text-primary">NURSING ASSESSMENT</span></h4>
                                                </div>
                                            </div>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2 font-bold">1. Dấu hiệu sinh tồn và các chỉ số đo lường/ <span class="text-primary">vital signs and standard measurements</span></label>
                                                </legend>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                                    <div class="form-group w-5 d-inline-block">
                                                        <input runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1 ">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                        <span class="append">Kg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                    <div class="form-group w-5 d-inline-block">
                                                        <input runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1 ">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input maxlength="3" id="txt_vs_height" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label class="control-label mr-2 mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                    <div class="form-group w-5 d-inline-block">
                                                        <input id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2">
                                                    <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                    <div class="form-group w-5 d-inline-block">
                                                        <input runat="server" id="txt_vs_BMI" class="form-control text-right" disabled="disabled" />
                                                        <span class="append">(Kg/m <sup>2</sup>)</span>
                                                    </div>
                                                    <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                                        <script type="text/javascript">

                                                            document.getElementById('txt_vs_height').addEventListener("change", function (e) {
                                                                document.getElementById('txt_vs_BMI').value = CalculateBmi();
                                                            });

                                                            document.getElementById('txt_vs_weight').addEventListener("change", function (e) {
                                                                document.getElementById('txt_vs_BMI').value = CalculateBmi();
                                                            });

                                                            function CalculateBmi() {
                                                                if (document.getElementById('txt_vs_height').value == "" || document.getElementById('txt_vs_weight').value == "") return "";
                                                                else { return (document.getElementById('txt_vs_weight').value / ((document.getElementById('txt_vs_height').value / 100) * 2)).toFixed(2) };
                                                            }

                                                        </script>
                                                    </telerik:RadScriptBlock>
                                                    <p class="mt-1">
                                                        (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
applicable for children and pregnant</span>)
                                                    </p>
                                                </div>

                                                <div class="col-sm-6 mb-2">
                                                    <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-2">
                                                    <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                    <div class="form-group w-4 d-inline-block">
                                                        <input runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2 font-bold">2. Hệ hô hấp/ <span class="text-primary">Respiratory system</span></label>
                                                </legend>

                                                <div class="col-md-12">
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_n" />
                                                        <span class="custom-control-label">Không có vấn đề/ <span class="text-primary">Normal</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_d" />
                                                        <span class="custom-control-label">Khó thở/ <span class="text-primary">Dyspnea</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_o" />
                                                        <span class="custom-control-label">Khó thở nằm/ <span class="text-primary">Orthopnea</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_w" />
                                                        <span class="custom-control-label">Khó thở khò khè/ <span class="text-primary">Wheeze</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_c" />
                                                        <span class="custom-control-label">Da xanh tái/ <span class="text-primary">Cyanosis</span></span>
                                                    </label>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="control-label mb-2">Ho/ <span class="text-primary">Cough:</span></label>
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_cough_False" name="rad_cough" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_cough_False">Không/ <span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" runat="server" id="rad_cough_True" name="rad_cough" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_cough_True">Có/ <span class="text-primary">Yes</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_cough" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare12" />
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_pro_cough_False" name="rad_pro_cough" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_pro_cough_False">Không có đờm/ <span class="text-primary">Unproductive cough</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_pro_cough_True" name="rad_pro_cough" class="custom-control-input" disabled-for="pro_cough_note_field" />
                                                        <label class="custom-control-label" for="rad_pro_cough_True">Có đờm (ghi rõ màu/ tính chất/ số lượng)/ <span class="text-primary">Productive (Specify color/ nature/ amount)</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_pro_cough" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare17" />
                                                        </a>
                                                    </div>
                                                    <div class="form-group pro_cough_note_field d-inline-block ml-2 w-n">
                                                        <webUI:TextField runat="server" ID="txt_pro_cough_note" />
                                                    </div>
                                                    <span class="text-danger" id="pro_cough_error"></span>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2 font-bold">3. Hệ tim mạch/ <span class="text-primary">Cardiovascular system</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 d-block">Mạch/ <span class="text-primary">Pulse:</span></label>
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_pulse_code_r" name="rad_pulse_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_pulse_code_r">Đều/ <span class="text-primary">Regular</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_pulse_code_i" name="rad_pulse_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_pulse_code_i">Không đều/ <span class="text-primary">Irregular</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_pulse_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare18" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 d-block">Tình trạng hiện có/ <span class="text-primary">Presence with</span></label>

                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_cp" />
                                                        <span class="custom-control-label">Đau ngực/ <span class="text-primary">Chest pain</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_di" />
                                                        <span class="custom-control-label">Chóng mặt/ <span class="text-primary">Dizzinness</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_ca" />
                                                        <span class="custom-control-label">Đau bắp chân/ <span class="text-primary">Calf pain</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_pe" />
                                                        <span class="custom-control-label">Phù ngoại biên/  <span class="text-primary">Peripheral edema</span></span>
                                                    </label>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 d-block">Tứ chi/ <span class="text-primary">Extremities</span></label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_wa" />
                                                        <span class="custom-control-label">Ấm/ <span class="text-primary">Warm</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_co" />
                                                        <span class="custom-control-label">Lạnh/ <span class="text-primary">Cold</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_cl" />
                                                        <span class="custom-control-label">Ẩm ướt/ <span class="text-primary">Clammy</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_cy" />
                                                        <span class="custom-control-label">Xanh tái/ <span class="text-primary">Cyanosed</span></span>
                                                    </label>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2 font-bold">4. Hệ thần kinh cảm giác/ <span class="text-primary">Neurosensory system</span></label>
                                                </legend>

                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 d-block">Định hướng được/ <span class="text-primary">Oriented</span></label>

                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_day" />
                                                        <span class="custom-control-label">Ngày/ <span class="text-primary">Day</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_time" />
                                                        <span class="custom-control-label">Thời gian/ <span class="text-primary">Time</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_per" />
                                                        <span class="custom-control-label">Người/ <span class="text-primary">Person</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_pla" />
                                                        <span class="custom-control-label">Nơi/ <span class="text-primary">Place</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_na" />
                                                        <span class="custom-control-label">Không định hướng được/ <span class="text-primary">Not all all</span></span>
                                                    </label>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <label class="control-label mb-2 d-block">Tình trạng tinh thần/ <span class="text-primary">Mental status</span></label>

                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_al" />
                                                        <span class="custom-control-label">Tỉnh táo/ <span class="text-primary">Alert</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_cf" />
                                                        <span class="custom-control-label">Nhầm lẫn/ <span class="text-primary">Confused</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_ag" />
                                                        <span class="custom-control-label">Kích động/ <span class="text-primary">Agitated</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_an" />
                                                        <span class="custom-control-label">Lo âu/ <span class="text-primary">Anxious</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_fr" />
                                                        <span class="custom-control-label">Quấy/ <span class="text-primary">Fretful</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_le" />
                                                        <span class="custom-control-label">Lơ mơ/ <span class="text-primary">Lethargic</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_de" />
                                                        <span class="custom-control-label">Trầm cảm/ <span class="text-primary">Depressed</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block">
                                                        <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="cb_mental_status_oth" />
                                                        <span class="custom-control-label">Khác/ <span class="text-primary">Other</span></span>
                                                    </label>

                                                    <div class="form-group mental_status_other_field ml-2 w-n">
                                                        <webUI:TextField runat="server" ID="txt_mental_status_other" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <label class="control-label mb-2 d-block">Thính giác/ <span class="text-primary">Hearing:</span></label>
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_hearing_code_n" name="rad_hearing_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_hearing_code_n">Bình thường/ <span class="text-primary">Normal</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_hearing_code_hi" name="rad_hearing_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_hearing_code_hi">Khiếm thính/ <span class="text-primary">Hearing impaired</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_hearing_code_ha" name="rad_hearing_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_hearing_code_ha">Dùng máy trợ thính (Trái/Phải)/ <span class="text-primary">Uses hearing aid (Left/Right)</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_hearing_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare20" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <label class="control-label mb-2 d-block">Thị giác/ <span class="text-primary">Vision:</span></label>
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_vision_code_nm" name="rad_vision_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vision_code_nm">Bình thường/ <span class="text-primary">Normal</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_vision_code_gl" name="rad_vision_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vision_code_gl">Đeo kính/ <span class="text-primary">Glasses</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_vision_code_cl" name="rad_vision_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vision_code_cl">Kính sát tròng/ <span class="text-primary">Contact lenses</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" disabled-for="vision_other_field" runat="server" id="rad_vision_code_oth" name="rad_vision_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_vision_code_oth">Khác/ <span class="text-primary">Other</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_vision_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare21" />
                                                        </a>
                                                    </div>

                                                    <div class="form-group vision_other_field ml-2
                                                    w-n">
                                                        <webUI:TextField runat="server" ID="txt_vision_other" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 d-block">Khả năng ngôn ngữ/ <span class="text-primary">Speech:</span></label>
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_speech_code_nm" name="rad_speech_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_speech_code_nm">Bình thường/ <span class="text-primary">Normal</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_speech_code_sl" name="rad_speech_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_speech_code_sl">Nói lắp/ <span class="text-primary">Slurred</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_speech_code_ap" name="rad_speech_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_speech_code_ap">Chứng mất ngôn ngữ/ <span class="text-primary">Aphasic</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_speech_code_nc" name="rad_speech_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_speech_code_nc">Không giao tiếp (Bất tỉnh or mê)/ <span class="text-primary">Non-communicative(Unconscious )</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="rad_speech_code_si" name="rad_speech_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_speech_code_si">Khiếm ngôn/ <span class="text-primary">Speech impaired</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" runat="server" id="rad_speech_code_nv" name="rad_speech_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_speech_code_nv">Chưa biết nói/ <span class="text-primary">Non-verbal</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_speech_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare19" />
                                                        </a>
                                                    </div>
                                                </div>

                                            </fieldset>


                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2 font-bold">5. Hệ tiêu hóa/ <span class="text-primary">Gastrointestinal system</span></label>
                                                </legend>

                                                <div class="col-md-12">
                                                    <label class="control-label d-block">Chế độ ăn uống/ <span class="text-primary">Diet</span></label>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_diet_code_nm" name="rad_diet_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_diet_code_nm">Bình thường/ <span class="text-primary">Normal</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_diet_code_bf" name="rad_diet_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_diet_code_bf">Bú bình/ <span class="text-primary">Bottle feeding</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_diet_code_tbf" name="rad_diet_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_diet_code_tbf">Bú mẹ hoàn toàn/ <span class="text-primary">Total breast feeding</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" disabled-for="diet_other_field" runat="server" id="rad_diet_code_oth" name="rad_diet_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_diet_code_oth">Khác/ <span class="text-primary">Other</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_diet_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare22" />
                                                        </a>
                                                        <div class="form-group w-n diet_other_field mt-2">
                                                            <webUI:TextField runat="server" ID="txt_diet_other" />
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="control-label d-block">Tình trạng hiện có/ <span class="text-primary">Presence of</span></label>
                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_diet_pre_code_v" name="rad_diet_pre_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_diet_pre_code_v">Nôn/ <span class="text-primary">Vomiting</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_diet_pre_code_n" name="rad_diet_pre_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_diet_pre_code_n">Buồn nôn/ <span class="text-primary">Nausea</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_diet_pre_code_s" name="rad_diet_pre_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_diet_pre_code_s">Nuốt khó (chuyển đến chuyên gia trị liệu)/ <span class="text-primary">Swalloing difficulties (refer to therapist)</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_diet_pre_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare23" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_ng_tube_True" name="rad_ng_tube" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_ng_tube_True">Ống thông/ <span class="text-primary">NG Tube</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_ng_tube_False" name="rad_ng_tube" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_ng_tube_False">Không/ <span class="text-primary">No</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_ng_tube" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare24" />
                                                        </a>
                                                    </div>

                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_gastrostomy_True" />
                                                        <span class="custom-control-label">Mở dạ dày/ <span class="text-primary">Gastrostomy</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                        <input type="checkbox" disabled-for="size_note_field" class="custom-control-input" runat="server" id="cb_size_True" />
                                                        <span class="custom-control-label">Kích cỡ/ <span class="text-primary">Size</span></span>
                                                    </label>

                                                    <div class="form-group w-s size_note_field mt-2">
                                                        <webUI:TextField runat="server" ID="txt_size_note" />
                                                    </div>

                                                    <label class="control-label mr-2">Ngày thay ống gần nhất/ <span class="text-primary">Last Date Changed</span></label>

                                                    <telerik:RadDatePicker runat="server" ID="dpk_last_date_changed" Width="120px" />
                                                    <div class="text-danger" id="last_date_changed_error"></div>
                                                </div>

                                                <div class="col-md-12 mb-2">
                                                    <label class="control-label d-block">Thức ăn không ưa thích/ <span class="text-primary">Food dislikes</span></label>

                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" ID="txt_food_dislike" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="control-label d-block">Bài tiết/ <span class="text-primary">Bowel elimination</span></label>
                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_bowel_elimination_code_two" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_bowel_elimination_code_two">2 lần/ ngày <span class="text-primary">(2 times/day)</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_bowel_elimination_code_one" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_bowel_elimination_code_one">1 lần/ ngày <span class="text-primary">(1 times/day)</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_bowel_elimination_code_eod" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_bowel_elimination_code_eod">Cách ngày/ <span class="text-primary">Every other day</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_bowel_elimination_code_oth" name="rad_bowel_elimination_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_bowel_elimination_code_oth">Khác/ <span class="text-primary">Other</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_bowel_elimination_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare27" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="control-label d-block">Tính chất phân/ <span class="text-primary">Consistency of stool</span></label>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_stool_consistency_code_h" name="rad_stool_consistency_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_stool_consistency_code_h">Cứng/ <span class="text-primary">Hard</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_stool_consistency_code_f" name="rad_stool_consistency_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_stool_consistency_code_f">Có hình dạng/ <span class="text-primary">Formed</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_stool_consistency_code_l" name="rad_stool_consistency_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_stool_consistency_code_l">Lỏng/ <span class="text-primary">Loose</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_stool_consistency_code_w" name="rad_stool_consistency_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_stool_consistency_code_w">Phân nước/ <span class="text-primary">Watery</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_stool_consistency_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare25" />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="control-label d-block">
                                                        Tình trạng hiện có/ <span class="text-primary">Presence with
                                                        </span>
                                                    </label>
                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_gas_presence_code_n" name="rad_gas_presence_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_gas_presence_code_n">Bình thường/ <span class="text-primary">Normal</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_gas_presence_code_i" name="rad_gas_presence_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_gas_presence_code_i">Không kiểm soát/ <span class="text-primary">Incontinence</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input type="radio" runat="server" id="rad_gas_presence_code_s" name="rad_gas_presence_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_gas_presence_code_s">Hậu môn nhân tạo/ <span class="text-primary">Stoma</span></label>
                                                        <a href="javascript:void(0)" class="el-hide" data-clear="rad_gas_presence_code" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare26" />
                                                        </a>
                                                    </div>
                                                </div>

                                            </fieldset>


                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2 font-bold">6. Đánh giá dinh dưỡng ban đầu/ <span class="text-primary">Initial Nutrition Assessment</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label mb-2">Bảng 1: Khảo sát dinh dưỡng ban đầu/ <span class="text-primary">Table 1: Initial screening</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <label class="control-label d-block">1. Chỉ số BMI < 20.5/ <span class="text-primary">Is BMI < 20.5?</span></label>

                                                            <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                                <input type="radio" onchange="initial_screening_change()" runat="server" id="rad_bmi_out_range_True" name="rad_bmi_out_range" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_bmi_out_range_True">Có/ <span class="text-primary">Yes</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                                <input type="radio" runat="server" id="rad_bmi_out_range_False" onchange="initial_screening_change()" name="rad_bmi_out_range" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_bmi_out_range_False">Không/ <span class="text-primary">No</span></label>
                                                                <a href="javascript:void(0)" class="el-hide"  data-clear="rad_bmi_out_range" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare28" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="control-label d-block">2. NB có sụt cân trong vòng 3 tháng gần đây không?/ <span class="text-primary">Has the patient lost weight within the last 3 months?</span></label>

                                                            <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                                <input type="radio" onchange="initial_screening_change()" runat="server" id="rad_loss_weight_True" name="rad_loss_weight" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_loss_weight_True">Có/ <span class="text-primary">Yes</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                                <input type="radio" runat="server" id="rad_loss_weight_False" onchange="initial_screening_change()" name="rad_loss_weight" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_loss_weight_False">Không/ <span class="text-primary">No</span></label>
                                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_loss_weight" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare29" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="control-label d-block">3. NB có chán ăn trong 1 tuần qua không?/ <span class="text-primary">Has the patient had a reduced dietary intake in the last week?</span></label>
                                                            <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                                <input onchange="initial_screening_change()" type="radio" runat="server" id="rad_reduce_dietary_True" name="rad_reduce_dietary" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_reduce_dietary_True">Có/ <span class="text-primary">Yes</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                                <input type="radio" onchange="initial_screening_change()" runat="server" id="rad_reduce_dietary_False" name="rad_reduce_dietary" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_reduce_dietary_False">Không/ <span class="text-primary">No</span></label>
                                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_reduce_dietary" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare30" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="control-label d-block">4. NB có bị bệnh gì nghiêm trọng không?/ <span class="text-primary">Is the patient severely ill?</span></label>
                                                            <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                                <input onchange="initial_screening_change()" type="radio" runat="server" id="rad_severely_ill_True" name="rad_severely_ill" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_severely_ill_True">Có/ <span class="text-primary">Yes</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                                <input onchange="initial_screening_change()" type="radio" runat="server" id="rad_severely_ill_False" name="rad_severely_ill" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_severely_ill_False">Không/ <span class="text-primary">No</span></label>
                                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_severely_ill" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare31" />
                                                                </a>
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

                                                    <fieldset class="row mb-2 final_screening">
                                                        <legend>
                                                            <label class="control-label mb-2">Bảng 2: Khảo sát dinh dưỡng tiếp theo/ <span class="text-primary">Table 2: Final screening</span></label>
                                                        </legend>
                                                        <div class="col-md-12 mb-2">
                                                            <fieldset class="row">
                                                                <legend>
                                                                    <label class="control-label mb-2"><span class="text-primary">Nutrition status</span></label>
                                                                </legend>
                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 d-block">Điểm = 0/ <span class="text-primary">Score = 0</span></label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_nutrition_normal_True" />
                                                                        <span class="custom-control-label">Tình trạng dinh dưỡng bình thường/ <span class="text-primary">Normal nutritional status</span></span>
                                                                    </label>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 d-block">Điểm = 1/ <span class="text-primary">Score = 1</span></label>

                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox"  class="custom-control-input" runat="server" onchange="nutrition_score1Change()" id="cb_nutrition_score1_1" />
                                                                        <span class="custom-control-label">Sụt cân > 5% trong 3 tháng/ <span class="text-primary">Weight loss > 5% in 3 months</span></span>
                                                                    </label>

                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" onchange="nutrition_score1Change()" class="custom-control-input" runat="server" id="cb_nutrition_score1_2" />
                                                                        <span class="custom-control-label">Ăn ít 50%-75% so với nhu cầu ăn bình thường trong tuần qua/ <span class="text-primary">Food intake below 50 - 75% of normal requirement in preceding week</span></span>
                                                                    </label>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 d-block">Điểm = 2/ <span class="text-primary">Score = 2</span></label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" onchange="nutrition_score2Change()" class="custom-control-input" runat="server" id="cb_nutrition_score2_1" />
                                                                        <span class="custom-control-label">Sụt cân > 5% trong 2 tháng/ <span class="text-primary">Weight loss > 5% in 2 months</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" onchange="nutrition_score2Change()" class="custom-control-input" runat="server" id="cb_nutrition_score2_2" />
                                                                        <span class="custom-control-label">BMI 18.5-20.5 và tổng trạng suy yếu/ <span class="text-primary">BMI 18.5 - 20.5 and impaired general condition</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" onchange="nutrition_score2Change()" class="custom-control-input" runat="server" id="cb_nutrition_score2_3" />
                                                                        <span class="custom-control-label">Ăn ít 25%-50% so với nhu cầu ăn bình thường trong tuần qua/ <span class="text-primary">Food intake 25–50% of normal requirement in preceding week</span></span>
                                                                    </label>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 d-block">Điểm = 3/ <span class="text-primary">Score = 3</span></label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="nutrition_score3Change()" runat="server" id="cb_nutrition_score3_1" />
                                                                        <span class="custom-control-label">Sụt cân > 5% trong 1 tháng/ <span class="text-primary">Weight loss > 5% in 1 month</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="nutrition_score3Change()" runat="server" id="cb_nutrition_score3_2" />
                                                                        <span class="custom-control-label">BMI < 18.5 và tổng trạng suy yếu/ <span class="text-primary">BMI < 18.5 and impaired general condition</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="nutrition_score3Change()" runat="server" id="cb_nutrition_score3_3" />
                                                                        <span class="custom-control-label">Ăn ít 0-25% so với nhu cầu ăn bình thường trong tuần qua/ <span class="text-primary">Food intake 0-25% of normal requirement in preceding week</span></span>
                                                                    </label>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 mr-2">
                                                                        Điểm/ <span class="text-primary">Score</span>
                                                                        <icon:Calculator runat="server" Width="16" Height="16" ID="Calculator1" />
                                                                    </label>
                                                                    <asp:Label Text="—" runat="server" ID="lbl_nutrition_score"></asp:Label>
                                                                    <div class="form-group d-inline-block w-3">
                                                                        <asp:Label Text="text" runat="server" ID="txt_nutrition_score" />
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <fieldset class="row">
                                                                <legend>
                                                                    <label class="control-label mb-2"><span class="text-primary">Severity of disease</span></label>
                                                                </legend>
                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 d-block">Điểm = 0/ <span class="text-primary">Score = 0</span></label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input"  runat="server" />
                                                                        <span class="custom-control-label">Yêu cầu dinh dưỡng đặc biệt/ <span class="text-primary">Normal nutritional requirements</span></span>
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 d-block">Điểm = 1/ <span class="text-primary">Score = 1</span></label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="severity_score1Change()" runat="server" id="cb_severity_score1_1" />
                                                                        <span class="custom-control-label">Gãy khớp háng/ <span class="text-primary">Hip fracture</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="severity_score1Change()" runat="server" id="cb_severity_score1_2" />
                                                                        <span class="custom-control-label">Bệnh mãn tính có kèm theo biến chứng/ <span class="text-primary">Chronic disease with complications</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="severity_score1Change()" runat="server" id="cb_severity_score1_3" />
                                                                        <span class="custom-control-label">Viêm phổi tắc nghẽn mãn tính/ <span class="text-primary">COPD</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="severity_score1Change()" runat="server" id="cb_severity_score1_4" />
                                                                        <span class="custom-control-label">NB yếu nhưng có thể di chuyển được/ <span class="text-primary">The patient is weak but can move out of bed</span></span>
                                                                    </label>

                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 d-block">Điểm = 2/ <span class="text-primary">Score = 2</span></label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="severity_score2Change()" runat="server" id="cb_severity_score2_1" />
                                                                        <span class="custom-control-label">Có phẫu thuật ở bụng/ <span class="text-primary">Major abdominal surgery</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" onchange="severity_score2Change()" class="custom-control-input" runat="server" id="cb_severity_score2_2" />
                                                                        <span class="custom-control-label">Đột quị/ <span class="text-primary">Stroke</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" onchange="severity_score2Change()" class="custom-control-input" runat="server" id="cb_severity_score2_3" />
                                                                        <span class="custom-control-label">Viêm phổi nặng/ <span class="text-primary">Severe pneumonia</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="cb_severity_score2_4" />
                                                                        <span class="custom-control-label">Bệnh ác tính huyết học/ <span class="text-primary">Hematologic malignancy</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" onchange="severity_score2Change()" class="custom-control-input" runat="server" id="cb_severity_score2_5" />
                                                                        <span class="custom-control-label">NB nằm liệt giường/ <span class="text-primary">The patient is bedridden</span></span>
                                                                    </label>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 d-block">Điểm = 3/ <span class="text-primary">Score = 3</span></label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="severity_score3Change()" runat="server" id="cb_severity_score3_1" />
                                                                        <span class="custom-control-label">Chấn thương đầu/ <span class="text-primary">Head injury</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="severity_score3Change()" runat="server" id="cb_severity_score3_2" />
                                                                        <span class="custom-control-label">Ghép tủy xương/ <span class="text-primary">Bone marrow transplantation</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="severity_score3Change()" runat="server" id="cb_severity_score3_3" />
                                                                        <span class="custom-control-label">Bệnh nhân chăm sóc chuyên sâu (APACHE> 10)/ <span class="text-primary">Intensive care patients (APACHE > 10)</span></span>
                                                                    </label>

                                                                </div>

                                                                <div class="col-md-12">
                                                                    <<label class="control-label mb-1 mr-2">Điểm/ <span class="text-primary">Score</span>
                                                                        <icon:Calculator runat="server" Width="16" Height="16" />
                                                                    </label>
                                                                    <asp:Label Text="—" class="d-inline-block" runat="server" id="lbl_severity_score"></asp:Label>
                                                                </div>

                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <fieldset class="row">
                                                                <legend>
                                                                    <label class="control-label mb-2"><span class="text-primary">Age</span></label>
                                                                </legend>
                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 d-block">Điểm = 0/ <span class="text-primary">Score = 0</span></label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" id="cb_younger_70_True" runat="server" />
                                                                        <span class="custom-control-label">< 70 tuổi/ <span class="text-primary">< 70 years old</span></span>
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 d-block">Điểm = 1/ <span class="text-primary">Score = 1</span></label>
                                                                    <label class="custom-control custom-checkbox ml-2">
                                                                        <input type="checkbox" class="custom-control-input" onchange="age_score1Change()" runat="server" id="cb_older_70_True" />
                                                                        <span class="custom-control-label">≥ 70 tuổi/ <span class="text-primary">≥ 70 years old</span></span>
                                                                    </label>

                                                                </div>

                                                                <div class="col-md-12">
                                                                    <label class="control-label mb-1 mr-2">Điểm/ <span class="text-primary">Score</span>
                                                                        <icon:Calculator runat="server" Width="16" Height="16" />
                                                                    </label>
                                                                    <asp:Label runat="server" ID="lbl_age_score"></asp:Label>
                                                                </div>

                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 mr-2">TỔNG SỐ ĐIỂM/ <span class="text-primary">TOTAL SCORE</span>
                                                                <icon:Calculator runat="server" Width="16" Height="16" />
                                                            </label>
                                                            <asp:Label Text="—" runat="server" ID="lbl_total_nutri_score"></asp:Label>
                                                            <p>
                                                                *Ghi chú: Khi đánh giá điểm cho mỗi tiêu chí thì luôn luôn chọn điểm cao nhất. Sau đó Sau đó cộng tất cả các điểm số ở cuối để có điểm số cuối cùng<br />
                                                                <span class="text-primary">Notes: When assessing the score for each criterion, always choose the highest score. Then add up all scores at the end to get the final score</span><br />
                                                                - Nếu điểm <3: đánh giá lại Nb mỗi tuần/ <span class="text-primary">If score < 3: weekly re-screening of the patient</span><br />
                                                                - Nếu điểm ≥ 3: giới thiệu NB đến khám chuyên gia dinh dưỡng/ <span class="text-primary">If score ≥ 3: refer patients to the nutritionists</span>
                                                            </p>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2 font-bold">7. Hệ tiết niệu sinh dục/ <span class="text-primary">Genitourinary system</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <label class="control-label d-block">Tiểu/ <span class="text-primary">Urination</span></label>

                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_nm" />
                                                        <span class="custom-control-label">Không có vấn đề/ <span class="text-primary">Normal</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_no" />
                                                        <span class="custom-control-label">Tiểu đêm/ <span class="text-primary">Nocturia</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_fr" />
                                                        <span class="custom-control-label">Thường xuyên/ <span class="text-primary">Frequency</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_dy" />
                                                        <span class="custom-control-label">Khó tiểu/ <span class="text-primary">Dysuria</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_urination_in" />
                                                        <span class="custom-control-label">Không kiểm soát/ <span class="text-primary">Incontinece</span></span>
                                                    </label>
                                                </div>

                                                <div class="col-12">
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_inter_catheter_True" />
                                                        <span class="custom-control-label">Thông tiểu ngắt quãng (lần/ ngày)/ <span class="text-primary">Intermittent catheterization</span></span>
                                                    </label>
                                                    <div class="form-group w-s d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_inter_catheter_note" />
                                                    </div>
                                                </div>

                                                <div class="col-12">
                                                    <label class="custom-control custom-checkbox mr-2 mb-1 d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_ind_catheter_True" />
                                                        <span class="custom-control-label">Ống thông tiểu lưu/ <span class="text-primary">Indwelling catheter</span></span>
                                                    </label>
                                                    <span class="text-danger" id="ind_catheter_error"></span>
                                                    <label class="mr-2">Kích cỡ/ <span class="text-primary">Size</span></label>

                                                    <div class="form-group w-s mr-2 d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_ind_catheter_size" />
                                                    </div>

                                                    <label class="control-label mr-2">Ngày thay gần nhất/ <span class="text-primary">Fr, Date last changed</span></label>

                                                    <telerik:RadDatePicker runat="server" ID="dpk_ind_catheter_date" Width="120px" />
                                                    <span class="text-danger" id="ind_catheter_date_error"></span>
                                                </div>

                                                <div class="col-12">
                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_sup_catheter_True" />
                                                        <span class="custom-control-label">Ống thông bàng quang qua da/ <span class="text-primary">Suprapubic catheter</span></span>
                                                    </label>

                                                    <label class="mr-2">Kích cỡ/ <span class="text-primary">Size</span></label>

                                                    <div class="form-group w-s size_note_field d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_sup_catheter_size" />
                                                    </div>

                                                    <label class="control-label">Ngày thay gần nhất/ <span class="text-primary">Fr, Date last changed</span></label>

                                                    <telerik:RadDatePicker runat="server" ID="dpk_last_sup_catheter_date" Width="120px" />
                                                    <span class="text-danger" id="last_sup_catheter_date_error"></span>
                                                </div>
                                                <div class="col-12">
                                                    <label class="control-label d-block">Đối với người bệnh nữ/ <span class="text-primary">For female patients only:</span></label>

                                                    <label class="control-label d-block">Kinh nguyệt/ <span class="text-primary">Menstruation:</span></label>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input disabled-for="final_screening" type="radio" runat="server" id="rad_menstruation_code_am" name="rad_menstruation_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_menstruation_code_am">Vô kinh/ <span class="text-primary">Amenorrhea</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input disabled-for="final_screening" type="radio" runat="server" id="rad_menstruation_code_me" name="rad_menstruation_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_menstruation_code_me">Mãn kinh/ <span class="text-primary">Menopause</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input disabled-for="final_screening" type="radio" runat="server" id="rad_menstruation_code_cy" name="rad_menstruation_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_menstruation_code_cy">Chu kỳ (ngày)/ <span class="text-primary">Cycle (day)</span></label>
                                                    </div>

                                                    <div class="form-group w-s d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_cycle_day" />
                                                    </div>

                                                    <label class="control-label">Ngày đầu của kỳ kinh cuối/ <span class="text-primary">Last menstrual period started:</span></label>

                                                    <div class="form-group w-s mt-1 d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_last_mens_period" />
                                                    </div>

                                                    <label class="control-label d-block">Có thai/ <span class="text-primary">Pregnancy:</span></label>

                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_not_pregnancy_True" />
                                                        <span class="custom-control-label">Không/ <span class="text-primary">No</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_pre_pregnancy_True" />
                                                        <span class="custom-control-label">Đã từng mang thai trước đây/ <span class="text-primary">Previous pregnancy</span></span>
                                                    </label>

                                                    <label class="control-label mb-1"><span class="text-primary">PARA</span></label>

                                                    <div class="form-group w-s d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_para" />
                                                    </div>

                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_cur_pregnancy_True" />
                                                        <span class="custom-control-label">Hiện đang mang thai/ <span class="text-primary">Current pregnancy</span></span>
                                                    </label>

                                                    <div class="form-group w-s d-inline-block">
                                                        <input id="txt_pregnancy_week" runat="server" class="form-control text-right" />
                                                        <span class="append">tuần/ week</span>
                                                    </div>

                                                    <label class="control-label mb-1 d-block">Ngừa thai/ <span class="text-primary">Contraception</span></label>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input disabled-for="final_screening" type="radio" runat="server" id="cb_contraception_code_no" name="cb_contraception_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="cb_contraception_code_no">Không/ <span class="text-primary">No</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input disabled-for="final_screening" type="radio" runat="server" id="cb_contraception_code_pill" name="cb_contraception_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="cb_contraception_code_pill">Thuốc ngừa thai/ <span class="text-primary">Contraceptive pill</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input disabled-for="final_screening" type="radio" runat="server" id="cb_contraception_code_dev" name="cb_contraception_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="cb_contraception_code_dev">Dụng cụ ngừa thai đặt trong tử cung/ <span class="text-primary">Intrauterine Device</span></label>
                                                    </div>

                                                    <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                        <input disabled-for="final_screening" type="radio" runat="server" id="cb_contraception_code_oth" name="cb_contraception_code" class="custom-control-input" />
                                                        <label class="custom-control-label" for="cb_contraception_code_oth">Khác/ <span class="text-primary">Other</span></label>
                                                    </div>

                                                    <div class="form-group w-5 d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_contraception_other" />
                                                    </div>

                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label mb-2 font-bold">8. Hệ cơ xương khớp/ <span class="text-primary">Musculoskeletal System</span></label>
                                                </legend>
                                                <div class="col-md-12">
                                                    <label class="control-label d-block">Tiền sử/ <span class="text-primary">History</span></label>

                                                    <label class="custom-control custom-checkbox ml-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_nm" />
                                                        <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox ml-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_jp" />
                                                        <span class="custom-control-label">Đau khớp/ <span class="text-primary">Joint pain</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox ml-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_js" />
                                                        <span class="custom-control-label">Sưng khớp/ <span class="text-primary">Joint swelling</span></span>
                                                    </label>

                                                    <label class="custom-control custom-checkbox ml-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_mus_history_ms" />
                                                        <span class="custom-control-label">Sự co rút cơ/ <span class="text-primary">Muscle spasms</span></span>
                                                    </label>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="custom-control custom-checkbox ml-2 d-inline mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_paralysis_True" />
                                                        <span class="custom-control-label">Liệt/ (1/2 người/2 chi/4 chi)/ <span class="text-primary">Paralysis (Hemi/Para/Tetra)</span></span>
                                                    </label>

                                                    <div class="form-group w-s mt-1 d-inline-block ml-2">
                                                        <webUI:TextField runat="server" ID="txt_paralysis_note" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="custom-control custom-checkbox mr-2 mb-1 d-inline">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_amputation_True" />
                                                        <span class="custom-control-label">Đoạn chi/ <span class="text-primary">Amputation</span></span>
                                                    </label>

                                                    <div class="form-group w-s d-inline-block">
                                                        <webUI:TextField runat="server" ID="txt_amputation_note" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_contracture_True" />
                                                        <span class="custom-control-label">Cơ bắp co rút/ <span class="text-primary">Contracture</span></span>
                                                    </label>

                                                    <div class="form-group w-s mt-1 d-inline-block ml-2">
                                                        <webUI:TextField runat="server" ID="txt_contracture_note" />
                                                    </div>
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_prosthesis_True" />
                                                        <span class="custom-control-label">Lắp bộ phận giả/ <span class="text-primary">Prosthesis</span></span>
                                                    </label>

                                                    <div class="form-group w-s mt-1 d-inline-block ml-2">
                                                        <webUI:TextField runat="server" ID="txt_prosthesis_note" />
                                                    </div>
                                                </div>
                                        </div>
                                        </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2 font-bold">9. Đau/ <span class="text-primary">Pain</span></label>
                                        </legend>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label d-inline-block mr-2">Hiện đang đau/ <span class="text-primary">Currently in pain</span></label>

                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_cur_in_pain_False" runat="server" name="rad_cur_in_pain" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_cur_in_pain_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>

                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_cur_in_pain_True" runat="server" name="rad_cur_in_pain" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_cur_in_pain_True">
                                                    Có(báo bác sỹ)/ <span class="text-primary">Yes (inform doctor)</span>
                                                </label>

                                                <a href="javascript:void(0)" data-clear="rad_cur_in_pain" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare43" />
                                                </a>
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
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_p_location_1" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_p_location_2" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_p_location_3" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Q Quality (describe the pain,discomfort, & characteristics of pain).</th>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_q_location_1" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_q_location_2" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_q_location_3" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">R Region/ Radiation (where is the pain?does it radiate?) </th>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_r_location_1" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_r_location_2" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_r_location_3" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">S Severity (rate pain score) </th>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_s_location_1" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_s_location_2" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_s_location_3" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">T Time (how long the patient had the pain?</th>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_t_location_1" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_t_location_2" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_t_location_3" />
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1 mr-2">Sử dụng thuốc giảm đau/ <span class="text-primary">Using painkiller:</span></label>

                                            <div class="custom-control custom-radio d-inline-block mr-2">
                                                <input type="radio" id="rad_using_pain_killer_False" runat="server" name="rad_using_pain_killer" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_using_pain_killer_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>

                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_using_pain_killer_True" runat="server" name="rad_using_pain_killer" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_using_pain_killer_True">
                                                    Có(báo bác sỹ)/ <span class="text-primary">Yes (inform doctor)</span>
                                                </label>
                                                <a href="javascript:void(0)" data-clear="rad_using_pain_killer" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare44" />
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Tên thuốc/ <span class="text-primary">Name of painkiller:</span></label>
                                            <div class="form-group w-n mt-1 d-inline-block ml-2">
                                                <webUI:TextField runat="server" ID="txt_pain_killer_name" />
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Nhận xét/ <span class="text-primary">Comments:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_pa_comment" />
                                            </div>
                                        </div>

                                    </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label mb-2 font-bold">10. Da & Nguy cơ loét tỳ đè/ <span class="text-primary">Skin & Pressure Sore Risk</span></label>
                                            </legend>

                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-2">Tình trạng/ <span class="text-primary">Condition</span></label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_nm" />
                                                    <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_pa" />
                                                    <span class="custom-control-label">Tái/ <span class="text-primary">Pale</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_fl" />
                                                    <span class="custom-control-label">Đỏ/ <span class="text-primary">Flush</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_ja" />
                                                    <span class="custom-control-label">Vàng da/ <span class="text-primary">Jaundiced</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_dr" />
                                                    <span class="custom-control-label">Khô/ <span class="text-primary">Dry</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_oi" />
                                                    <span class="custom-control-label">Nhờn/ <span class="text-primary">Oily</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_sw" />
                                                    <span class="custom-control-label">Nhiều mồ hôi/ <span class="text-primary">Sweaty</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_condition_ra" />
                                                    <span class="custom-control-label">Phát ban/ <span class="text-primary">Rash</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-2">Vết thương/ <span class="text-primary">Wounds</span></label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_1" />
                                                    <span class="custom-control-label">Máu tụ (1)/ <span class="text-primary">Haematoma</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_2" />
                                                    <span class="custom-control-label">Sự thâm tím (2)/ <span class="text-primary">Bruises</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_3" />
                                                    <span class="custom-control-label">Rách (3)/ <span class="text-primary">Laceration</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_4" />
                                                    <span class="custom-control-label">Sẹo (4)/ <span class="text-primary">Scar</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_5" />
                                                    <span class="custom-control-label">Phỏng (5)/ <span class="text-primary">Burn</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_wounds_6" />
                                                    <span class="custom-control-label">Loét do tỳ đè (6)/ <span class="text-primary">Pressure sore</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-12 mb-2">
                                                Biểu thị vùng da với chỉ số tương ứng trên sơ đồ cơ thể và mô tả vết thương dưới dây<br />
                                                <span class="text-primary">Indicate the location with the corresponding number in the body diagram and describe the wound below.</span><br />
                                                Chỉ rõ vùng của vết thương bằng chỉ số tương ứng (1-6) dưới đây<br />
                                                <span class="text-primary">Specify location of wound with the corresponding number (1-6) below</span>
                                            </div>

                                            <div class="col-md-12 mb-2">
                                                <asp:UpdatePanel ID="updatePanel_skin_anno" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:GridView
                                                            ShowHeaderWhenEmpty="true"
                                                            ID="grid_skin_anno"
                                                            runat="server"
                                                            CssClass="tb-responsive table-bordered"
                                                            OnRowDeleting="grid_skin_anno_RowDeleting"
                                                            AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div class="w-s pt-2 pb-2">Vùng/ <span class="text-primary">Location</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div class="form-group">
                                                                            <webUI:TextField runat="server" DataKey="location" Value='<%#Eval("location") %>' />
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div class="w-n">Loại vết thương và mô tả vết thương (vd: kích cỡ, độ sâu, màu…)/ <span class="text-primary">Wound type and description (i.e. size, depth, colour…)</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField Value='<%#Eval("type") %>' DataKey="type" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-secondary" OnClientClick="return confirm('are you sure?')">
                                                                            <icon:Trash runat="server" ID="Trash" />
                                                                        </asp:LinkButton>

                                                                        <%--<asp:Button ID="ButtonAdd" runat="server" Text="Delete" CommandName="Delete"
                                                                         CssClass="grvAddButton" OnClientClick="return confirm('are you sure?')"  />--%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <%--<asp:CommandField ShowDeleteButton="True" ButtonType="Button" />--%>
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
                                                <img src="../images/2021-05-25_21-54-42.png" />
                                            </div>

                                            <div class="col-md-12 mb-2">
                                                Đánh giá nguy cơ loét tỳ đè được cải tiến thang Braden<br />
                                                <span class="text-primary">Pressure Sore risk assessment-Modified Braden</span><br />
                                                Hướng dẫn: So sánh tình trạng của người bệnh với mô tả phù hợp nhất của từng loại. Ghi điểm (bằng số) ở cột bên phải. Cộng lại ở bên dưới để tính.<br />
                                                <span class="text-primary">Guidance: Compare the patient’s condition to the most appropriate description for each category. Note the score (written as a number) at the right column. Add up at the bottom to receive the total score.</span>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label w-7 mb-2 mr-2">Nhận thức giác quan/ <span class="text-primary">Sensory perception</span></label>

                                                <select onchange="sensory_score_change(this)" runat="server" id="select_sensory_code" class="custom-select d-inline-block w-n mb-2">
                                                    <option></option>
                                                </select>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label w-7 mb-2 mr-2">Độ ẩm/ <span class="text-primary">Moisture</span></label>

                                                <select onchange="moisture_score_change(this)" runat="server" id="select_moisture_code" class="custom-select d-inline-block w-n mb-2">
                                                    <option></option>
                                                </select>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label w-7 mb-2 mr-2">Vận động/ <span class="text-primary">Activity</span></label>

                                                <select onchange="activity_score_change(this)" runat="server" id="select_activity_code" class="custom-select d-inline-block w-n mb-2">
                                                    <option></option>
                                                </select>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label w-7 mb-2 mr-2">Di chuyển/ <span class="text-primary">Mobility</span></label>

                                                <select onchange="mobility_score_change(this)" runat="server" id="select_mobility_code" class="custom-select d-inline-block w-n mb-2">
                                                    <option></option>
                                                </select>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label w-7 mb-2 mr-2">Dinh dưỡng/ <span class="text-primary">Nutrition</span></label>

                                                <select onchange="nutrition_score_change(this)" runat="server" id="select_nutrition_code" class="custom-select d-inline-block w-n mb-2">
                                                    <option></option>
                                                </select>
                                            </div>

                                            <div class="col-md-12 mb-2">
                                                <label class="control-label w-7 mb-2 mr-2">Sự ma sát & trượt da/ <span class="text-primary">Friction & shear</span></label>

                                                <select onchange="friction_score_change(this)" runat="server" id="select_friction_code" class="custom-select d-inline-block w-n">
                                                    <option></option>
                                                </select>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label w-7 mb-2 mr-2">Tổng số điểm/ <span class="text-primary">Total Score</span>
                                                                <icon:Calculator runat="server" Width="16" Height="16" />
                                                            </label>
                                                    <asp:Label Text="—" runat="server" ID="lbl_total_score"></asp:Label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label w-7 mb-2 mr-2">Nguy cơ loát tỳ đè/ <span class="text-primary">Pressure sore risk</span></label>

                                                <div class="form-group d-inline-block w-4">
                                                    <webUI:TextField runat="server" ID="txt_pres_sore_risk_code" />
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label w-7 mb-2 mr-2">Cách phòng ngừa tương ứng với những nguy cơ xác định/ <span class="text-primary">Take preventive actions according to the identified risk</span></label>
                                                <div class="form-group d-inline-block w-4">
                                                    <webUI:TextField runat="server" ID="txt_preven_action" />
                                                </div>
                                            </div>

                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label mb-2 font-bold">11. Khả năng thực hiện những sinh hoạt hàng ngày/ <span class="text-primary">Ability to perform daily activities</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <fieldset class="row mb-2">
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
                                                <fieldset class="row mb-2">
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
                                                <fieldset class="row mb-2">
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
                                                <fieldset class="row mb-2">
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
                                                <fieldset class="row mb-2">
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
                                                <fieldset class="row mb-2">
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
                                                <fieldset class="row mb-2">
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
                                                <fieldset class="row mb-2">
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
                                                <fieldset class="row mb-2">
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
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Thuốc đã sử dụng/ <span class="text-primary">Medication used:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_medication_used" />
                                                </div>
                                            </div>

                                        </fieldset>

                                        <fieldset class="row mb-2">
                                            <legend>
                                                <label class="control-label mb-2 font-bold">12. Đánh giá nguy cơ té ngã sử dụng Bảng Morse Scale/ <span class="text-primary">High risk of fall assessment using Morse Scale</span></label>
                                            </legend>

                                            <div class="col-md-12 mb-2">
                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label">Tiền sử bị ngã/ <span class="text-primary">History of falling</span></label>
                                                    </legend>

                                                    <div class="col-md-12">
                                                        <div class="custom-control custom-radio mr-2 d-inline-block">
                                                            <input type="radio" id="rad_fall_history_code_25" runat="server" name="rad_fall_history_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_fall_history_code_25">
                                                                Có/ <span class="text-primary">Yes</span>  = 25
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_fall_history_code_0" runat="server" name="rad_fall_history_code" class="custom-control-input" />
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
                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label">Có từ 2 bệnh lý trở lên/ <span class="text-primary">Secondary diagnosis</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <div class="custom-control custom-radio mr-2 d-inline-block">
                                                            <input type="radio" id="rad_secon_diagnosis_code_15" runat="server" name="rad_secon_diagnosis_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_secon_diagnosis_code_15">
                                                                Có/ <span class="text-primary">Yes</span>  = 15
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_secon_diagnosis_code_0" runat="server" name="rad_secon_diagnosis_code" class="custom-control-input" />
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
                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label">Khả năng di chuyển/ <span class="text-primary">Ambulatory Aids</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="rad_ambula_aids_code_30" runat="server" name="rad_ambula_aids_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ambula_aids_code_30">
                                                                Sử dụng vật dụng hỗ trợ/ <span class="text-primary">Furniture</span>  = 30
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="rad_ambula_aids_code_15" runat="server" name="rad_ambula_aids_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_ambula_aids_code_15">
                                                                Nạng, thiết bị hỗ trợ đi lại/ <span class="text-primary">Crutches, cane walker</span> = 15
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="rad_ambula_aids_code_0" runat="server" name="rad_ambula_aids_code" class="custom-control-input" />
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
                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label">Liệu pháp tiêm tĩnh mạch/ có khóa heparin <span class="text-primary">Intravenous therapy/heparin locked</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <div class="custom-control custom-radio d-inline-block mr-2">
                                                            <input type="radio" id="rad_intra_therapy_code_20" runat="server" name="rad_intra_therapy_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_intra_therapy_code_20">
                                                                Có/ <span class="text-primary">Yes</span> = 20
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" id="rad_intra_therapy_code_0" runat="server" name="rad_intra_therapy_code" class="custom-control-input" />
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
                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label">Dáng đi/ di chuyển/ <span class="text-primary">Gait/ transferring</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="rad_gait_trans_code_20" runat="server" name="rad_gait_trans_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_gait_trans_code_20">
                                                                Suy yếu/ <span class="text-primary">Impaired</span> = 20
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="rad_gait_trans_code_10" runat="server" name="rad_gait_trans_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_gait_trans_code_10">
                                                                Yếu/ <span class="text-primary">Weak</span> = 10
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="rad_gait_trans_code_0" runat="server" name="rad_gait_trans_code" class="custom-control-input" />
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
                                                <fieldset class="row mb-2">
                                                    <legend>
                                                        <label class="control-label">Trạng thái tâm thần/ <span class="text-primary">Mental status</span></label>
                                                    </legend>
                                                    <div class="col-md-12">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="rad_fr_mental_status_code_15" runat="server" name="rad_fr_mental_status_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_fr_mental_status_code_15">
                                                                Không hiểu được giới hạn bản thân/ <span class="text-primary">Does not understand limitation</span> = 15
                                                            </label>
                                                        </div>
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="rad_fr_mental_status_code_0" runat="server" name="rad_fr_mental_status_code" class="custom-control-input" />
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

                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mr-2">
                                                    TỔNG ĐIỂM/ <span class="text-primary">TOTAL SCORE:</span>
                                                    <icon:Calculator Width="16" Height="16" runat="server" ID="Calculator" />
                                                </label>
                                                <div class="form-group d-inline-block w-4">
                                                    <asp:Label runat="server" ID="txt_fr_total_score"></asp:Label>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mr-2">0-24: Nguy cơ thấp/ <span class="text-primary">low risk:</span></label>
                                                <label class="control-label mb-1 mr-2">25-44: Nguy cơ trung bình/ <span class="text-primary">medium risk:</span></label>
                                                <label class="control-label mb-1">45+: Nguy cơ cao/ <span class="text-primary">high risk:</span></label>
                                            </div>

                                        </fieldset>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1 h4">D. KẾ HOẠCH XUẤT VIỆN (HOÀN TẤT TRONG VÒNG 24 GIỜ SAU KHI NHẬP VIỆN)/ <span class="text-primary">DISCHARGE PLAN (TO BE COMPLETED WITHIN 24HOURS OF ADMISSION):</span></label>
                                            <p>
                                                Đánh giá lại và mời hội chẩn nếu tình trạng sức khỏe của người bệnh thay đổi. Nếu cần, chuyển bệnh đến khoa thích hợp. Nếu có nghi vấn, thảo luận với bác sĩ phụ trách.<br />
                                                <span class="text-primary">Reassess and inform if patient’s condition charges. If there is “ Yes” refer to the respective unit. In doubt, discuss with doctor in charge</span>
                                            </p>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Nhiều chuyên khoa cùng tham gia điều trị/ <span class="text-primary">Multidisciplinary team involvement:</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_involvement_True" runat="server" name="rad_involvement" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_involvement_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_involvement_False" runat="server" name="rad_involvement" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_involvement_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Yêu cầu thiết bị y tế, máy tạo oxy và dịch vụ giúp đỡ chăm sóc tại nhà/ <span class="text-primary">Requires medical equipment, oxygen concentrator and home care help services:</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_req_med_equipment_True" runat="server" name="rad_req_med_equipment" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_req_med_equipment_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_req_med_equipment_False" runat="server" name="rad_req_med_equipment" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_req_med_equipment_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Yêu cầu theo dõi điều trị/ <span class="text-primary">Requires follow-up care:</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_req_foll_care_True" runat="server" name="rad_req_foll_care" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_req_foll_care_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_req_foll_care_False" runat="server" name="rad_req_foll_care" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_req_foll_care_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Các trường hợp tự tử (cần hội chẩn khẩn cấp)/ <span class="text-primary">Suicidal cases (Urgent referral):</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_suicidal_referral_True" runat="server" name="rad_suicidal_referral" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_suicidal_referral_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_suicidal_referral_False" runat="server" name="rad_suicidal_referral" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_suicidal_referral_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Sống một mình với tình trạng suy giảm chức năng và không được chăm sóc điều trị hay hỗ trợ từ gia đình/ <span class="text-primary">Lives alone with reduced functional status and no other care giver or family support:</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_alone_reduce_functional_True" runat="server" name="rad_alone_reduce_functional" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_alone_reduce_functional_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_alone_reduce_functional_False" runat="server" name="rad_alone_reduce_functional" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_alone_reduce_functional_True">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Mời bác sĩ vật lý trị liệu hội chẩn (nếu có, báo bác sĩ)/ <span class="text-primary">Referral to Physiotherapist (if yes, inform Doctor):</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_ref_physiotherapist_True" runat="server" name="rad_ref_physiotherapist" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_ref_physiotherapist_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_ref_physiotherapist_False" runat="server" name="rad_ref_physiotherapist" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_ref_physiotherapist_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Mời chuyên gia ngôn ngữ trị liệu hội chẩn (nếu có, báo bác sĩ)/ <span class="text-primary">Referral to speech therapist (if yes, inform doctor):</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_ref_speech_therapist_True" runat="server" name="rad_ref_speech_therapist" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_ref_speech_therapist_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_ref_speech_therapist_False" runat="server" name="rad_ref_speech_therapist" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_ref_speech_therapist_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Giới thiệu đến chuyên gia dinh dưỡng/ <span class="text-primary">Referral to Dietician:</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_ref_dietician_True" runat="server" name="rad_ref_dietician" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_ref_dietician_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_ref_dietician_False" runat="server" name="rad_ref_dietician" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_ref_dietician_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Giới thiệu đến chuyên gia tâm lý/ <span class="text-primary">Referral to Psychologist:</span></label>
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
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Yêu cầu chuyển đến bệnh viện khác/ <span class="text-primary">Requires referral to other hospital:</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_other_hospital_True" runat="server" name="rad_other_hospital" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_other_hospital_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_other_hospital_False" runat="server" name="rad_other_hospital" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_other_hospital_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                            <span class="text-danger" id="other_hospital_error"></span>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Người nhà hỗ trợ tại nhà/ <span class="text-primary">Support system at home:</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_support_at_home_True" runat="server" name="rad_support_at_home" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_support_at_home_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_support_at_home_False" runat="server" name="rad_support_at_home" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_support_at_home_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Người bệnh yêu cầu phương tiện vận chuyển về nhà/ <span class="text-primary">Will patient require transportation arrangements to go home:</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_req_transportation_True" runat="server" name="rad_req_transportation" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_req_transportation_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_req_transportation_False" runat="server" name="rad_req_transportation" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_req_transportation_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Cầu thang bộ tại nhà/ <span class="text-primary">Stairs to climb at home:</span></label>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_stairs_climb_home_True" runat="server" name="rad_stairs_climb_home" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_stairs_climb_home_True">
                                                    Có/ <span class="text-primary">Yes</span>
                                                </label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block">
                                                <input type="radio" id="rad_stairs_climb_home_False" runat="server" name="rad_stairs_climb_home" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_stairs_climb_home_False">
                                                    Không/ <span class="text-primary">No</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1 h4">E. KẾ HOẠCH XUẤT VIỆN- ĐÁNH GIÁ LẠI/ <span class="text-primary">DISCHARGE PLANNING - REASSESSMENT:</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_dis_planning" />
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1 h4">F. QUẢN LÝ XUẤT VIỆN (HOÀN THÀNH SỚM NHẤT CÓ THỂ TRONG NGÀY NHẬP VIỆN)/ <span class="text-primary">DISCHARGE MANAGEMENT (TO BE DONE AS EARLY AT THE DAY OF ADMISSION):</span></label>
                                            <div class="form-group">
                                                <webUI:TextField runat="server" ID="txt_dis_management" />
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1 mr-2">Ngày giờ/ <span class="text-primary">Date & Time:</span></label>
                                            <div class="form-group d-inline-block">
                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_assess_date_time" Width="200px" />
                                                <span class="text-danger" id="assess_date_time_error"></span>
                                            </div>
                                        </div>

                                        <fieldset class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-actions">
                                                    <asp:Button ID="btnComplete" class="btn btn-primary" runat="server" Text="Complete" />
                                                    <asp:Button ID="btnSave" class="btn btn-primary" runat="server" OnClick="btnSave_Click" Text="Save" />
                                                    <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                    <asp:Button ID="btnAmend" class="btn btn-secondary" runat="server" Text="Amend" />
                                                    <asp:Button ID="btnPrint" OnClientClick="window.print()" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                                    <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
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
                                                    <asp:Button runat="server" Text="Delete" ID="Button1" class="btn btn-danger" />
                                                </div>
                                            </ModalBody>
                                        </webUI:PopupModal>

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

            let fall_history_score = 0;
            let secon_diagnosis_score = 0;
            let ambula_aids_score = 0;
            let intra_therapy_score = 0;
            let gait_trans_score = 0;
            let fr_mental_status_score = 0;
            // History of falling
            document.querySelector('#rad_fall_history_code_0').addEventListener("change", () => { fall_history_score = 0; updateFrTotalScore(); });

            document.querySelector('#rad_fall_history_code_25').addEventListener("change", () => { fall_history_score = 25; updateFrTotalScore(); });
            //Secondary diagnosis
            document.querySelector('#rad_secon_diagnosis_code_0').addEventListener("change", () => { secon_diagnosis_score = 0; updateFrTotalScore(); });

            document.querySelector('#rad_secon_diagnosis_code_15').addEventListener("change", () => { secon_diagnosis_score = 15; updateFrTotalScore(); });
            //Ambulatory Aids
            document.querySelector('#rad_ambula_aids_code_30').addEventListener("change", () => { ambula_aids_score = 30; updateFrTotalScore(); });

            document.querySelector('#rad_ambula_aids_code_15').addEventListener("change", () => { ambula_aids_score = 15; updateFrTotalScore(); });

            document.querySelector('#rad_ambula_aids_code_0').addEventListener("change", () => { ambula_aids_score = 0; updateFrTotalScore(); });
            //Intravenous therapy/heparin locked
            document.querySelector('#rad_intra_therapy_code_20').addEventListener("change", () => { intra_therapy_score = 20; updateFrTotalScore(); });

            document.querySelector('#rad_intra_therapy_code_0').addEventListener("change", () => { intra_therapy_score = 0; updateFrTotalScore(); });
            //Gait/ transferring
            document.querySelector('#rad_gait_trans_code_20').addEventListener("change", () => { gait_trans_score = 20; updateFrTotalScore(); });

            document.querySelector('#rad_gait_trans_code_10').addEventListener("change", () => { gait_trans_score = 10; updateFrTotalScore(); });

            document.querySelector('#rad_gait_trans_code_0').addEventListener("change", () => { gait_trans_score = 0; updateFrTotalScore(); });
            //Mental status
            document.querySelector('#rad_fr_mental_status_code_15').addEventListener("change", () => { fr_mental_status_score = 15; updateFrTotalScore(); });

            document.querySelector('#rad_fr_mental_status_code_0').addEventListener("change", () => { fr_mental_status_score = 0; updateFrTotalScore(); });

            function updateFrTotalScore() {
                document.querySelector("#txt_fr_total_score").innerText = fall_history_score + secon_diagnosis_score + ambula_aids_score + intra_therapy_score + gait_trans_score + fr_mental_status_score;
            }

        let nutrition_score1 = 0;
        let nutrition_score2 = 0;
        let nutrition_score3 = 0;
        let nutrition_score_total = 0;

        function nutrition_score1Change() {
            nutrition_score1 = 0;
            let checkbox1 = document.getElementById("cb_nutrition_score1_1");
            let checkbox2 = document.getElementById("cb_nutrition_score1_2");

            if (checkbox1.checked || checkbox2.checked) {
                nutrition_score1 = 1;
            }

            updateNutritionScore();
        }

        function nutrition_score2Change()  {
            nutrition_score2 = 0;

            let checkbox1 = document.getElementById("cb_nutrition_score2_1");
            let checkbox2 = document.getElementById("cb_nutrition_score2_2");
            let checkbox3 = document.getElementById("cb_nutrition_score2_3");

            if (checkbox1.checked || checkbox2.checked || checkbox3.checked) {
                nutrition_score2 = 2;
            }

            updateNutritionScore();
        }

        function nutrition_score3Change () {
            nutrition_score3 = 0;

            let checkbox1 = document.getElementById("cb_nutrition_score3_1");
            let checkbox2 = document.getElementById("cb_nutrition_score3_2");
            let checkbox3 = document.getElementById("cb_nutrition_score3_3");

            if (checkbox1.checked || checkbox2.checked || checkbox3.checked) {
                nutrition_score3 = 3;
            }

            updateNutritionScore();
        }

        function updateNutritionScore() {
            nutrition_score_total = parseInt(nutrition_score1) + parseInt(nutrition_score2) + parseInt(nutrition_score3);
            document.getElementById("lbl_nutrition_score").innerText = nutrition_score_total;

            updateTotalNutriScore();
        }


        // Severity of disease

        let severity_score1 = 0;
        let severity_score2 = 0;
        let severity_score3 = 0;
        let severity_score_total = 0;

        function severity_score1Change() {
            severity_score1 = 0;
            let checkbox1 = document.getElementById("cb_severity_score1_1");
            let checkbox2 = document.getElementById("cb_severity_score1_2");
            let checkbox3 = document.getElementById("cb_severity_score1_3");
            let checkbox4 = document.getElementById("cb_severity_score1_4");

            if (checkbox1.checked || checkbox2.checked || checkbox3.checked || checkbox4.checked) {
                severity_score1 = 1;
            }

            updateSeverityScore();
        }

        function severity_score2Change() {
            severity_score2 = 0;
            let checkbox1 = document.getElementById("cb_severity_score2_1");
            let checkbox2 = document.getElementById("cb_severity_score2_2");
            let checkbox3 = document.getElementById("cb_severity_score2_3");
            let checkbox4 = document.getElementById("cb_severity_score2_4");
            let checkbox5 = document.getElementById("cb_severity_score2_5");

            if (checkbox1.checked || checkbox2.checked || checkbox3.checked || checkbox4.checked || checkbox5.checked) {
                severity_score2 = 2;
            }

            updateSeverityScore();
        }

        function severity_score3Change() {
            severity_score3 = 0;
            let checkbox1 = document.getElementById("cb_severity_score3_1");
            let checkbox2 = document.getElementById("cb_severity_score3_2");
            let checkbox3 = document.getElementById("cb_severity_score3_3");

            if (checkbox1.checked || checkbox2.checked || checkbox3.checked) {
                severity_score3 = 3;
            }

            updateSeverityScore();
        }



        function updateSeverityScore() {
            severity_score_total = parseInt(severity_score1) + parseInt(severity_score2) + parseInt(severity_score3);
            document.getElementById("lbl_severity_score").innerText = severity_score_total;

            updateTotalNutriScore();
        }

        let age_score1 = 0;
        let age_score_total = 0;

        function age_score1Change() {
            age_score = 0;
            let checkbox1 = document.getElementById("cb_older_70_True");

            if (checkbox1.checked) {
                age_score1 = 1;
            }

            updateAgeScore();
        }

        function updateAgeScore() {
            age_score_total = parseInt(age_score1);
            document.getElementById("lbl_age_score").innerText = age_score_total;
            updateTotalNutriScore();
        }

        function updateTotalNutriScore() {
            document.getElementById("lbl_total_nutri_score").innerText = nutrition_score_total + severity_score_total + age_score_total;
        }

            let clear_fall_history_score = (el) => {
                clearRadioButton(el);
                fall_history_score = 0;
                updateFrTotalScore();
            }

            let clear_secon_diagnosis_score = (el) => {
                clearRadioButton(el);
                secon_diagnosis_score = 0;
                updateFrTotalScore();
            }

            let clear_ambula_aids_score = (el) => {
                clearRadioButton(el);
                ambula_aids_score = 0;
                updateFrTotalScore();
            }

            let clear_intra_therapy_score = (el) => {
                clearRadioButton(el);
                intra_therapy_score = 0;
                updateFrTotalScore();
            }

            let clear_gait_trans_score = (el) => {
                clearRadioButton(el);
                gait_trans_score = 0;
                updateFrTotalScore();
            }

            let clear_fr_mental_status_score = (el) => {
                clearRadioButton(el);
                clear_fr_mental_status_score = 0;
                updateFrTotalScore();
            }

            function clearRadioButton(el) {
                let radioButton = document.querySelector(`input[name="${el.getAttribute("data-clear")}"]:checked`);
                if (radioButton) { radioButton.checked = false; }
            }

        let sensory_score, moisture_score, activity_score, mobility_score, nutrition_score, friction_score;
        let total_score = document.getElementById("lbl_total_score")

            let update_total_score = () => {
                if (!sensory_score || !moisture_score || !activity_score || !mobility_score || !nutrition_score || !friction_score) {
                    lbl_total_score.innerText = "—";
                } else {
                    lbl_total_score.innerText = parseInt(sensory_score) + parseInt(moisture_score) + parseInt(activity_score) + parseInt(mobility_score) + parseInt(nutrition_score) + parseInt(friction_score);
                }
            }

            let sensory_score_change = (e) => { sensory_score = e.value; update_total_score(); }

            let moisture_score_change = (e) => { moisture_score = e.value; update_total_score(); }

            let activity_score_change = (e) => { activity_score = e.value; update_total_score(); }

            let mobility_score_change = (e) => { mobility_score = e.value; update_total_score(); }

            let nutrition_score_change = (e) => { nutrition_score = e.value; update_total_score(); }

            let friction_score_change = (e) => { friction_score = e.value; update_total_score(); }

            //
            let bmi_out_range = document.getElementById("rad_bmi_out_range_True");
            let severely_ill = document.getElementById("rad_severely_ill_True");
            let reduce_dietary = document.getElementById("rad_reduce_dietary_True");
            let loss_weight = document.getElementById("rad_loss_weight_True");

            function initial_screening_change() {
                let final_screening = document.querySelector(".final_screening");
                if (bmi_out_range.checked || severely_ill.checked || reduce_dietary.checked || loss_weight.checked) {
                    final_screening.classList.remove("el-hide");
                } else {
                    final_screening.classList.add("el-hide");
                }
        }

        //
        if (document.querySelector("#RequiredFieldValidator").value) {
            let errors = document.querySelector("#RequiredFieldValidator").value
            console.log(errors);

            if (errors.includes("pro_cough_error")) {
                document.querySelector("#pro_cough_error").innerHTML = "this field is required.";
            }

            if (errors.includes("last_date_changed_error")) {
                let last_date_changed_error = document.getElementById("last_date_changed_error");
                if (last_date_changed_error) last_date_changed_error.innerHTML = "Ngày thay gần nhất/ Fr, Date last changed is required";
            }

            if (errors.includes("last_sup_catheter_date_error")) {
                let last_date_changed_error = document.getElementById("last_sup_catheter_date_error");
                if (last_date_changed_error) last_date_changed_error.innerHTML = "Ngày thay gần nhất/ Fr, Date last changed is required";
            }

            

            if (errors.includes("other_hospital_error")) {
                let other_hospital_error = document.getElementById("other_hospital_error"); if (other_hospital_error) other_hospital_error.innerHTML = "Yêu cầu chuyển đến bệnh viện khác/ Requires referral to other hospital";
            }

            if (errors.includes("assess_date_time_error")) {
                let assess_date_time_error = document.getElementById("assess_date_time_error");
                if (assess_date_time_error) assess_date_time_error.innerHTML = "Ngày giờ/ Date & Time is required";
            }

            if (errors.includes("ind_catheter_error")) {
                let ind_catheter_error = document.getElementById("ind_catheter_error");
                if (ind_catheter_error) ind_catheter_error.innerHTML = "Ngày giờ/ Date & Time is required";
            }

            if (errors.includes("ind_catheter_date_error")) {
                let ind_catheter_date_error = document.getElementById("ind_catheter_date_error");
                if (ind_catheter_date_error) ind_catheter_date_error.innerHTML = "Ngày giờ/ Date & Time is required";
            }

            
        }
    </script>
</body>
</html>
