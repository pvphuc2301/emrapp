<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatIniNurAss.aspx.cs" Inherits="EMR.OutPathIniNurAss" ValidateRequest="false" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <link href="../../styles/style-custom.css" rel="stylesheet" />
    <link href="../../styles/telerik-custom.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" method="post">
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
                <div class="col-lg-12" id="accordionExample">
                    <div class="card">
                        <div class="card-header bg-primary">
                            <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <h4 class="m-b-0 text-white font-bold">Patient details</h4>
                            </a>
                        </div>
                        <div class="card-body collapse show" id="collapseOne" aria-labelledby="headingOne">
                            <h4 class="box-title font-bold">Person Info</h4>
                            <hr />
                            <div class="row">
                                <div class="col-sm-6" style="display: flex">
                                    <div class="w-5 text-sm-right">
                                        <label class="control-label text-sm-right mr-3">First Name:</label>
                                    </div>
                                    <div class="flex-grow-1">
                                        <label class="control-label text-sm-right">John</label>
                                    </div>
                                </div>

                                <!--/span-->
                                <div class="col-sm-6" style="display: flex">
                                    <div class="w-5 text-sm-right">
                                        <label class="control-label text-sm-right mr-3">Last Name:</label>
                                    </div>
                                    <div class="flex-grow-1">
                                        <label class="control-label text-sm-right">Doe</label>
                                    </div>
                                </div>
                            </div>
                            <!--/row-->
                            <div class="row">
                                <div class="col-sm-6" style="display: flex">
                                    <div class="w-5 text-sm-right">
                                        <label class="control-label text-sm-right mr-3">Gender:</label>
                                    </div>
                                    <div class="flex-grow-1">
                                        <label class="control-label text-sm-right">Male</label>
                                    </div>
                                </div>
                                <div class="col-sm-6" style="display: flex">
                                    <div class="w-5 text-sm-right">
                                        <label class="control-label text-sm-right mr-3">Date of Birth:</label>
                                    </div>
                                    <div class="flex-grow-1">
                                        <label class="control-label text-sm-right">11/06/1987</label>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                            <!--/row-->
                            <div class="row">
                                <div class="col-sm-6" style="display: flex">
                                    <div class="w-5 text-sm-right">
                                        <label class="control-label text-sm-right mr-3">Contact Person:</label>
                                    </div>
                                    <div class="flex-grow-1">
                                        <label class="control-label text-sm-right">11/06/1987</label>
                                    </div>
                                </div>

                                <div class="col-sm-6" style="display: flex">
                                    <div class="w-5 text-sm-right">
                                        <label class="control-label text-sm-right mr-3">Relationship:</label>
                                    </div>
                                    <div class="flex-grow-1">
                                        <label class="control-label text-sm-right"></label>
                                    </div>
                                </div>

                            </div>
                            <!--/row-->
                            <div class="row">
                                <div class="col-lg-6 d-sm-flex">
                                    <div class="w-5 text-sm-right">
                                        <label class="control-label text-sm-right mr-3">Address:</label>
                                    </div>
                                    <div class="flex-grow-1">
                                        <label class="control-label text-sm-right">19/1 Phan Tây Hồ,P.7, Quận Phú Nhuận, Tp. HCM, Việt Nam</label>
                                    </div>
                                </div>

                            </div>
                            <!--/row-->
                            <!--/row-->
                            <h4 class="box-title font-bold">Visit Details</h4>
                            <hr />

                            <div class="row">
                                <div class="col-sm-6" style="display: flex">
                                    <div class="w-5 text-sm-right">
                                        <label class="control-label text-sm-right mr-3">Encounter:</label>
                                    </div>
                                    <div class="flex-grow-1">
                                        <label class="control-label text-sm-right">OPD 8536</label>
                                    </div>
                                </div>

                                <div class="col-sm-6" style="display: flex">
                                    <div class="w-5 text-sm-right">
                                        <label class="control-label text-sm-right mr-3">Admit Date:</label>
                                    </div>
                                    <div class="flex-grow-1">
                                        <label class="control-label text-sm-right">15-05-2019</label>
                                    </div>
                                </div>
                                <!--/span-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Row -->

            <!-- Row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header bg-primary">
                            <a data-toggle="collapse" href="javascript:void(0)" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                <h4 class="m-b-0 text-white font-bold">Outpatient Initial Nursing Assessment</h4>
                            </a>
                        </div>
                        <div class="card-body collapse show" id="collapseTwo">
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
                                            <input id="txtTemperature" runat="server" class="form-control text-right"  />
                                            <span class="append">°C</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-2 d-flex no-block">
                                        <label class="control-label w-6 mb-1">Nhịp tim/ <span class="text-primary">rate:</span></label>
                                        <div class="form-group w-5">
                                            <input id="txtHeartRate" runat="server" class="form-control text-right"  />
                                            <span class="append">/phút (m)</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6 mb-2 d-flex no-block">
                                        <label class="control-label w-6 mb-1 ">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                        <div class="form-group w-4">
                                            <input id="txtWeight" runat="server" class="form-control text-right"  />
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
                                            <input id="txtHeight" maxlength="3" runat="server" class="form-control text-right"  />
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
                                                <input id="txtBmi" runat="server" class="form-control text-right" disabled="disabled"/>
                                                <span class="append">(Kg/m <sup>2</sup>)</span>
                                                <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
                                                    <script type="text/javascript">
                                                        let txtHeight = document.getElementById('txtHeight');
                                                        let txtBmi = document.getElementById('txtBmi');
                                                        let txtWeight = document.getElementById('txtWeight');

                                                        txtHeight.addEventListener("change", function (e) {
                                                            txtBmi.value = CalculateBmi();
                                                        });

                                                        txtWeight.addEventListener("change", function (e) {
                                                            txtBmi.value = CalculateBmi();
                                                        });

                                                        function CalculateBmi() {
                                                            console.log('bmi :' + txtWeight.value / (Math.pow(txtHeight.value, 2)));
                                                            if (txtHeight.value == "" || txtWeight.value == "") return "";
                                                            else { return txtWeight.value / (Math.pow(txtHeight.value, 2)) };
                                                        }

                                                    </script>
                                                </telerik:RadScriptBlock>
                                            </div>
                                        </div>
                                        <p class="mt-1">(Không áp dụng cho trẻ em và phụ nữ có thai/ <span class="text-primary">not
applicable for children and pregnant</span>)</p>
                                    </div>

                                    <div class="col-sm-6 mb-2 d-flex no-block">
                                        <label for="spO2" class="control-label w-6 mb-1">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                        <div class="form-group w-4">
                                            <input id="txtSpo2" runat="server" class="form-control text-right"/>
                                            <span class="append">%</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-sm-6 mb-2 d-flex no-block">
                                        <label for="head-circumference" class="control-label w-6 mb-1">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                        <div class="form-group w-4">
                                            <input id="txtHeadCircumference" runat="server" class="form-control text-right"/>
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
                                            <input type="hidden" id="txtChiefComplaint" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <%-- 2. Allergy --%>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <label class="control-label mb-1 font-bold">2. Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <input type="radio" runat="server" id="radAllergy1" name="radAllergy" class="custom-control-input" />
                                            <label class="custom-control-label" for="radAllergy1">Không/ <span class="text-primary">No</span></label>
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="custom-control custom-radio mb-1">
                                            <input disabled-for="txtAllergy" type="radio" runat="server" id="radAllergy2" name="radAllergy" class="custom-control-input" />
                                            <label class="custom-control-label" for="radAllergy2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                        </div>
                                        <div class="form-group">
                                            <input type="hidden" id="txtAllergy" class="contenteditable" runat="server" value="" />
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
                                        <div class="form-group">
                                            <input type="hidden" id="txtMentalStatus" class="contenteditable" runat="server" value="" />
                                        </div>
                                    </div>
                                </div>

                                <%-- 4. Pain score --%>
                                <div class="row mb-2">
                                    <div class="col-md-4">
                                        <label class="control-label mb-1 font-bold">4. Thang điểm đau/ <span class="text-primary">Pain score:</span></label>
                                    </div>
                                    <div class="col-md-8">
                                        <input runat="server" class="form-control d-inline-block" id="txtPainCore"/>
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
                                        <div class="form-group">
                                            <input type="hidden" id="txtFrms" class="contenteditable" runat="server" value="" />
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
                                            <asp:RadioButton ID="rad_nss1" runat="server" Text="Bình thường/ Normal" GroupName="rad_nss" />
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <asp:RadioButton ID="rad_nss2" runat="server" Text="Suy dinh dưỡng/ Malnutrition" GroupName="rad_nss" />
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="custom-control custom-radio">
                                            <asp:RadioButton ID="rad_nss3" runat="server" Text="Thừa cân hoặc béo phì/ Overweight or obesity" GroupName="rad_nss" />
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
                                            <asp:RadioButton ID="rad_housing1" runat="server" Text="Sống một mình/ Lives alone" GroupName="rad_housing" />
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="custom-control custom-radio">
                                            <asp:RadioButton ID="rad_housing2" runat="server" Text="Sống với người thân/ With relatives" GroupName="rad_housing" />
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
                                            <asp:RadioButton ID="rad_prior1" runat="server" Text="Cần được khám ngay/ Immediate consulting requirement" GroupName="rad_prior" />
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <div class="custom-control custom-radio">
                                            <asp:RadioButton ID="rad_prior2" runat="server" Text="Có thể chờ khám trong khoảng thời gian xác định/ Be able to wait for consultation at a specific time" GroupName="rad_prior" />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-actions mb-3">
                                    <asp:Button ID="btnComplete" OnClick="btnComplete_Click" CssClass="btn btn-primary" Text="Complete" runat="server" />

                                    <asp:Button ID="btnSave" CssClass="btn btn-primary" Text="Save" runat="server" OnClick="btnSave_Click" />

                                    <asp:Button ID="btnDelete" CssClass="btn btn-secondary" Text="Delete" runat="server" />

                                    <asp:Button ID="btnAmend"  CssClass="btn btn-secondary" Text="Amend" runat="server" OnClick="btnAmend_Click" UseSubmitBehavior="False" />

                                    <asp:Button ID="btnPrint" CssClass="btn btn-secondary" Text="Print" runat="server" />
                                        
                                    <asp:Button ID="btnCancel" CssClass="btn btn-secondary" Text="Cancel" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

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
