<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DischargeSummary.aspx.cs" Inherits="EMR.DischargeSummary" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="uc1" TagName="PatientInfo" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="aih" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="aih" TagName="AmendReason" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="aih" TagName="Label" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="aih" TagName="Date" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="aih" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../styles/style.css" rel="stylesheet" />
    <link href="../../styles/myStyle.css" rel="stylesheet" />
    <%--<link href="../../style/style-custom.css" rel="stylesheet" />--%>
</head>
<body>
    <div class="cssclsNoScreen">
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

    <div class="cssclsNoPrint">
        <form method="post" action="#" id="form2" runat="server">
            <telerik:RadScriptManager runat="server" ID="RadScriptManager2" />
            <div class="scroll-sidebar h-100 w-100">
                <asp:HiddenField runat="server" ID="RequiredFieldValidator" />
                <asp:Panel runat="server" ID="messagePlaceHolder">
                    <aih:AmendReason runat="server" ID="txt_amendReason" />
                </asp:Panel>

                <uc1:PatientInfo runat="server" ID="PatientInfo1" />

                <div class="row">
                    <div class="col-md-12">
                        <div class="card mt-2">
                            <div class="card-header">
                                <h4 class="text-primary">Discharge Summary</h4>
                                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="arrowhead"></a>
                            </div>
                            <div class="card-body collapse show" id="collapseOne">
                                <div class="form-body">

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1">Lý do xuất viện/ <span class="text-primary">Discharge Reason <span class="text-danger">*</span>:</span></label>
                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                <input disabled-for="normal_field" type="radio" runat="server" id="rad_disc_reason_code_ama" name="rad_disc_reason_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_disc_reason_code_ama"><span class="text-primary">Normal</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                <input type="radio" runat="server" id="rad_disc_reason_code_dama" disabled-for="dama_field" name="rad_disc_reason_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_disc_reason_code_dama"><span class="text-primary">DAMA</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                <input type="radio" runat="server" id="rad_disc_reason_code_transfer" disabled-for="transfer_field" name="rad_disc_reason_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_disc_reason_code_transfer"><span class="text-primary">Transfer</span></label>
                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_disc_reason_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare38" />
                                                </a>
                                            </div>
                                            <div id="rad_disc_reason_code_error" class="text-danger"></div>
                                        </div>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Ngày nhập viện/ <span class="text-primary">Date of hospitalization:</span></label>
                                            <div class="d-inline-block ml-2">
                                                <telerik:RadDatePicker runat="server" ID="dpk_date_of_hospital" Width="120px" />
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Ngày xuất viện/ <span class="text-primary">Date of discharge:</span></label>
                                            <div class="d-inline-block ml-2">
                                                <telerik:RadDatePicker runat="server" ID="dpk_date_of_discharge" Width="120px" />
                                            </div>
                                        </div>
                                    </fieldset>


                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">1. Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                        </legend>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_admission_reason" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">2. Chẩn đoán chính/ <span class="text-primary">Main diagnosis:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Phân loại bệnh theo ICD-10/ <span class="text-primary">ICD-10 Code:</span></label>
                                            <aih:TextField runat="server" ID="txt_icd10_diagnosis" />
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Chẩn đoán kết hợp/ <span class="text-primary">Associated diagnosis:</span></label>
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_associated_diagnosis" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">3. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_cur_med_history" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_ant_med_history" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">4. Dấu hiệu lâm sàng lúc nhập viện/ <span class="text-primary">Physical findings on admission:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_physical_finding" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">5. Kết quả xét nghiệm/ <span class="text-primary">Laboratory investigation results:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_lab_result" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">Giải phẫu bệnh/ <span class="text-primary">Pathology:</span></label>
                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                <input type="radio" runat="server" id="rad_patho_result_code_be" name="rad_patho_result_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_patho_result_code_be">Lành tính/ <span class="text-primary">Benign</span></label>
                                            </div>
                                            <div class="custom-control custom-radio  d-inline-block ml-2">
                                                <input type="radio" runat="server" id="rad_patho_result_code_ma" name="rad_patho_result_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_patho_result_code_ma">Ác tính/ <span class="text-primary">Malignant</span></label>
                                            </div>
                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                <input type="radio" runat="server" id="rad_patho_result_code_uc" name="rad_patho_result_code" class="custom-control-input" />
                                                <label class="custom-control-label" for="rad_patho_result_code_uc">Chưa xác định/ <span class="text-primary">Unconfirmed</span></label>
                                                <a href="javascript:void(0)" class="el-hide" data-clear="rad_patho_result_code" onclick="clear_radiobutton(this)">
                                                    <icon:xsquare runat="server" ID="XSquare2" />
                                                </a>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">6. Các quy trình đã được thực hiện/ <span class="text-primary">Procedures performed:</span></label>
                                        </legend>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_proce_performed" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">7. Điều trị trong quá trình nằm viện/ <span class="text-primary">Treatment during hospitalization:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_treatment" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">8. Diễn tiến trong quá trình nằm viện/ <span class="text-primary">Evolution during hospitalization:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_evolution" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label mb-2">9. Tình trạng của bệnh nhân khi xuất viện/ <span class="text-primary">Patient’s condition on discharge:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_disc_condition" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 normal_field transfer_field">
                                        <legend>
                                            <label class="control-label mb-2">10. Thuốc khi xuất viện/ <span class="text-primary">Discharge medications:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <aih:TextField runat="server" ID="txt_disc_medication" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 normal_field">
                                        <legend>
                                            <label class="control-label mb-2">11. Hướng dẫn theo dõi (ghi rõ các dấu hiệu cần tái khám ngay)/ <span class="text-primary">Follow-up instructions (signs and symptoms for immediate revisit):</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <aih:TextField runat="server" ID="txt_follow_up_instruc" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 normal_field">
                                        <legend>
                                            <label class="control-label mb-2">12. Chế độ ăn uống/ <span class="text-primary">Special Diet:</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <aih:TextField runat="server" ID="txt_special_diet" />
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 normal_field">
                                        <legend>
                                            <label class="control-label mb-2">13. Ngày tái khám (ghi rõ ngày và tên Bác sĩ)/ <span class="text-primary">Next consultation (specify date and with whom):</span></label>
                                        </legend>
                                        <div class="col-md-12">
                                            <div class="d-inline-block mb-2 mr-2">
                                                <telerik:RadDatePicker Width="120px" ID="dpk_next_consult_date" runat="server"></telerik:RadDatePicker>
                                            </div>

                                            <div class="form-group d-inline-block w-n mb-2">
                                                <aih:TextField runat="server" ID="txt_next_consult_doctor" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 dama_field">
                                        <legend>
                                            <label class="control-label mb-2">10. Xuất viện trái với lời khuyên bác sỹ/ <span class="text-primary">Discharge against medical advice (DAMA):</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <aih:TextField runat="server" ID="txt_dama" />
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">
                                                Nếu có, nêu rõ lí do/ <span class="text-primary">If yes, specify the reason
