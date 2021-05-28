<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InpIniNurAss.aspx.cs" Inherits="EMR.InpatientInitialNursingAssessment" %>





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
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />

</head>
<body>


    <div class="cssclsNoPrint">
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    

    <form method="post" action="#" id="form2" runat="server" >
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <webUI:AmendReason runat="server" ID="txt_amendReason" />
                    <webUI:PatientInfo runat="server" ID="PatientInfo1" />
                    <div class="row" style="margin-bottom: 50px;">
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
                                                A. THÔNG TIN TỔNG QUÁT VỀ NGƯỜI BỆNH/ <span class="text-primary">GENERAL PATIENT INFORMATION</span>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Quốc gia cư trú/ <span class="text-primary">Country of residence:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex;">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_residence_code_vnm" name="rad_residence_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_residence_code_vnm">Việt Nam</label>
                                                </div>
                                                <div class="custom-control custom-radio mb-1 ml-2">
                                                    <input disabled-for="residence_other_field" type="radio" runat="server" id="rad_residence_code_oth" name="rad_residence_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_residence_code_oth">Khác</label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_residence_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare2" />
                                                    </a>
                                                </div>
                                                <div class="form-group ml-2 flex-grow-1 residence_other_field">
                                                    <webUI:TextField runat="server" ID="txt_residence_other" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Ngôn ngữ/ <span class="text-primary">Language:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex;">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_language_code_vi" name="rad_language_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_language_code_vi">Tiếng Việt</label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2">
                                                    <input type="radio" runat="server" id="rad_language_code_en" name="rad_language_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_language_code_en">Tiếng Anh</label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input disabled-for="language_other_field" type="radio" runat="server" id="rad_language_code_oth" name="rad_language_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_language_code_oth">Tiếng khác</label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_language_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare4" />
                                                    </a>
                                                </div>
                                                <div class="form-group flex-grow-1 ml-2 language_other_field">
                                                    <webUI:TextField runat="server" ID="txt_language_other" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Cần phiên dịch/ <span class="text-primary">Requires Interpreter:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_req_interpreter1" name="rad_req_interpreter" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_req_interpreter1">Có/ <span class="text-primary">Yes</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_req_interpreter2" name="rad_req_interpreter" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_req_interpreter2">Không/ <span class="text-primary">No</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_req_interpreter" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare5" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Tôn giáo/ <span class="text-primary">Religion:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_religion_code_bh" name="rad_religion_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_religion_code_bh">Phật giáo/ <span class="text-primary">Buddhism</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2">
                                                    <input type="radio" runat="server" id="rad_religion_code_ch" name="rad_religion_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_religion_code_ch">Thiên chúa giáo</label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input disabled-for="religion_other_field" type="radio" runat="server" id="rad_religion_code_oth" name="rad_religion_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_religion_code_oth">Khác</label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_religion_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare6" />
                                                    </a>
                                                </div>

                                                <div class="form-group flex-grow-1 ml-2 religion_other_field">
                                                    <webUI:TextField runat="server" ID="TextField3" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Nhu cầu tín ngưỡng/ <span class="text-primary">Spiritual counselling:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_spiritual_couns1" name="rad_spiritual_couns" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spiritual_couns1">Có/ <span class="text-primary">Yes</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_spiritual_couns2" name="rad_spiritual_couns" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spiritual_couns2">Không/ <span class="text-primary">No</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_spiritual_couns" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare7" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Nghề nghiệp/ <span class="text-primary">Occupation:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Hoàn cảnh sống/ <span class="text-primary">Living Status:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_living_status_code_aln" name="rad_living_status_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_living_status_code_aln">Một mình/ <span class="text-primary">Alone</span></label>
                                                </div>

                                                <div class="custom-control ml-2 custom-radio">
                                                    <input type="radio" runat="server" id="rad_living_status_code_wth" name="rad_living_status_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_living_status_code_wth">Với vợ, chồng, con, anh, chị, em ruột/ <span class="text-primary">With spouse, children, sibling</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input disabled-for="living_status_note_field" type="radio" runat="server" id="rad_living_status_code_oth" name="rad_living_status_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_living_status_code_oth">Khác</label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_living_status_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare8" />
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group living_status_note_field">
                                                    <webUI:TextField runat="server" ID="txt_living_status_note" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Mối quan tâm khi nằm viện/ <span class="text-primary">Concerns related to hospitalization:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_hospital_concern_code_non" name="rad_hospital_concern_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_hospital_concern_code_non">Không/ <span class="text-primary">None</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_hospital_concern_code_rel" name="rad_hospital_concern_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_hospital_concern_code_rel">Gia đình, các mối quan hệ/ <span class="text-primary">Family, relationship issues</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_hospital_concern_code_fin" name="rad_hospital_concern_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_hospital_concern_code_fin">Tài chính/ <span class="text-primary">Financial</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_hospital_concern_code_wor" name="rad_hospital_concern_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_hospital_concern_code_wor">Lo âu/ <span class="text-primary">Worriedness</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input disabled-for="hospital_concern_other_field" type="radio" runat="server" id="rad_hospital_concern_code_oth" name="rad_hospital_concern_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_hospital_concern_code_oth">Khác/ <span class="text-primary">Others</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_hospital_concern_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare13" />
                                                    </a>
                                                </div>

                                            </div>

                                            <div class="col-md-12">

                                                <div class="form-group hospital_concern_other_field">
                                                    <webUI:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Người đi cùng/ <span class="text-primary">Accompanied by:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="TextField8" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Quan hệ/ <span class="text-primary">Relationship:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="TextField9" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <h4>B. BỆNH SỬ/ <span class="text-primary">MEDICAL HISTORY</span></h4>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Bệnh nhân nhập viện từ/ <span class="text-primary">Patient admitted from:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_admit_from_code_opd" name="rad_admit_from_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_admit_from_code_opd">Khoa khám bệnh/ <span class="text-primary">OPD</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2">
                                                    <input type="radio" runat="server" id="rad_admit_from_code_er" name="rad_admit_from_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_admit_from_code_er">Khoa cấp cứu/ <span class="text-primary">ER</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2">
                                                    <input type="radio" runat="server" id="rad_admit_from_code_vd" name="rad_admit_from_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_admit_from_code_vd">Bác sĩ hơp tác/ <span class="text-primary">Visiting Doctor</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2">
                                                    <input type="radio" runat="server" id="rad_admit_from_code_oth" disabled-for="admit_from_desc_field" name="rad_admit_from_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_admit_from_code_oth">Khác/ <span class="text-primary">Referral</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_admit_from_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare9" />
                                                    </a>
                                                </div>

                                            </div>

                                            <div class="col-md-12">

                                                <div class="form-group admit_from_desc_field">
                                                    <webUI:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>



                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Tình trang khi đến</label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_code_w" />
                                                    <span class="custom-control-label">Tự đi được/ <span class="text-primary">Walking</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_code_s" />
                                                    <span class="custom-control-label">Bằng băng ca/ <span class="text-primary">Stretcher</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_arrived_code_wc" />
                                                    <span class="custom-control-label">Bằng xe lăn/ <span class="text-primary">Wheelchair</span></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Lần nhập viện trước tại bệnh viện Quốc tế Mỹ</label>
                                                <label />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Tiền sử bệnh/ <span class="text-primary">Past medical history:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_past_med_history1" name="rad_past_med_history" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_past_med_history1">Có/ <span class="text-primary">Yes</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_past_med_history2" disabled-for="past_med_history_note_field" name="rad_past_med_history" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_past_med_history2">Không/ <span class="text-primary">No</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_past_med_history" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare10" />
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group past_med_history_note_field">
                                                    <webUI:TextField runat="server" ID="TextField1" />
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Tiền sử phẫu thuật/ <span class="text-primary">Past Surgical History:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_past_sur_history1" name="rad_past_sur_history" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_past_sur_history1">Có/ <span class="text-primary">Yes</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_past_sur_history2" disabled-for="past_sur_history_note_field" name="rad_past_sur_history" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_past_sur_history2">Không/ <span class="text-primary">No</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_past_sur_history" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare11" />
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group past_sur_history_note_field">
                                                    <webUI:TextField runat="server" ID="TextField2" />
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Lạm dụng chất kích thích/ <span class="text-primary">Substance abuse</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_substance_abuse_s" />
                                                    <span class="custom-control-label">Hút thuốc/ <span class="text-primary">Smoking</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_substance_abuse_a" />
                                                    <span class="custom-control-label">Rượu bia/ <span class="text-primary">Acohol</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" disabled-for="substance_abuse_other_field" class="custom-control-input" runat="server" id="cb_substance_abuse_oth" />
                                                    <span class="custom-control-label">Khác/ <span class="text-primary">Other</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group substance_abuse_other_field">
                                                    <webUI:TextField runat="server" ID="TextField5" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Hồ sơ bệnh án kèm theo/ <span class="text-primary">Previous test results/documents:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_previous_document1" name="rad_previous_document" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_previous_document1">Không/ <span class="text-primary">No</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_previous_document2" disabled-for="previous_document_note_field" name="rad_previous_document" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_previous_document2">Yes/ <span class="text-primary">Có</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_previous_document" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare14" />
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group previous_document_note_field">
                                                    <webUI:TextField runat="server" ID="TextField6" />
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Thuốc hiện đang dùng tại nhà/ <span class="text-primary">Current home medication:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_cur_home_medication1" name="rad_cur_home_medication" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_cur_home_medication1">Không/ <span class="text-primary">No</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_cur_home_medication2" name="rad_cur_home_medication" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_cur_home_medication2">Có/ Yes (Tham khảo đơn thuốc đính kèm)/ <span class="text-primary">If, yes please refer to the prescription attached</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_cur_home_medication" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare15" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Dị ứng/ Phản ứng / <span class="text-primary">Allergy/ Reaction:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_allergy1" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy1">Không/ <span class="text-primary">No</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_allergy2" disabled-for="allergy_note_field" name="rad_allergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_allergy2">Có (ghi rõ)/ <span class="text-primary">Yes (specify)</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare16" />
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group allergy_note_field">
                                                    <webUI:TextField runat="server" ID="TextField7" />
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

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">1. Dấu hiệu sinh tồn và các chỉ số đo lường/ <span class="text-primary">vital signs and standard measurements</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                <div class="form-group w-4">
                                                    <input runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                    <span class="append">°C</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Mạch/ <span class="text-primary">Heart Rate:</span></label>
                                                <div class="form-group w-5">
                                                    <input runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1 ">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                <div class="form-group w-4">
                                                    <input runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                    <span class="append">Kg</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                <div class="form-group w-5">
                                                    <input runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                    <span class="append">/phút (m)</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1 ">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                <div class="form-group w-4">
                                                    <input maxlength="3" id="txt_vs_height" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label class="control-label w-6 mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                <div class="form-group w-5">
                                                    <input id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                    <span class="append">mmHg</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2">
                                                <div class="d-flex no-block">
                                                    <label for="bmi" class="control-label w-6 mb-1">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                    <div class="form-group w-5">
                                                        <input runat="server" id="txt_vs_BMI" class="form-control text-right" disabled="disabled" />
                                                        <span class="append">(Kg/m <sup>2</sup>)</span>
                                                    </div>
                                                </div>
                                                <p class="mt-1">
                                                    (Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
applicable for children and pregnant</span>)
                                                </p>
                                            </div>

                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label for="spO2" class="control-label w-6 mb-1">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                <div class="form-group w-4">
                                                    <input runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                    <span class="append">%</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6 mb-2 d-flex no-block">
                                                <label for="head-circumference" class="control-label w-6 mb-1">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                <div class="form-group w-4">
                                                    <input runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">2. Hệ hô hấp/ <span class="text-primary">Respiratory system</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_n" />
                                                    <span class="custom-control-label">Không có vấn đề/ <span class="text-primary">Normal</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_d" />
                                                    <span class="custom-control-label">Khó thở/ <span class="text-primary">Dyspnea</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_o" />
                                                    <span class="custom-control-label">Khó thở nằm/ <span class="text-primary">Orthopnea</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_w" />
                                                    <span class="custom-control-label">Khó thở khò khè/ <span class="text-primary">Wheeze</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_respiratory_system_c" />
                                                    <span class="custom-control-label">Da xanh tái/ <span class="text-primary">Cyanosis</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Ho/ <span class="text-primary">Cough:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_cough1" name="rad_cough" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_cough1">Không/ <span class="text-primary">No</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_cough2" name="rad_cough" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_cough2">Có/ <span class="text-primary">Yes</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_cough" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare12" />
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_pro_cough_note1" name="rad_pro_cough_note" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_pro_cough_note1">Không có đờm/ <span class="text-primary">Unproductive cough</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_pro_cough_note2" name="rad_pro_cough_note" class="custom-control-input" disabled-for="pro_cough_note_field" />
                                                    <label class="custom-control-label" for="rad_pro_cough_note2">Có đờm (ghi rõ màu/ tính chất/ số lượng)/ <span class="text-primary">Productive (Specify color/ nature/ amount)</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_pro_cough_note" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare17" />
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="form-group pro_cough_note_field">
                                                    <webUI:TextField runat="server" ID="TextField4" />
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">3. Hệ tim mạch/ <span class="text-primary">Cardiovascular system</span></label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Mạch/ <span class="text-primary">Pulse:</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_pulse_code_r" name="rad_pulse_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_pulse_code_r">Đều/ <span class="text-primary">Regular</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1">
                                                    <input type="radio" runat="server" id="rad_pulse_code_i" name="rad_pulse_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_pulse_code_i">Không đều/ <span class="text-primary">Irregular</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_pulse_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare18" />
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Tình trạng hiện có/ <span class="text-primary">Presence with</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_cp" />
                                                    <span class="custom-control-label">Đau ngực/ <span class="text-primary">Chest pain</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_di" />
                                                    <span class="custom-control-label">Chóng mặt/ <span class="text-primary">Dizzinness</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_ca" />
                                                    <span class="custom-control-label">Đau bắp chân/ <span class="text-primary">Calf pain</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_presence_pe" />
                                                    <span class="custom-control-label">Phù ngoại biên/  <span class="text-primary">Peripheral edema</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Tứ chi/ <span class="text-primary">Extremities</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_wa" />
                                                    <span class="custom-control-label">Ấm/ <span class="text-primary">Warm</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_co" />
                                                    <span class="custom-control-label">Lạnh/ <span class="text-primary">Cold</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_cl" />
                                                    <span class="custom-control-label">Ẩm ướt/ <span class="text-primary">Clammy</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_extremities_cy" />
                                                    <span class="custom-control-label">Xanh tái/ <span class="text-primary">Cyanosed</span></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">4. Hệ thần kinh cảm giác/ <span class="text-primary">Neurosensory system</span></label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Định hướng được/ <span class="text-primary">Oriented</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_day" />
                                                    <span class="custom-control-label">Ngày/ <span class="text-primary">Day</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_time" />
                                                    <span class="custom-control-label">Thời gian/ <span class="text-primary">Time</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_per" />
                                                    <span class="custom-control-label">Người/ <span class="text-primary">Person</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_pla" />
                                                    <span class="custom-control-label">Nơi/ <span class="text-primary">Place</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_oriented_na" />
                                                    <span class="custom-control-label">Không định hướng được/ <span class="text-primary">Not all all</span></span>
                                                </label>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Tình trạng tinh thần/ <span class="text-primary">Mental status</span></label>
                                            </div>

                                            <div class="col-md-12" style="display: flex">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_al" />
                                                    <span class="custom-control-label">Tỉnh táo/ <span class="text-primary">Alert</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_cf" />
                                                    <span class="custom-control-label">Nhầm lẫn/ <span class="text-primary">Confused</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_ag" />
                                                    <span class="custom-control-label">Kích động/ <span class="text-primary">Agitated</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_an" />
                                                    <span class="custom-control-label">Lo âu/ <span class="text-primary">Anxious</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_fr" />
                                                    <span class="custom-control-label">Quấy/ <span class="text-primary">Fretful</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_le" />
                                                    <span class="custom-control-label">Lơ mơ/ <span class="text-primary">Lethargic</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_mental_status_de" />
                                                    <span class="custom-control-label">Trầm cảm/ <span class="text-primary">Depressed</span></span>
                                                </label>
                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="cb_mental_status_oth" />
                                                    <span class="custom-control-label">Khác/ <span class="text-primary">Other</span></span>
                                                </label>

                                                <div class="form-group mental_status_other_field ml-2" style="width: 320px">
                                                    <webUI:TextField runat="server" ID="TextField10" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Thính giác/ <span class="text-primary">Hearing:</span></label>
                                        </div>

                                        <div class="col-md-12" style="display: flex">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" runat="server" id="rad_hearing_code_n" name="rad_hearing_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_hearing_code_n">Bình thường/ <span class="text-primary">Normal</span></label>
                                            </div>

                                            <div class="custom-control custom-radio ml-2 mb-1">
                                                <input type="radio" runat="server" id="rad_hearing_code_hi" name="rad_hearing_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_hearing_code_hi">Khiếm thính/ <span class="text-primary">Hearing impaired</span></label>
                                            </div>

                                            <div class="custom-control custom-radio ml-2 mb-1">
                                                <input type="radio" runat="server" id="rad_hearing_code_ha" name="rad_hearing_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_hearing_code_ha">Dùng máy trợ thính (Trái/Phải)/ <span class="text-primary">Uses hearing aid (Left/Right)</span></label>
                                                <a href="javascript:void(0)" style="display: none;" data-clear="rad_hearing_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare20" />
                                                </a>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Thị giác/ <span class="text-primary">Vision:</span></label>
                                        </div>

                                        <div class="col-md-12" style="display: flex">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" runat="server" id="rad_vision_code_nm" name="rad_vision_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_vision_code_nm">Bình thường/ <span class="text-primary">Normal</span></label>
                                            </div>

                                            <div class="custom-control custom-radio ml-2 mb-1">
                                                <input type="radio" runat="server" id="rad_vision_code_gl" name="rad_vision_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_vision_code_gl">Đeo kính/ <span class="text-primary">Glasses</span></label>
                                            </div>

                                            <div class="custom-control custom-radio ml-2 mb-1">
                                                <input type="radio" runat="server" id="rad_vision_code_cl" name="rad_vision_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_vision_code_cl">Kính sát tròng/ <span class="text-primary">Contact lenses</span></label>
                                            </div>

                                            <div class="custom-control custom-radio ml-2 mb-1">
                                                <input type="radio" disabled-for="vision_other_field" runat="server" id="rad_vision_code_oth" name="rad_vision_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_vision_code_oth">Khác/ <span class="text-primary">Other</span></label>
                                                <a href="javascript:void(0)" style="display: none;" data-clear="rad_vision_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare21" />
                                                </a>
                                            </div>

                                            <div class="form-group vision_other_field ml-2" style="width: 320px">
                                                <webUI:TextField runat="server" ID="TextField11" />
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-2">Khả năng ngôn ngữ/ <span class="text-primary">Speech:</span></label>
                                        </div>

                                        <div class="col-md-12" style="display: flex">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" runat="server" id="rad_speech_code_nm" name="rad_speech_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_speech_code_nm">Bình thường/ <span class="text-primary">Normal</span></label>
                                            </div>

                                            <div class="custom-control custom-radio ml-2 mb-1">
                                                <input type="radio" runat="server" id="rad_speech_code_sl" name="rad_speech_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_speech_code_sl">Nói lắp/ <span class="text-primary">Slurred</span></label>
                                            </div>

                                            <div class="custom-control custom-radio ml-2 mb-1">
                                                <input type="radio" runat="server" id="rad_speech_code_ap" name="rad_speech_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_speech_code_ap">Chứng mất ngôn ngữ/ <span class="text-primary">Aphasic</span></label>
                                            </div>

                                            <div class="custom-control custom-radio ml-2 mb-1">
                                                <input type="radio" runat="server" id="rad_speech_code_nc" name="rad_speech_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_speech_code_nc">Không giao tiếp (Bất tỉnh or mê)/ <span class="text-primary">Non-communicative(Unconscious )</span></label>
                                            </div>

                                            <div class="custom-control custom-radio ml-2 mb-1">
                                                <input type="radio" runat="server" id="rad_speech_code_si" name="rad_speech_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_speech_code_si">Khiếm ngôn/ <span class="text-primary">Speech impaired</span></label>
                                            </div>

                                            <div class="custom-control custom-radio ml-2 mb-1">
                                                <input type="radio" runat="server" id="rad_speech_code_nv" name="rad_speech_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_speech_code_nv">Chưa biết nói/ <span class="text-primary">Non-verbal</span></label>
                                                <a href="javascript:void(0)" style="display: none;" data-clear="rad_speech_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare19" />
                                                </a>
                                            </div>
                                        </div>

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
                                                    <div class="form-group w-n diet_other_field mt-1" style="display: inline-block; margin-bottom: -15px !important;">
                                                        <webUI:TextField runat="server" ID="TextField13" />
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
                                                    <a href="javascript:void(0)"  class="el-hide" data-clear="rad_diet_pre_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare23" />
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input type="radio" runat="server" id="rad_ng_tube1" name="rad_ng_tube" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_ng_tube1">Ống thông/ <span class="text-primary">NG Tube</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input type="radio" runat="server" id="rad_ng_tube2" name="rad_ng_tube" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_ng_tube2">Không/ <span class="text-primary">No</span></label>
                                                    <a href="javascript:void(0)"  class="el-hide" data-clear="rad_ng_tube" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare24" />
                                                    </a>
                                                </div>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_gastrostomy" />
                                                    <span class="custom-control-label">Mở dạ dày/ <span class="text-primary">Gastrostomy</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" disabled-for="size_note_field" class="custom-control-input" runat="server" id="cb_size" />
                                                    <span class="custom-control-label">Kích cỡ/ <span class="text-primary">Size</span></span>
                                                </label>

                                                <div class="form-group w-s size_note_field mt-1" style="display: inline-block;">
                                                    <webUI:TextField runat="server" ID="TextField12" />
                                                </div>

                                                <label class="control-label"> Ngày thay ống gần nhất/ <span class="text-primary">Last Date Changed</span></label>

                                                <telerik:RadDatePicker runat="server" ID="dpk_last_date_changed" Width="120px" />
                                            </div>

                                            <div class="col-md-12 mb-2">
                                                <label class="control-label d-block">Thức ăn không ưa thích/ <span class="text-primary">Food dislikes</span></label>

                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="TextField14" />
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
                                                    <a href="javascript:void(0)"  class="el-hide" data-clear="rad_bowel_elimination_code" onclick="clear_radiobutton(this)">
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
                                                    <a href="javascript:void(0)"  class="el-hide" data-clear="rad_stool_consistency_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare25" />
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="col-md-12">
                                                <label class="control-label d-block">Tình trạng hiện có/ <span class="text-primary">Presence with
