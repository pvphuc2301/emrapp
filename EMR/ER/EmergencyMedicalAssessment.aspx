<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmergencyMedicalAssessment.aspx.cs" Inherits="EMR.EmergencyMedicalAssessment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <link href="../../styles/style.css" rel="stylesheet" />
        <link href="../../styles/myStyle.css" rel="stylesheet" />
        <link href="../../style/style-custom.css" rel="stylesheet" />
    </head>
    <body>
        <form id="form1" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
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
            <div class="scroll-sidebar h-100 w-100">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header bg-primary">
                                <h4 class="m-b-0 text-white font-bold">EMERGENCY MEDICAL ASSESSMENT</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-body">
                                         
                                    <div class="col-md-12 mb-2 d-lg-flex">
                                        <div class="w-sm-10">
                                            <label class="control-label">Ngày, giờ bắt đầu đánh giá/ <span class="text-primary">Starting date, time of the assessmen:</span></label>
                                        </div>
                                        <div class="form-group">
                                            <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker7" runat="server" ></telerik:RadDatePicker>
                                            <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker10" runat="server" ></telerik:RadTimePicker>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Lý do đến khám/ <span class="text-primary">Chief complaint/ Reason of consultation:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox3" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-2">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_chief_complaint1" name="rad_chief_complaint" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_chief_complaint1">Hồi sức/ <span class="text-primary">Resuscitation</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_chief_complaint2" name="rad_chief_complaint" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_chief_complaint2">Cấp cứu/ <span class="text-primary">Emergency</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_chief_complaint3" name="rad_chief_complaint" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_chief_complaint3">Khẩn trương/ <span class="text-primary">Urgent</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_chief_complaint4" name="rad_chief_complaint" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_chief_complaint4">Trì hoãn/ <span class="text-primary">Less Urgent</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_chief_complaint5" name="rad_chief_complaint" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_chief_complaint5">Không cấp cứu/ <span class="text-primary">Non-Urgent</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Bệnh Sử/ <span class="text-primary">History of present illness (HPI):</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox1" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tiền sử bệnh/ <span class="text-primary">Past medical history (PMH):</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox2" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Meds:</label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox4" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Surgical:</label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox5" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">Thói quen/ <span class="text-primary">Habits:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Alcohol/ <span class="text-primary">Rượu</span></span>
                                            </label>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Smoking/ <span class="text-primary">Thuốc</span></span>
                                            </label>
                                        </div>
                                        <div class="col-md-4">
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label">Chất gây nghiện/ <span class="text-primary">Drugs</span></span>
                                            </label>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Khác, ghi rõ/ <span class="text-primary">Other, specify:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox6" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Thuốc dùng tại nhà/ <span class="text-primary">Home medications:</span></label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tiền sử dị ứng/ <span class="text-primary">Allergies:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox7" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tiền sử bệnh người thân/ <span class="text-primary">Relevant family history:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox8" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Khám lâm sàng liên quan/ <span class="text-primary">Physical examination:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox9" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Kết quả tìm thấy/ <span class="text-primary">Findings (General and Diagnostic support):</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox10" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
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
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox
                                                    RenderMode="Lightweight"
                                                    Width="100%"
                                                    runat="server"
                                                    ID="RadTextBox11"
                                                    EmptyMessage=""
                                                    TextMode="MultiLine"
                                                    Resize="None"
                                                    CssClass="form-control par"
                                                    disabled="disabled"
                                                ></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Kết quả khảo sát/ <span class="text-primary">Investigations Results (Labs, Imaging...):</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox12" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Chẩn đoán sơ bộ/ <span class="text-primary">Initial diagnosis:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox13" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox14" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox15" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
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
                                                <input disabled-for="specialist_opinion" type="radio" id="rad_specialist_opinion2" name="rad_specialist_opinion" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_specialist_opinion2">Có/ <span class="text-primary">Yes</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tên của bác sĩ chuyên khoa/ Khoa/ <span class="text-primary">Name of the specialist/ Department:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox16" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control specialist_opinion" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Giờ liên hệ/ <span class="text-primary">Time contacted:</span></label>

                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTimePicker RenderMode="Classic" ID="RadTimePicker1" runat="server" ></telerik:RadTimePicker>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-6 col-lg-6 mb-2 d-lg-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Giờ khám/ <span class="text-primary">Time provided:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTimePicker RenderMode="Classic" ID="RadTimePicker2" runat="server" ></telerik:RadTimePicker>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tóm tắt ý kiến của bác sĩ chuyên khoa/ <span class="text-primary">Specialist opinion summarised:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox17" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control specialist_opinion"></telerik:RadTextBox>
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
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">Time</label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">Medication and Fluid</label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">Dose</label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">HR bpm</label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">Route</label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">Comments</label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1" style="width: 243px">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadTimePicker4" runat="server" ></telerik:RadDatePicker>
                                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker3" runat="server" ></telerik:RadTimePicker>
                                                                </div>
                                                            </td>
                                                            <td class="p-1">
                                                                <div class="form-group">
                                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox29" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control specialist_opinion"></telerik:RadTextBox>
                                                                </div>
                                                            </td>
                                                            <td class="p-1">
                                                                <div class="form-group">
                                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox30" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control specialist_opinion"></telerik:RadTextBox>
                                                                </div>
                                                            </td>
                                                            <td class="p-1">
                                                                <div class="form-group">
                                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox31" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control specialist_opinion"></telerik:RadTextBox>
                                                                </div>
                                                            </td>
                                                            <td class="p-1">
                                                                <div class="form-group">
                                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox32" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control specialist_opinion"></telerik:RadTextBox>
                                                                </div>
                                                            </td>
                                                            <td class="p-1">
                                                                <div class="form-group">
                                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox33" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control specialist_opinion"></telerik:RadTextBox>
                                                                </div>
                                                            </td>
                                                            <td class="p-1">
                                                                x
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="12">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <button class="btn btn-primary">New row</button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-2 font-bold pl-4">Progress Note</label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">Time</label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">Progress</label>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <label class="control-label mb-2">Progress</label>
                                                                </div>
                                                            </td>
                                                            <td>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="p-1" style="width: 243px">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker1" runat="server" ></telerik:RadDatePicker>
                                                                    <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker5" runat="server" ></telerik:RadTimePicker>
                                                                </div>
                                                            </td>
                                                            <td class="p-1">
                                                                <div class="form-group">
                                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox34" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control specialist_opinion"></telerik:RadTextBox>
                                                                </div>
                                                            </td>
                                                            <td class="p-1">
                                                                <div class="form-group">
                                                                    <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox35" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control specialist_opinion"></telerik:RadTextBox>
                                                                </div>
                                                            </td>
                                                            <td class="p-1">
                                                                x
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">
                                                                <div class="form-group p-0 m-0 border-0">
                                                                    <button class="btn btn-primary">New row</button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Kết luận sau điều trị/ <span class="text-primary">Conclusions at termination of treatmen:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox18" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">2. Xuất viện/ <span class="text-primary">Discharge:</span></label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Toa thuốc/ <span class="text-primary">Prescription:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox19" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Ghi rõ các hướng dẫn chăm sóc tiếp theo/ <span class="text-primary">Specify follow-up care instructions:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox20" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 mb-2 d-lg-flex">
                                        <div class="w-lg-8">
                                            <label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Discharge Time:</span></label>
                                        </div>
                                        <div class="form-group">
                                            <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker4" runat="server" ></telerik:RadDatePicker>
                                            <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker7" runat="server" ></telerik:RadTimePicker>
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
                                                <input disabled-for="referred_opd" type="radio" id="rad_referred_opd2" name="rad_referred_opd" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_referred_opd2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox21" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control referred_opd" disabled="disabled"></telerik:RadTextBox>
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
                                                    <input disabled-for="hos_req" type="radio" id="rad_hos_req2" name="rad_hos_req" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_hos_req2">Có, Giải thích/ <span class="text-primary">Yes, Explain</span></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Lý do/ <span class="text-primary">Reason:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox22" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control hos_req" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tại khoa/ <span class="text-primary">Ward:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox23" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control hos_req" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-2 d-lg-flex">
                                            <div class="w-lg-8">
                                                <label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Discharge Time:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker5" runat="server" ></telerik:RadDatePicker>
                                                <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker8" runat="server" ></telerik:RadTimePicker>
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
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Chẩn đoán trước phẫu thuật/ <span class="text-primary">Pre-operative diagnosis:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox24" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tóm tắt bệnh án/ <span class="text-primary">Brief summary:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox25" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                        <div class="row">
                                            <div class="col-md-12 mb-2 d-lg-flex">
                                            <div class="w-lg-8">
                                                <label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Time of leaving Emergency:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker3" runat="server" ></telerik:RadDatePicker>
                                                <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker6" runat="server" ></telerik:RadTimePicker>
                                            </div>
                                        </div>
                                        </div>
                                        

                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 font-bold">6. Nếu chuyển đến BV khác/ <span class="text-primary">In case of transfer to another hospital:</span></label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Lý do chuyển viện/ <span class="text-primary">Reason for transfer:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox26" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Tình trạng trước khi chuyển viện/ <span class="text-primary">Status before transfer:</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox27" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 mb-2 d-lg-flex">
                                            <div class="w-lg-9">
                                                    <label class="control-label mb-1">Giờ rời khỏi khoa cấp cứu/ <span class="text-primary">Time of leaving Emergency:</span></label>
                                            </div>
                                            <div class="form-group">
                                                <telerik:RadDatePicker Width="120px" RenderMode="Classic" ID="RadDatePicker6" runat="server" ></telerik:RadDatePicker>
                                                <telerik:RadTimePicker Width="110px" RenderMode="Classic" ID="RadTimePicker9" runat="server" ></telerik:RadTimePicker>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Tình trạng của bệnh nhân khi xuất viện/ <span class="text-primary">Patient's Condition at Discharge:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_con_discharge1" name="rad_con_discharge" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_con_discharge1">Có cải thiện/ <span class="text-primary">Improved</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_con_discharge2" name="rad_con_discharge" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_con_discharge2">Không thay đổi/ <span class="text-primary">Unchanged</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_con_discharge3" name="rad_con_discharge" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_con_discharge3">Không ổn định/ <span class="text-primary">Unstable</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="control-label mb-1">Mã ICD-10/ <span class="text-primary">ICD-10 Code(S):</span></label>
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox28" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-actions mb-3">
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Complete</button>
                                        <button type="submit" class="btn btn-primary"><i class="fa fa-check"></i> Save</button>
                                        <button type="button" class="btn btn-secondary">Revert</button>
                                        <button type="button" class="btn btn-secondary">Delete</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->

            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- End Wrapper -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- All Jquery -->
            <!-- ============================================================== -->
        </form>

        <script src="../../scripts/jquery-3.2.1.min.js"></script>
        <script src="../../scripts/popper.min.js"></script>
        <script src="../../scripts/bootstrap.min.js"></script>
        <script src="../../scripts/perfect-scrollbar.jquery.min.js"></script>
        <script src="../../scripts/custom.js"></script>
        <script src="../../scripts/myScript.js"></script>
    </body>
</html>
