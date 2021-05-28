<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrtDisCer.aspx.cs" Inherits="EMR.Print.IPD.PrtDisCer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div class="printToolBar" style="position: sticky; top: 0; left: 0; right: 0; padding: 4px; background: #ddd;">
        <div class="btn btn-sm btn-secondary" onclick="window.print()">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-printer" viewBox="0 0 16 16">
                <path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z" />
                <path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z" />
            </svg>
        </div>
    </div>
<div class="cssclsNoScreen">
        <table class="report-container" style="max-width: 992px; width: 100%; margin-top: 20px; margin-bottom: 100px;">
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
                                <div><asp:Label ID="lbPatientName" runat="server"></asp:Label>MAI MAI MÃI1</div>
                                <div><asp:Label ID="lbBirthday" runat="server" Text='<%# Eval("date_of_birth") %>'></asp:Label> 
                                    | <asp:Label ID="lbSex" runat="server"></asp:Label></div>
                                <div><asp:Label ID="lbPID" runat="server" Font-Bold="true"></asp:Label></div>
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
                        <div class="main">
                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold d-block mb-0 h4">Ngày khám bệnh:</label>
                                    Day of visit
                                </div>
                                <div class="d-inline-block ml-2 align-top">02-03-2021</div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold d-block mb-0 h4">I. LÝ DO ĐẾN KHÁM:</label>
                                    CHIEF COMPLAINT
                                </div>
                                <div class="d-inline-block ml-2 align-top"><asp:Label ID="lbReason" runat="server"></asp:Label>
                                    <%--Đau họng, sốt, khan tiếng--%></div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold d-block mb-0 h4">II. BỆNH SỬ:</label>
                                    MEDICAL HISTORY
                                </div>
                                <div class="d-inline-block ml-2 align-top">
                                    <asp:Label ID="lbmedical_history" runat="server"></asp:Label>
                                    <%--Hai ngày trước: Ho nhiều, nuốt đau ăn uống khó, sau đó sốt nhẹ, khan tiếnguống thuốc nhưng không đỡ--%>
                                </div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">III. TIỀN SỬ BỆNH:</label>
                                    ANTECEDENT MEDICAL HISTORY
                                </div>
                                <div class="d-inline-block ml-2 align-top"></div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">❖ Bản thân:</label>                                    
                                    Personal
                                </div>
                                <div class="d-inline-block ml-2 align-top"><asp:Label ID="lbPersonal" runat="server"></asp:Label></div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">❖ Gia đình:</label>
                                    Family
                                </div>
                                <div class="d-inline-block ml-2 align-top">Khỏe mạnh</div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">❖ Tiêm chủng:</label>
                                    Immunization
                                </div>
                                <div class="d-inline-block ml-2 align-top"></div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold d-block mb-0 h5">❖ Thuốc đang sử dụng:</label>
                                    Current medications
                                </div>
                                <div class="d-inline-block ml-2 align-top">Không rõ</div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">IV. Khám bệnh:</label>
                                    Physical Examination
                                </div>
                                <div class="d-inline-block ml-2 align-top"></div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="mb-0 h5"><span class="font-bold ">1. Dấu hiệu sinh tồn</span>/ Vital signs:</label>
                                </div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <table class="table-bordered">
                                    <tr>
                                        <td class="p-2">Nhiệt độ/ Temperature (C degree)</td>
                                        <td class="p-2" style="width: 100px;"></td>
                                        <td class="p-2">Mạch/ Pulse (/min)</td>
                                        <td class="p-2" style="width: 100px;"></td>
                                    </tr>
                                    <tr>
                                        <td class="p-2">Cân nặng/ Weight (Kg)</td>
                                        <td class="p-2"></td>
                                        <td class="p-2">Nhịp thở/ Respiratory Rate (/min)</td>
                                        <td class="p-2"></td>
                                    </tr>
                                    <tr>
                                        <td class="p-2">Chiều cao/Height (cm)</td>
                                        <td class="p-2"></td>
                                        <td class="p-2">Huyết áp/Blood pressure (mmHg)</td>
                                        <td class="p-2"></td>
                                    </tr>
                                    <tr>
                                        <td class="p-2">Chỉ số khối cơ thể/ BMI (Kg/m2)</td>
                                        <td class="p-2"></td>
                                        <td class="p-2">Độ bão hòa Oxy/ SpO2 (%)</td>
                                        <td class="p-2"></td>
                                    </tr>
                                </table>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="mb-0 h5"><span class="font-bold ">2. Khám bệnh</span>/ Physical Examination:</label>
                                </div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="mb-0 h4 d-block"><span class="font-bold ">❖ Yêu cầu khám chuyên khoa tâm lý:</span></label>
                                    Psychological consultation required
                                </div>
                                <div class="d-inline-block ml-2 align-top">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                    </svg>
                                    Không/No
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-square" viewBox="0 0 16 16">
                                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                    </svg>
                                    Có/Yes
                                </div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">V. Chỉ định và kết quả xét nghiệm:</label>
                                    Laboratory indications and results
                                </div>
                                <div class="d-inline-block ml-2 align-top"></div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">❖ Khảo sát bổ sung khác:</label>
                                    Additional investigations
                                </div>
                                <div class="d-inline-block ml-2 align-top"></div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">VI. Kết luận:</label>
                                    Conclusion
                                </div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">● Chẩn đoán ban đầu:</label>
                                    Initial diagnosis
                                </div>
                                <div class="d-inline-block ml-2 align-top">Viêm mũi họng cấp</div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">● Chẩn đoán xác định:</label>
                                    Diagnosis
                                </div>
                                <div class="d-inline-block ml-2 align-top">Chronic rhinitis, nasopharyngitis and pharyngitis (J31)</div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">● Chẩn đoán phân biệt:</label>
                                    Differential diagnosis
                                </div>
                                <div class="d-inline-block ml-2 align-top">Không</div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">● Bệnh kèm theo:</label>
                                    Associated conditions
                                </div>
                                <div class="d-inline-block ml-2 align-top"></div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">● Điều trị:</label>
                                    Treatment
                                </div>
                                <div class="d-inline-block ml-2 align-top">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                    </svg>
                                    Ngoại trú/Ambulatory care
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-square" viewBox="0 0 16 16">
                                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                    </svg>
                                    Nhập viện/Admission
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-square" viewBox="0 0 16 16">
                                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                    </svg>
                                    Chuyển viện/Transfer
                                </div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">❖ Yêu cầu ý kiến chuyên khoa:</label>
                                    Specialized opinion requested
                                </div>
                                <div class="d-inline-block ml-2 align-top">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z" />
                                    </svg>
                                    Không/No
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-square" viewBox="0 0 16 16">
                                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                    </svg>
                                    Có/Yes
                                </div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">● Hướng dẫn cụ thể dành cho bệnh nhân:</label>
                                    Specific education required
                                </div>
                                <div class="d-inline-block ml-2 align-top">Tái khám theo hẹn</div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="d-inline-block">
                                    <label class="font-bold  d-block mb-0 h5">● Hẹn lần khám tới:</label>
                                    Next Appointment
                                </div>
                                <div class="d-inline-block ml-2 align-top"></div>
                            </div>

                            <div class="col-md-12 mb-2">
                                <div class="text-center" style="float: right;margin-right: 100px;">
                                    <div>
                                        <label class="font-bold d-block mb-0 h5">BÁC SĨ ĐIỀU TRỊ</label>
                                        ATTENDING DOCTOR
                                    </div>
                                    <div style="margin-top: 100px">Dr. Nguyen Dinh My</div>
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
                        <div class="footer-info" style="display: flex; justify-content: space-between; width: 100%;">
                            <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                            <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Quận 2, Tp.HCM</div>
                            <div>Tel: 028 3910 9999</div>
                            <div>www.aih.com.vn</div>
                        </div>
                    </td>
                    <td class="report-footer-space" style="height: 100px;">
                    </td>
                </tr>
            </tfoot>

        </table>

