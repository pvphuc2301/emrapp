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
                    <div id="AmendReasonPlaceHolder" runat="server"></div>

                    <uc1:PatientInfo runat="server" ID="PatientInfo" />

                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="text-primary">EMERGENCY MEDICAL ASSESSMENT
                                    </h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    <span class="text-primary">Ngày, giờ bắt đầu đánh giá/ 
                                                        <span class="text-primary">Starting date, time of the assessmen:
                                                        <span class="text-danger">*</span>
                                                        </span>
                                                </label>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" ID="rad_evaluation_time" Width="200px" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtChiefComplaint" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_chief_complaint_code_R" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_chief_complaint_code_R">
                                                        Hồi sức/ <span class="text-primary">Resuscitation</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_chief_complaint_code_E" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_chief_complaint_code_E">
                                                        Cấp cứu/ <span class="text-primary">Emergency</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_chief_complaint_code_U" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_chief_complaint_code_U">
                                                        Khẩn trương/ <span class="text-primary">Urgent</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-2 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_chief_complaint_code_L" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_chief_complaint_code_L">
                                                        Trì  hoãn/ <span class="text-primary">Less Urgent</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-md-4 col-sm-6">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_chief_complaint_code_N" runat="server" name="rad_triage_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_chief_complaint_code_N">
                                                        Không cấp cứu/ <span class="text-primary">Non-Urgent</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Bệnh Sử/ <span class="text-primary">History of present illness(HPI):</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtHistoryofPresent" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tiền sử bệnh/ <span class="text-primary">Past medical history (PMH):</span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Meds
                                                                                    <span
                                                                                        class="text-danger">*</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtpastmedhismeds" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Surgical
                                                                                    <span
                                                                                        class="text-danger">*</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtpastmedhissurs" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Thói
                                                                                    quen/ <span
                                                                                        class="text-primary">Habits:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server" id="cb_habits_A"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Alcohol/
                                                                                        <span
                                                                                            class="text-primary">Rượu</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server" id="cb_habits_S"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Smoking/
                                                                                        <span
                                                                                            class="text-primary">Thuốc</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server" id="cb_habits_D"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Chất
                                                                                        gây nghiện/ <span
                                                                                            class="text-primary">Drugs</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-12">
                                                <label class="custom-control custom-checkbox">
                                                    <input
                                                        disabled-for="habit_other_field"
                                                        type="checkbox" runat="server"
                                                        id="cb_habits_O"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Khác,
                                                                                        ghi rõ/ <span
                                                                                            class="text-primary">Other,
                                                                                            specify</span></span>
                                                </label>

                                                <div class="form-group habit_other_field">
                                                    <Input:TextField runat="server" ID="txthabitsother" />
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Thuốc
                                                                                    dùng tại nhà/ <span
                                                                                        class="text-primary">Home
                                                                                        medications:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txthomemedications" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tiền
                                                                                    sử dị ứng/ <span
                                                                                        class="text-primary">Allergies:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtallergies" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tiền
                                                                                    sử bệnh người thân/ <span
                                                                                        class="text-primary">Relevant
                                                                                        family history:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtrelevantfamilyhistory" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Khám
                                                                                    lâm sàng liên quan/ <span
                                                                                        class="text-primary">Physical
                                                                                        examination:</span></label>

                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Kết
                                                                                    quả tìm thấy/ <span
                                                                                        class="text-primary">Findings
                                                                                        (General and Diagnostic
                                                                                        support):</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtfinding" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Yêu
                                                                                    cầu khám chuyên khoa tâm lý/<span
                                                                                        class="text-primary">Psychological
                                                                                        assessment
                                                                                        required:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_required_code_False" runat="server" name="rad_required_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_required_code_False">
                                                        Không/
                                                                                        <span
                                                                                            class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="required_code_field" type="radio" id="rad_required_code_True" runat="server" name="rad_required_code" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_required_code_True">
                                                        Có,
                                                                                        ghi rõ/ <span
                                                                                            class="text-primary">Yes,
                                                                                            specify:</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_required_code" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare1" />
                                                    </a>
                                                </div>
                                                <div class="row par required_code_field">
                                                    <Input:TextField runat="server" ID="txtrequiredtext" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Kết
                                                                                    quả khảo sát/ <span
                                                                                        class="text-primary">Investigations
                                                                                        Results (Labs,
                                                                                        Imaging...):</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtinvestigationsresults" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Chẩn
                                                                                    đoán sơ bộ/ <span
                                                                                        class="text-primary">Initial
                                                                                        diagnosis:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtinitialdiagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Chẩn
                                                                                    đoán phân biệt/ <span
                                                                                        class="text-primary">Differential
                                                                                        diagnosis:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtdiferentialdiagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Bệnh
                                                                                    kèm theo/ <span
                                                                                        class="text-primary">Associated
                                                                                        conditions:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtassociatedconditions" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Chuẩn
                                                                                    đoán xác định/ <span
                                                                                        class="text-primary">Confirmed
                                                                                        Diagnosis:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtcomfirmeddiagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Ý kiến
                                                                                    của bác sĩ chuyên khoa/ <span
                                                                                        class="text-primary">Specialist
                                                                                        opinion:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_specialist_opinion_False" runat="server" name="rad_specialist_opinion" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_specialist_opinion_False">
                                                        Không/
                                                                                        <span
                                                                                            class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="specialist_opinion_field" type="radio" id="rad_specialist_opinion_True" runat="server" name="rad_specialist_opinion" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_specialist_opinion_True">
                                                        Có/
                                                                                        <span
                                                                                            class="text-primary">Yes</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_specialist_opinion" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare2" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 specialist_opinion_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tên
                                                                                    của bác sĩ chuyên khoa/ Khoa/ <span
                                                                                        class="text-primary">Name of the
                                                                                        specialist/
                                                                                        Department:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtnameofspecialist" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row specialist_opinion_field">
                                            <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                        liên hệ/ <span
                                                                                            class="text-primary">Time
                                                                                            contacted:</span></label>

                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_time_contaced" />
                                                </div>
                                            </div>

                                            <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                                <div class="w-sm-7">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                        khám/ <span
                                                                                            class="text-primary">Time
                                                                                            provided:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_time_provided" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 specialist_opinion_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tóm
                                                                                    tắt ý kiến của bác sĩ chuyên
                                                                                    khoa/ <span
                                                                                        class="text-primary">Specialist
                                                                                        opinion
                                                                                        summarised:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtspecopinionsummarised" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Kế
                                                                                    hoạch chăm sóc/ <span
                                                                                        class="text-primary">Care
                                                                                        Plan:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    1.
                                                                                    Điều trị tại khoa cấp cứu/ <span
                                                                                        class="text-primary">Treatment
                                                                                        in Emergency</span></label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:UpdatePanel ID="updatePanel_Treatment" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:GridView ShowHeaderWhenEmpty="true" ID="grid_Treatment" runat="server" OnRowDeleting="grid_Treatment_RowDeleting" OnRowUpdating="gridTreatment_RowUpdating" OnRowDataBound="gridTreatment_RowDataBound" CssClass="tb-responsive" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 105px" class="text-primary pt-2 pb-2">
                                                                            Time
                                                                        </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <telerik:RadDateTimePicker ID="time" SelectedDate='<%# DateTime.Parse(Eval("time").ToString()) %>' Width="200px" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 285px" class="text-primary">
                                                                            Medication and Fluid
                                                                        </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <Input:TextField runat="server" Value='<%#Eval("medication") %>' DataKey="medication" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 80px" class="text-primary">
                                                                        Dose</span>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <Input:TextField runat="server" Value='<%#Eval("dose") %>' DataKey="dose" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 80px" class="text-primary">
                                                                        Route</span>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <Input:TextField runat="server" Value='<%#Eval("route") %>' DataKey="route" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px" class="text-primary">
                                                                        Comment</span>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <Input:TextField runat="server" Value='<%#Eval("comment") %>' DataKey="comment" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:UpdateProgress ID="updateProgress_Treatment" runat="server" AssociatedUpdatePanelID="updatePanel_Treatment">
                                                            <ProgressTemplate>
                                                                Please wait....
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                        <div class="mt-2">
                                                            <asp:Button ID="btn_grid_Treatment_add" runat="server" CssClass="btn btn-sm btn-outline-primary " OnClick="btn_grid_Treatment_add_Click" Text="Add row" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btn_grid_Treatment_add" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold pl-4">
                                                    Progress
                                                                                    Note</label>
                                            </div>
                                            <div class="col-md-12">
                                                <asp:UpdatePanel ID="updatePanel_ProgressNote" runat="server" UpdateMode="Always">
                                                    <ContentTemplate>
                                                        <asp:GridView ShowHeaderWhenEmpty="true" ID="grid_progress_note" runat="server" OnRowDeleting="grid_progress_note_RowDeleting" OnRowUpdating="gridTreatment_RowUpdating" OnRowDataBound="gridTreatment_RowDataBound" CssClass="tb-responsive" AutoGenerateColumns="false">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 105px" class="text-primary pt-2 pb-2">
                                                                            Time
                                                                        </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <telerik:RadDateTimePicker ID="time" SelectedDate='<%# DateTime.Parse(Eval("time").ToString()) %>' Width="200px" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px" class="text-primary">
                                                                            Progress
                                                                        </div>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <Input:TextField runat="server" Value='<%#Eval("progress") %>' DataKey="progress" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField>
                                                                    <HeaderTemplate>
                                                                        <div style="width: 300px" class="text-primary">
                                                                        Appropriate Order
                                                                                                                    </span>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <Input:TextField runat="server" Value='<%#Eval("appropriate_order") %>' DataKey="appropriate_order" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:UpdateProgress ID="updateProgress_ProgressNote" runat="server" AssociatedUpdatePanelID="updatePanel_ProgressNote">
                                                            <ProgressTemplate>
                                                                Please wait....
                                                            </ProgressTemplate>
                                                        </asp:UpdateProgress>
                                                        <div class="mt-2">
                                                            <asp:Button ID="btn_grid_progress_note_add" runat="server" CssClass="btn btn-sm btn-outline-primary" Text="Add row" OnClick="btn_grid_progress_note_add_Click" />
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btn_grid_progress_note_add" EventName="Click" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </div>

                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Kết
                                                                                    luận sau điều trị/ <span
                                                                                        class="text-primary">Conclusions
                                                                                        at termination of
                                                                                        treatmen:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtconclusions" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">
                                                    2.
                                                                                    Xuất viện/ <span
                                                                                        class="text-primary">Discharge:</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_discharge_False" runat="server" name="rad_discharge" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_discharge_False">
                                                        Không/
                                                                                        <span
                                                                                            class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="discharge_field" type="radio" id="rad_discharge_True" runat="server" name="rad_discharge" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_discharge_True">
                                                        Có/
                                                                                        <span
                                                                                            class="text-primary">Yes</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_discharge" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare3" />
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 discharge_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Toa
                                                                                    thuốc/ <span
                                                                                        class="text-primary">Prescription:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtprescription" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 discharge_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Ghi rõ
                                                                                    các hướng dẫn chăm sóc tiếp theo/
                                                                                    <span class="text-primary">Specify
                                                                                        follow-up care
                                                                                        instructions:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtspecifycareinstructions" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row discharge_field">
                                            <div class="col-md-12 mb-2 d-lg-flex ">
                                                <div class="w-lg-8">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                        rời khỏi khoa cấp cứu/ <span
                                                                                            class="text-primary">Discharge
                                                                                            Time:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_discharge_time" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">
                                                    3.
                                                                                    Chuyển sang khám ngoại trú/ <span
                                                                                        class="text-primary">Referred to
                                                                                        OPD:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_referred_OPD_False" runat="server" name="rad_referred_opd" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_referred_OPD_False">
                                                        Không/
                                                                                        <span
                                                                                            class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-2">
                                                    <input disabled-for="referred_opd_field" type="radio" id="rad_referred_OPD_True" runat="server" name="rad_referred_opd" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_referred_OPD_True">
                                                        Có,
                                                                                        Giải thích/ <span
                                                                                            class="text-primary">Yes,
                                                                                            Explain</span></label>
                                                    <a href="javascript:void(0)" style="display: none;" data-clear="rad_referred_opd" onclick="clear_radiobutton(this)">
                                                        <icon:xsquare runat="server" ID="XSquare4" />
                                                    </a>
                                                </div>
                                                <div class="form-group referred_opd_field">
                                                    <Input:TextField runat="server" ID="txtreferredtoOPDtext" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">
                                                    4.
                                                                                    Yêu cầu nhập viện/ <span
                                                                                        class="text-primary">Hospitalisation
                                                                                        required:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_hospitalisation_required_False" runat="server" name="rad_hos_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_hospitalisation_required_False">
                                                        Không/
                                                                                        <span
                                                                                            class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group m-0 p-0 border-0">
                                                    <div class="custom-control custom-radio mb-2">
                                                        <input disabled-for="hos_req_field" type="radio" id="rad_hospitalisation_required_True" runat="server" name="rad_hos_req" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_hospitalisation_required_True">
                                                            Có,
                                                                                            Giải
                                                                                            thích/ <span
                                                                                                class="text-primary">Yes,
                                                                                                Explain</span></label>
                                                        <a href="javascript:void(0)" style="display: none;" data-clear="rad_hos_req" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare5" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row par hos_req_field">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">
                                                    Lý do/
                                                                                    <span
                                                                                        class="text-primary">Reason:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtreason" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row hos_req_field">
                                            <div class="col-md-12 mb-2">
                                                <label class="control-label mb-1">
                                                    Tại
                                                                                    khoa/ <span
                                                                                        class="text-primary">Ward:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtward" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row hos_req_field">
                                            <div class="col-md-12 mb-2 d-lg-flex">
                                                <div class="w-lg-8">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                        rời khỏi khoa cấp cứu/ <span
                                                                                            class="text-primary">Discharge
                                                                                            Time:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_timeofleavingemergency" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">
                                                    5.
                                                                                    Nếu phẫu thuật cấp cứu/ <span
                                                                                        class="text-primary">In case of
                                                                                        emergency
                                                                                        surgery:</span></label>
                                                <p>
                                                    Khi không có thời gian để ghi nhận đầy đủ bệnh sử và kết quả khám lâm sàng của bệnh nhân cần phẫ̃u thuật cấp cứu, vui lòng ghi rõ:
                                                    <br />
                                                    <span class="text-primary">When
                                                                                        there is no time to record the
                                                                                        complete history and physical
                                                                                        examination of a patient
                                                                                        requiring emergency surgery,
                                                                                        indicate </span>
                                                </p>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_emergency_surgery_False" runat="server" name="rad_emr_sur" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_emergency_surgery_False">
                                                        Không/
                                                                                        <span
                                                                                            class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group m-0 p-0 border-0">
                                                    <div class="custom-control custom-radio mb-2">
                                                        <input disabled-for="emr_sur_field" type="radio" id="rad_emergency_surgery_True" runat="server" name="rad_emr_sur" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_emergency_surgery_True">
                                                            Có,
                                                                                            Giải
                                                                                            thích/ <span
                                                                                                class="text-primary">Yes,
                                                                                                Explain</span></label>
                                                        <a href="javascript:void(0)" style="display: none;" data-clear="rad_emr_sur" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare6" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row par emr_sur_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Chẩn
                                                                                    đoán trước phẫu thuật/ <span
                                                                                        class="text-primary">Pre-operative
                                                                                        diagnosis:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtpreoperative_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 emr_sur_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tóm
                                                                                    tắt bệnh án/ <span
                                                                                        class="text-primary">Brief
                                                                                        summary:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtprebrief_summary" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row emr_sur_field">
                                            <div class="col-md-12 mb-2 d-lg-flex">
                                                <div class="w-lg-8">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                        rời khỏi khoa cấp cứu/ <span
                                                                                            class="text-primary">Time of
                                                                                            leaving
                                                                                            Emergency:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_time_of_leaving_emer_e" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">
                                                    6.
                                                                                    Nếu chuyển đến BV khác/ <span
                                                                                        class="text-primary">In case of
                                                                                        transfer to another
                                                                                        hospital:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" id="rad_transfer_hospital_False" runat="server" name="rad_transfer_hos" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_transfer_hospital_False">
                                                        Không/
                                                                                        <span
                                                                                            class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group m-0 p-0 border-0">
                                                    <div class="custom-control custom-radio mb-2">
                                                        <input disabled-for="transfer_hos_field" type="radio" id="rad_transfer_hospital_True" runat="server" name="rad_transfer_hos" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_transfer_hospital_True">
                                                            Có,
                                                                                            Giải thích/ <span
                                                                                                class="text-primary">Yes,
                                                                                                Explain</span></label>
                                                        <a href="javascript:void(0)" style="display: none;" data-clear="rad_transfer_hos" onclick="clear_radiobutton(this)">
                                                            <icon:xsquare runat="server" ID="XSquare7" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 transfer_hos_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Lý do
                                                                                    chuyển viện/ <span
                                                                                        class="text-primary">Reason for
                                                                                        transfer:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" id="txtreasonfor_transfer" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 transfer_hos_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tình
                                                                                    trạng trước khi chuyển viện/ <span
                                                                                        class="text-primary">Status
                                                                                        before transfer:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtstatus_before_transfer" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row transfer_hos_field">
                                            <div class="col-md-12 mb-2 d-lg-flex">
                                                <div class="w-lg-9">
                                                    <label class="control-label mb-1">
                                                        Giờ
                                                                                        rời khỏi khoa cấp cứu/ <span
                                                                                            class="text-primary">Time of
                                                                                            leaving
                                                                                            Emergency:</span></label>
                                                </div>
                                                <div class="form-group">
                                                    <telerik:RadDateTimePicker runat="server" Width="200px" ID="rad_time_of_leaving_emer_a" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Tình
                                                                                    trạng của bệnh nhân khi xuất viện/
                                                                                    <span class="text-primary">Patient's
                                                                                        Condition at
                                                                                        Discharge:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server"
                                                        id="cb_patient_discharge_IMP"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Có
                                                                                        cải thiện/ <span
                                                                                            class="text-primary">Improved</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server"
                                                        id="cb_patient_discharge_UNC"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Không
                                                                                        thay đổi/ <span
                                                                                            class="text-primary">Unchanged</span></span>
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox"
                                                        runat="server"
                                                        id="cb_patient_discharge_UNS"
                                                        class="custom-control-input" />
                                                    <span
                                                        class="custom-control-label">Không
                                                                                        ổn định/ <span
                                                                                            class="text-primary">Unstable</span></span>
                                                </label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">
                                                    Mã
                                                                                    ICD-10/ <span
                                                                                        class="text-primary">ICD-10
                                                                                        Code(S):</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txticd_10" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-actions mb-3">
                                        <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                        <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                        <asp:Button ID="btnDelete" data-target="#exampleModalCenter" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-danger" runat="server" Text="Delete" />

                                        <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                        <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server" OnClick="btnPrint_Click" Text="Print" />

                                        <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                                    </div>

                                    <asp:UpdatePanel ID="updatePanelDeleteReason" runat="server" UpdateMode="Always">
                                        <ContentTemplate>
                                            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLongTitle">Delete document</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span
                                                                    aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <p runat="server">
                                                                Please provide reason for deletion
                                                            </p>
                                                            <div class="form-group mb-2">
                                                                <Input:TextField runat="server" ID="TextField1" />
                                                            </div>
                                                            <div id="Div1" class="text-danger" runat="server">
                                                                Nội dung lý do xóa phải trên 3 ký tự
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button onserverclick="btnDelete_Click" class="btn btn-danger" runat="server">Delete</button>
                                                            <button id="btnClose" data-dismiss="modal" class="btn btn-secondary">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                    <asp:PostBackTrigger ControlID="btnAmend" />
                    <asp:PostBackTrigger ControlID="btnCancel" />
                    <asp:PostBackTrigger ControlID="btnComplete" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
    <script>
        let alertBox = document.getElementById("MessagePlaceHolder");

        setTimeout(function () {
            alertBox.style.top = "0";
        }, 2000);
    </script>
    <script src="../../scripts/jquery-3.2.1.min.js"></script>
    <script src="../../scripts/bootstrap.min.js"></script>
    <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
    <script src="../../scripts/contenteditable.min.js"></script>
</body>

</html>