</span></label>
                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input type="radio" runat="server" id="rad_gas_presence_code_n" name="rad_gas_presence_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_gas_presence_code_n">Bình thường/ <span class="text-primary">Normal</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input type="radio" runat="server" id="rad_gas_presence_code_i" name="rad_gas_presence_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_gas_presence_code_i">Không kiểm soát/ <span class="text-primary">Incontinence</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input type="radio" runat="server" id="rad_gas_presence_code_" name="rad_gas_presence_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_gas_presence_code_">Hậu môn nhân tạo/ <span class="text-primary">Stoma</span></label>
                                                    <a href="javascript:void(0)"  class="el-hide" data-clear="rad_gas_presence_code" onclick="clear_radiobutton(this)">
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
                                                            <input type="radio" disabled-for="final_screening" runat="server" id="rad_bmi_out_range1" name="rad_bmi_out_range" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_bmi_out_range1">Có/ <span class="text-primary">Yes</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_bmi_out_range2" name="rad_bmi_out_range" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_bmi_out_range2">Không/ <span class="text-primary">No</span></label>
                                                            <a href="javascript:void(0)" style="display: none;" data-clear="rad_bmi_out_range" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare28" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label class="control-label d-block">2. NB có sụt cân trong vòng 3 tháng gần đây không?/ <span class="text-primary">Has the patient lost weight within the last 3 months?</span></label>

                                                        <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                            <input type="radio" disabled-for="final_screening" runat="server" id="rad_loss_weight1" name="rad_loss_weight" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_loss_weight1">Có/ <span class="text-primary">Yes</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_loss_weight2" name="rad_loss_weight" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_loss_weight2">Không/ <span class="text-primary">No</span></label>
                                                            <a href="javascript:void(0)" style="display: none;" data-clear="rad_loss_weight" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare29" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label class="control-label d-block">3. NB có chán ăn trong 1 tuần qua không?/ <span class="text-primary">Has the patient had a reduced dietary intake in the last week?</span></label>
                                                        <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                            <input disabled-for="final_screening" type="radio" runat="server" id="rad_reduce_dietary1" name="rad_reduce_dietary" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_reduce_dietary1">Có/ <span class="text-primary">Yes</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                            <input  type="radio" runat="server" id="rad_reduce_dietary2" name="rad_reduce_dietary" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_reduce_dietary2">Không/ <span class="text-primary">No</span></label>
                                                            <a href="javascript:void(0)" style="display: none;" data-clear="rad_reduce_dietary" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare30" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <label class="control-label d-block">4. NB có bị bệnh gì nghiêm trọng không?/ <span class="text-primary">Is the patient severely ill?</span></label>
                                                        <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                            <input disabled-for="final_screening" type="radio" runat="server" id="rad_severely_ill1" name="rad_severely_ill" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_severely_ill1">Có/ <span class="text-primary">Yes</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                            <input type="radio" runat="server" id="rad_severely_ill2" name="rad_severely_ill" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_severely_ill2">Không/ <span class="text-primary">No</span></label>
                                                            <a href="javascript:void(0)" style="display: none;" data-clear="rad_severely_ill" onclick="clear_radiobutton(this)">
                                                                <icon:xsquare runat="server" ID="XSquare31" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        Ghi chú: Thức ăn bao gồm ăn qua miệng và các đường khác (qua ống thông dạ dày hoặc dinh dưỡng qua đường TM)<br />
