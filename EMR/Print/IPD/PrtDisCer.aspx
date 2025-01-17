﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrtDisCer.aspx.cs" Inherits="EMR.Print.IPD.PrtDisCer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<link href="../../styles/style.css" rel="stylesheet" />--%>
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <style>

        @media print{
            
            .report-footer .report-footer-cell:after {
                content:  counter(page);
                counter-increment: page;
                /*left: 0;
                text-align: center;
                right: 0;
                top: 100%;
                width: 100%;
                white-space: nowrap;
                z-index: 20;
                -moz-border-radius: 5px;
                -moz-box-shadow: 0px 0px 4px #222;
                background-color: red;
                color: blue;*/
                /*background-image: -moz-linear-gradient(top, #eeeeee, #cccccc);*/
            }
        
        }
    </style>


</head>
<body>
    <%--<div class="printToolBar" style="position: sticky; top: 0; left: 0; right: 0; padding: 4px; background: #ddd;">
        <div class="btn btn-sm btn-secondary" onclick="window.print()">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-printer" viewBox="0 0 16 16">
                <path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z" />
                <path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z" />
            </svg>
        </div>
    </div>--%>
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
                        <img style="width: 100%" src="../images/ExcellentCare.png" />
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
</body>
</html>