</div>
    <div class="cssclsNoPrint">
        <form method="post" action="#" id="form2" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <div class="scroll-sidebar h-100 w-100">
            <asp:UpdatePanel ID="Upd" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="AmendReasonPlaceHolder" runat="server"></div>

                    <uc1:PatientInfo runat="server" ID="PatientInfo" />

                    <div class="row" style="margin-bottom: 50px;">
                        <div class="col-lg-12">
                            <div class="card mt-2">
                                <div class="card-header">
                                    <h4 class="text-primary">Outpatient Medical Record</h4>
                                    <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                                </div>
                                <div class="card-body collapse show" id="collapseOne">
                                    <div class="form-body">
                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtChiefComplaint" />
                                                </div>
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
                                                    <Input:TextField runat="server" ID="txtMedicalHistory" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtCurrentMedication" />
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
                                                    <Input:TextField runat="server" ID="txtPersonal" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1 font-bold">Habits/ <span class="text-primary">Thói quen:</span></label>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Hút thuốc lá/ <span class="text-primary">Smoking:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_habits_smoking1" name="rad_habits_smoking" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_smoking1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="habits_smoking_field" type="radio" runat="server" id="rad_habits_smoking2" name="rad_habits_smoking" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_smoking2">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                </div>
                                                <div class="form-group habits_smoking_field">
                                                    <Input:TextField runat="server" ID="txt_habits_smoking_pack" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Uống rượu/ <span class="text-primary">Alcohol:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_habits_alcohol1" name="rad_habits_alcohol" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_alcohol1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="habits_alcohol_field" type="radio" runat="server" id="rad_habits_alcohol2" name="rad_habits_alcohol" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_alcohol2">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                </div>
                                                <div class="form-group habits_alcohol_field">
                                                    <Input:TextField runat="server" ID="txt_habits_alcohol_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Chất gây nghiện/ <span class="text-primary">Drugs:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_habits_drugs1" name="rad_habits_drugs" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_drugs1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="habits_drugs_field" type="radio" runat="server" id="rad_habits_drugs2" name="rad_habits_drugs" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_drugs2">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                </div>
                                                <div class="form-group habits_drugs_field">
                                                    <Input:TextField runat="server" ID="txt_habits_drugs_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Tập thể dục thường xuyên/ <span class="text-primary">Regular physical exercise:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_habits_physical_exercise1" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_physical_exercise1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="habits_physical_exercise_field" type="radio" runat="server" id="rad_habits_physical_exercise2" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_habits_physical_exercise2">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                </div>
                                                <div class="form-group habits_physical_exercise_field">
                                                    <Input:TextField runat="server" ID="txt_habits_phy_exer_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Khác, Ghi rõ/ <span class="text-primary">Other, Specify:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_habits_other" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2">Dị ứng/ <span class="text-primary">Allergy:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="radAllergy1" name="radAllergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="radAllergy1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="allergy_field" type="radio" runat="server" id="radAllergy2" name="radAllergy" class="custom-control-input" />
                                                    <label class="custom-control-label" for="radAllergy2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>
                                                <div class="form-group allergy_field">
                                                    <Input:TextField runat="server" ID="txtAllergyNote" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtFamily" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Tiêm chủng/ <span class="text-primary">Immunization:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtImmunization" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <label class="control-label mb-2 font-bold">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label>
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
                                                <label class="control-label w-6 mb-1">Mạch/ <span class="text-primary">Heart Rate:</span></label>
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
                                                    <input id="txt_pulse" runat="server" class="form-control text-right" />
                                                    <span class="append">cm</span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_physical_examination" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological consultation required:</span></label>
                                            </div>
                                            <div class="col-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_psy_consult_required1" name="rad_psy_consult_required" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_psy_consult_required1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>
                                            <div class="col-8">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_psy_consult_required2" name="rad_psy_consult_required" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_psy_consult_required2">Có/ <span class="text-primary">Yes</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label font-bold mb-1">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_laboratory_indications_results" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_additional_investigation" />
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
                                                    <Input:TextField runat="server" ID="txt_initial_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán xác định/ <span class="text-primary">Initial diagnosis (ICD 10):</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_diagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis (ICD 10):</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtDiffesrentialDiagnosis" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_associated_conditions" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Điều trị/ <span class="text-primary">Treatment:</span></label>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input disabled-for="current_medication_field" type="radio" runat="server" id="radTreatment1" name="radTreatment" class="custom-control-input" />
                                                    <label class="custom-control-label" for="radTreatment1">Ngoại trú/ <span class="text-primary">Ambulatory care</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="radTreatment2" name="radTreatment" class="custom-control-input" />
                                                    <label class="custom-control-label" for="radTreatment2">Nhập viện/ <span class="text-primary">Admission</span></label>
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-1">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="radTreatment3" name="radTreatment" class="custom-control-input" />
                                                    <label class="custom-control-label" for="radTreatment3">Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2 current_medication_field">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1"><span class="text-primary">5. Current medications:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txtMedicine" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="custom-control custom-radio">
                                                    <input type="radio" runat="server" id="rad_spec_opinion_requested1" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_requested1">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                            </div>

                                            <div class="col-md-8">
                                                <div class="custom-control custom-radio mb-1">
                                                    <input disabled-for="spec_opinion_requested_field" type="radio" runat="server" id="rad_spec_opinion_requested2" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_requested2">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                </div>
                                                <div class="form-group spec_opinion_requested_field">
                                                    <Input:TextField runat="server" ID="txt_spec_opinion_requested_note" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_specific_education_required" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <label class="control-label mb-1">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                                <div class="form-group">
                                                    <Input:TextField runat="server" ID="txt_next_appointment" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions mb-3">
                                            <asp:Button ID="btnComplete" OnClick="btnComplete_Click" class="btn btn-primary" runat="server" Text="Complete" />

                                            <asp:Button ID="btnSave" OnClick="btnSave_Click" class="btn btn-primary" runat="server" Text="Save" />

                                            <asp:Button ID="btnDelete" data-target="#exampleModalCenter" data-toggle="modal" data-backdrop="static" data-keyboard="false" class="btn btn-danger" runat="server" Text="Delete" />

                                            <asp:Button ID="btnAmend" OnClick="btnAmend_Click" class="btn btn-secondary" runat="server" Text="Amend" />

                                            <asp:Button ID="btnPrint" CssClass="btn btn-secondary" runat="server"  OnClick="btnPrint_Click" Text="Print" />

                                            <asp:Button ID="btnCancel" CssClass="btn btn-secondary" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
                                        </div>
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
</body>
</html>
