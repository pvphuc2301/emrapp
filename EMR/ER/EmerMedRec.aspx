<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmerMedRec.aspx.cs" Inherits="EMR.ER.EmerMedRec" %>


<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/Alert.ascx" TagPrefix="uc1" TagName="Alert" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="Input" TagName="TextField" %>
<%@ Register Src="~/UserControls/PromptButton.ascx" TagPrefix="Button" TagName="Prompt" %>
<%@ Register Src="~/icons/PlusCircle.ascx" TagPrefix="Icon" TagName="PlusCircle" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="trash" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />
    <style>
        .alert {
            display: flex;
            align-items: center;
        }

        #MessagePlaceHolder {
            left: 0;
            right: 0;
        }
    </style>
    <script>
        function changeValue(a, b) {
            document.getElementById(b).value = document.getElementById(a).innerHTML;
        }
    </script>
</head>
<body>

    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">AIH Hospital</p>
        </div>
    </div>

    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <uc1:PatientInfo runat="server" ID="PatientInfo" />

                     <div class="row" style="margin-bottom: 50px;">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">EMERGENCY MEDICAL ASSESSMENT</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Ngày, giờ bắt đầu đánh giá/ <span class="text-primary">Starting date, time of the assessmen:<span class="text-danger">*</span></span>
                                                </label>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Lý do đến khám/ <span class="text-primary">Chief complaint/ Reason of consultation:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_triage_code_1" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_triage_code_1">Hồi sức/ <span class="text-primary">Resuscitation</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_triage_code_2" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_triage_code_2">Cấp cứu/ <span class="text-primary">Emergency</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_triage_code_3" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_triage_code_3">Khẩn trương/ <span class="text-primary">Urgent</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_triage_code_4" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_triage_code_4">Trì hoãn/ <span class="text-primary">Less Urgent</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_triage_code_5" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_triage_code_5">Không cấp cứu/ <span class="text-primary">Non-Urgent</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_triage_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Bệnh Sử/ <span class="text-primary">History of present illness (HPI):</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tiền sử bệnh/ <span class="text-primary">Past medical history (PMH):</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Meds <span class="text-danger">*</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Surgical <span class="text-danger">*</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Thói quen/ <span class="text-primary">Habits:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" runat="server" class="custom-control-input" />
                                                    <span class="custom-control-label">Alcohol/ <span class="text-primary">Rượu</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" runat="server" class="custom-control-input" />
                                                    <span class="custom-control-label">Smoking/ <span class="text-primary">Thuốc</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" runat="server" class="custom-control-input" />
                                                    <span class="custom-control-label">Chất gây nghiện/ <span class="text-primary">Drugs</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="custom-control custom-checkbox">
                                                    <input disabled-for="habit_other_field" type="checkbox" runat="server" class="custom-control-input" />
                                                    <span class="custom-control-label">Khác, ghi rõ/ <span class="text-primary">Other, specify</span></span>
                                                </label>

                                                <div class="form-group habit_other_field">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Thuốc dùng tại nhà/ <span class="text-primary">Home medications:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tiền sử dị ứng/ <span class="text-primary">Allergies:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tiền sử bệnh người thân/ <span class="text-primary">Relevant family history:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Khám lâm sàng liên quan/ <span class="text-primary">Physical examination:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Kết quả tìm thấy/ <span class="text-primary">Findings (General and Diagnostic support):</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological assessment required:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_par1" name="rad_par" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_par1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="par" type="radio" id="rad_par2" name="rad_par" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_par2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_par" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare1" />
                                                    </a>
                                                </div>
                                                <div class="form-group par">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Kết quả khảo sát/ <span class="text-primary">Investigations Results (Labs, Imaging...):</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán sơ bộ/ <span class="text-primary">Initial diagnosis:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chuẩn đoán xác định/ <span class="text-primary">Confirmed Diagnosis:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Ý kiến của bác sĩ chuyên khoa/ <span class="text-primary">Specialist opinion:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_specialist_opinion1" name="rad_specialist_opinion" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_specialist_opinion1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="specialist_opinion_field" type="radio" id="rad_specialist_opinion2" name="rad_specialist_opinion" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_specialist_opinion2">Có/ <span class="text-primary">Yes</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_specialist_opinion" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare2" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 specialist_opinion_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tên của bác sĩ chuyên khoa/ Khoa/ <span class="text-primary">Name of the specialist/ Department:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                         
                                        <div class="row specialist_opinion_field">
                                            <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">Giờ liên hệ/ <span class="text-primary">Time contacted:</span></label>

                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" />
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">Giờ khám/ <span class="text-primary">Time provided:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 specialist_opinion_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tóm tắt ý kiến của bác sĩ chuyên khoa/ <span class="text-primary">Specialist opinion summarised:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Kế hoạch chăm sóc/ <span class="text-primary">Care Plan:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">1. Điều trị tại khoa cấp cứu/ <span class="text-primary">Treatment in Emergency</span></label>
                                            </div>
                                            <div class="col-md-12">
                                                insert table
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold pl-4">Progress Note</label>
                                            </div>
                                            <div class="col-md-12">
                                                insert table
                                            </div>

                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Kết luận sau điều trị/ <span class="text-primary">Conclusions at termination of treatmen:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                         <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">2. Xuất viện/ <span class="text-primary">Discharge:</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_discharge1" name="rad_discharge" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_discharge1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="discharge_field" type="radio" id="rad_discharge2" name="rad_discharge" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_discharge2">Có/ <span class="text-primary">Yes</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_discharge" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare3" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 discharge_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Toa thuốc/ <span class="text-primary">Prescription:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 discharge_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Ghi rõ các hướng dẫn chăm sóc tiếp theo/ <span class="text-primary">Specify follow-up care instructions:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row discharge_field">
                                            <div class="col-md-12 mb-2 d-lg-flex ">
                                                <div class="w-lg-8">
                                                    <label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Discharge Time:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">3. Chuyển sang khám ngoại trú/ <span class="text-primary">Referred to OPD:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_referred_opd1" name="rad_referred_opd" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_referred_opd1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="referred_opd_field" type="radio" id="rad_referred_opd2" name="rad_referred_opd" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_referred_opd2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_referred_opd" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare4" />
                                                    </a>
                                                </div>
                                                <div class="form-group referred_opd_field">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">4. Yêu cầu nhập viện/ <span class="text-primary">Hospitalisation required:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_hos_req1" name="rad_hos_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_hos_req1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group m-0 p-0 border-0">
                                                    <div class="custom-control custom-radio mb-2">
                                                        <input disabled-for="hos_req_field" type="radio" id="rad_hos_req2" name="rad_hos_req" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_hos_req2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                        <a href="javascript:void(0)" style="display: none;" data-clear="rad_hos_req" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare5" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row hos_req_field">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">Lý do/ <span class="text-primary">Reason:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row hos_req_field">
                                            <div class="col-md-12 mb-2">
                                                    <label class="control-label mb-1">Tại khoa/ <span class="text-primary">Ward:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row hos_req_field">
                                            <div class="col-md-12 mb-2 d-lg-flex">
                                                <div class="w-lg-8">
                                                    <label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Discharge Time:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">5. Nếu phẫu thuật cấp cứu/ <span class="text-primary">In case of emergency surgery:</span></label>
                                                <p>
                                                    Khi không có thời gian để ghi nhận đầy đủ bệnh sử và kết quả khám lâm sàng của bệnh nhân cần phẫ̃u thuật cấp cứu, vui lòng ghi rõ: <br />
                                                    <span class="text-primary">When there is no time to record the complete history and physical examination of a patient requiring emergency surgery, indicate </span>
                                                </p>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_emr_sur1" name="rad_emr_sur" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_emr_sur1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group m-0 p-0 border-0">
                                                    <div class="custom-control custom-radio mb-2">
                                                        <input disabled-for="emr_sur_field" type="radio" id="rad_emr_sur2" name="rad_emr_sur" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_emr_sur2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                        <a href="javascript:void(0)" style="display: none;" data-clear="rad_emr_sur" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare6" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                            <div class="row mb-2 emr_sur_field">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Chẩn đoán trước phẫu thuật/ <span class="text-primary">Pre-operative diagnosis:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2 emr_sur_field">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Tóm tắt bệnh án/ <span class="text-primary">Brief summary:</span></label>
                                                    <div class="form-group">
                                                        <Input:TextField runat="server" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row emr_sur_field">
                                                <div class="col-md-12 mb-2 d-lg-flex">
                                                    <div class="w-lg-8">
                                                        <label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Time of leaving Emergency:</span></label>
                                                    </div>
                                                    <div class="form-group">
                                                        <telerik:RadDateTimePicker runat="server" Width="200px" />
                                                    </div>
                                                </div>
                                            </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">6. Nếu chuyển đến BV khác/ <span class="text-primary">In case of transfer to another hospital:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_transfer_hos1" name="rad_transfer_hos" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_transfer_hos1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group m-0 p-0 border-0">
                                                    <div class="custom-control custom-radio mb-2">
                                                        <input disabled-for="transfer_hos_field" type="radio" id="rad_transfer_hos2" name="rad_transfer_hos" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_transfer_hos2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                        <a href="javascript:void(0)" style="display: none;" data-clear="rad_transfer_hos" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare7" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 transfer_hos_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Lý do chuyển viện/ <span class="text-primary">Reason for transfer:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 transfer_hos_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tình trạng trước khi chuyển viện/ <span class="text-primary">Status before transfer:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row transfer_hos_field">
                                            <div class="col-md-12 mb-2 d-lg-flex">
                                                <div class="w-lg-9">
                                                        <label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Time of leaving Emergency:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server"  Width="200px" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tình trạng của bệnh nhân khi xuất viện/ <span class="text-primary">Patient's Condition at Discharge:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_con_discharge1" />
                                                    <span class="custom-control-label">Có cải thiện/ <span class="text-primary">Improved</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_con_discharge2" />
                                                    <span class="custom-control-label">Không thay đổi/ <span class="text-primary">Unchanged</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input" runat="server" id="cb_con_discharge3" />
                                                    <span class="custom-control-label">Không ổn định/ <span class="text-primary">Unstable</span></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Mã ICD-10/ <span class="text-primary">ICD-10 Code(S):</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-actions mb-3">
                                        <asp:Button ID="btnComplete" class="btn btn-primary" runat="server" Text="Complete" />

                                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" />

                                        <asp:Button ID="btnDelete" data-target="#exampleModalCenter" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-danger" runat="server" Text="Delete" />

                                        <asp:Button ID="btnAmend" class="btn btn-secondary" runat="server" Text="Amend" />

                                        <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" Text="Print" />

                                        <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
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