:</span></label>
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_dama_note" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2 transfer_field">
                                        <legend>
                                            <label class="control-label mb-2">11. Chuyển viện/ <span class="text-primary">Transfer to another hospital:</span></label>
                                        </legend>
                                        <div class="col-md-12 mb-2">
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_trans_to_hospital" />
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <label class="control-label mb-1">
                                                Nếu có, nêu rõ lí do/ <span class="text-primary">If yes, specify the reason
:</span></label>
                                            <div class="form-group">
                                                <aih:TextField runat="server" ID="txt_transfer_reason" />
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label mb-1 mr-2 mb-2">Ngày/ <span class="text-primary">Date</span></label>
                                            <div class="d-inline-block mb-2">
                                                <telerik:RadDatePicker Width="120px" ID="dpk_signed_date" runat="server"></telerik:RadDatePicker>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label class="control-label mb-1 mr-2 mb-2">Họ tên bác sỹ và mã số nhân viên/ <span class="text-primary">Doctor’s Name and ID</span></label>
                                            <div class="form-group d-inline-block w-n mb-2">
                                                <aih:TextField runat="server" ID="txt_signed_doctor" />
                                            </div>
                                        </div>
                                    </fieldset>

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

                                    <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                        <ModalBody>
                                            <div class="text-center">
                                                <icon:ExclamationTriangle cssClass="text-danger" Width="80" Height="80" runat="server" />
                                                <h4 class="mt-4 mb-4">Delete document?
                                                </h4>
                                            </div>
                                            <div class="text-right">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <asp:Button runat="server" OnClick="btnDelete_Click" Text="Delete" ID="btnDelete" class="btn btn-danger" />
                                            </div>
                                        </ModalBody>
                                    </webUI:PopupModal>
                                </div>
                            </div>
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

    <script>
        console.log(document.querySelector("#RequiredFieldValidator").value, document.querySelector("#RequiredFieldValidator").value == true);

        if (document.querySelector("#RequiredFieldValidator").value) {
            if (!document.querySelector('input[name="rad_disc_reason_code"]:checked')) {
                document.querySelector("#rad_disc_reason_code_error").innerHTML = "Lý do xuất viện/ Discharge Reason is required.";
            }
        }
    </script>

</body>
</html>
