<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatIniNurAss.aspx.cs" Inherits="EMR.OutPathIniNurAss" ValidateRequest="false" %>


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




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../style/style-custom.css" rel="stylesheet" />

</head>
<body>
    <webUI:PrintWindow runat="server" ID="PrintWindow">
        <PrintHeader>
            <img style="width: 200px" src="../images/AIH_PI_FULL.png" />
            <div style="flex-grow: 1; text-align: center;">
                <div style="color: #007297; font-size: 26.6667px;">GIẤY CHỨNG NHẬN ĐIỀU TRỊ</div>
            <div style="color: #e20e5a; font-size: 16.6667px;">MEDICAL CERTIFICATE</div>
            </div>
            <div style="width: 200px; text-align: center">
                <div>MAI MAI MÃI1</div>
                <div>05-10-1960 | Nữ</div>
                <webUI:Barcode runat="server" id="Barcode" Text="900000488" Width="200" Height="40" />
                <div>900000488</div>
            </div>
        </PrintHeader>
        <PrintContent>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="BỆNH VIỆN QUỐC TẾ MỸ CHỨNG NHẬN:" SubTitle="AMERICAN INTERNATIONAL HOSPITAL CERTIFIES THAT" />
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-6">
                   <webUI:Label runat="server" Title="Họ tên bệnh nhân:" SubTitle="Patient's name" />
                    <div class="d-inline-block ml-2 align-top">MAI MAI MÃI1</div>
                </div>
                <div class="col-6">
                   <webUI:Label runat="server" Title="Ngày sinh:" SubTitle="DOB" />
                    <div class="d-inline-block ml-2 align-top">05-10-1960</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Giới tính:" SubTitle="Gender" />
                    <webUI:Label runat="server" Title="Nam" SubTitle="Male" />
                    <webUI:Label runat="server" Title="Nữ " SubTitle="Female" />
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-6">
                    <webUI:Label runat="server" Title="Khoa:" SubTitle="Dept" />
                    <div class="d-inline-block ml-2 align-top">Khoa khám bệnh</div>
                </div>
                <div class="col-6">
                    <webUI:Label runat="server" Title="Mã BN:" SubTitle="Patient ID" />
                    <div class="d-inline-block ml-2 align-top">900000488</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Đã đến khám và điều trị tại bệnh viện của chúng tôi, với những thông tin như sau:" SubTitle="Visited and received treatment at our hospital, with the following information" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Ngày khám bệnh:" SubTitle="Date of visit" />
                    <div class="d-inline-block ml-2 align-top">05-03-2021</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Lý do đến khám:" SubTitle="Chief complaint" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Tóm tắt bệnh sử:" SubTitle="History of present illness" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Tiền sử bệnh:" SubTitle="Past history" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Đặc điểm lâm sàng:" SubTitle="Clinical findings" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Cận lâm sàng được chỉ định:" SubTitle="Para-clinical investigations" />
                    <div class="d-inline-block ml-2 align-top">None;</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Chẩn đoán:" SubTitle="Diagnosis" />
                    <div class="d-inline-block ml-2 align-top">J01.0: Acute maxillary sinusitis/ Viêm xoang hàm cấp;;</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Phương pháp và thuốc điều trị:" SubTitle="Treatment and medications" />
                    <div class="d-inline-block ml-2 align-top">Paracetamol (Perfalgan) 10mg/ml;;</div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Thời gian điều trị:" SubTitle="Treatment period" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-12">
                   <webUI:Label runat="server" Title="Lời khuyên và theo dõi:" SubTitle="Recommendation and Follow-up" />
                    <div class="d-inline-block ml-2 align-top"></div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-6">

                </div>
                <div class="col-6 mb-2">
                    <div>
                        <webUI:Signature runat="server" Title="BÁC SĨ ĐIỀU TRỊ" SubTitle="ATTENDING DOCTOR" FullName="Dr. Nguyen Dinh My">
                            <ItemTemplate>
                                <webUI:Date runat="server" Day="23" Month="5" Year="2021" />
                            </ItemTemplate>
                        </webUI:Signature>
                    </div>
                </div>
            </div>

        </PrintContent>
    </webUI:PrintWindow>

    <div class="cssclsNoPrint">
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->

        <form method="post" action="#" id="form2" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
            <div class="scroll-sidebar h-100 w-100">
                <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                        <asp:Panel runat="server" ID="messagePlaceHolder">
                            <webUI:AmendReason runat="server" ID="txt_amendReason" />
                        </asp:Panel>

                        <webUI:PatientInfo runat="server" ID="PatientInfo1" />

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">Outpatient Initial Nursing Assessment</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                    </div>

                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body mb-4">

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-2 font-bold">I. DẤU HIỆU SINH TỒN/ <span class="text-primary">Vital signs</span></label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label w-6 mb-1">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                    <div class="form-group w-4">
                                                        <input id="txtTemperature" runat="server" class="form-control text-right" />
                                                        <span class="append">°C</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label w-6 mb-1">Nhịp tim/ <span class="text-primary">rate:</span></label>
                                                    <div class="form-group w-5">
                                                        <input id="txtHeartRate" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label w-6 mb-1 ">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                    <div class="form-group w-4">
                                                        <input id="txtWeight" runat="server" class="form-control text-right" />
                                                        <span class="append">Kg</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label w-6 mb-1">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                    <div class="form-group w-5">
                                                        <input id="txtRespiratoryRate" runat="server" class="form-control text-right" />
                                                        <span class="append">/phút (m)</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label w-6 mb-1 ">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                    <div class="form-group w-4">
                                                        <input id="txtHeight" maxlength="3" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label class="control-label w-6 mb-1">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                    <div class="form-group w-5">
                                                        <input id="txtBloodPressure" runat="server" class="form-control text-right" />
                                                        <span class="append">mmHg</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2">
                                                    <div class="d-flex no-block">
                                                        <label for="bmi" class="control-label w-6 mb-1">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                        <div class="form-group w-5">
                                                            <input id="txtBmi" runat="server" class="form-control text-right" disabled="disabled" />
                                                            <span class="append">(Kg/m <sup>2</sup>)</span>
                                                            <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                                                <script type="text/javascript">

                                                                    document.getElementById('txtHeight').addEventListener("change", function (e) {
                                                                        document.getElementById('txtBmi').value = CalculateBmi();
                                                                    });

                                                                    document.getElementById('txtWeight').addEventListener("change", function (e) {
                                                                        document.getElementById('txtBmi').value = CalculateBmi();
                                                                    });

                                                                    function CalculateBmi() {
                                                                        if (document.getElementById('txtHeight').value == "" || document.getElementById('txtWeight').value == "") return "";
                                                                        else { return (document.getElementById('txtWeight').value / ((document.getElementById('txtHeight').value / 100) * 2)).toFixed(2) };
                                                                    }

                                                                </script>
                                                            </telerik:RadScriptBlock>
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
                                                        <input id="txtSpo2" runat="server" class="form-control text-right" />
                                                        <span class="append">%</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-sm-6 mb-2 d-flex no-block">
                                                    <label for="head-circumference" class="control-label w-6 mb-1">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                    <div class="form-group w-4">
                                                        <input id="txtPluse" runat="server" class="form-control text-right" />
                                                        <span class="append">cm</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- III. ASSESSMENT --%>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label font-bold">II. ĐÁNH GIÁ/ <span class="text-primary">ASSESSMENT</span></label>
                                                </div>
                                            </div>

                                            <%-- 1. Chief complaint --%>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 font-bold">1. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                    <div class="form-group">
                                                        <webUI:TextField runat="server" id="txtChiefComplaint" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 font-bold">2. Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input type="radio" runat="server" id="radAllergy1" name="radAllergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radAllergy1">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio d-inline-block mr-2">
                                                        <input disabled-for="txtAllergy" type="radio" runat="server" id="radAllergy2" name="radAllergy" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radAllergy2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    </div>
                                                    <div class="form-group txtAllergy">
                                                        <webUI:TextField runat="server" id="txtAllergy" />
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- 3. Allergy --%>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 font-bold">3. Trạng thái tinh thần/ <span class="text-primary">Mental status:</span></label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Đáp ứng phù hợp/ <span class="text-primary">Appropriate response:</span></label>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="radMentalStatus1" name="radMentalStatus" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radMentalStatus1">Có/ <span class="text-primary">Yes</span></label>
                                                    </div>
                                                </div>

                                                <div class="col-md-8">
                                                    <div class="custom-control custom-radio mb-1">
                                                        <input disabled-for="txtMentalStatus" type="radio" runat="server" id="radMentalStatus2" name="radMentalStatus" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radMentalStatus2">Không, ghi rõ/ <span class="text-primary">No, specify:</span></label>
                                                    </div>
                                                    <div class="form-group txtMentalStatus">
                                                        <webUI:TextField runat="server" id="txtMentalStatus" />
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- 4. Pain score --%>
                                            <div class="row mb-2">
                                                <div class="col-md-4">
                                                    <label class="control-label mb-1 font-bold">4. Thang điểm đau/ <span class="text-primary">Pain score:</span></label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input runat="server" class="form-control d-inline-block w-4" id="txtPainCore" />
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <img src="../images/pain_score.png" style="max-width: 720px; width: 100%;" alt="" />
                                                </div>
                                            </div>

                                            <%-- 5. Fall risk MORSE SCALE --%>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 font-bold d-block">5. Tầm soát nguy cơ té ngã/ <span class="text-primary">Fall risk MORSE SCALE:</span></label>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="radFrms1" name="radFrms" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radFrms1">Không có nguy cơ/ <span class="text-primary">No risk</span></label>
                                                    </div>
                                                </div>

                                                <div class="col-md-8">
                                                    <div class="custom-control custom-radio mb-1">
                                                        <input disabled-for="txtFrms" type="radio" runat="server" id="radFrms2" name="radFrms" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radFrms2">Nếu có, cung cấp phương tiện hỗ trợ/ <span class="text-primary">If yes, provide assistance</span></label>
                                                    </div>
                                                    <div class="form-group txtFrms">
                                                        <webUI:TextField runat="server" id="txtFrms" />
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- 6. Nutritional status screening --%>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 font-bold d-block">6. Đánh giá tình trang dinh dưỡng/ <span class="text-primary">Nutritional status screening:</span></label>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="radNss1" name="radNss" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radNss1">Bình thường/ <span class="text-primary">Normal</span></label>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="radNss2" name="radNss" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radNss2">Suy dinh dưỡng/ <span class="text-primary">Malnutrition</span></label>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="radNss3" name="radNss" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radNss3">Thừa cân hoặc béo phì/ <span class="text-primary">Overweight or obesity</span></label>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- III. SOCIAL FACTORS ASSESSMENT (ONLY FOR THE FIRST VISIT) --%>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label font-bold d-block">III. ĐÁNH GIÁ CÁC YẾU TỐ XÃ HỘI CỦA NGƯỜI BỆNH (DUY NHẤT CHO LẦN KHÁM ĐẦU TIÊN)/ <span class="text-primary">SOCIAL FACTORS ASSESSMENT (ONLY FOR THE FIRST VISIT):</span></label>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1">Tình trạng sinh sống/ <span class="text-primary">Housing</span></label>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="radHousing1" name="radHousing" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radHousing1">Sống một mình/ <span class="text-primary">Lives alone</span></label>
                                                    </div>
                                                </div>

                                                <div class="col-md-8">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="radHousing2" name="radHousing" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radHousing2">Sống với người thân/ <span class="text-primary">With relatives</span></label>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- IV. PRIORITIZATION --%>
                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 font-bold d-block">IV.	MỨC ĐỘ ƯU TIÊN/ <span class="text-primary">PRIORITIZATION:</span></label>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="radPrior1" name="radPrior" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radPrior1">Cần được khám ngay/ <span class="text-primary">Immediate consulting requirement</span></label>
                                                    </div>
                                                </div>

                                                <div class="col-md-8">
                                                    <div class="custom-control custom-radio">
                                                        <input type="radio" runat="server" id="radPrior2" name="radPrior" class="custom-control-input" />
                                                        <label class="custom-control-label" for="radPrior2">Có thể chờ khám trong khoảng thời gian xác định/ <span class="text-primary">Be able to wait for consultation at a specific time</span></label>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <fieldset class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-actions">
                                                    <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />
                                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />
                                                    <button type="button" id="btnDeleteModal" runat="server" class="btn btn-danger" data-toggle="modal" data-target="#myModal">Delete</button>
                                                    <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />
                                                    <asp:Button ID="btnPrint" OnClientClick="window.print()" CssClass="btn btn-secondary" runat="server" Text="Print" />
                                                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" CssClass="btn btn-secondary" runat="server" Text="Cancel" />
                                                </div>
                                            </div>
                                        </fieldset>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="btnSave" />
                        <asp:PostBackTrigger ControlID="btnAmend" />
                        <asp:PostBackTrigger ControlID="btnCancel" />
                        <asp:PostBackTrigger ControlID="btnComplete" />
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
