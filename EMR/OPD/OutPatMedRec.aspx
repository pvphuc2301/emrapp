﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OutPatMedRec.aspx.cs" Inherits="EMR.OutPatMedRec" ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS1.ascx" TagPrefix="webUI" TagName="PrtRowS1" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrtRowS2.ascx" TagPrefix="webUI" TagName="PrtRowS2" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="XSquare" %>
<%@ Register Src="~/UserControls/UserControlPatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Outpatient Medical Record</title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <%--<link href="../styles/print.css" rel="stylesheet" />--%>
    <style>
        .dg {
            display: grid;
            width: 100%;
        }
        .cursor-wait {
            pointer-events: none;
            background-color: #007bff;
            border-color: #007bff;
            opacity: .65;
        }
        .gtc-1 {
            grid-template-columns: 200px 1fr;
        }

        .gtc-2 {
            grid-template-columns: auto 1fr;
        }

        @media only screen and (max-width: 600px) {
          .dg {
            display: block !important;
          }
        }

        .ml1 {
            margin-left: 20px;
        }

        .ml2 {
            margin-left: 25px;
        }
        .font-10 {
            font-size: 10pt  !important;
        }
    </style>
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <style>
        @page {
            /*margin-top: 10px;*/
        }
        #print_content {
		    line-height: initial !important;
	    }
        #print_header {
            height: 2cm !important;
        }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="uplPrintPage" runat="server">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="print_page" runat="server">
                    <table class="report-container">
                        <thead class="report-header">
                            <tr>
                                <th class="report-header-cell">
                                    <div runat="server" id="print_header">
                                        <div style="display: flex; align-items: center; padding: 0 18px">
                                            <img style="width: 180px" src="../images/AIH_PI_FULL.png" />
                                            <div style="text-align: center; align-self: center; flex-grow: 1">
                                                <div><span style="font-size: 12pt; font-weight: bold">BỆNH ÁN NGOẠI TRÚ</span></div>
                                                <div class="en font-bold">OUTPATIENT MEDICAL RECORD</div>
                                            </div>
                                            <div style="width: 120px; text-align: left; font-size: 11px">
                                                <%--<asp:Label CssClass="d-block" runat="server" ID="prt_fullname"></asp:Label>
                                                <asp:Label class="d-block" CssClass="d-block" runat="server" ID="prt_dob"></asp:Label>
                                                <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
                                                <asp:Label runat="server" ID="prt_vpid" CssClass="d-block font-bold"></asp:Label>--%>
                                            </div>
                                        </div>
                                        <div style="height: 12px; position: relative; margin-top: -4px">
                                            <span style="position:absolute; left: 0; top: 50%; width: 190px; border: 2px solid #e20e5a; display: inline-block;"></span>
                                            <span style="position:absolute; left: 190px; top: 50%; right: 0; border: 2px solid #007297; display: inline-block;"></span>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                        </thead>

                        <tbody class="report-content">
                            <tr>
                                <td class="report-content-cell">
                                    <div class="main" runat="server" id="print_content">
                                        <div style="display: grid; grid-template-columns: 260px 1fr; margin-bottom: 6px">
                                            <div>
                                                <div class="font-10 pl-2 pr-2" style="border: 1px dashed #000; line-height: 2; margin-right: 20px">
                                                    <div>Họ tên: <asp:Label runat="server" ID="prt_patient_name"/></div>
                                                    <div>Ngày sinh: <asp:Label runat="server" ID="prt_dob"/></div>
                                                    <div>Giới tính: <asp:Label runat="server" ID="prt_gender"/></div>
                                                    <div>PID: <asp:Label runat="server" ID="prt_pid"/></div>
                                                </div>
                                            </div>
                                            <div>
                                                <div style="display: grid; grid-template-columns: auto 40px auto 1fr">
                                                    <span style="font-weight: bold">Ngày, giờ bắt đầu đánh giá:&nbsp;</span>
                                                    <asp:Label runat="server" ID="prt_asessment_time"/>
                                                    <span style="font-weight: bold">;Ngày&nbsp;</span>
                                                    <asp:Label runat="server" ID="prt_asessment_date"/>
                                                </div>
                                                <div class="en"><span style="font-weight: bold"><i>Starting date, time of the assessment</i></span></div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr;">
                                            <webUI:PrtRowS1 FontBold="true" Title="Ngày khám bệnh" SubTitle="Day of visit" runat="server" />
                                            <asp:Label runat="server" ID="prt_day_of_visit" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr;">
                                            <webUI:PrtRowS1 FontBold="true" Order="I." Title="Lý do đến khám:" SubTitle="Chief complaint" runat="server" />
                                            <asp:Label runat="server" ID="prt_chief_complaint" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr;">
                                            <webUI:PrtRowS1 FontBold="true" Order="II." Title="Bệnh sử:" SubTitle="Medical history" runat="server" />
                                            <asp:Label runat="server" ID="prt_medical_history" />
                                        </div>

                                        <div style="">
                                            <webUI:PrtRowS1 FontBold="true" Order="III." Title="Tiền sử bệnh:" SubTitle="Atencedent medical history" runat="server" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 100px 1fr;">
                                            <div class="d-grid" style="grid-template-columns: 18px 1fr; margin-left: 5px">
                                                <div><span class="align-top">❖</span></div>
                                                <div>
                                                    <div class="font-weight-bold">Bản Thân:</div>
                                                    <div class="en">Personal</div>
                                                </div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_personal" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="-" Title="Đã từng nhiễm COVID-19 trong vòng 6 tháng qua:" SubTitle="Have been infected with COVID-19 within the last 6 months" runat="server" />
                                            <div>
                                                <asp:Label CssClass="ml-4" Style="" runat="server" ID="prt_infected_with_covid_true" Text="❏"/>&nbsp;Có/ <span class="en">Yes</span>
                                                <asp:Label CssClass="ml-4" Style="" runat="server" ID="prt_infected_with_covid_false" Text="❏"/>&nbsp;Không/ <span class="en">No</span>
                                            </div>
                                        </div>

                                        <div style="">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="-" Title="Tiền sử tiêm chủng" SubTitle="Immunization history" runat="server" />
                                        </div>

                                        <div class="ml2">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Tiêm vắc xin phòng COVID-19" SubTitle="COVID-19 vaccination" runat="server" />
                                            
                                            <div class="ml1">
                                                <asp:Label CssClass="ml-4" Style="" runat="server" ID="prt_received_1_dose_true" Text="❏"/>&nbsp;Đã tiêm mũi 1/ <span class="en">Received 1st dose</span>
                                                <asp:Label CssClass="ml-4" Style="" runat="server" ID="prt_received_2_dose_true" Text="❏"/>&nbsp;Đã tiêm mũi 2/ <span class="en">Received 2nd dose</span>
                                            </div>

                                            <div class="ml1">
                                                <asp:Label CssClass="ml-4" Style="" runat="server" ID="prt_received_additional_true" Text="❏"/>&nbsp;Đã tiêm mũi bổ sung, nhắc lại/ <span class="en">Received additional, booster dose</span>
                                                <asp:Label CssClass="ml-4" Style="" runat="server" ID="prt_not_yet_vaccinations_true" Text="❏"/>&nbsp;Chưa tiêm/ <span class="en">Not yet</span>
                                            </div>

                                            <div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                                <webUI:PrtRowS1 FontBold="true" FixedLeft="22" Order="" Title="Tiêm vắc xin khác (ghi rõ):" SubTitle="Other vaccinations (specify)" runat="server" />
                                                <asp:Label runat="server" ID="prt_immunization" />
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 90px 1fr;">
                                            <div class="d-grid" style="grid-template-columns: 18px 1fr; margin-left: 5px">
                                                <div><span class="align-top">❖</span></div>
                                                <div>
                                                    <div class="font-weight-bold">Gia đình:</div>
                                                    <div class="en">Family</div>
                                                </div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_family" />
                                        </div>

                                        <%--<div class="d-grid" style="grid-template-columns: auto 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="❖" Title="Tiêm chủng:" SubTitle="Imminization" runat="server" />
                                            <asp:Label runat="server" ID="prt_immunization" />
                                        </div>--%>

                                        <div class="d-grid" style="grid-template-columns: 170px 1fr;">
                                            <div class="d-grid" style="grid-template-columns: 18px 1fr; margin-left: 5px">
                                                <div><span class="align-top">❖</span></div>
                                                <div>
                                                    <div class="font-weight-bold">Thuốc đang sử dụng:</div>
                                                    <div class="en">Current medications</div>
                                                </div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_current_medication" />
                                        </div>

                                        <div style="">
                                            <webUI:PrtRowS1 FontBold="true" Order="IV." Title="Khám bệnh:" SubTitle="Physical examinations" runat="server" />
                                        </div>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="1." Title="Dấu hiệu sinh tồn/ " SubTitle="Vital signs:" runat="server" />

                                        <table class="table-bordered mb-2" style="table-layout: fixed; width: 100%;">
                                            <tr>
                                                <td class="p-2">Nhiệt độ/ <span class="en">Temperature</span> (C degree)</td>
                                                <td class="p-2 text-right" style="width: 90px;"><asp:Label runat="server" ID="prt_vs_temperature" /></td>
                                                <td class="p-2">Mạch/ <span class="en">Pulse</span> (/min)</td>
                                                <td class="p-2 text-right" style="width: 90px;"><asp:Label runat="server" ID="prt_pulse" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Cân nặng/ <span class="en">Weight</span> (Kg)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_weight" /></td>
                                                <td class="p-2">Nhịp thở/ <span class="en">Respiratory Rate</span> (/min)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_respiratory_rate" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chiều cao/ <span class="en">Height </span>(cm)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_height" /></td>
                                                <td class="p-2">Huyết áp/ <span class="en">Blood pressure </span>(mmHg)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_blood_pressure" /></td>
                                            </tr>
                                            <tr>
                                                <td class="p-2">Chỉ số khối cơ thể/ <span class="en">BMI</span> (Kg/m2)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_BMI" /></td>
                                                <td class="p-2">Độ bão hòa Oxy/ <span class="en">SpO2 </span>(%)</td>
                                                <td class="p-2 text-right">
                                                    <asp:Label runat="server" ID="prt_vs_spO2" /></td>
                                            </tr>
                                        </table>

                                        <webUI:PrtRowS1 FontBold="true" CssClass="text-inline" Order="2." Title="Khám bệnh/ " SubTitle="Physical Examination:" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: 10px 1fr;">
                                            <label></label>
                                            <asp:Label runat="server" ID="prt_physical_examination" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 280px 1fr;">
                                            <div class="d-grid" style="grid-template-columns: 18px 1fr; margin-left: 5px">
                                                <div><span class="align-top">❖</span></div>
                                                <div>
                                                    <div class="font-weight-bold">Yêu cầu khám chuyên khoa tâm lý:</div>
                                                    <div class="en">Psychological consultation required</div>
                                                </div>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 100px 1fr;">
                                                <div><asp:Label runat="server" ID="prt_psy_consult_required_false" Text="❏"/> Không/ <span class="en">No</span></div>
                                                <div><asp:Label runat="server" ID="prt_psy_consult_required_true" Text="❏"/> Có/ <span class="en">Yes</span></div>
                                            </div>
                                        </div>

                                        <%-- Nutrition screening --%>

                                        <div style="margin-left: 5px">❖ Kết quả sàng lọc dinh dưỡng/ <span class="en">Nutrition screening</span></div>

                                        <div style="display: grid; grid-template-columns: 330px 1fr; margin-left: 25px">
                                            <div style="display: grid; grid-template-columns: 18px 1fr">
                                                <div><asp:Label CssClass="align-top" runat="server" ID="prt_risk_of_malnutrition_false" Text="❏"/></div>
                                                <div>
                                                    <div>Không có nguy cơ thiếu dinh dưỡng (<2)</div>
                                                    <div class="en">No risk of malnutrition</div>
                                                </div>
                                            </div>
                                            <div style="display: grid; grid-template-columns: 18px 1fr">
                                                <div><asp:Label CssClass="align-top" runat="server" ID="prt_risk_of_malnutrition_true" Text="❏"/></div>
                                                <div>
                                                    <div>Có nguy cơ thiếu dinh dưỡng (≥ 2)</div>
                                                    <div class="en">Risk of malnutrition</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div runat="server" id="prt_nutrition_screening_wrapper" style="display: grid; grid-template-columns: auto 1fr; gap: 5px; margin-left: 25px">
                                            <div>
                                                <div class="lh1">Nếu có, yêu cầu khám chuyên khoa dinh dưỡng:</div>
                                                <div class="en">If yes, nutritional consultation required</div>
                                            </div>
                                            <div>
                                                <div><asp:Label runat="server" ID="prt_nutrition_screening_code_true" Text="❏"/> Có/ <span class="en">Yes</span></div>
                                                <div><asp:Label runat="server" ID="prt_nutrition_screening_code_false" Text="❏"/> Không, lý do/ <span class="en">No, reason: </span><asp:Label runat="server" ID="prt_nutrition_screening_desc"/></div>
                                            </div>
                                        </div>

                                        <%-- Nutrition screening end --%>

                                        <webUI:PrtRowS1 FontBold="true" Order="V." Title="Chỉ định và kết quả xét nghiệm:" SubTitle="Laboratory indications and results" runat="server" />

                                        <div class="d-grid" style="grid-template-columns: 20px 1fr;">
                                            <label></label>
                                            <asp:Label runat="server" ID="prt_laboratory_indications_results" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: auto 1fr;">
                                            <div class="d-grid" style="grid-template-columns: 18px 1fr; margin-left: 5px">
                                                <div><span class="align-top">❖</span></div>
                                                <div>
                                                    <div class="font-weight-bold">Khảo sát bổ sung khác</div>
                                                    <div class="en">Additional investigations</div>
                                                </div>
                                            </div>
                                            <asp:Label runat="server" ID="prt_additional_investigation" />
                                        </div>

                                        <div style="">
                                            <webUI:PrtRowS1 FontBold="true" Order="VI." Title="Kết luận:" SubTitle="Conclusion" runat="server" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" Title="Chẩn đoán ban đầu:" SubTitle="Initial diagnosis" runat="server" />
                                            <asp:Label runat="server" ID="prt_initial_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" Title="Chẩn đoán xác định:" SubTitle="Diagnosis" runat="server" />
                                            <asp:Label runat="server" ID="prt_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" Title="Chẩn đoán phân biệt:" SubTitle="Differential diagnosis" runat="server" />
                                            <asp:Label runat="server" ID="prt_differential_diagnosis" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 180px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" Order="•" FixedLeft="10" Title="Bệnh kèm theo:" SubTitle="Associated conditions" runat="server" />
                                            <asp:Label runat="server" ID="prt_associated_conditions" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 85px 1fr; gap: 6px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Điều trị:" SubTitle="Treatment" runat="server" />
                                            <div style="display: grid; grid-template-columns: 200px 1fr 1fr; gap: 6px">
                                                <div><asp:Label runat="server" ID="prt_treatment_code_opd" Text="❏"/> Ngoại trú/ <span class="en">Ambulatory care</span></div>
                                                <div><asp:Label runat="server" ID="prt_treatment_code_ipd" Text="❏"/> Nhập viện/ <span class="en">Admission</span></div>
                                                <div><asp:Label runat="server" ID="prt_treatment_code_trf" Text="❏"/> Chuyển viện/ <span class="en">Transfer</span></div>
                                            </div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 90px 1fr;">
                                            <label></label>
                                            <asp:Label runat="server" ID="prt_medicine" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 280px 1fr;">
                                            <div class="d-grid" style="grid-template-columns: 18px 1fr; margin-left: 5px">
                                                <div><span class="align-top">❖</span></div>
                                                <div>
                                                    <div class="font-weight-bold">Yêu cầu ý kiến chuyên khoa</div>
                                                    <div class="en">Specialized opinion requested</div>
                                                </div>
                                            </div>
                                            <div class="d-grid" style="grid-template-columns: 100px 1fr;">
                                                <div><asp:Label runat="server" ID="prt_spec_opinion_requested_false" Text="❏"/> Không/ <span class="en">No</span></div>
                                                <div><asp:Label runat="server" ID="prt_spec_opinion_requested_true" Text="❏"/> Có/ <span class="en">Yes</span></div>
                                            </div>
                                        </div>

                                        <div runat="server" id="prt_spec_opinion_requested_note_wrapper" class="d-grid" style="grid-template-columns: 220px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Nếu có, nêu rõ:" SubTitle="If yes, specif" runat="server" />
                                            <asp:Label runat="server" ID="prt_spec_opinion_requested_note" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Hướng dẫn cụ thể dành cho bệnh nhân:" SubTitle="Specific education required" runat="server" />
                                            <asp:Label runat="server" ID="prt_specific_education_required" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 220px 1fr; grid-gap: 5px;">
                                            <webUI:PrtRowS1 FontBold="true" FixedLeft="10" Order="•" Title="Hẹn lần khám tới:" SubTitle="Next Appointment" runat="server" />
                                            <asp:Label runat="server" ID="prt_next_appointment" />
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr; grid-gap: 5px">
                                            <div></div>
                                            <div class="text-center" style="break-inside: avoid !important; page-break-inside: avoid !important">
                                                <div><span class="font-bold">Ngày</span>/<span class="en">Date</span> <asp:Label runat="server" ID="prt_printed_date" /> <span class="font-bold">Giờ</span>/<span class="en">Time</span> <asp:Label runat="server" ID="prt_printed_time" /></div>
                                                <div><span class="font-bold">Họ tên, chữ ký & MSNV của Bác sĩ</span></div>
                                                <div class="en">Doctor’s full name, signature & ID</div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot class="report-footer">
                            <tr>
                                <td class="report-footer-cell" runat="server" id="print_footer">
                                    <div style="margin-left: -18px"><img style="width: 210mm" src="../images/ExcellentCare.png" /></div>
                                    <div class="footer-info" style="padding: 0 18px">
                                        <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                                        <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Tp. Thủ Đức, Tp.HCM</div>
                                        <div>Tel: 028 3910 9999</div>
                                        <div>www.aih.com.vn</div>
                                    </div>
                                </td>
                                <td class="report-footer-space" runat="server" id="print_footer_space"></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="cssclsNoPrint">
            <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd; border-radius: 0;">
                <li><asp:LinkButton runat="server" ID="btnHome" OnClick="RedirectToPatientSummary" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                <li>Outpatient Medical Record</li>
            </ul>
            <div style="overflow: scroll; height: calc(100vh - 43px); overflow-x: hidden;">
                <asp:HiddenField runat="server" ID="DataObj" />
                <asp:Panel runat="server" ID="messagePlaceHolder">
                    <div class="card" runat="server" id="amendReasonWraper">
                        <div class="card-body">
                            <h5>Lý do thay đổi/ <span class="text-primary">amend reason: </span>
                                <br />
                                <span class="text-danger">* </span><small>Nội dung lý do thay đổi phải trên 3 ký tự</small></h5>
                            <div class="form-group mb-2">

                                <asp:TextBox runat="server" TextMode="MultiLine" ID="txt_amend_reason" CssClass="form-control" />

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group2" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <asp:ValidationSummary ID="valSum" DisplayMode="BulletList" CssClass="validationSummary" runat="server" ValidationGroup="Group1" HeaderText="Please complete the highlighted field(s)." />
                </asp:Panel>
                <%-- Patient Info --%>
        <webUI:PatientInfo runat="server" ID="uc_patientInfo"></webUI:PatientInfo>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card mt-2">
                            <div class="card-header">
                                <h4 class="text-primary h4">Outpatient Medical Record</h4>
                                <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                            </div>
                            <div class="card-body collapse show" id="collapseOne">
                                <div class="form-body version">
                                    <%-- Update 08/10/2022 --%>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="alert alert-warning d-flex align-items-center" runat="server" id="LastestVersion">
                                                <span class="mr-2"><i class="fa fa-exclamation-triangle" style="font-size:24px"></i></span>
                                                <span class="mr-2">You are viewing an old version of this document</span>
                                                <asp:LinkButton OnClick="GoToLastestVersion" ID="hlkLastestVersion" Text="[View latest version]" runat="server"></asp:LinkButton>
                                            </div>
                                            <div class="alert alert-info d-flex align-items-center">
                                                <span class="mr-2"><i style="font-size: 24px;" class="fa fa-exclamation-circle"></i></span>
                                                <telerik:RadLabel runat="server" ID="rlblLogHistory" />
                                                <asp:UpdatePanel runat="server" ID="uplViewHistory">
                                                    <ContentTemplate>
                                                        <asp:LinkButton runat="server" ID="lbtnViewHistory" OnClick="ViewHistory" Text="[View History]"></asp:LinkButton>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </div>
                                    </div>

                                    <lable class="font-weight-bold">Ngày, giờ bắt đầu đánh giá/ <span class="text-primary">Starting date, time of the assessment</span></lable>

                                    <div style="display: grid; grid-template-columns: 200px 1fr">
                                        <div></div>
                                        <asp:Label runat="server" ID="lbl_asessment_date_time" />
                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_asessment_date_time" Width="200px" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <label class="control-label h4">I. Lý do đến khám/ <span class="text-primary">Chief complaint:</span></label>
                                        </div>

                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_chief_complain" />
                                            <div class="form-group" runat="server" id="chief_complain_wrapper">
                                                <webUI:TextField runat="server" ID="txt_chief_complain" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label h4">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                        </div>
                                    </div>

                                    <div runat="server" visible="false">
                                        <div class="btn btn-sm btn-primary mb-2" onclick="ShowPastMedicalHistoryRadWindow()">
                                            View Past Medical History
                                        </div>
                                        <telerik:RadCodeBlock runat="server">
                                            <script type="text/javascript">
                                                function ShowPastMedicalHistoryRadWindow() {
                                                    var window = $find("rwndPastMedicalHistory");
                                                    window.show();
                                                }
                                            </script>
                                        </telerik:RadCodeBlock>
                                        <telerik:RadWindow Modal="true" 
                                            CssClass="NoIconUrl"
                                            Width="720px"
                                            Height="500px"
                                            VisibleStatusbar="false" 
                                            Behaviors="Close,Move" 
                                            Opacity="1" 
                                            BackColor="#515e7b80" 
                                            ID="rwndPastMedicalHistory" 
                                            Title="Past Medical History" 
                                            runat="server">
                                            <ContentTemplate>
                                                <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                <telerik:RadGrid RenderMode="Lightweight" EnableAriaSupport="true" ID="rgdPastMedicalHistory" runat="server" AllowPaging="false" AllowSorting="false"
                                                        OnNeedDataSource="rgdPastMedicalHistory_NeedDataSource" AllowFilteringByColumn="false"
                                                    CellSpacing="0" GridLines="None">
                                                    <MasterTableView AutoGenerateColumns="false" TableLayout="Fixed">
                                                        <Columns>
                                                            <telerik:GridTemplateColumn>
                                                                <ItemTemplate>
                                                                    <span>
                                                                        <%# Convert.ToDateTime(Eval("actual_visit_date_time")).ToString("yyyy-MM-dd") %> 
                                                                        (<%# Eval("visit_type") %>-<%# Eval("visit_code") %>)
                                                                        <%# Eval("medical_history") %>
                                                                    </span>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                        </Columns>
                                                        <NestedViewTemplate>
                                                            <p>

                                                            <span class="font-bold">Medical history: </span>
                                                            <%# Eval("medical_history") %>
                                                            </p>

                                                            <p>

                                                            <span class="font-bold">Diagnosis: </span>
                                                            <%# Eval("diagnosis") %>
                                                            </p>
                                                            </NestedViewTemplate>

                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                    
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>                                
                                            </ContentTemplate>
                                        </telerik:RadWindow>
                                    </div>

                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">1. Bệnh sử hiện tại/ <span class="text-primary">Current Medical History:</span></label>
                                        </legend>

                                        <div class="col-md-12 mb-2 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_medical_history" />
                                            <div class="form-group" runat="server" id="medical_history_wrapper">
                                                <webUI:TextField runat="server" ID="txt_medical_history" />
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-2">
                                            <fieldset class="row">
                                                <legend>
                                                    <label class="control-label">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                </legend>
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_current_medication" />
                                                    <div class="form-group " runat="server" id="current_medication_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_current_medication" />
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </fieldset>


                                    <fieldset class="row mb-2">
                                        <legend>
                                            <label class="control-label">2. Tiền sử bệnh/ <span class="text-primary">Antecedent Medical History:</span></label>
                                        </legend>

                                        <div class="col-md-12 mb-2">
                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Bản thân/ <span class="text-primary">Personal:</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2 dg gtc-1">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_personal" />
                                                    <div class="form-group" runat="server" id="personal_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_personal" />
                                                    </div>
                                                </div>

                                                <div class="add-v20 col-md-12 mb-2">
                                                    <label class="control-label">Đã từng nhiễm COVID-19 trong vòng 6 tháng qua/ <span class="text-primary">Have been infected with COVID-19 within the last 6 months:</span></label>
                                                    <div class="dg gtc-1">
                                                        <div></div>
                                                        <asp:Label runat="server" ID="lbl_infected_with_covid"></asp:Label>
                                                        <div runat="server" id="infected_with_covid_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_infected_with_covid_true" name="rad_infected_with_covid" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_infected_with_covid_true">Có/ <span class="text-primary">Yes</span></label>
                                                            </div>
                                                            <div class="custom-control custom-radio d-inline-block">
                                                                <input type="radio" runat="server" id="rad_infected_with_covid_false" name="rad_infected_with_covid" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_infected_with_covid_false">Không/ <span class="text-primary">No</span></label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div><label class="control-label">Tiền sử tiêm chủng/ <span class="text-primary">Immunization history:</span></label></div>
                                                            
                                                    <div class="mb-2">
                                                        <label class="control-label">• Tiêm vắc xin phòng COVID-19/ <span class="text-primary">COVID-19 vaccination:</span></label>
                                                
                                                        <div>
                                                            <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_received_1_dose_true" />
                                                                <span class="custom-control-label">Đã tiêm mũi 1/ <span class="text-primary">Received 1<sup>st</sup> dose</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_received_2_dose_true" />
                                                                <span class="custom-control-label">Đã tiêm mũi 2/ <span class="text-primary">Received 2<sup>st</sup> dose</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_received_additional_true" />
                                                                <span class="custom-control-label">Đã tiêm mũi bổ sung, nhắc lại/ <span class="text-primary">Received additional, booster dose</span></span>
                                                            </label>

                                                            <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                                <input type="checkbox" class="custom-control-input" runat="server" id="cb_not_yet_vaccinations_true" />
                                                                <span class="custom-control-label">Chưa tiêm/ <span class="text-primary">Not yet</span></span>
                                                            </label>
                                                        </div>

                                                        <div class="dg gtc-1">
                                                            <label class="control-label">• Tiêm vắc xin khác (ghi rõ)/ <span class="text-primary">Other vaccinations (specify):</span></label>
                                                            <%--<asp:Label runat="server" ID="lbl_other_vaccinations"></asp:Label>
                                                            <div class="form-group" runat="server" id="other_vaccinations_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_other_vaccinations" />
                                                            </div>--%>
                                                            <asp:Label runat="server" ID="lbl_immunization" />
                                                            <div class="form-group " runat="server" id="immunization_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_immunization" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-12 mb-2" runat="server" id="habits_field">
                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">Habits/ <span class="text-primary">Thói quen:</span></label>
                                                        </legend>

                                                        <div class="col-md-12 gt-2-a">
                                                            <label class="control-label mb-2" style="width: 310px">Hút thuốc lá/ <span class="text-primary">Smoking:</span></label>
                                                            <asp:Label runat="server" ID="lbl_habits_smoking" />
                                                            <div runat="server" id="habits_smoking_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_habits_smoking_false" name="rad_habits_smoking" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_habits_smoking_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio  d-inline-block">
                                                                    <input disabled-for="habits_smoking_field" type="radio" runat="server" id="rad_habits_smoking_true" name="rad_habits_smoking" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_habits_smoking_true">Có, ghi số gói trong năm/ <span class="text-primary">Yes, specify pack years:</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_habits_smoking" onclick="clear_radiobutton(this)">
                                                                        <icon:XSquare runat="server" ID="XSquare7" />
                                                                    </a>
                                                                </div>
                                                                <div class="form-group habits_smoking_field d-inline-block">
                                                                    <input runat="server" id="txt_habits_smoking_pack" data-type="number" class="form-control w-5" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                            <div class="col-md-12 gt-2-a">
                                                            <label class="control-label mb-2" style="width: 310px">Uống rượu/ <span class="text-primary">Alcohol:</span></label>
                                                            <asp:Label runat="server" ID="lbl_habits_alcohol" />
                                                                <div runat="server" id="habits_alcohol_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_habits_alcohol_false" name="rad_habits_alcohol" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_habits_alcohol_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input disabled-for="habits_alcohol_field" type="radio" runat="server" id="rad_habits_alcohol_true" name="rad_habits_alcohol" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_habits_alcohol_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_habits_alcohol" onclick="clear_radiobutton(this)">
                                                                        <icon:XSquare runat="server" ID="XSquare6" />
                                                                    </a>
                                                                </div>
                                                                <div class="form-group habits_alcohol_field mb-2">
                                                                    <webUI:TextField runat="server" ID="txt_habits_alcohol_note" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                                
                                                                
                                                        <div class="col-md-12 gt-2-a">
                                                            <label class="control-label mb-2" style="width: 310px">Chất gây nghiện/ <span class="text-primary">Drugs:</span></label>
                                                            <asp:Label runat="server" ID="lbl_habits_drugs" />
                                                            <div runat="server" id="habits_drugs_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_habits_drugs_false" name="rad_habits_drugs" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_habits_drugs_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio mb-1 d-inline-block">
                                                                    <input disabled-for="habits_drugs_field" type="radio" runat="server" id="rad_habits_drugs_true" name="rad_habits_drugs" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_habits_drugs_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_habits_drugs" onclick="clear_radiobutton(this)">
                                                                        <icon:XSquare runat="server" ID="XSquare5" />
                                                                    </a>
                                                                </div>
                                                                <div class="form-group habits_drugs_field mb-2">
                                                                    <webUI:TextField runat="server" ID="txt_habits_drugs_note" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                                

                                                        <div class="col-md-12 gt-2-a">
                                                            <label class="control-label mb-2">Tập thể dục thường xuyên/ <span class="text-primary">Regular physical exercise:</span></label>
                                                            <asp:Label runat="server" ID="lbl_habits_physical_exercise" />
                                                            <div runat="server" id="habits_physical_exercise_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input type="radio" runat="server" id="rad_habits_physical_exercise_false" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_habits_physical_exercise_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>
                                                                <div class="custom-control custom-radio d-inline-block">
                                                                    <input disabled-for="habits_physical_exercise_field" type="radio" runat="server" id="rad_habits_physical_exercise_true" name="rad_habits_physical_exercise" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_habits_physical_exercise_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_habits_physical_exercise" onclick="clear_radiobutton(this)">
                                                                        <icon:XSquare runat="server" ID="XSquare4" />
                                                                    </a>
                                                                </div>
                                                                <div class="form-group mb-2 habits_physical_exercise_field">
                                                                    <webUI:TextField runat="server" ID="txt_habits_phy_exer_note" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                                
                                                        <div class="col-md-12 gt-2-a">
                                                            <label class="control-label mb-1">Khác, Ghi rõ/ <span class="text-primary">Other, Specify:</span></label>
                                                            <asp:Label runat="server" ID="lbl_habits_other" />
                                                            <div class="form-group" runat="server" id="habits_other_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_habits_other" />
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                </div>

                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-2">Tiền sử dị ứng/ <span class="text-primary">Allergy:</span></label>
                                                    <asp:Label runat="server" ID="lbl_allergy" />

                                                    <div runat="server" id="allergy_wrapper">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input type="radio" onchange="radioButtonChange(this)" data-target="allergy_field" runat="server" id="rad_allergy_false" name="rad_allergy" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_allergy_false">Không/ <span class="text-primary">No</span></label>
                                                        </div>
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input disabled-for="allergy_field" onchange="radioButtonChange(this)" type="radio" runat="server" id="rad_allergy_true" name="rad_allergy" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_allergy_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                            <a href="javascript:void(0)" data-clear="rad_allergy" onclick="clear_radiobutton(this)">
                                                                <icon:XSquare runat="server" ID="XSquare38" />
                                                            </a>
                                                        </div>
                                                        <%--<asp:CustomValidator ID="CustomValidator2" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="Tiền sử dị ứng/ allergy is requested" CssClass="text-danger" OnServerValidate="allergy_ServerValidate"></asp:CustomValidator>--%>
                                                        <div class="form-group allergy_field">
                                                            <webUI:TextField TextMode="SingleLine" runat="server" ID="txt_allergy_note" />
                                                            <asp:CustomValidator ID="CustomValidator2" CssClass="text-danger" ValidationGroup="Group1" OnServerValidate="CustomValidatorAllergyNote_ServerValidate" Display="Dynamic" ErrorMessage="Too many characters. 256 allowed." runat="server" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </fieldset>

                                            <fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Gia đình/ <span class="text-primary">Family:</span></label>
                                                </legend>

                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_family" />
                                                    <div class="form-group " runat="server" id="family_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_family" />
                                                    </div>
                                                </div>
                                            </fieldset>

                                            <%--<fieldset class="row mb-2">
                                                <legend>
                                                    <label class="control-label">Tiêm chủng/ <span class="text-primary">Immunization:</span></label>
                                                </legend>
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_immunization" />
                                                    <div class="form-group " runat="server" id="immunization_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_immunization" />
                                                    </div>
                                                </div>
                                            </fieldset>--%>
                                        </div>
                                    </fieldset>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label h4">III. Khám bệnh/ <span class="text-primary">Physical Examination:</span></label>
                                        </div>
                                    </div>

                                    <div class="mb-1"><label class="control-label">Dấu hiệu sinh tồn/ <span class="text-primary">Vital signs</span></label></div>

                                    <asp:UpdatePanel ID="updatepnl_vital_sign" runat="server">
                                        <ContentTemplate>
                                            <div class="dg gtc-1 mb-1">
                                                <div></div>
                                                <div>
                                                    <div class="mb-1">
                                                        <asp:LinkButton runat="server" ID="btnUpdateVitalSign" OnClick="btnUpdateVitalSign_Click" CssClass="btn btn-sm btn-secondary waves-effect">Update</asp:LinkButton>
                                                        <asp:LinkButton Visible="false" runat="server" ID="btnVSFreeText" OnClick="btnVSFreeText_Click" CssClass="btn btn-sm btn-secondary waves-effect">New Vital Sign</asp:LinkButton>
                                                        <asp:CheckBox Style="display: none" runat="server" ID="cbVSFreeText" />
                                                    </div>

                                                    <%--<label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <span class="custom-control-label">Free Text</span>
                                                    </label>--%>

                                                    <asp:UpdateProgress runat="server" AssociatedUpdatePanelID="updatepnl_vital_sign">
                                                        <ProgressTemplate>
                                                            <div class="loader1 ml-2">
                                                                <div style="width: 28px; height: 28px;" class="loader-wheel"></div>
                                                            </div>
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_temperature" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 120px" runat="server" id="vs_temperature_wrapper">
                                                                <input data-type="number" runat="server" id="txt_vs_temperature" class="form-control text-right" />
                                                                <span class="append">°C</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_weight" style="line-height: 31px"></asp:Label>
                                                                
                                                            <div class="form-group" style="width: 120px" runat="server" id="vs_weight_wrapper">
                                                                <input data-type="number" onchange="CalculateBmi()" runat="server" id="txt_vs_weight" class="form-control text-right" />
                                                                <span class="append">Kg</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                        <asp:Label runat="server" ID="lbl_vs_height" style="line-height: 31px"></asp:Label>
                                                        <div class="form-group" style="width: 120px" runat="server" id="vs_height_wrapper">
                                                            <input data-type="number" onchange="CalculateBmi()" id="txt_vs_height" runat="server" class="form-control text-right" />
                                                            <span class="append">cm</span>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label for="bmi" class="control-label mb-1 mr-2" style="line-height: 31px">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_BMI" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 150px" runat="server" id="vs_BMI_wrapper">
                                                                <input runat="server" id="txt_vs_bmi" class="form-control text-right" disabled="disabled" />
                                                                <span class="append">(Kg/m <sup>2</sup>)</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div><asp:Label runat="server" ID="bmiStr"></asp:Label></div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi) <br />
                                                            <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_pulse" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 120px" runat="server" id="vs_pulse_wrapper">
                                                                <input data-type="number" runat="server" id="txt_vs_pulse" class="form-control text-right" />
                                                                <span class="append">cm</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Nhịp tim/ <span class="text-primary">Heart rate:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_heart_rate" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 150px" runat="server" id="vs_heart_rate_wrapper">
                                                                <input data-type="number" runat="server" id="txt_vs_heart_rate" class="form-control text-right" />
                                                                <span class="append">/phút (m)</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_respiratory_rate" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 150px" runat="server" id="vs_respiratory_rate_wrapper">
                                                                <input data-type="number" runat="server" id="txt_vs_respiratory_rate" class="form-control text-right" />
                                                                <span class="append">/phút (m)</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label class="control-label mr-2 mb-1" style="line-height: 31px">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_blood_pressure" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 150px" runat="server" id="vs_blood_pressure_wrapper">
                                                                <input data-type="number1" id="txt_vs_blood_pressure" runat="server" class="form-control text-right" />
                                                                <span class="append">mmHg</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="dg gtc-2 mb-1" style="width: 400px">
                                                        <label for="spO2" class="control-label mb-1 mr-2" style="line-height: 31px">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                        <div>
                                                            <asp:Label runat="server" ID="lbl_vs_spO2" style="line-height: 31px"></asp:Label>
                                                            <div class="form-group" style="width: 120px" runat="server" id="vs_spO2_wrapper">
                                                                <input data-type="number" runat="server" id="txt_vs_spO2" class="form-control text-right" />
                                                                <span class="append">%</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div style="display: none;">
                                                        <div>
                                                            <label class="control-label mb-1 mr-2">Nhiệt độ/ <span class="text-primary">Temperature:</span></label>
                                                                    
                                                            <asp:Label runat="server" ID="vs_temperature" />&nbsp;°C
                                                        </div>

                                                        <div >
                                                            <label class="control-label mb-1 mr-2">Cân Nặng/ <span class="text-primary">Weight:</span></label>
                                                            <asp:Label runat="server" ID="vs_weight" />&nbsp;Kg
                                                        </div>

                                                        <div >
                                                            <label class="control-label mb-1 mr-2">Chiều cao/ <span class="text-primary">Height:</span></label>
                                                            <asp:Label runat="server" ID="vs_height" />&nbsp;cm
                                                        </div>

                                                        <div>
                                                            <label for="bmi" class="control-label mb-1 mr-2">Chỉ số khối cơ thể/ <span class="text-primary">BMI</span></label>
                                                            <asp:Label runat="server" ID="vs_bmi" />
                                                        </div>

                                                        <div>
                                                            <label for="head-circumference" class="control-label mb-1 mr-2">Vòng đầu (trẻ em < 2 tuổi)/ <span class="text-primary">Head Circumference (children < 2 year old) </span></label>
                                                            <asp:Label runat="server" ID="vs_pulse" />&nbsp;cm
                                                        </div>

                                                        <div >
                                                            <label class="control-label mb-1 mr-2">Nhịp tim/ <span class="text-primary">Heart Rate:</span></label>
                                                            <asp:Label runat="server" ID="vs_heart_rate" />&nbsp;/phút (m)
                                                        </div>

                                                        <div>
                                                            <label class="control-label mb-1 mr-2">Nhịp thở/ <span class="text-primary">Respiratory rate:</span></label>
                                                            <asp:Label runat="server" ID="vs_respiratory_rate" />&nbsp;/phút (m)
                                                        </div>

                                                        <div >
                                                            <label class="control-label mb-1 mr-2">Huyết áp/ <span class="text-primary">Blood Pressure:</span></label>
                                                            <asp:Label runat="server" ID="vs_blood_pressure" />&nbsp;mmHg
                                                        </div>

                                                        <div >
                                                            <label for="spO2" class="control-label mb-1 mr-2">Độ bão hòa Oxy/ <span class="text-primary">SpO2:</span></label>
                                                            <asp:Label runat="server" ID="vs_spo2" />&nbsp;%
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <div class="row mb-2">
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                                <asp:Label runat="server" ID="lbl_physical_examination" />                                                    
                                            <div class="form-group" runat="server" id="physical_examination_wrapper">
                                                <webUI:TextField runat="server" ID="txt_physical_examination" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12 gt-2-a">
                                            <label class="control-label">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological consultation required:</span></label>
                                                <asp:Label runat="server" ID="lbl_psy_consult_required" />
                                            <div runat="server" id="psy_consult_required_wrapper">
                                                <div class="d-inline-block">
                                                    <div class="custom-control custom-radio d-inline-block">
                                                        <input type="radio" runat="server" id="rad_psy_consult_required_false" name="rad_psy_consult_required" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_psy_consult_required_false">Không/ <span class="text-primary">No</span></label>
                                                    </div>
                                                    <div class="custom-control custom-radio  d-inline-block">
                                                        <input type="radio" runat="server" id="rad_psy_consult_required_true" name="rad_psy_consult_required" class="custom-control-input" />
                                                        <label class="custom-control-label" for="rad_psy_consult_required_true">Có/ <span class="text-primary">Yes</span></label>
                                                        <a href="javascript:void(0)" data-clear="rad_psy_consult_required" onclick="clear_radiobutton(this)">
                                                            <icon:XSquare runat="server" ID="XSquare1" />
                                                        </a>
                                                    <%--<asp:CustomValidator ID="CustomValidator3" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="Yêu cầu khám chuyên khoa tâm lý/ Psychological consultation required" CssClass="text-danger" OnServerValidate="psy_consult_required_ServerValidate"></asp:CustomValidator>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12"><label class="control-label h4">IV. Chỉ định và kết quả xét nghiệm/ <span class="text-primary">Laboratory indications and results:</span></label></div>
                                        <div class="col-md-12 gt-2-a">
                                            <label></label>
                                            <asp:Label runat="server" ID="lbl_laboratory_indications_results" />
                                            <div class="form-group mb-2 " runat="server" id="laboratory_indications_results_wrapper">
                                                <webUI:TextField runat="server" ID="txt_laboratory_indications_results" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12 gt-2-a">
                                            <label class=" col-md-12 control-label mb-1">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations:</span></label>
                                            <asp:Label runat="server" ID="lbl_additional_investigation" />
                                            <div class="form-group" runat="server" id="additional_investigation_wrapper">
                                                <webUI:TextField runat="server" ID="txt_additional_investigation" />
                                            </div>
                                        </div>
                                    </div>

                                    <%-- Nutrition screening --%>
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <div>❖ Kết quả sàng lọc dinh dưỡng/ <span class="text-primary">Nutrition screening</span> <span style="display: none"><asp:LinkButton runat="server" ID="btnUpdateNutritionScreening" OnClick="btnUpdateNutritionScreening_Click" CssClass="btn btn-sm btn-secondary">Update</asp:LinkButton></span></div>
                                            <div class="row mb-2" style="display: grid; grid-template-columns: 200px 1fr">
                                                <div></div>
                                                <asp:Label runat="server" ID="lbl_risk_of_malnutrition" />
                                                <%--<div runat="server" id="risk_of_malnutrition_wrapper">
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_risk_of_malnutrition_false" />
                                                        <span class="custom-control-label">Không có nguy cơ thiếu dinh dưỡng (<2)/ <span class="text-primary">No risk of malnutrition</span></span>
                                                    </label>
                                                    <label class="custom-control custom-checkbox d-inline-block mr-2">
                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_risk_of_malnutrition_true" />
                                                        <span class="custom-control-label">Có nguy cơ thiếu dinh dưỡng (≥ 2)/ <span class="text-primary">Risk of malnutrition</span></span>
                                                    </label>
                                                </div>--%>
                                            </div>
                                            <div runat="server" id="nutrition_screening_wrapper">
                                                <div>Nếu có, yêu cầu khám chuyên khoa dinh dưỡng/ <span class="text-primary">If yes, nutritional consultation required:</span></div>
                                                <div class="row mb-2" style="display: grid; grid-template-columns: 200px 1fr">
                                                    <div></div>
                                                    <div>
                                                        <asp:Label runat="server" ID="lbl_nutrition_screening_code" />
                                                        <asp:UpdatePanel ID="up_nutrition_screening" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <div class="d-inline-block">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onclick="__doPostBack('risk_of_malnutrition_changed', true)" type="radio" runat="server" id="rad_nutrition_screening_code_y" name="rad_nutrition_screening" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_nutrition_screening_code_y">Có/ <span class="text-primary">Yes</span></label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onclick="__doPostBack('risk_of_malnutrition_changed', false)" type="radio" runat="server" id="rad_nutrition_screening_code_n" name="rad_nutrition_screening" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_nutrition_screening_code_n">Không, lý do/ <span class="text-primary">No, reason</span></label>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group" runat="server" id="nutrition_screening_desc_wrapper">
                                                                    <webUI:TextField TextMode="SingleLine" runat="server" ID="txt_nutrition_screening_desc" />
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <%-- Nutrition screening end --%>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="control-label h4">V. Kết luận/ <span class="text-primary">Conclusion:</span></label>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12 gt-2-a">
                                            <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis:</span></label>
                                            <asp:Label runat="server" ID="lbl_initial_diagnosis" />
                                            <div class="form-group" runat="server" id="initial_diagnosis_wrapper">
                                                <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12 gt-2-a">
                                            <label class="control-label mb-1">Chẩn đoán xác định/ <span class="text-primary">Diagnosis:</span></label>
                                            <asp:Label runat="server" ID="lbl_diagnosis" />
                                            <div class="form-group " runat="server" id="diagnosis_wrapper">
                                                <webUI:TextField runat="server" ID="txt_diagnosis" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12 gt-2-a">
                                            <label class="control-label mb-1">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis:</span></label>
                                            <asp:Label runat="server" ID="lbl_differential_diagnosis" />
                                            <div class="form-group " runat="server" id="differential_diagnosis_wrapper">
                                                <webUI:TextField runat="server" ID="txt_differential_diagnosis" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12 gt-2-a">
                                            <label class="control-label mb-1">Bệnh kèm theo/ <span class="text-primary">Associated conditions:</span></label>
                                            <asp:Label runat="server" ID="lbl_associated_conditions" />
                                            <div class="form-group" runat="server" id="associated_conditions_wrapper">
                                                <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                            </div>
                                        </div>
                                    </div>

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <div class="row mb-2">
                                                <div class="col-md-12 gt-2-a">
                                                    <label class="control-label mb-1">Điều trị/ <span class="text-primary">Treatment:</span></label>
                                                    <asp:Label runat="server" ID="lbl_treatment_code" />
                                                    <div runat="server" id="treatment_code_wrapper" class="d-inline-block">
                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onclick="__doPostBack('rad_treatment_code_change','opd')" type="radio" runat="server" id="rad_treatment_code_opd" name="rad_treatment_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_treatment_code_opd">Ngoại trú/ <span class="text-primary">Ambulatory care</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onclick="__doPostBack('rad_treatment_code_change','ipd')" type="radio" runat="server" id="rad_treatment_code_ipd" name="rad_treatment_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_treatment_code_ipd">Nhập viện/ <span class="text-primary">Admission</span></label>
                                                        </div>

                                                        <div class="custom-control custom-radio d-inline-block">
                                                            <input onclick="__doPostBack('rad_treatment_code_change','trf')" type="radio" runat="server" id="rad_treatment_code_trf" name="rad_treatment_code" class="custom-control-input" />
                                                            <label class="custom-control-label" for="rad_treatment_code_trf">Chuyển viện/ <span class="text-primary">Transfer</span></label>
                                                            <a href="javascript:void(0)" onclick="__doPostBack('rad_treatment_code_change','')">
                                                                <icon:XSquare runat="server" ID="XSquare2" />
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2" runat="server" id="current_medication_field">
                                                <div class="col-md-12 gt-2-a">
                                                    <%--<label class="control-label mb-1"><span class="text-primary">5. Current medications:</span></label>--%>
                                                    <label class="control-label mb-1"></label>
                                                    <asp:Label runat="server" ID="lbl_medicine" />
                                                    <div class="form-group " runat="server" id="medicine_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_medicine" />
                                                    </div>
                                                </div>
                                            </div>

                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                    <div class="row mb-2">
                                        <div class="col-md-12 gt-2-a">
                                            <label class="control-label mb-1">Yêu cầu ý kiến chuyên khoa/ <span class="text-primary">Specialized opinion requested:</span></label>

                                            <asp:Label runat="server" ID="lbl_spec_opinion_requested" />
                                            <div runat="server" id="spec_opinion_requested_wrapper">
                                                <div class="custom-control custom-radio d-inline-block">
                                                    <input onchange="radioButtonChange(this)" data-target="spec_opinion_requested_field" type="radio" runat="server" id="rad_spec_opinion_requested_false" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_requested_false">Không/ <span class="text-primary">No</span></label>
                                                </div>
                                                <div class="custom-control custom-radio d-inline-block">
                                                    <input onchange="radioButtonChange(this)" disabled-for="spec_opinion_requested_field" type="radio" runat="server" id="rad_spec_opinion_requested_true" name="rad_spec_opinion_requested" class="custom-control-input" />
                                                    <label class="custom-control-label" for="rad_spec_opinion_requested_true">Có, ghi rõ/ <span class="text-primary">Yes, specify:</span></label>
                                                    <a href="javascript:void(0)" data-clear="rad_spec_opinion_requested" onclick="clear_radiobutton(this)">
                                                        <icon:XSquare runat="server" ID="XSquare3" />
                                                    </a>
                                                    <%--<asp:CustomValidator ID="CustomValidator1" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="Yêu cầu ý kiến chuyên khoa/ Specialized opinion requested" CssClass="text-danger" OnServerValidate="spec_opinion_requested_ServerValidate"></asp:CustomValidator>--%>
                                                </div>
                                                <div class="form-group spec_opinion_requested_field">
                                                    <webUI:TextField runat="server" ID="txt_spec_opinion_requested_note" TextMode="SingleLine" />
                                                    <asp:CustomValidator ID="CustomValidator1" CssClass="text-danger" ValidationGroup="Group1" OnServerValidate="CustomValidatorSpecOpinionRequestedNote_ServerValidate" Display="Dynamic" ErrorMessage="Too many characters. 256 allowed." runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12 gt-2-a">
                                            <label class="control-label mb-1">Hướng dẫn cụ thể dành cho bệnh nhân/ <span class="text-primary">Specific education required:</span></label>
                                            <asp:Label runat="server" ID="lbl_specific_education_required" />
                                            <div class="form-group " runat="server" id="specific_education_required_wrapper">
                                                <webUI:TextField runat="server" ID="txt_specific_education_required" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row mb-2">
                                        <div class="col-md-12 gt-2-a">
                                            <label class="control-label mb-1">Hẹn lần khám tới/ <span class="text-primary">Next Appointment:</span></label>
                                            <asp:Label runat="server" ID="lbl_next_appointment" />
                                            <div class="form-group" runat="server" id="next_appointment_wrapper">
                                                <webUI:TextField runat="server" ID="txt_next_appointment" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--  --%>
                                <div class="mt-2 d-flex">
                                    <asp:UpdatePanel runat="server" ID="uplPrintDocument" Class="d-inline-block">
                                        <ContentTemplate>
                                            <asp:LinkButton ValidationGroup="Group2" runat="server" OnClick="CompleteDocument" ID="btnComplete" CssClass="btn btn-primary mr-1">Complete</asp:LinkButton>
                                            <asp:LinkButton ValidationGroup="Group1" OnClick="SaveDocument" ID="btnSave" runat="server" CssClass="btn btn-primary mr-1">Save</asp:LinkButton>
                                            <asp:LinkButton runat="server" OnClick="DeleteDocument" ID="btnDelete" CssClass="btn btn-danger mr-1">Delete</asp:LinkButton>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:LinkButton runat="server" OnClick="AmendDocument" ID="btnAmend" CssClass="btn btn-secondary mr-1">Amend</asp:LinkButton>
                                    <asp:UpdatePanel runat="server" Class="d-inline-block" ID="UpdatePanel2">
                                        <ContentTemplate>
                                            <asp:LinkButton runat="server" OnClick="PrintDocument" ID="btnPrint" CssClass="btn btn-secondary mr-1">Print</asp:LinkButton>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:LinkButton runat="server" OnClick="CancelAmendDocument" ID="btnCancel" CssClass="btn btn-secondary">Cancel</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/alertify.js"></script>
    
    <script type="text/javascript">
        
        function print_document() {
            //let lbl_treatment_code = document.querySelector("#lbl_treatment_code").innerText;
            //if (lbl_treatment_code != null) {
            //    switch (lbl_treatment_code) {
            //        case "Ngoại trú/Ambulatory care":
            //            document.querySelector("#prt_treatment_opd").innerHTML = "☒";
            //            break;
            //        case "Nhập viện/Admission":
            //            document.querySelector("#prt_treatment_ipd").innerHTML = "☒";
            //            break;
            //        case "Chuyển viện/Transfer":
            //            document.querySelector("#prt_treatment_trf").innerHTML = "☒";
            //            break;
            //    }
            //}

            //let lbl_psy_consult_required = document.querySelector("#lbl_psy_consult_required").innerText;
            //if (lbl_psy_consult_required != null) {
            //    if (lbl_psy_consult_required.includes("Không/ No")) {
            //        document.querySelector("#prt_psy_consult_required_false").innerHTML = "☒";
            //    } else if (lbl_psy_consult_required.includes("Có, ghi rõ/ Yes, specify")) {
            //        document.querySelector("#prt_psy_consult_required_true").innerHTML = "☒";
            //    }
            //}

            //let lbl_spec_opinion_requested = document.querySelector("#lbl_spec_opinion_requested").innerText;
            //if (lbl_spec_opinion_requested != null) {
            //    if (lbl_spec_opinion_requested.includes("Không/ No")) {
            //        document.querySelector("#prt_spec_opinion_requested_false").innerHTML = "☒";
            //    } else if (lbl_spec_opinion_requested.includes("Có, ghi rõ/ Yes, specify")) {
            //        document.querySelector("#prt_spec_opinion_requested_true").innerHTML = "☒";
            //    }
            //}
            
            let print_page = document.querySelector("#print_page");
            print_page.style.display = "block";
            setTimeout(() => { print_page.style.display = "none"; }, 100);
            window.print();
        }
        function show_window(rwndID) {
            var oWnd = $find(rwndID);
            oWnd.show();
        }
        <%--function select_print_language() {
            var oWnd = $find("<%=rwndPrint.ClientID %>");
            oWnd.show();
        }--%>
    </script>

    <script type="text/javascript">
        formGroup_init();
        InputFilter("data-type='number'");
        InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        checkboxRadiobutton_init();

        $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            formGroup_init();
            checkboxRadiobutton_init();
            InputFilter("data-type='number'");
            InputFilter("data-type='number1'", /^\d*\.?\/?\d*$/);
            $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                    document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

        //function btnPrint_Click() {
        //    let printContent = document.querySelector("#printContent");
        //    printContent.setAttribute("style", "display: block");

        //    let total = Math.ceil(printContent.offsetHeight / 1096);

        //    for (let i = 1; i <= total; i++) {
        //        let div = document.createElement("div");
        //        div.setAttribute("class", "watermark page");
        //        div.setAttribute("style", "top: " + (1093 * (i - 1)) + "px;");
        //        //div.setAttribute("data-page", "Page " + i + " of " + total);
        //        document.getElementById("print_content").append(div);

        //    }

        //    setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);
        //    window.print();
        //}

    </script>
</body>
</html>