<span class="text-primary">Note: Food intake includes food taken by mouth, and other route (tube feeding or parenteral nutrition)</span><br />
                                                         - Nếu trả lời “có” cho bất kỳ câu hỏi nào ở bảng 1 thì vui lòng đánh giá tiếp ở bảng 2 <br />   
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
                                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="Checkbox1" />
                                                                    <span class="custom-control-label">Tình trạng dinh dưỡng bình thường/ <span class="text-primary">Normal nutritional status</span></span>
                                                                </label>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label class="control-label mb-1 d-block">Điểm = 1/ <span class="text-primary">Score = 1</span></label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="Checkbox2" />
                                                                    <span class="custom-control-label">Sụt cân > 5% trong 3 tháng/ <span class="text-primary">Weight loss > 5% in 3 months</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="Checkbox3" />
                                                                    <span class="custom-control-label">Ăn ít 50%-75% so với nhu cầu ăn bình thường trong tuần qua/ <span class="text-primary">Food intake below 50 - 75% of normal requirement in preceding week</span></span>
                                                                </label>
                                                            </div>

                                                            <div class="col-md-12">
                                                                <label class="control-label mb-1 d-block">Điểm = 2/ <span class="text-primary">Score = 2</span></label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="Checkbox4" />
                                                                    <span class="custom-control-label">Sụt cân > 5% trong 2 tháng/ <span class="text-primary">Weight loss > 5% in 2 months</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="Checkbox5" />
                                                                    <span class="custom-control-label">BMI 18.5-20.5 và tổng trạng suy yếu/ <span class="text-primary">BMI 18.5 - 20.5 and impaired general condition</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="Checkbox6" />
                                                                    <span class="custom-control-label">Ăn ít 25%-50% so với nhu cầu ăn bình thường trong tuần qua/ <span class="text-primary">Food intake 25–50% of normal requirement in preceding week</span></span>
                                                                </label>
                                                            </div>

                                                            <div class="col-md-12">
                                                                <label class="control-label mb-1 d-block">Điểm = 3/ <span class="text-primary">Score = 3</span></label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox7" />
                                                                    <span class="custom-control-label">Sụt cân > 5% trong 1 tháng/ <span class="text-primary">Weight loss > 5% in 1 month</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox8" />
                                                                    <span class="custom-control-label">BMI < 18.5 và tổng trạng suy yếu/ <span class="text-primary">BMI < 18.5 and impaired general condition</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox"  class="custom-control-input" runat="server" id="Checkbox9" />
                                                                    <span class="custom-control-label">Ăn ít 0-25% so với nhu cầu ăn bình thường trong tuần qua/ <span class="text-primary">Food intake 0-25% of normal requirement in preceding week</span></span>
                                                                </label>

                                                            </div>

                                                            <div class="col-md-12">
                                                                <label class="control-label mb-1">Điểm/ <span class="text-primary">Score</span></label><label runat="server" id="nutrition_score" ></label>
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
                                                                    <input type="checkbox" class="custom-control-input" runat="server" />
                                                                    <span class="custom-control-label">Yêu cầu dinh dưỡng đặc biệt/ <span class="text-primary">Normal nutritional requirements</span></span>
                                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_triage_code" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare35" />
                                                                    </a>
                                                                </label>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label class="control-label mb-1 d-block">Điểm = 1/ <span class="text-primary">Score = 1</span></label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_severity_score1_" />
                                                                    <span class="custom-control-label">Gãy khớp háng/ <span class="text-primary">Hip fracture</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_severity_score1_code_2" />
                                                                    <span class="custom-control-label">Bệnh mãn tính có kèm theo biến chứng/ <span class="text-primary">Chronic disease with complications</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_severity_score1_code_3" />
                                                                    <span class="custom-control-label">Viêm phổi tắc nghẽn mãn tính/ <span class="text-primary">COPD</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_severity_score1_code_4" />
                                                                    <span class="custom-control-label">NB yếu nhưng có thể di chuyển được/ <span class="text-primary">The patient is weak but can move out of bed</span></span>
                                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_triage_code" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare33" />
                                                                    </a>
                                                                </label>

                                                            </div>

                                                            <div class="col-md-12">
                                                                <label class="control-label mb-1 d-block">Điểm = 2/ <span class="text-primary">Score = 2</span></label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="cb_severity_score2_code_1" />
                                                                    <span class="custom-control-label">Có phẫu thuật ở bụng/ <span class="text-primary">Major abdominal surgery</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="cb_severity_score2_code_2" />
                                                                    <span class="custom-control-label">Đột quị/ <span class="text-primary">Stroke</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="cb_severity_score2_code_3" />
                                                                    <span class="custom-control-label">Viêm phổi nặng/ <span class="text-primary">Severe pneumonia</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="cb_severity_score2_code_4" />
                                                                    <span class="custom-control-label">Bệnh ác tính huyết học/ <span class="text-primary">Hematologic malignancy</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" disabled-for="mental_status_other_field" class="custom-control-input" runat="server" id="cb_severity_score2_code_5" />
                                                                    <span class="custom-control-label">NB nằm liệt giường/ <span class="text-primary">The patient is bedridden</span></span>
                                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_triage_code" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare32" />
                                                                    </a>
                                                                </label>
                                                            </div>

                                                            <div class="col-md-12">
                                                                <label class="control-label mb-1 d-block">Điểm = 3/ <span class="text-primary">Score = 3</span></label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_severity_score3_code_1" />
                                                                    <span class="custom-control-label">Chấn thương đầu/ <span class="text-primary">Head injury</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_severity_score3_code_2" />
                                                                    <span class="custom-control-label">Ghép tủy xương/ <span class="text-primary">Bone marrow transplantation</span></span>
                                                                </label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox"  class="custom-control-input" runat="server" id="cb_severity_score3_code_3" />
                                                                    <span class="custom-control-label">Bệnh nhân chăm sóc chuyên sâu (APACHE> 10)/ <span class="text-primary">Intensive care patients (APACHE > 10)</span></span>
                                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_triage_code" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare34" />
                                                                    </a>
                                                                </label>

                                                            </div>

                                                            <div class="col-md-12">
                                                                <label class="control-label mb-1">Điểm/ <span class="text-primary">Score</span></label><label runat="server" id="Label1" ></label>
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
                                                                    <input type="checkbox" class="custom-control-input" runat="server" />
                                                                    <span class="custom-control-label">< 70 tuổi/ <span class="text-primary">< 70 years old</span></span>
                                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_triage_code" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare36" />
                                                                    </a>
                                                                </label>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <label class="control-label mb-1 d-block">Điểm = 1/ <span class="text-primary">Score = 1</span></label>
                                                                <label class="custom-control custom-checkbox ml-2">
                                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox10" />
                                                                    <span class="custom-control-label">≥ 70 tuổi/ <span class="text-primary">≥ 70 years old</span></span>
                                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_triage_code" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare37" />
                                                                    </a>
                                                                </label>

                                                            </div>

                                                            <div class="col-md-12">
                                                                <label class="control-label mb-1">Điểm/ <span class="text-primary">Score</span></label><label runat="server" id="Label2" ></label>
                                                            </div>

                                                        </fieldset>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <label class="control-label mb-1">TỔNG SỐ ĐIỂM/ <span class="text-primary">TOTAL SCORE</span></label><label runat="server" id="Label3" ></label>
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

                                        <fieldset class="row">
                                            <legend>
                                                <label class="control-label mb-2 font-bold">7. Hệ tiết niệu sinh dục/ <span class="text-primary">Genitourinary system</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <label class="control-label d-block">Tiểu/ <span class="text-primary">Urination</span></label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox13" />
                                                    <span class="custom-control-label">Không có vấn đề/ <span class="text-primary">Normal</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox14" />
                                                    <span class="custom-control-label">Tiểu đêm/ <span class="text-primary">Nocturia</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox15" />
                                                    <span class="custom-control-label">Thường xuyên/ <span class="text-primary">Frequency</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox16" />
                                                    <span class="custom-control-label">Khó tiểu/ <span class="text-primary">Dysuria</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox17" />
                                                    <span class="custom-control-label">Không kiểm soát/ <span class="text-primary">Incontinece</span></span>
                                                </label>

                                                <div class="ml-2 mb-1 d-inline-block">
                                                    <label class="custom-control custom-checkbox">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox18" />
                                                        <span class="custom-control-label">Thông tiểu ngắt quãng (lần/ ngày)/ <span class="text-primary">Intermittent catheterization</span></span>
                                                    </label>
                                                    <div class="form-group w-s mt-1" style="display: inline-block">
                                                        <webUI:TextField runat="server" ID="TextField18" />
                                                    </div>
                                                </div>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox19" />
                                                    <span class="custom-control-label">Ống thông tiểu lưu/ <span class="text-primary">Indwelling catheter</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox12" />
                                                    <span class="custom-control-label">Kích cỡ/ <span class="text-primary">Size</span></span>
                                                </label>

                                                <div class="form-group w-s mt-1">
                                                    <webUI:TextField runat="server" ID="TextField16" />
                                                </div>

                                                <label class="control-label">Ngày thay gần nhất/ <span class="text-primary">Fr, Date last changed</span></label>

                                                <telerik:RadDatePicker runat="server" ID="RadDatePicker1" Width="120px" />

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox20" />
                                                    <span class="custom-control-label">Ống thông bàng quang qua da/ <span class="text-primary">Suprapubic catheter</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox11" />
                                                    <span class="custom-control-label">Kích cỡ/ <span class="text-primary">Size</span></span>
                                                </label>

                                                <div class="form-group w-s size_note_field mt-1" style="display: inline-block;">
                                                    <webUI:TextField runat="server" ID="TextField15" />
                                                </div>

                                                <label class="control-label">Ngày thay gần nhất/ <span class="text-primary">Fr, Date last changed</span></label>

                                                <telerik:RadDatePicker runat="server" ID="RadDatePicker2" Width="120px" />

                                                <label class="control-label d-block">Đối với người bệnh nữ/ <span class="text-primary">For female patients only:</span></label>

                                                <label class="control-label d-block">Kinh nguyệt/ <span class="text-primary">Menstruation:</span></label>

                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input disabled-for="final_screening" type="radio" runat="server" id="Radio2" name="rad_severely_ill" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_severely_ill1">Vô kinh/ <span class="text-primary">Amenorrhea</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input disabled-for="final_screening" type="radio" runat="server" id="Radio3" name="rad_severely_ill" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_severely_ill1">Mãn kinh/ <span class="text-primary">Menopause</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input disabled-for="final_screening" type="radio" runat="server" id="Radio1" name="rad_severely_ill" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_severely_ill1">Chu kỳ (ngày)/ <span class="text-primary">Cycle (day)</span></label>
                                                </div>

                                                <div class="form-group w-s size_note_field mt-1" style="display: inline-block;">
                                                    <webUI:TextField runat="server" ID="TextField19" />
                                                </div>

                                                <label class="control-label">Ngày đầu của kỳ kinh cuối/ <span class="text-primary">Last menstrual period started:</span></label>

                                                <div class="form-group w-s mt-1" style="display: inline-block;">
                                                    <webUI:TextField runat="server" ID="TextField20" />
                                                </div>

                                                <label class="control-label d-block">Có thai/ <span class="text-primary">Pregnancy:</span></label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox21" />
                                                    <span class="custom-control-label">Không/ <span class="text-primary">No</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox22" />
                                                    <span class="custom-control-label">Đã từng mang thai trước đây/ <span class="text-primary">Previous pregnancy</span></span>
                                                </label>
                                                
                                                <label class="control-label mb-1"><span class="text-primary">PARA</span></label>
                                                
                                                <div class="form-group w-s mt-1" style="display: inline-block;">
                                                    <webUI:TextField runat="server" ID="TextField21" />
                                                </div>

                                                <label class="custom-control custom-checkbox ml-2 mb-1 d-inline-block">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox23" />
                                                    <span class="custom-control-label">Hiện đang mang thai/ <span class="text-primary">Current pregnancy</span></span>
                                                </label>

                                                <div class="form-group w-s mt-1" style="display: inline-block;">
                                                    <webUI:TextField runat="server" ID="TextField22" />
                                                </div>

                                                <div class="form-group w-4">
                                                    <input id="Text1" runat="server" class="form-control text-right" />
                                                    <span class="append">tuần/ week</span>
                                                </div>

                                                <label class="control-label mb-1 d-block">Ngừa thai/ <span class="text-primary">Contraception</span></label>
                                                
                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input disabled-for="final_screening" type="radio" runat="server" id="Radio4" name="rad_severely_ill" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_severely_ill1">Không/ <span class="text-primary">No</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input disabled-for="final_screening" type="radio" runat="server" id="Radio5" name="rad_severely_ill" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_severely_ill1">Thuốc ngừa thai/ <span class="text-primary">Contraceptive pill</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input disabled-for="final_screening" type="radio" runat="server" id="Radio6" name="rad_severely_ill" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_severely_ill1">Dụng cụ ngừa thai đặt trong tử cung/ <span class="text-primary">Intrauterine Device</span></label>
                                                </div>

                                                <div class="custom-control custom-radio ml-2 mb-1 d-inline-block">
                                                    <input disabled-for="final_screening" type="radio" runat="server" id="Radio7" name="rad_severely_ill" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_severely_ill1">Khác/ <span class="text-primary">Other</span></label>
                                                </div>
                                                <div class="form-group w-5">
                                                    <input id="Text2" runat="server" class="form-control text-right" />
                                                    <span class="append">tuần/ week</span>
                                                </div>

                                            </div>
                                        </fieldset>


                                        <fieldset class="row">
                                            <legend>
                                                <label class="control-label mb-2 font-bold">8. Hệ cơ xương khớp/ <span class="text-primary">Musculoskeletal System</span></label>
                                            </legend>
                                            <div class="col-md-12">
                                                <label class="control-label d-block">Tiền sử/ <span class="text-primary">History</span></label>

                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox24" />
                                                    <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox25" />
                                                    <span class="custom-control-label">Đau khớp/ <span class="text-primary">Joint pain</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox26" />
                                                    <span class="custom-control-label">Sưng khớp/ <span class="text-primary">Joint swelling</span></span>
                                                </label>

                                                <label class="custom-control custom-checkbox ml-2">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox27" />
                                                    <span class="custom-control-label">Sự co rút cơ/ <span class="text-primary">Muscle spasms</span></span>
                                                </label>

                                                <div style="display: flex;">
                                                    <label class="custom-control custom-checkbox ml-2" style="display: flex; align-items: center;">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox29" />
                                                        <span class="custom-control-label">Liệt/ (1/2 người/2 chi/4 chi)/ <span class="text-primary">Paralysis (Hemi/Para/Tetra)</span></span>
                                                    </label>

                                                    <div class="form-group w-s mt-1 d-inline-block ml-2">
                                                        <webUI:TextField runat="server" ID="TextField23" />
                                                    </div>
                                                </div>

                                                <div style="display: flex;">
                                                    <label class="custom-control custom-checkbox ml-2 mb-1" style="display: flex; align-items: center;">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox30" />
                                                        <span class="custom-control-label">Đoạn chi/ <span class="text-primary">Amputation</span></span>
                                                    </label>

                                                    <div class="form-group w-s mt-1 d-inline-block ml-2">
                                                        <webUI:TextField runat="server" ID="TextField26" />
                                                    </div>
                                                </div>

                                                <div style="display: flex;">
                                                    <label class="custom-control custom-checkbox ml-2 mb-1" style="display: flex; align-items: center;">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox32" />
                                                        <span class="custom-control-label">Cơ bắp co rút/ <span class="text-primary">Contracture</span></span>
                                                    </label>

                                                    <div class="form-group w-s mt-1 d-inline-block ml-2">
                                                        <webUI:TextField runat="server" ID="TextField25" />
                                                    </div>
                                                </div>

                                                <div style="display: flex;">
                                                    <label class="custom-control custom-checkbox ml-2 mb-1" style="display: flex; align-items: center;">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="Checkbox31" />
                                                        <span class="custom-control-label">Lắp bộ phận giả/ <span class="text-primary">Prosthesis</span></span>
                                                    </label>

                                                    <div class="form-group w-s mt-1 d-inline-block ml-2">
                                                        <webUI:TextField runat="server" ID="TextField24" />
                                                    </div>
                                                </div>

                                            </div>
                                        </fieldset>


                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">* Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_cur_medication" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">2. Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label">Bản thân/ <span class="text-primary">Personal:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_personal" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_family" />
                                                </div>
                                            </div>
                                        </div>



                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                            </div>
                                        </div>



                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">1. Sốc, phản ứng nặng sau lần tiêm chủng trước/ <span class="text-primary">Shock, severe reaction after previous vaccination:</span></label>
                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_1" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">2. Đang mắc bệnh cấp tính hoặc bệnh mạn tính tiến triển/ <span class="text-primary">Are suffering from an acute or progressive chronic disease:</span></label>
                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_2" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">3. Đang hoặc mới kết thúc đợt điều trị corticoid liều cao (prednison >2mg/kg/ngày), hóa trị, xạ trị, dùng gammaglobulin/ <span class="text-primary">At or just after a high-dose corticosteroid treatment (prednison> 2mg / kg / day), chemotherapy, radiation and gammaglobulin:</span></label>
                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_3" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">4. Sốt/Hạ thân nhiệt (Sốt: nhiệt độ ≥ 38°C; Hạ thân nhiệt: nhiệt độ ≤ 35,5°C)/ Fever/ <span class="text-primary">Hypothermia (Fever: temperature ≥ 37.5 ° C; Hypothermia: temperature ≤ 35.5 ° C):</span></label>
                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_4" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">5. Nghe tim bất thường/ <span class="text-primary">Hearing abnormalities:</span></label>
                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_5" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">6. Nhịp thở, nghe phổi bất thường/ <span class="text-primary">Abnormal breathing, pulmonary listening:</span></label>
                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_6" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">7. Tri giác bất thường (li bì hoặc kích thích)/ <span class="text-primary">Abnormal perception (li or stimulation):</span></label>
                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_7" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">8. Các chống chỉ định khác, nếu có ghi rõ<span class="text-primary">Other contraindications, if yes specified:</span></label>
                                                <webUI:TextField runat="server" ID="txt_scr_before_vacc_8" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Loại vắc xin tiêm chủng lần này/ <span class="text-primary">Appointed Vaccine:</span></label>

                                                <asp:UpdatePanel ID="updatePanel_appointedVaccine" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:GridView
                                                            ShowHeaderWhenEmpty="true"
                                                            ID="grid_appointedVaccine"
                                                            runat="server"
                                                            CssClass="tb-responsive"
                                                            AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Tên vaccin/ <span class="text-primary">Drug names</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField Value='<%#Eval("drug_name") %>' DataKey="drug_name" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Hàm lượng/ <span class="text-primary">Strength</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField Value='<%#Eval("strength") %>' DataKey="strength" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Đường dùng/ <span class="text-primary">Route</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField Value='<%#Eval("router") %>' DataKey="router" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px">Hướng dẫn bổ sung/ Chỉ định sử dụng khi cần thiết kèm theo lý do/ <span class="text-primary">Additional instruction/ PRN order with reason</span></div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <webUI:TextField Value='<%#Eval("reason") %>' DataKey="reason" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />

                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:UpdateProgress ID="updateProgress_appointedVaccine" runat="server" AssociatedUpdatePanelID="updatePanel_appointedVaccine">
                                                            <ProgressTemplate>
                                                                Please wait....
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                        <div class="mt-2">
                                                            <asp:Button ID="btn_grid_appointedVaccine_add" runat="server" CssClass="btn btn-sm btn-outline-primary" Text="Add row" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btn_grid_appointedVaccine_add" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                                <webUI:TextField runat="server" ID="txt_additional_investigations" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis (ICD 10):</span></label>
                                                <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis (ICD 10):</span></label>
                                                <webUI:TextField runat="server" ID="txt_differential_diagnosis" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Kế hoạch điều trị/ <span class="text-primary">Treatment:</span></label>
                                            </div>

                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_treatment_code_opd" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_opd">
                                                        Ngoại trú/ <span class="text-primary">Ambulatory care</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_treatment_code_ipd" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_ipd">
                                                        Nhập viện/ <span class="text-primary">Admission</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_treatment_code_trf" runat="server" name="rad_treatment_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_treatment_code_trf">
                                                        Chuyển viện/ <span class="text-primary">Transfer</span>
                                                    </label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_treatment_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare3" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                            </div>

                                            <div class="col-md-2 col-sm-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_spec_opinion_req1" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_req1">
                                                        Không/ <span class="text-primary">No</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="col-md-2 col-sm-8">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" disabled-for="spec_opinion_req_text_field" id="rad_spec_opinion_req2" runat="server" name="rad_spec_opinion_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_req2">
                                                        Có, ghi rõ/ <span class="text-primary">Yes, specify</span>
                                                    </label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_spec_opinion_req" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare1" />
                                                    </a>
                                                </div>
                                                <div class="form-group spec_opinion_req_text_field">
                                                    <webUI:TextField runat="server" id="txt_spec_opinion_req_text" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                                <div class="form-group">
                                                    <webUI:TextField runat="server" ID="txt_pecific_edu_req" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">• Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                                <webUI:TextField runat="server" ID="txt_next_appointment" />
                                            </div>
                                        </div>

                                        <div class="form-actions mb-3">
                                            <asp:Button ID="btnComplete" class="btn btn-primary" runat="server" Text="Complete" />
                                            <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" />
                                            <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                            <asp:Button ID="btnAmend" class="btn btn-secondary" runat="server" Text="Amend" />
                                            <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" OnClientClick="window.print()"  Text="Print" />
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
                                                            <webUI:TextField runat="server" ID="TextField17" />
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
                        </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnAmend" />
                    <asp:PostBackTrigger ControlID="btnCancel" />
                    <%--<asp:PostBackTrigger ControlID="btnSave" />                     <asp:PostBackTrigger ControlID="btnComplete" />--%>
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
