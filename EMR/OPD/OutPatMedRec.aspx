<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatMedRec.aspx.cs" Inherits="EMR.OutpatientMedicalRecord" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

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
                    <!-- Row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header bg-primary">
                            <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                <h4 class="m-b-0 text-white font-bold">Outpatient Medical Record</h4>
                            </a>
                        </div>
                        <div class="card-body collapse show" id="collapseTwo">
                            <form action="#" class="form-horizontal form-bordered">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-12 col-lg-6 mb-2 d-sm-flex">
                         m                   <div class="w-sm-7">
                                                <label class="control-label mb-1">Họ tên người bệnh /<span class="text-primary">Paitent's Name:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <%--<telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="txtPatientName" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadTextBox>--%>
                                                  <telerik:RadLabel RenderMode="Lightweight" runat="server" ID="lblPatientName" EmptyMessage="" TextMode="SingleLine" Width="100%" Resize="None" CssClass="form-control"></telerik:RadLabel>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-4 col-lg-6 mb-2 d-md-block d-lg-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Ngày tháng năm sinh /<span class="text-primary">DOB:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadDatePicker RenderMode="Classic" Width="150px" ID="RadDatePicker2" runat="server"></telerik:RadDatePicker>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-4 col-lg-6 mb-2 d-md-block d-lg-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Giới tính /<span class="text-primary">Gender:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="rad_gender1" name="rad_gender" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_gender1">Nam/ <span class="text-primary">Male</span></label>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <div class="custom-control custom-radio">
                                                            <input type="radio" id="rad_gender2" name="rad_gender" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_gender2">Nữ/ <span class="text-primary">Female</span></label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-12 col-md-4 col-lg-6 mb-2 d-sm-flex d-md-block d-lg-flex">
                                            <div class="w-sm-7">
                                                <label class="control-label mb-1">Mã số người bệnh/ <span class="text-primary">PID:</span></label>
                                            </div>
                                            <div class="form-group flex-grow-1">
                                                <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="RadTextBox35" EmptyMessage="" TextMode="SingleLine" Resize="None" Width="100%" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-2 font-bold">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                    
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="lbl_chief_complain" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-2 font-bold">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1 font-bold">1. Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox4" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                    
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox5" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
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
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox6" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label">Bệnh lý/ <span class="text-primary">Diseases:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox7" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label">Phẫu thuật/ <span class="text-primary">Operation:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox8" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label">Chấn thương/ <span class="text-primary">Trauma:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox9" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>
                                            
                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-labelfont-bold">Quá trình sinh trưởng và phát triển/ <span class="text-primary">Growth and Development:</span></label>
                                        </div>
                                    </div>
                                            
                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1 mr-2">Con thứ mấy/ <span class="text-primary">Birth order:</span></label>
                                            <label class="custom-control custom-checkbox m-b-0 d-inline">
                                                <input type="checkbox" class="custom-control-input" />
                                                <span class="custom-control-label"></span>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label">Phương pháp sanh/ <span class="text-primary">Delivery mode:</span></label>
                                        </div>
                                    </div>
                                            
                                    <div class="row mb-2">
                                        <div class="col-md-6"> 
                                            <label class="control-label mb-1">Sanh ngã âm đạo/ <span class="text-primary">Vaginal delivery:</span></label>
                                            <select class="custom-select">
                                                <option selected="">...</option>
                                                <option value="1">Sanh tự nhiên/ Spontaneous</option>
                                                <option value="2">Sanh hút/ Vacuum-assisted</option>
                                                <option value="3">Sanh kềm/ Forceps-assisted</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6"> 
                                            <label class="control-label mb-1">C- Sanh mổ/ <span class="text-primary">Section:</span></label>
                                            <select class="custom-select">
                                                <option selected="">...</option>
                                                <option value="1">Mổ chương trình/ Elective</option>
                                                <option value="2">Mổ cấp cứu/ Emergency</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Cân nặng lúc sinh/ <span class="text-primary">Weight of Birth:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox10" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Dị tật bẩm sinh/ <span class="text-primary">Congenital malformation:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox11" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Phát triển về tinh thần/ <span class="text-primary">Neurological development:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox12" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Phát triển về vận động/ <span class="text-primary">Motor development:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox13" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Chế độ dinh dưỡng/ <span class="text-primary">Regimen:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox14" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Tiêm chủng/ <span class="text-primary">Immunization:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox15" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox16" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
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
                                            <label class="control-label font-bold">DẤU HIỆU SINH TỒN/ <span class="text-primary">VITAL SIGNS:</span></label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                            <div class="form-group">
                                            <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_temperature" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            <span class="append">°C</span>
                                        </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Mạch/ <span class="text-primary">Pulse:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_pulse" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_weight" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">Kg</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_respiratory_rate" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">/phút (m)</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Chiều cao/ <span class="text-primary">Height:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_height" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">cm</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_blood_pressure" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">mmHg</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Chỉ số khối cơ thể/ <span class="text-primary">BMI:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_bmi" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">(Kg/m <sup>2</sup>)</span>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 mb-2">
                                            <label class="control-label mb-1">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="txt_spo2" EmptyMessage="" TextMode="SingleLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                                <span class="append">%</span>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Tổng trạng/ <span class="text-primary">General appearance:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox17" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Hệ tim mạch/ <span class="text-primary">Cardiovascular system:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox18" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Hệ hô hấp/ <span class="text-primary">Respiratory system:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox19" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Hệ tiêu hóa/ <span class="text-primary">Digestive system:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox20" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Hệ thần kinh/ <span class="text-primary">Nervous system:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox21" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>
                                            
                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Hệ niệu-dục/ <span class="text-primary">Urogenital system:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_urogenital_system1" name="rad_urogenital_system" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_urogenital_system1">Nam/ <span class="text-primary">Male</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_urogenital_system2" name="rad_urogenital_system" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_urogenital_system2">Nữ/ <span class="text-primary">Female</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Hệ cơ-xương-khớp/ <span class="text-primary">Musculoskeletal system:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox22" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>
                                            
                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Tai Mũi Họng/ <span class="text-primary">Otorhinolaryngology:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox23" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>
                                            
                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Hệ da-lông/ <span class="text-primary">Integumentary system:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox24" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>
                                            
                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Mắt/ <span class="text-primary">Ophthalmology:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox25" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>
                                            
                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Ghi nhận khác/ <span class="text-primary">Other findings:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox26" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>
                                            
                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological consultation required:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_pcr1" name="rad_pcr" class="custom-control-input"  />
                                                <label class="custom-control-label" for="rad_pcr1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_pcr2" name="rad_pcr" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_pcr2">Có/ <span class="text-primary">Yes</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label font-bold">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox27" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label font-bold">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                        </div>
                                    </div>
                                            
                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis (ICD 10):</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox28" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis (ICD 10):</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox29" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox30" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label">Kế hoạch điều trị/ <span class="text-primary">Treatment:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_treatment1" name="rad_treatment" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_treatment1">Ngoại trú/ <span class="text-primary">Ambulatory care</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_treatment2" name="rad_treatment" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_treatment2">Nhập viện/ <span class="text-primary">Admission</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_treatment3" name="rad_treatment" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_treatment3">Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" id="rad_sor1" name="rad_sor" class="custom-control-input"  />
                                                <label class="custom-control-label" for="rad_sor1">Không/ <span class="text-primary">No</span></label>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="custom-control custom-radio">
                                                <input disabled-for="sor" type="radio" id="rad_sor2" name="rad_sor" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_sor2">Có/ <span class="text-primary">Yes</span></label>
                                            </div>
                                            <label class="control-label mb-1">Nếu có, ghi rõ/ <span class="text-primary">If yes, specify:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox31" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control sor" disabled="disabled"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox32" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12"> 
                                            <label class="control-label mb-1">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                            <div class="form-group">
                                                <telerik:RadTextBox RenderMode="Lightweight" Width="100%" runat="server" ID="RadTextBox33" EmptyMessage="" TextMode="MultiLine" Resize="None" CssClass="form-control"></telerik:RadTextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-actions mb-3">
                                        <asp:Button runat="server" ID="btn_complete" Text="Complete" CssClass="btn btn-primary" />
                                        <asp:Button runat="server" ID="btn_save" Text="Save" CssClass="btn btn-primary" />
                                        <asp:Button runat="server" ID="btn_revert" Text="Revert" CssClass="btn btn-secondary" />
                                        <asp:Button runat="server" ID="btn_delete" Text="Delete" CssClass="btn btn-secondary" />
                                    </div>


                                </div>
                            </form>
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
    <script src="../../scripts/custom.min.js"></script>
    <script src="../../scripts/myScript.js"></script>
</body>
</html>
