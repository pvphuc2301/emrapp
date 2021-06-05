<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObsGynIniAss.aspx.cs" Inherits="EMR.IPD.ObsGynIniAss" ValidateRequest="false" %>

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

        div[data-type=edit] .view{
            display: none !important;
        }

        div[data-type=view] .edit{
            display: none !important;
        }
    </style>
</head>
<body>
    <%--<div class="cssclsNoScreen">
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
    </div>--%>

    <div>
        <form method="post" action="#" id="form2" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />

            <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
            <asp:Panel runat="server" ID="messagePlaceHolder">
                <webUI:AmendReason runat="server" ID="txt_amendReason" />
            </asp:Panel>
            <div class="cssclsNoPrint">
                <webUI:PatientInfo runat="server" ID="PatientInfo1" />
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header bg-secondary cssclsNoPrint">
                            <h4 class="text-primary">OBSTETRIC & GYNECOLOGICAL INITIAL ASESMENT</h4>
                            <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                        </div>
                        <div class="card-body collapse show" id="collapseOne" data-type="view">
                            <table class="report-container">
                                <thead class="report-header cssclsNoScreen">
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
                                                <div class="form-body">
                                                    <!-- Chief complaint -->
                                                    <div class="row mb-2">
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 h4">I. Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                                            <asp:Label runat="server" ID="prt_reason_admission" Text="" />
                                                            <div class="form-group edit">
                                                                <webUI:TextField runat="server" id="txt_reason_admission" />
                                                            </div>

                                                            

                                                        </div>
                                                    </div>

                                                    <div class="row mb-2">
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 h4">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                                        </div>
                                                    </div>

                                                    <div class="row mb-2 view">
                                                        <div class="col-md-12">
                                                            <asp:Label runat="server" ID="prt_is_obs_gyn" />
                                                        </div>
                                                    </div>

                                                    <div class="row mb-2 edit">
                                                        <div class="col-md-12">
                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input type="radio" disabled-for="obstetrics" runat="server" id="rad_is_obs_gyn_true" name="rad_is_obs_gyn" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_is_obs_gyn_true">SẢN KHOA/ <span class="text-primary">OBSTETRICS</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input type="radio" disabled-for="gynecology_field" runat="server" id="rad_is_obs_gyn_false" name="rad_is_obs_gyn" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_is_obs_gyn_false">PHỤ KHOA/ <span class="text-primary">GYNECOLOGY</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_is_obs_gyn" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare24" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <fieldset class="row mb-2 gynecology_field">
                                                        <legend>
                                                            <label class="control-label">1. Bệnh sử hiện tại/ <span class="text-primary">Current medical history:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 mb-2">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_gyn_med_history" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-2 font-bold">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_gyn_cur_medication" />
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2 obstetrics">
                                                        <legend>
                                                            <label class="control-label mb-2 font-bold">1. Bệnh sử hiện tại/ <span class="text-primary">Current medical history:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1 w-5">Kinh chót/ <span class="text-primary">LMP:</span></label>
                                                            <div class="d-inline-block">
                                                                <label class="control-label mb-1 ml-2">từ/ <span class="text-primary">from:</span></label>
                                                                <asp:Label runat="server" CssClass="view" ID="lbl_lmp_from" Text="_" />
                                                                <div class="form-group d-inline-block w-5 ml-2 edit">
                                                                    <webUI:TextField runat="server" id="txt_lmp_from" />
                                                                </div>
                                                            </div>
                                                            <div class="d-inline-block">
                                                                <label class="control-label mb-1 ml-2">đến/ <span class="text-primary">to:</span></label>
                                                                <asp:Label runat="server" CssClass="view" ID="Label1" Text="_" />
                                                                <div class="form-group d-inline-block w-5 ml-2 edit">
                                                                    <webUI:TextField runat="server" id="txt_lmp_to" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1 w-5">Tuổi thai/ <span class="text-primary">Gestational age:</span></label>
                                                            <asp:Label runat="server" CssClass="view" ID="Label2" Text="_ ngày/ days" />
                                                            <asp:Label runat="server" CssClass="view" ID="Label3" Text="_ tuần/ weeks" />
                                                            <div class="form-group w-5 d-inline-block ml-2 edit">
                                                                <input runat="server" data-type="number" id="txt_ges_age_weeks" class="form-control text-right" />
                                                                <span class="append">tuần/ weeks</span>
                                                            </div>
                                                            <div class="form-group w-5 d-inline-block ml-2 edit">
                                                                <input runat="server" data-type="number" id="txt_ges_age_days" class="form-control text-right" />
                                                                <span class="append">ngày/ days</span>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1 w-5">Khám thai/ <span class="text-primary">Prenatal visit:</span></label>
                                                            <asp:Label runat="server" CssClass="view" ID="Label4" Text="_" />
                                                            <div class="form-group edit">
                                                                <webUI:TextField runat="server" ID="txt_prenatal_visit" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Chủng ngừa uốn ván/ <span class="text-primary">Tetanus vaccination:</span></label>
                                                            <div class="view">
                                                                <asp:Label runat="server" ID="prt_tetanus_vaccination_false" Text="❏ Chưa/ Not yet" />
                                                                <asp:Label runat="server" ID="prt_tetanus_vaccination_true" Text="❏ Có/yes, ………Lần/times" />
                                                            </div>
                                                            <div class="d-inline-block edit">
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_tetanus_vaccination_false" name="rad_tetanus_vaccination" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_tetanus_vaccination_false">Chưa/ <span class="text-primary">Not yet</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" disabled-for="tetanus_vaccin_time_field" id="rad_tetanus_vaccination_true" name="rad_tetanus_vaccination" class="custom-control-input" runat="server" />
                                                                    <label class="custom-control-label" for="rad_tetanus_vaccination_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_tetanus_vaccination" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare12" />
                                                                    </a>
                                                                </div>

                                                                <div class="form-group w-5 d-inline-block tetanus_vaccin_time_field ml-2">
                                                                    <input runat="server" id="txt_tetanus_vaccin_time" class="form-control text-right" />
                                                                    <span class="append">lần/ times</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1 d-block">Nhiễm Streptococcus nhóm B/ <span class="text-primary">GBS infection:</span></label>
                                                            <label class="control-label mb-1">Con trước nhiễm trùng huyết do Streptococcus nhóm B/ <span class="text-primary">Previous infant with invasive GBS disease</span></label>
                                                            <div class="view">
                                                                <asp:Label runat="server" ID="prt_gbs_disease_false" Text="❏ Không/ No" />
                                                                <asp:Label runat="server" ID="prt_gbs_disease_true" Text="❏ Có/ Yes" />
                                                            </div>
                                                            <div class="d-inline-block edit">
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_gbs_disease_false" name="rad_gbs_disease" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_gbs_disease_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_gbs_disease_true" name="rad_gbs_disease" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_gbs_disease_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_gbs_disease" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare1" />
                                                                    </a>
                                                                </div>
                                                            </div>

                                                            <label class="control-label mb-1">Nhiễm trùng tiểu do Streptococcus nhóm B trong thai kỳ lần này/ <span class="text-primary">GBS bacteriuria during any trimester of the current pregnancy</span></label>
                                                            <div class="view">
                                                                <asp:Label runat="server" ID="prt_gbs_bacteriuria_false" Text="❏ Không/ No" />
                                                                <asp:Label runat="server" ID="prt_gbs_bacteriuria_true" Text="❏ Có/ Yes" />
                                                            </div>
                                                            <div class="d-inline-block edit">
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_gbs_bacteriuria_false" name="rad_gbs_bacteriuria" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_gbs_bacteriuria_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_gbs_bacteriuria_true" name="rad_gbs_bacteriuria" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_gbs_bacteriuria_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_gbs_bacteriuria" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare2" />
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <label class="control-label mb-1">Cấy dịch âm đạo dương tính Streptococcus nhóm B trong tam cá nguyệt cuối thai kỳ lần này/ <span class="text-primary">Positive GBS vaginal-rectal screening culture in late gestation during current pregnancy</span></label>
                                                            <div class="view">
                                                                <asp:Label runat="server" ID="prt_gbs_vaginal_false" Text="❏ Không/ No" />
                                                                <asp:Label runat="server" ID="prt_gbs_vaginal_true" Text="❏ Có/ Yes" />
                                                            </div>
                                                            <div class="d-inline-block edit">
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_gbs_vaginal_false" name="rad_gbs_vaginal" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_gbs_vaginal_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_gbs_vaginal_true" name="rad_gbs_vaginal" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_gbs_vaginal_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_gbs_vaginal" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare3" />
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Đái tháo đường thai kỳ/ <span class="text-primary">Gestational Diabetes:</span></label>
                                                            <div class="view">
                                                                <asp:Label runat="server" ID="prt_ges_diabetes_false" Text="❏ Không/ No" />
                                                                <asp:Label runat="server" ID="prt_ges_diabetes_true" Text="❏ Có/ Yes" />
                                                            </div>
                                                            <div class="d-inline-block edit">
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_ges_diabetes_false" name="rad_ges_diabetes" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_ges_diabetes_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_ges_diabetes_true" name="rad_ges_diabetes" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_ges_diabetes_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_ges_diabetes" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare6" />
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Bất thường khác trong thai kỳ/ <span class="text-primary">Other gestational abnormalities:</span></label>
                                                            <div class="view">
                                                                <asp:Label runat="server" ID="prt_other_ges_abnormal_true" Text="❏ Không/ No" />
                                                                <asp:Label runat="server" ID="prt_other_ges_abnormal_false" Text="❏ Có/ Yes" />
                                                            </div>
                                                            <div class="d-inline-block edit">
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_other_ges_abnormal_false" name="rad_other_ges_abnormal" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_other_ges_abnormal_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input disabled-for="other_ges_abnormal_note_field" runat="server" type="radio" id="rad_other_ges_abnormal_true" name="rad_other_ges_abnormal" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_other_ges_abnormal_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_cough" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare4" />
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="form-group other_ges_abnormal_note_field ml-2">
                                                                <webUI:TextField runat="server" ID="txt_other_ges_abnormal_note" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Chuyển dạ khởi phát lúc/ <span class="text-primary">Labor triggered at:</span></label>
                                                            <asp:Label CssClass="view" runat="server" ID="lbl_labor_trig_at_time" />
                                                            <telerik:RadDateTimePicker runat="server" ID="dtpk_labor_trig_at_time" Width="200px" CssClass="ml-2 edit" />
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Dấu hiệu ban đầu/ <span class="text-primary">Preliminary signs:</span></label>
                                                            <asp:Label CssClass="view" runat="server" ID="prt_preliminary_signs" />
                                                            <div class="form-group ml-2 edit">
                                                                <webUI:TextField runat="server" ID="txt_preliminary_signs" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Diễn tiến/ <span class="text-primary">Progression:</span></label>
                                                            <asp:Label CssClass="view" runat="server" ID="prt_progression" />
                                                            <div class="form-group ml-2 edit">
                                                                <webUI:TextField runat="server" ID="txt_progression" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                            <asp:Label CssClass="view" runat="server" ID="prt_obs_cur_medication" />
                                                            <div class="form-group ml-2 edit">
                                                                <webUI:TextField runat="server" ID="txt_obs_cur_medication" />
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label font-bold">2. Tiền sử bệnh/ <span class="text-primary">Antecedent medical history:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Bản thân/ <span class="text-primary">Personal</span></label>
                                                            <asp:Label CssClass="view" runat="server" ID="prt_personal" />
                                                            <div class="form-group edit">
                                                                <webUI:TextField runat="server" ID="txt_personal" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family</span></label>
                                                            <asp:Label CssClass="view" runat="server" ID="prt_family" />
                                                            <div class="form-group edit">
                                                                <webUI:TextField runat="server" ID="txt_family" />
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label font-bold">3. Tiền căn phụ khoa/ <span class="text-primary">Gynecological history:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="row edit">
                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Tuổi dậy thì/ <span class="text-primary">Age of menarche</span></label>
                                                                    <div class="form-group d-inline-block w-4 edit">
                                                                        <webUI:TextField runat="server" ID="txt_age_of_menarhce" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Chu kỳ kinh/ <span class="text-primary">Menstrual cycle</span></label>
                                                                    <div class="form-group w-5 d-inline-block edit">
                                                                        <input runat="server" data-type="number" id="txt_menstrual_cycle" class="form-control text-right" />
                                                                        <span class="append">ngày/ days</span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Số ngày hành kinh/ <span class="text-primary">Length of period</span></label>
                                                                    <div class="form-group w-5 d-inline-block edit">
                                                                        <input runat="server" id="txt_length_of_period" class="form-control text-right" />
                                                                        <span class="append">ngày/ days</span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Lượng máu kinh/ <span class="text-primary">Amount of menstrual blood</span></label>
                                                                    <div class="form-group w-4 d-inline-block edit">
                                                                        <input runat="server" id="txt_amount_mens_blood" class="form-control text-right" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Tuổi kết hôn/ <span class="text-primary">Marriage age</span></label>
                                                                    <div class="form-group w-4 d-inline-block edit">
                                                                        <input runat="server" data-type="number" id="txt_marriage_age" class="form-control text-right" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Tuổi mãn kinh/ <span class="text-primary">Age of menopause</span></label>
                                                                    <div class="form-group w-4 d-inline-block edit">
                                                                        <input runat="server" id="txt_age_menopause" class="form-control text-right" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Những bệnh phụ khoa đã mắc trước đây/ <span class="text-primary">Previous gynecological diseases</span></label>
                                                                    <div class="form-group edit">
                                                                        <webUI:TextField runat="server" ID="txt_previous_gyn_diseases" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row view">
                                                                <div class="col-md-12 mb-2">
                                                                    <div runat="server" id="prt_age_of_menarche"></div>
                                                                    <div runat="server" id="prt_marriage_age"></div>
                                                                    <div runat="server" id="prt_age_menopause"></div>
                                                                    <div runat="server" id="prt_previous_gyn_diseases"></div>
                                                                    <%--<asp:Panel CssClass="view" runat="server" ID="prt_age_of_menarche"></asp:Panel>
                                                                    <asp:Panel CssClass="view" runat="server" ID="prt_marriage_age" ></asp:Panel>
                                                                    <asp:Panel CssClass="view" runat="server" ID="prt_age_menopause" ></asp:Panel>
                                                                    <asp:Panel CssClass="view" runat="server" ID="prt_previous_gyn_diseases" ></asp:Panel>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label font-bold">4. Tiền căn sản khoa/ <span class="text-primary">Obstetric history:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Những bệnh phụ khoa đã mắc trước đây/ <span class="text-primary">Previous gynecological diseases</span></label>

                                                            <asp:UpdatePanel ID="updatePanel_obs_history" runat="server" UpdateMode="Always">
                                                                <ContentTemplate>
                                                                    <asp:GridView
                                                                        ShowHeaderWhenEmpty="true"
                                                                        ID="grid_obs_history"
                                                                        runat="server"
                                                                        CssClass="tb-responsive table-bordered"
                                                                        AutoGenerateColumns="false">
                                                                        <Columns>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div class="w-s pt-2 pb-2">
                                                                                        Lần mang thai thứ/ <span class="text-primary">gravidity</span>
                                                                                    </div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("label") %>' DataKey="label" runat="server" Disabled="true" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 80px">1</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_1") %>' DataKey="grav_1" runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 80px">2</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_2") %>' DataKey="grav_2" runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 80px">3</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_3") %>' DataKey="grav_3" runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 80px">4</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_4") %>' DataKey="grav_4" runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 80px">5</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_5") %>' DataKey="grav_5" runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 80px">6</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_6") %>' DataKey="grav_6" runat="server" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>

                                                                        </Columns>

                                                                    </asp:GridView>
                                                                    <asp:UpdateProgress ID="updateProgress_obs_history" runat="server" AssociatedUpdatePanelID="updatePanel_obs_history">
                                                                        <ProgressTemplate>
                                                                            Please wait....
                                                                        </ProgressTemplate>
                                                                    </asp:UpdateProgress>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>

                                                            <%--<div class="table-responsive">
                                                                <table class="table table-bordered">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2" style="width: 210px">Lần mang thai thứ/ <span class="text-primary">gravidity</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">1</label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="w-5">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">2</label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="w-5">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">3</label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="w-5">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">4</label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="w-5">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">5</label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="w-5">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">6</label>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Năm/ <span class="text-primary">Year</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control w-5" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control w-5" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control w-5" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control w-5" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control w-5" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control w-5" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Sanh đủ tháng/ <span class="text-primary">term delivery</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Sanh non tháng/ <span class="text-primary">preterm delivery</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Sảy thai/ <span class="text-primary">miscarriage</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Hút thai/ <span class="text-primary">aspiration abortion</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Nạo thai/ <span class="text-primary">dilation and evacuation</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Thủ thuật Kovac/ <span class="text-primary">Kovac’s procedure</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Thai ngoài tử cung/ <span class="text-primary">ectopic</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Thai trứng/ <span class="text-primary">molar pregnancy</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Thai lưu/ <span class="text-primary">stillbirth</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Sinh sống/ <span class="text-primary">living child</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Cân nặng/ <span class="text-primary">weight</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Phương pháp sinh/ <span class="text-primary">delivery mode</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <label class="control-label mb-2">Biến chứng/ <span class="text-primary">complication</span></label>
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                            <td class="pl-1 pr-1">
                                                                                <div class="form-group p-0 m-0 border-0">
                                                                                    <input type="text" placeholder="" class="form-control" />
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>--%>
                                                        </div>
                                                    </fieldset>


                                                    <div class="row mb-2">
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 h4">III. Khám lâm sàng/ <span class="text-primary">Physical examination:</span></label>
                                                        </div>
                                                    </div>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">1. Khám tổng quát/ <span class="text-primary">General exam:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 edit">
                                                            <div class="row">
                                                                <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Tổng trạng/<span class="text-primary">General appearance</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_general_appearance" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Phù/ <span class="text-primary">Edema</span></label>
                                                            <label class="custom-control custom-checkbox d-inline-block ml-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_edema_true" />
                                                                <span class="custom-control-label"></span>
                                                            </label>
                                                            <div class="form-group d-inline-block w-n">
                                                                <webUI:TextField runat="server" ID="txt_edema_note" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ tim mạch/ <span class="text-primary">Cardiovascular system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_cardio_system" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ hô hấp/ <span class="text-primary">Respiratory system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_respiratory_system" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ tiêu hóa/<span class="text-primary">Digestive system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_digestive_system" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ thần kinh/<span class="text-primary">Nervous system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_nervous_system" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ niệu-dục/  <span class="text-primary">Urogenital system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_uro_system" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ cơ-xương-khớp/  <span class="text-primary">Musculoskeletal system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_mus_system" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Tai Mũi Họng/<span class="text-primary">Otorhinolaryngology</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_otorhinolaryngology" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ da-lông/ <span class="text-primary">Integumentary system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_integumentary_system" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Mắt/ <span class="text-primary">Ophthalmology</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_ophthalmology" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Ghi nhận khác/ <span class="text-primary">Other findings</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_other_findings" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological consultation required</span></label>
                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input type="radio" runat="server" id="rad_psy_consul_required_true" name="rad_psy_consul_required" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_psy_consul_required_true">Có/ <span class="text-primary">Yes</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input type="radio" runat="server" id="rad_psy_consul_required_false" name="rad_psy_consul_required" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_psy_consul_required_false">Không/ <span class="text-primary">No</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_psy_consul_required" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare17" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 view">
                                                            <div class="row">
                                                                <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Tổng trạng/<span class="text-primary">General appearance</span></label>
                                                                <div runat="server" id="prt_general_appearance"></div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Phù/ <span class="text-primary">Edema: </span></label>
                                                            <div runat="server" id="prt_edema_false"></div>
                                                            <div runat="server" id="prt_edema_true"></div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">• Hệ tim mạch/ Cardiovascular syste<span class="text-primary">Cardiovascular system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="TextField3" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ hô hấp/ <span class="text-primary">Respiratory system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="TextField4" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ tiêu hóa/<span class="text-primary">Digestive system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="TextField5" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ thần kinh/<span class="text-primary">Nervous system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="TextField6" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ niệu-dục/  <span class="text-primary">Urogenital system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="TextField7" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ cơ-xương-khớp/  <span class="text-primary">Musculoskeletal system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="TextField8" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Tai Mũi Họng/<span class="text-primary">Otorhinolaryngology</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="TextField9" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Hệ da-lông/ <span class="text-primary">Integumentary system</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="TextField10" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Mắt/ <span class="text-primary">Ophthalmology</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="TextField11" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Ghi nhận khác/ <span class="text-primary">Other findings</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="TextField12" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological consultation required</span></label>
                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input type="radio" runat="server" id="Radio1" name="rad_psy_consul_required" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_psy_consul_required_true">Có/ <span class="text-primary">Yes</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input type="radio" runat="server" id="Radio2" name="rad_psy_consul_required" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_psy_consul_required_false">Không/ <span class="text-primary">No</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_psy_consul_required" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare7" />
                                                                </a>
                                                            </div>
                                                        </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">2. Khám chuyên khoa/ <span class="text-primary">Specific exam:</span></label>
                                                        </legend>

                                                        <div class="col-md-12 mb-2 obstetrics">
                                                            <fieldset class="row mb-2">
                                                                <legend>
                                                                    <label class="control-label">Khám ngoài/ <span class="text-primary">External exam:</span></label>
                                                                </legend>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Vết mổ cũ/ <span class="text-primary">Previous cicatrice</span></label>
                                                                    <label class="custom-control custom-checkbox d-inline-block ml-2">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_obs_pre_cicatrice_true" />
                                                                        <span class="custom-control-label"></span>
                                                                    </label>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Hình dáng tử cung/ <span class="text-primary">Uterine shape</span></label>
                                                                    <div class="form-group">
                                                                        <webUI:TextField runat="server" ID="txt_obs_uterine_shape" />
                                                                    </div>
                                                                    <label class="control-label mb-1">Tư thế/ <span class="text-primary">Posture</span></label>
                                                                    <div class="form-group">
                                                                        <webUI:TextField runat="server" ID="txt_obs_posture" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Bề cao tử cung/ <span class="text-primary">Fundal height</span></label>
                                                                    <div class="form-group w-4 d-inline-block">
                                                                        <input runat="server" id="txt_obs_fundal_height" class="form-control text-right" />
                                                                        <span class="append">cm</span>
                                                                    </div>
                                                                    <label class="control-label mb-1">chu vi vòng bụng/ <span class="text-primary">abdominal circumference</span></label>
                                                                    <div class="form-group w-4 d-inline-block">
                                                                        <input runat="server" id="txt_obs_abdominal_circum" class="form-control text-right" />
                                                                        <span class="append">cm</span>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Cơn gò tử cung/ <span class="text-primary">Uterine contraction</span></label>
                                                                    <div class="form-group">
                                                                        <webUI:TextField runat="server" ID="txt_obs_uterine_con" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Tần số tim thai/ <span class="text-primary">Fetal heart rate</span></label>
                                                                    <div class="form-group w-5 d-inline-block">
                                                                        <input runat="server" id="txt_obs_fetal_heart_rate" class="form-control text-right" />
                                                                        <span class="append">lần/phút/ bpm</span>
                                                                    </div>
                                                                    <label class="control-label mb-1">Ngực/ <span class="text-primary">Breasts</span></label>
                                                                    <div class="form-group">
                                                                        <webUI:TextField runat="server" ID="txt_obs_breasts" />
                                                                    </div>
                                                                </div>

                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gynecology_field">
                                                            <fieldset class="row mb-2">
                                                                <legend>
                                                                    <label class="control-label font-bold">Khám ngoài/ <span class="text-primary">External exam:</span></label>
                                                                </legend>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Bụng có sẹo phẫu thuật cũ/ <span class="text-primary">Abdominal Surgery Scars</span></label>
                                                                    <label class="custom-control custom-checkbox d-inline-block ml-2">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_gyn_abdo_sur_scars_true" />
                                                                        <span class="custom-control-label"></span>
                                                                    </label>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Lý do/ <span class="text-primary">Reason</span></label>
                                                                    <div class="form-group">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_reason" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Sờ nắn và đo ngoài tử cung/ <span class="text-primary">Uterine Height</span></label>
                                                                    <div class="form-group">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_uterine_height" />
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2 obstetrics">
                                                            <fieldset class="row mb-2">
                                                                <legend>
                                                                    <label class="control-label font-bold">Khám trong/ <span class="text-primary">Internal exam:</span></label>
                                                                </legend>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Âm hộ/ <span class="text-primary">Vulva</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_obs_vulva" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Âm đạo/ <span class="text-primary">Vagina</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_obs_vagina" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Tầng sinh môn/ <span class="text-primary">Perineum</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_obs_perineum" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Cổ tử cung/ <span class="text-primary">Cervix</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_obs_cervix" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Phần phụ/ <span class="text-primary">Adnexa</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_obs_adnexa" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Tình trạng ối/ <span class="text-primary">Membrane condition</span></label>
                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_obs_mem_condition_code_in" name="rad_obs_mem_condition_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_obs_mem_condition_code_in">Nguyên vẹn/ <span class="text-primary">Intact</span></label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_obs_mem_condition_code_ru" name="rad_obs_mem_condition_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_obs_mem_condition_code_ru">Đã vỡ/ <span class="text-primary">Ruptured</span></label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Đặc điểm dịch ối/ <span class="text-primary">Features of amniotic fluid</span></label>
                                                                    <label class="custom-control custom-checkbox d-inline-block ml-2">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_obs_feat_amniotic_n" />
                                                                        <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox d-inline-block ml-2">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_obs_feat_amniotic_o" />
                                                                        <span class="custom-control-label">Thiểu ối/ <span class="text-primary">Oligohydramnios</span></span>
                                                                    </label>
                                                                    <label class="custom-control custom-checkbox d-inline-block ml-2">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_obs_feat_amniotic_p" />
                                                                        <span class="custom-control-label">Đa ối/ <span class="text-primary">Polyhydramnios</span></span>
                                                                    </label>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Màu sắc nước ối/ <span class="text-primary">Color of amniotic fluid</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_obs_color_amniotic" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Ngôi thai/ <span class="text-primary">Presentation</span></label>
                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_obs_presentation_code_c" name="rad_obs_presentation_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_obs_presentation_code_c">Đầu/ <span class="text-primary">Cephalic</span></label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_obs_presentation_code_b" name="rad_obs_presentation_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_obs_presentation_code_b">Mông/ <span class="text-primary">Breech</span></label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_obs_presentation_code_o" disabled-for="obs_presentation_other_field" name="rad_obs_presentation_code" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_obs_presentation_code_o">Ngôi khác/ <span class="text-primary">Others, specify</span></label>
                                                                        <a href="javascript:void(0)" data-clear="rad_obs_presentation_code" onclick="clear_radiobutton(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare5" />
                                                                        </a>
                                                                    </div>
                                                                    <div class="form-group obs_presentation_other_field d-inline-block ml-2 w-n">
                                                                        <webUI:TextField runat="server" ID="txt_obs_presentation_other" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Vị trí ngôi thai/ <span class="text-primary">Fetal position</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_obs_fetal_position" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Khám khung chậu/ <span class="text-primary">Pelvic exam</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_obs_pelvic_exam" />
                                                                    </div>
                                                                </div>


                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Chỉ số Bishop/ <span class="text-primary">Bishop score</span></label>
                                                                    <div class="form-group w-5 d-inline-block">
                                                                        <input runat="server" id="txt_obs_bishop_score" class="form-control text-right" />
                                                                        <span class="append">điểm/ points</span>
                                                                    </div>
                                                                </div>

                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gynecology_field">
                                                            <fieldset class="row mb-2">
                                                                <legend>
                                                                    <label class="control-label font-bold">Khám trong/ <span class="text-primary">Internal exam:</span></label>
                                                                </legend>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Âm hộ/ <span class="text-primary">Vulva</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_vulva" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Tầng sinh môn/ <span class="text-primary">Perineum</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_perineum" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Khám mỏ vịt/ <span class="text-primary">Speculum examination</span></label>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Âm đạo/ <span class="text-primary">Vagina</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_vagina" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Dịch tiết/ <span class="text-primary">Discharge</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_discharge" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Cổ tử cung/ <span class="text-primary">Cervix</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_cervix" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Phần phụ/ <span class="text-primary">Adnexa</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_adnexa" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Các túi cùng/ <span class="text-primary">Douglas pouchs</span></label>
                                                                    <div class="form-group d-inline-block w-n ml-2">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_douglas_pouchs" />
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </fieldset>

                                                    <div class="row mb-2">
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 font-bold">IV. Laboratory indications and results/ <span class="text-primary">Chỉ định và kết quả xét nghiệm:</span></label>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_lab_result" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 font-bold">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_add_investigations" />
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="row mb-2">
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 font-bold">V. Conclusion/ <span class="text-primary">Kết luận:</span></label>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 font-bold">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 font-bold">Chẩn đoán xác định/ <span class="text-primary">Diagnosis</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_diagnosis" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 font-bold">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_diff_diagnosis" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 font-bold">Bệnh kèm theo/ <span class="text-primary">Associated conditions</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 font-bold">Kế hoạch điều trị/ <span class="text-primary">Treatment plan</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_treatment_plan" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 font-bold">Kế hoạch xuất viện/ <span class="text-primary">Discharge Plan</span></label>
                                                            <div class="form-group">
                                                                <webUI:TextField runat="server" ID="txt_discharge_plan" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <fieldset class="row mb-2">
                                                        <div class="col-md-12">
                                                            <div class="form-actions">
                                                                <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />
                                                                <asp:Button ID="btnSave" class="btn btn-primary" runat="server" OnClick="btnSave_Click" Text="Save" />
                                                                <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                                <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                                <asp:Button ID="btnPrint" OnClientClick="window.print()" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                                                <asp:Button OnClick="btnCancel_Click" ID="btnCancel" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
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
                                        </td>
                                    </tr>
                                </tbody>

                                <tfoot class="report-footer cssclsNoScreen">
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
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
    <script src="../scripts/checkValidFields.js"></script>

</body>
</html>
