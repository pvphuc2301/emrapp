<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObsGynIniAss.aspx.cs" Inherits="EMR.IPD.ObsGynIniAss" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>
<%@ Register Src="~/UserControls/TextField.ascx" TagPrefix="webUI" TagName="TextField" %>
<%@ Register Src="~/icons/XSquare.ascx" TagPrefix="icon" TagName="xsquare" %>
<%@ Register Src="~/UserControls/PrintTemplate/PrintWindow.ascx" TagPrefix="webUI" TagName="PrintWindow" %>
<%@ Register Src="~/UserControls/PrintTemplate/Label.ascx" TagPrefix="webUI" TagName="Label" %>
<%@ Register Src="~/UserControls/AmendReason.ascx" TagPrefix="webUI" TagName="AmendReason" %>
<%@ Register Src="~/UserControls/PopupModal.ascx" TagPrefix="webUI" TagName="PopupModal" %>
<%@ Register Src="~/icons/ExclamationTriangle.ascx" TagPrefix="icon" TagName="ExclamationTriangle" %>
<%@ Register Src="~/UserControls/Barcode.ascx" TagPrefix="webUI" TagName="Barcode" %>
<%@ Register Src="~/icons/Trash.ascx" TagPrefix="icon" TagName="Trash" %>
<%@ Register Src="~/UserControls/PrintTemplate/Signature.ascx" TagPrefix="webUI" TagName="Signature" %>
<%@ Register Src="~/UserControls/PrintTemplate/Date.ascx" TagPrefix="webUI" TagName="Date" %>
<%@ Register Src="~/icons/Calculator.ascx" TagPrefix="icon" TagName="Calculator" %>
<%@ Register Src="~/UserControls/PrintTemplate/Line.ascx" TagPrefix="webUI" TagName="Line" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../styles/style.css" rel="stylesheet" />
    <link href="../styles/myStyle.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
    <link href="../styles/print-10.2022.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="../styles/telerik-custom.css" rel="stylesheet" />
    <style>
        @page {
            margin-top: 15px;
        }
        #print_content {
		    line-height: initial !important;
	    }
    </style>
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen" id="print_page" runat="server" style="font-family: 'Times New Roman' !important; width: 210mm; overflow: hidden">
                <table class="report-container">
                    <thead class="report-header">
                        <tr>
                            <th class="report-header-cell">
                                <div runat="server" id="print_header" style="width: 210mm; height: 2.5cm">
                                    <div style="display: flex; align-items: center; padding: 0 18px">
                                        <img style="width: 180px" src="../images/AIH_PI_FULL.png" />
                                        <div style="text-align: center; align-self: center; flex-grow: 1">
                                            <div><span style="font-size: 12pt; font-weight: bold">BỆNH ÁN SẢN PHỤ KHOA</span></div>
                                            <div class="en"><i style="font-size: 11pt; font-weight: bold">OBSTETRIC & GYNECOLOGICAL INITIAL ASSESSMENT</i></div>
                                        </div>
                                        <div style="width: 150px; text-align: center; font-size: 11px">
                                            <div runat="server" id="prt_fullname"></div>
                                            <div runat="server" id="prt_gender"></div>
                                            <div class="d-block" runat="server" id="prt_DOB"></div>
                                            <div runat="server" id="prt_vpid" class="d-block font-bold"></div>
                                            <asp:PlaceHolder ID="BarCode" runat="server"></asp:PlaceHolder>
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
                                <div class="main" runat="server" id="print_content" style="font-size: 12pt; margin: 0 1.5cm 0 2cm;">
                                    <!-- Code printed here -->
                                    <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                        <div>I.</div>
                                        <div><span class="font-bold">Lí do nhập viện/ <span class="en">Reason for admission: </span></span><asp:Label runat="server" ID="prt_reason_admission"></asp:Label></div>
                                    </div>
                                    <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                        <div>II.</div>
                                        <div><span class="font-bold">Bệnh sử/ <span class="en">Medical history: </span></span></div>
                                    </div>
                                    <div style="display: grid; grid-template-columns: 18px 1fr; gap: 6px">
                                        <div>1.</div>
                                        <div>
                                            <span class="font-bold">Bệnh sử hiện tại/ <span class="en">Current medical history: </span></span>
                                        </div>
                                    </div>
                                    <div class="text-center font-bold"><asp:Label ID="prt_title" runat="server" /></div>
                                    <%--  --%>
                                    <div id="div_obs" runat="server">
                                        <div>- Kinh chót/ <span class="en">LMP:</span> từ/ <span class="en">from: </span><asp:Label runat="server" ID="prt_lmp_from"/> đến/ <span class="en">to: </span><asp:Label runat="server" ID="prt_lmp_to"/></div>
                                        <div>- Tuổi thai/ <span class="en">Gestational age: </span>
                                            <asp:Label runat="server" ID="prt_ges_age_weeks"/> tuần/ <span class="en">weeks: </span>
                                            <asp:Label runat="server" ID="prt_ges_age_days"/> ngày/ <span class="en">days</span>
                                        </div>
                                        <div>- Khám thai/ <span class="en">Prenatal visit:</span><asp:Label runat="server" ID="prt_prenatal_visit"/></div>
                                        <div>- Chủng ngừa uốn ván/ <span class="en">Tetanus vaccination:</span></div>
                                        <div style="margin-left: 10px"><asp:Label ID="prt_tetanus_vaccination" runat="server" /></div>
                                        <div>- Nhiễm Streptococcus nhóm B/ <span class="en">GBS infection:</span></div>
                                        <div style="margin-left: 10px;">• Con trước nhiễm trùng huyết do Streptococcus nhóm B/ <span class="en">Previous infant with invasive GBS disease:</span></div>
                                        <div style="margin-left: 40px"><asp:Label ID="prt_gbs_disease" runat="server" /></div>
                                        <div style="margin-left: 40px">Nhiễm trùng tiểu do Streptococcus nhóm B trong thai kỳ lần này/ <span class="en">GBS bacteriuria during any trimester of the current pregnancy:</span></div>
                                        <div style="margin-left: 40px"><asp:Label ID="prt_gbs_bacteriuria" runat="server" /></div>
                                        <div style="margin-left: 10px;">• Cấy tầm soát phết âm đạo – trực tràng dương tính Streptococcus nhóm B trong tam cá nguyệt cuối thai kỳ lần này/ <span class="en">Positive GBS vaginal-rectal screening culture in late gestation during current pregnancy:</span></div>
                                        <div style="margin-left: 40px"><asp:Label ID="prt_gbs_vaginal" runat="server" /></div>
                                        <div class="d-grid" style="grid-template-columns: auto 1fr;">
                                            <div>- Đái tháo đường thai kỳ/ <span class="en">Gestational Diabetes:&nbsp;</span></div>
                                            <div><asp:Label ID="prt_ges_diabetes" runat="server" /></div>
                                        </div>
                                        <div>- Bất thường khác trong thai kỳ/ <span class="en">Other gestational abnormalities:</span></div>
                                        <div style="margin-left: 40px;"><asp:Label ID="prt_other_ges_abnormal" runat="server" /></div>
                                        <div>- Chuyển dạ khởi phát lúc/ <span class="en">Labor triggered at:</span><asp:Label ID="prt_labor_trig_at_time" runat="server" /></div>
                                        <div>- Dấu hiệu ban đầu/ <span class="en">Preliminary signs:</span><asp:Label ID="prt_preliminary_signs" runat="server" /></div>
                                        <div style="margin-left: 20px;">❖ <span class="font-bold">Thuốc đang sử dụng/ <span class="en">Current medications</span></span>: <asp:Label ID="prt_obs_cur_medication" runat="server" /></div>
                                    </div>

                                    <div id="div_gyn" runat="server">
                                        <div><asp:Label ID="prt_gyn_med_history" runat="server" /></div>
                                        <div>
                                            ❖ <span class="font-bold">Thuốc đang sử dụng/ <span class="en">Current medications: </span></span>
                                            <asp:Label ID="prt_gyn_cur_medication" runat="server" />
                                        </div>
                                    </div>
                                    <div><span class="font-bold">2. Tiền sử bệnh/ <span class="en">Antecedent medical history:</span></span></div>
                                    <div>- Cá nhân/ <span class="en">Personal:</span> <asp:Label ID="prt_personal" runat="server" /></div>
                                    <div style="height: 26px"><asp:Label runat="server"> Đã từng nhiễm COVID-19 trong vòng 6 tháng qua</span>/ <span class="en">Have been infected with COVID-19 within the last 6 months:</span></asp:Label></div>
                                    <div style="margin-left: 100px">
                                        <asp:Label CssClass="ml-4" runat="server" ID="prt_infected_with_covid_true" Text="❏"/>&nbsp;Có/ <span class="en">Yes</span>
                                        <asp:Label CssClass="ml-4" runat="server" ID="prt_infected_with_covid_false" Text="❏"/>&nbsp;Không/ <span class="en">No</span>
                                    </div>
                                    <div><asp:Label runat="server">Tiền sử tiêm chủng</span>/ <span class="en">Immunization history:</span></asp:Label></div>
                                    <div><asp:Label runat="server">• Tiêm vắc xin phòng COVID-19/ <span class="en">COVID-19 vaccination:</span> </asp:Label></div>
                                    <div>
                                        <asp:Label CssClass="ml-4" runat="server" ID="prt_received_1_dose_true" Text="❏"/>&nbsp;Đã tiêm mũi 1/ <span class="en">Received 1<sup>st</sup> dose</span>
                                        <asp:Label CssClass="ml-4" runat="server" ID="prt_received_2_dose_true" Text="❏"/>&nbsp;Đã tiêm mũi 2/ <span class="en">Received 2<sup>nd</sup> dose</span>
                                    </div>
                                    <div>
                                        <asp:Label CssClass="ml-4" runat="server" ID="prt_received_additional_true" Text="❏"/>&nbsp;Đã tiêm mũi bổ sung, nhắc lại/ <span class="en">Received additional, booster dose</span>
                                        <asp:Label CssClass="ml-4" runat="server" ID="prt_not_yet_vaccinations_true" Text="❏"/>&nbsp;Chưa tiêm/ <span class="en">Not yet</span>
                                    </div>
                                    <div><asp:Label runat="server" ID="prt_other_vaccinations"/></div>
                                    <div>- Gia đình/ <span class="en">Family: </span><asp:Label ID="prt_family" runat="server" /></div>
                                    <div><span class="font-bold">3. Tiền căn phụ khoa/ <span class="en">Gynecological history:</span></span></div>

                                    <div>
                                        - Tuổi dậy thì/ <span class="en">Age of menarche: </span><asp:Label ID="prt_age_of_menarhce" runat="server" />,
                                        Chu kỳ kinh/ <span class="en">Menstrual cycle:</span>
                                        <asp:Label ID="prt_menstrual_cycle" runat="server" />
                                        ngày/ <span class="en">day(s).</span> Số ngày hành kinh/ <span class="en">Length of period:</span>
                                        <asp:Label ID="prt_length_of_period" runat="server" />
                                        ngày/ <span class="en">day(s)</span>, Lượng máu kinh/ <span class="en">Amount of menstrual blood:</span>
                                        <asp:Label ID="prt_amount_mens_blood" runat="server" />
                                    </div>

                                    <div>- Tuổi kết hôn/ <span class="en">Marriage age:</span><asp:Label ID="prt_marriage_age" runat="server" /></div>

                                    <div>- Tuổi mãn kinh/ <span class="en">Age of menopause: </span><asp:Label ID="prt_age_menopause" runat="server" /></div>

                                    <div>- Những bệnh phụ khoa đã mắc trước đây/ <span class="en">Previous gynecological diseases: </span><asp:Label ID="prt_previous_gyn_diseases" runat="server" /></div>

                                    <div><span class="font-bold">4. Tiền căn sản khoa</span>/ <span class="en">Obstetric history:</span></div>

                                    <table style="table-layout: fixed; width: 100%" class="table-bordered mt-1 mb-1" runat="server" id="prt_obs_history">
                                        <tr>
                                            <td style="width: 250px"><span class="font-bold">Lần mang thai thứ</span>/ <span class="en">gravidity</span></td>
                                            <td class="text-center"><span class="font-bold">1</span></td>
                                            <td class="text-center"><span class="font-bold">2</span></td>
                                            <td class="text-center"><span class="font-bold">3</span></td>
                                            <td class="text-center"><span class="font-bold">4</span></td>
                                            <td class="text-center"><span class="font-bold">5</span></td>
                                            <td class="text-center"><span class="font-bold">6</span></td>
                                        </tr>
                                    </table>

                                    <div><span class="font-bold">III. Khám lâm sàng/ <span class="en">Physical examination:</span></span></div>

                                    <div><span class="font-bold">1. Khám tổng quát/ <span class="en">General exam:</span></span></div>

                                    <div style="margin-left: 40px;"><span class="font-bold">• Tổng trạng/ </span><span class="en">General appearance: </span><asp:Label ID="prt_general_appearance" runat="server" /></div>

                                    <div class="d-grid" style="margin-left: 40px; grid-template-columns: auto 1fr;">
                                        <div>
                                            <span class="font-bold">Phù/ </span><span class="en">Edema:</span>&nbsp;
                                        </div>
                                        <div>
                                            <asp:Label ID="prt_edema" runat="server" />
                                        </div>
                                    </div>

                                    <div style="margin-left: 40px;">
                                        <span class="font-bold">• Hệ tim mạch/ </span><span class="en">Cardiovascular system: </span><asp:Label ID="prt_cardio_system" runat="server" />
                                    </div>
                                    
                                    <div style="margin-left: 40px;">
                                        <span class="font-bold">• Hệ hô hấp/ </span><span class="en">Respiratory system: </span><asp:Label ID="prt_respiratory_system" runat="server" />
                                    </div>
                                    
                                    <div style="margin-left: 40px;">
                                        <span class="font-bold">• Hệ tiêu hóa/ </span><span class="en">Digestive system: </span><asp:Label ID="prt_digestive_system" runat="server" />
                                    </div>
                                    
                                    <div style="margin-left: 40px;">
                                        <span class="font-bold">• Hệ thần kinh/ </span><span class="en">Nervous system: </span><asp:Label ID="prt_nervous_system" runat="server" />
                                    </div>
                                    
                                    <div style="margin-left: 40px;">
                                        <span class="font-bold">• Hệ niệu-dục/ </span><span class="en">Urogenital system: </span><asp:Label ID="prt_uro_system" runat="server" />
                                    </div>
                                    
                                    <div style="margin-left: 40px;">
                                        <span class="font-bold">• Hệ cơ-xương-khớp/ </span><span class="en">Musculoskeletal system: </span><asp:Label ID="prt_mus_system" runat="server" />
                                    </div>
                                    
                                    <div style="margin-left: 40px;">
                                        <span class="font-bold">• Tai Mũi Họng/ </span><span class="en">Otorhinolaryngology: </span><asp:Label ID="prt_otorhinolaryngology" runat="server" />
                                    </div>

                                    <div style="margin-left: 40px;">
                                        <span class="font-bold">• Hệ da-lông/ </span><span class="en">Integumentary system: </span><asp:Label ID="prt_integumentary_system" runat="server" />
                                    </div>

                                    <div style="margin-left: 40px;">
                                        <span class="font-bold">• Mắt/ </span><span class="en">Ophthalmology: </span><asp:Label ID="prt_ophthalmology" runat="server" />
                                    </div>
                                    
                                    <div style="margin-left: 40px;">
                                        <span class="font-bold">• Ghi nhận khác/ </span><span class="en">Other findings: </span><asp:Label ID="prt_other_findings" runat="server" />
                                    </div>
                                    
                                    <div class="d-grid" style="grid-template-columns: auto 1fr;">
                                        <div>
                                            ❖ <span class="font-bold">Yêu cầu khám chuyên khoa tâm lý/ </span><span class="en">Psychological consultation required: </span>&nbsp;
                                        </div>
                                        <asp:Label ID="prt_psy_consul_required" runat="server" />
                                    </div>
                                    <div>&nbsp;</div>
                                    <div id="div_for_obstetric" runat="server">
                                        <div><span class="font-bold">2. Khám chuyên khoa/ <span class="en">Specific exam: </span></span>(Cho sản khoa/ <span class="en">For Obstetric)</span></div>
                                    
                                        <div style="margin-left: 10px;">
                                            <span class="font-bold">• Khám ngoài/ </span><span class="en">External exam: </span><asp:Label ID="Label1" runat="server" />
                                        </div>

                                        <div style="">
                                            - Vết mổ cũ/ <span class="en">Previous cicatrice: </span><asp:Label ID="prt_obs_pre_cicatrice_true" runat="server" Text="❏" />
                                        </div>

                                        <div style="">
                                            - Hình dáng tử cung/ <span class="en">Uterine shape: </span><asp:Label ID="prt_obs_uterine_shape" runat="server" />
                                            . Tư thế/ <span class="en">Posture: </span><asp:Label runat="server" ID="prt_obs_posture"/>
                                        </div>

                                        <div style="">
                                            - Bề cao tử cung/ <span class="en">Fundal height: </span><asp:Label runat="server" ID="prt_obs_fundal_height"/>
                                            cm, chu vi vòng bụng/ <span class="en">abdominal circumference: </span><asp:Label runat="server" ID="prt_obs_abdominal_circum"/>&nbsp;cm
                                        </div>

                                        <div style="">
                                            - Cơn gò tử cung/ <span class="en">Uterine contraction: </span><asp:Label ID="prt_obs_uterine_con" runat="server" />
                                        </div>

                                        <div style="">
                                            - Tần số tim thai/ <span class="en">Fetal heart rate: </span><asp:Label ID="prt_obs_fetal_heart_rate" runat="server" />&nbsp;lần/phút/ <span class="en">bpm</span>
                                        </div>

                                        <div style="">
                                            - Ngực/ <span class="en">Breasts: </span><asp:Label ID="prt_obs_breasts" runat="server" />
                                        </div>

                                        <div style="margin-left: 10px; ">
                                            <span class="font-bold">• Khám trong</span>/ <span class="en">Internal exam:</span>
                                        </div>

                                        <div style="">
                                            - Chỉ số Bishop/ <span class="en">Bishop score: </span><asp:Label ID="prt_obs_bishop_score" runat="server" />&nbsp;điểm/ <span class="en">points</span>
                                        </div>
                                    
                                        <div style="">
                                            - Âm hộ/ <span class="en">Vulva: </span><asp:Label runat="server" ID="prt_obs_vulva"/>
                                             Âm đạo/ <span class="en">Vagina: </span><asp:Label runat="server" ID="prt_obs_vagina"/>
                                        </div>

                                        <div style="">
                                            - Tầng sinh môn/ <span class="en">Perineum: </span><asp:Label runat="server" ID="prt_obs_perineum"/>
                                        </div>
                                    
                                        <div style="">
                                            - Cổ tử cung/ <span class="en">Cervix: </span><asp:Label runat="server" ID="prt_obs_cervix"/>
                                            Phần phụ/ <span class="en">Adnexa: </span><asp:Label runat="server" ID="prt_obs_adnexa"/>
                                        </div>
                                    
                                        <div class="d-grid" style="grid-template-columns: auto 1fr; ">
                                            <div>
                                                - Tình trạng ối/ <span class="en">Membrane condition &nbsp;</span>
                                            </div>
                                            <asp:Label ID="prt_obs_mem_condition_code" runat="server" />
                                        </div>

                                        <div runat="server" id="obs_mem_condition_code_ru_field" style="">
                                            - Ối vỡ lúc/ <span class="en">Rupture of membrane at: </span><asp:Label runat="server" ID="prt_obs_rup_of_mem_at"/>
                                            <br />
                                            <asp:Label runat="server" ID="prt_obs_rup_of_mem_code"/>
                                        </div>

                                        <div style="">
                                            <span class="font-bold">- Đặc điểm dịch ối</span>/ <span class="en">Features of amniotic fluid:</span>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr 1fr; margin-left: 40px; ">
                                            <div>
                                                <asp:Label ID="prt_obs_feat_amniotic_n" Text="❏" runat="server" />&nbsp;Bình thường/ <span class="en">Normal</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_obs_feat_amniotic_o" Text="❏" runat="server" />&nbsp;Thiểu ối/ <span class="en">Oligohydramnios</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_obs_feat_amniotic_p" Text="❏" runat="server" />&nbsp;Đa ối/ <span class="en">Polyhydramnios</span>
                                            </div>
                                        </div>

                                        <div style="">- Ngôi thai/ <span class="en">Presentation:</span></div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr; margin-left: 40px; ">
                                            <div>
                                                <asp:Label ID="prt_obs_presentation_code_c" runat="server" Text="❏" />&nbsp;Đầu/ <span class="en">Cephalic</span>
                                            </div>
                                            <div>
                                                <asp:Label ID="prt_obs_presentation_code_b" runat="server" Text="❏" />&nbsp;Mông/ <span class="en">Breech</span>
                                            </div>

                                            <div>
                                                <asp:Label ID="prt_obs_presentation_code_o" runat="server" Text="❏" />&nbsp;Ngôi khác/ <span class="en">Others, specify: </span><asp:Label ID="prt_obs_presentation_other" runat="server" />
                                            </div>
                                        </div>

                                        <div style="">
                                            - Vị trí ngôi thai/ <span class="en">Fetal position: </span><asp:Label ID="prt_obs_fetal_position" runat="server" />
                                        </div>

                                        <div style="">
                                            - Khám khung chậu/ <span class="en">Pelvic exam: </span><asp:Label ID="prt_obs_pelvic_exam" runat="server" />
                                        </div>
                                    </div>

                                    <div id="div_for_gyneacology" runat="server">
                                        
                                        <div><span class="font-bold">2. Khám chuyên khoa/ <span class="en">Specific exam: </span></span> (Cho phụ khoa/ <span class="en">For Gyneacology)</span></div>

                                        <div style="margin-left: 12px">
                                            <span class="font-bold">• Khám ngoài/ <span class="en">External examination: </span></span>
                                        </div>
                                        
                                        <div style="margin-left: 12px">
                                            - Bụng có sẹo phẫu thuật cũ/ <span class="en">Abdominal Surgery Scars:</span>
                                            <asp:Label runat="server" ID="prt_gyn_abdo_sur_scars_true" Text="❏"/>
                                            Lý do/ <span class="en">Reason</span> <asp:Label runat="server" ID="prt_gyn_reason"/>
                                        </div>
                                        
                                        <div style="margin-left: 12px">- Sờ nắn và đo ngoài tử cung/ <span class="en">Uterine Height:</span><asp:Label runat="server" ID="prt_gyn_uterine_height"/></div>
                                        
                                        <div style="margin-left: 12px">
                                            <span class="font-bold">• Khám trong/ <span class="en">Internal examination: </span></span>
                                        </div>
                                        
                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr; margin-left: 12px">
                                            <div>Âm hộ/ <span class="en">Vulva: </span><asp:Label runat="server" ID="prt_gyn_vulva"/></div>
                                            <div>Tầng sinh môn/ <span class="en">Perineum: </span><asp:Label runat="server" ID="prt_gyn_perineum"/></div>
                                        </div>

                                        <div style="margin-left: 12px">Khám mỏ vịt/ <span class="en">Speculum examination</span></div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr; margin-left: 12px">
                                            <div>Âm đạo/ <span class="en">Vagina: </span><asp:Label runat="server" ID="prt_gyn_vagina"/></div>
                                            <div>Dịch tiết/ <span class="en">Discharge: </span><asp:Label runat="server" ID="prt_gyn_discharge"/></div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr; margin-left: 12px">
                                            <div>Cổ tử cung/ <span class="en">Cervix: </span><asp:Label runat="server" ID="prt_gyn_cervix"/></div>
                                            <div>Tử cung/ <span class="en">Uterus: </span><asp:Label runat="server" ID="prt_gyn_uterus"/></div>
                                        </div>

                                        <div class="d-grid" style="grid-template-columns: 1fr 1fr; margin-left: 12px">
                                            <div>
                                                Phần phụ/ <span class="en">Adnexa: </span><asp:Label runat="server" ID="prt_gyn_adnexa"/>
                                            </div>
                                            <div>
                                                Các túi cùng /<span class="en">Douglas pouchs: </span><asp:Label runat="server" ID="prt_gyn_douglas_pouchs"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div><span class="font-bold">IV. Chỉ định và kết quả xét nghiệm / <span class="en">Laboratory indications and results: </span></span></div>
                                    
                                    <div style="margin-left: 20px;">
                                        <div><asp:Label runat="server" ID="prt_lab_result"/></div>
                                        <div><asp:Label ID="prt_add_investigations" runat="server" /></div>
                                    </div>

                                    <div><span class="font-bold">V. Kết luận/ <span class="en">Conclusion</span>: </span></div>

                                    <div style="margin-left: 20px; ">
                                        <span class="font-bold">Chẩn đoán ban đầu</span>/ <span class="en">Initial diagnosis: </span><asp:Label ID="prt_initial_diagnosis" runat="server" />
                                    </div>

                                    <div style="margin-left: 20px; ">
                                        <span class="font-bold">Chẩn đoán phân biệt</span>/ <span class="en">Differential diagnosis: </span><asp:Label ID="prt_diff_diagnosis" runat="server" />
                                    </div>

                                    <div style="margin-left: 20px; ">
                                        <span class="font-bold">Bệnh kèm theo</span>/ <span class="en">Associated conditions: </span><asp:Label ID="prt_associated_conditions" runat="server" />
                                    </div>

                                    <div style="margin-left: 20px; ">
                                        <span class="font-bold">Kế hoạch điều trị</span>/ <span class="en">Treatment Plan: </span><asp:Label ID="prt_treatment_plan" runat="server" />
                                    </div>

                                    <div style="margin-left: 20px;">
                                        <span class="font-bold">Kế hoạch xuất viện</span>/ <span class="en">Discharge plan: </span><asp:Label ID="prt_discharge_plan" runat="server" />
                                    </div>
                                    
                                    <div class="d-grid" style="grid-template-columns: 1fr 1fr; grid-gap: 5px">
                                        <div></div>
                                        <div class="text-center" style="break-inside: avoid !important; page-break-inside: avoid !important">
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
                            <td class="report-footer-cell" runat="server" id="print_footer" style="height: 2cm; width: 210mm">
                                <div style="margin-left: -18px"><img style="width: 210mm" src="../images/ExcellentCare.png" /></div>
                                <div class="footer-info" style="padding: 0 18px">
                                    <div style="font-weight: bold;">BỆNH VIỆN QUỐC TẾ MỸ</div>
                                    <div>Số 6, Đường Bắc Nam 3, Phường An Phú, Tp. Thủ Đức, Tp.HCM</div>
                                    <div>Tel: 028 3910 9999</div>
                                    <div>www.aih.com.vn</div>
                                </div>
                            </td>
                            <td class="report-footer-space" runat="server" id="print_footer_space" style="height: 2cm; width: 210mm"></td>
                        </tr>
                    </tfoot>
                </table>
            </div>

                <telerik:RadWindowManager RenderMode="Lightweight"  EnableShadow="true" Behaviors="Close,Move" ID="RadWindowManager" DestroyOnClose="true" RestrictionZoneID="RestrictionZone" Opacity="99" runat="server" Width="450" MaxHeight="400">
                    <Windows>
                        <telerik:RadWindow CssClass="NoIconUrl" VisibleStatusbar="false" MinWidth="600" RenderMode="Lightweight" ID="RadWindow1" Title="Version History" runat="server">
                            <ContentTemplate>
                                <telerik:RadGrid ShowHeader="false" ID="RadGrid1" runat="server" AllowSorting="true" OnItemCommand="RadGrid1_ItemCommand">
                                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="document_id,document_log_id">
                                        <Columns>
                                            <telerik:GridTemplateColumn>
                                                <ItemTemplate>
                                                    <telerik:RadLabel runat="server" ID="RadLabel1" Text='<%# GetHistoryName(Eval("status"),Eval("created_name_e"), Eval("created_date_time"), Eval("modified_name_e"), Eval("modified_date_time"), Eval("amend_reason")) %>'/>
                                                    <asp:HyperLink CssClass="btn-link" Text="View Log" runat="server" NavigateUrl='<%# GetLogUrl(Eval("document_log_id")) %>'/>
                                                </ItemTemplate>
                                            </telerik:GridTemplateColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <SelectedItemStyle CssClass="SelectedStyle" />
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="true" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </ContentTemplate>
                        </telerik:RadWindow>
                        <telerik:RadWindow CssClass="NoIconUrl" RenderMode="Lightweight" ID="RadWindow2" Title="Warning" runat="server">
                            <ContentTemplate>
                                <div class="text-center">
                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                    <h4 class="mt-4 mb-4">Delete document?</h4>
                                </div>

                                <div class="d-grid no-block justify-content-end">
                                    <asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="btnDelete" CssClass="btn btn-danger">Delete</asp:LinkButton>
                                </div>
                            </ContentTemplate>
                        </telerik:RadWindow>
                        <telerik:RadWindow CssClass="NoIconUrl" RenderMode="Lightweight" ID="RadWindow3" Title="Warning" runat="server">
                            <ContentTemplate>
                                <div class="text-center">
                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                    <h4 class="mt-4">Denied!</h4>
                                    <label runat="server" id="lblUserBlock" />
                                </div>

                                <div class="d-grid no-block justify-content-end">
                                    <%--<asp:LinkButton OnClick="btnDelete_Click" runat="server" ID="LinkButton1" CssClass="btn btn-danger">Delete</asp:LinkButton>--%>
                                </div>
                            </ContentTemplate>
                        </telerik:RadWindow>
                    </Windows>
                </telerik:RadWindowManager>

                <div class="cssclsNoPrint">
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;border-bottom: 1px solid #ddd; border-radius: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>OBSTETRIC & GYNECOLOGICAL INITIAL ASSESSMENT</li>
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

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" ValidationGroup="Group1" runat="server" ControlToValidate="txt_amend_reason" ErrorMessage="Please enter amend reason"
                                            ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>

                            <asp:ValidationSummary
                                ID="valSum"
                                DisplayMode="BulletList"
                                CssClass="validationSummary"
                                runat="server" ValidationGroup="Group1"
                                HeaderText="Please complete the highlighted field(s)." />
                        </asp:Panel>

                        <div class="row">
                            <div class="col-md-12 cssclsNoScreen">
                                <asp:Label runat="server" ID="lblPid"></asp:Label>
                            </div>
    <div class="col-lg-12" id="accordionExample">
        <div class="card">
            <div class="card-body collapse show" id="collapsePatientInfo" aria-labelledby="headingPatientInfo">
                <h5 class="box-title">Thông tin bệnh nhân/ Patient Detail</h5>
                <hr style="margin: 8px 0 12px 0;" />
                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">First Name:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblFirstName" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>

                    <!--/span-->
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Last Name:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblLastName" CssClass="control-label text-sm-right"></asp:Label>
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
                            <asp:Label runat="server" ID="lblGender" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Date of Birth:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblDoB" CssClass="control-label text-sm-right"></asp:Label>
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
                            <asp:Label runat="server" ID="lblContactPerson" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>

                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Relationship:</label>

                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblRelationship" CssClass="control-label text-sm-right"></asp:Label>
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
                            <asp:Label runat="server" ID="lblPatientAddress" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                </div>
                <!--/row-->
                <!--/row-->
                <!-- Header: Patient Visit Info -->
                <h5 class="box-title">Thông tin lần khám/ Visit Detail <span class="text-danger">*</span></h5>
                <hr style="margin: 8px 0 12px 0;" />

                <div class="row">
                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Encounter:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblVisitCode" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>

                    <div class="col-sm-6" style="display: flex">
                        <div class="w-5 text-sm-right">
                            <label class="control-label text-sm-right mr-3">Admit Date:</label>
                        </div>
                        <div class="flex-grow-1">
                            <asp:Label runat="server" ID="lblVisitDate" CssClass="control-label text-sm-right"></asp:Label>
                        </div>
                    </div>
                    <!--/span-->
                </div>
            </div>
        </div>
    </div>
</div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card v20">
                                    <div class="card-header">
                                        <h4 class="text-primary">OBSTETRIC & GYNECOLOGICAL INITIAL ASSESSMENT</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="alert alert-warning d-flex align-items-center" runat="server" id="currentLog">
                                                        <span class="mr-2">You are viewing an old version of this document</span>
                                                        <asp:HyperLink OnLoad="LinkViewLastestVersion_Load" ID="LinkViewLastestVersion" CssClass="btn-link" Text="View Latest Version" runat="server" />
                                                    </div>

                                                    <div class="alert alert-info d-flex align-items-center">
                                                        <telerik:RadLabel runat="server" ID="RadLabel1" />
                                                        <a class="btn-link" href="javascript:void(0)" onclick="showWindow('RadWindow1')">View History</a>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <label class="col-md-12 control-label mb-1 h4">I. Lý do nhập viện/ <span class="text-primary">Reason for admission:</span></label>
                                                <div class="col-md-12 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_reason_admission" />
                                                    <div class="form-group" runat="server" id="reason_admission_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_reason_admission" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h4">II. Bệnh sử/ <span class="text-primary">Medical History:</span></label>
                                                </div>
                                            </div>

                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div class="row mb-2 gt-2-a">
                                                        <label></label>
                                                        <asp:Label runat="server" CssClass="col-md-12" ID="lbl_is_obs_gyn" />
                                                        <div class="col-md-12" runat="server" id="is_obs_gyn_wrapper">
                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input type="radio" onclick="__doPostBack('is_obs_gyn_change', true)" runat="server" id="rad_is_obs_gyn_true" name="rad_is_obs_gyn" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_is_obs_gyn_true">SẢN KHOA/ <span class="text-primary">OBSTETRICS</span></label>
                                                            </div>

                                                            <div class="custom-control custom-radio d-inline-block ml-2">
                                                                <input type="radio" onclick="__doPostBack('is_obs_gyn_change', false)" runat="server" id="rad_is_obs_gyn_false" name="rad_is_obs_gyn" class="custom-control-input" />
                                                                <label class="custom-control-label" for="rad_is_obs_gyn_false">PHỤ KHOA/ <span class="text-primary">GYNECOLOGY</span></label>
                                                                <a href="javascript:void(0)" data-clear="rad_is_obs_gyn" onclick="clear_radiobutton(this)">
                                                                    <icon:xsquare runat="server" ID="XSquare24" />
                                                                </a>
                                                            </div>
                                                            <asp:CustomValidator ID="CustomValidator1" ValidationGroup="Group1" runat="server" Display="Dynamic" ErrorMessage="This field is required" CssClass="text-danger" OnServerValidate="is_obs_gyn_ServerValidate"></asp:CustomValidator>
                                                        </div>
                                                    </div>
                                                
                                                    <fieldset runat="server" id="gynecology_field" class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">1. Bệnh sử hiện tại/ <span class="text-primary">Current medical history:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label></label>
                                                            <asp:Label runat="server" ID="lbl_gyn_med_history"></asp:Label>
                                                            <div class="form-group" runat="server" id="gyn_med_history_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_gyn_med_history" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-2">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                            <asp:Label runat="server" ID="lbl_gyn_cur_medication"></asp:Label>
                                                            <div class="form-group" runat="server" id="gyn_cur_medication_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_gyn_cur_medication" />
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2" runat="server" id="obstetrics_field">
                                                        <legend>
                                                            <label class="control-label">1. Bệnh sử hiện tại/ <span class="text-primary">Current medical history:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1 w-5">Kinh chót/ <span class="text-primary">LMP:</span></label>
                                                            <div>
                                                                <div class="d-inline-block">
                                                                    <label class="control-label mb-1">từ/ <span class="text-primary">from:</span></label>
                                                                    <asp:Label runat="server" ID="lbl_lmp_from" />
                                                                    <div class="form-group d-inline-block w-5 ml-2" runat="server" id="lmp_from_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_lmp_from" />
                                                                    </div>
                                                                </div>
                                                                <div class="d-inline-block">
                                                                    <label class="control-label mb-1 ml-2">đến/ <span class="text-primary">to:</span></label>
                                                                    <asp:Label runat="server" ID="lbl_lmp_to" />
                                                                    <div class="form-group d-inline-block w-5 ml-2" runat="server" id="lmp_to_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_lmp_to" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1 w-5">Tuổi thai/ <span class="text-primary">Gestational age:</span></label>
                                                            <asp:Label runat="server" ID="lbl_ges_age_weeks" />
                                                            <div runat="server" id="ges_age_weeks_wrapper">
                                                                <div class="form-group d-inline-block w-5">
                                                                    <input runat="server" data-type="number" id="txt_ges_age_weeks" class="form-control text-right" />
                                                                    <span class="append">tuần/ weeks</span>
                                                                </div>

                                                                <div class="form-group d-inline-block w-5 ml-2">
                                                                    <input runat="server" data-type="number" id="txt_ges_age_days" class="form-control text-right" />
                                                                    <span class="append">ngày/ days</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1 w-5">Khám thai/ <span class="text-primary">Prenatal visit:</span></label>
                                                            <asp:Label runat="server" ID="lbl_prenatal_visit" />
                                                            <div class="form-group" runat="server" id="prenatal_visit_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_prenatal_visit" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1">Chủng ngừa uốn ván/ <span class="text-primary">Tetanus vaccination:</span></label>
                                                            <asp:Label runat="server" ID="lbl_tetanus_vaccination" />
                                                            <div>
                                                                <div runat="server" class="d-inline-block" id="tetanus_vaccination_wrapper">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input onclick="__doPostBack('rad_tetanus_vaccination_change','false')" type="radio" runat="server" id="rad_tetanus_vaccination_false" name="rad_tetanus_vaccination" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_tetanus_vaccination_false">Chưa/ <span class="text-primary">Not yet</span></label>
                                                                    </div>

                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" onclick="__doPostBack('rad_tetanus_vaccination_change','true')" id="rad_tetanus_vaccination_true" name="rad_tetanus_vaccination" class="custom-control-input" runat="server" />
                                                                        <label class="custom-control-label" for="rad_tetanus_vaccination_true">Có/ <span class="text-primary">Yes</span></label>
                                                                        <input onclick="__doPostBack('rad_tetanus_vaccination_change','')" hidden="hidden" type="checkbox" id="Radio4" runat="server" />
                                                        <label for="Radio4"><icon:XSquare runat="server" ID="XSquare9" /></label>
                                                                    </div>
                                                                </div>

                                                                <div runat="server" id="tetanus_vaccin_time_field">
                                                                    <div runat="server" id="tetanus_vaccin_time_wrapper" class="form-group d-inline-block w-5">
                                                                        <input runat="server" data-type="number" id="txt_tetanus_vaccin_time" class="form-control text-right" />
                                                                        <span class="append">lần/ times</span>
                                                                    </div>
                                                                </div>


                                                                <%--<div class="form-group w-5 d-inline-block tetanus_vaccin_time_field ml-2" runat="server" id="tetanus_vaccin_time_wrapper">
                                                                    <input runat="server" data-type="number" id="" class="form-control text-right" />
                                                                    <span class="append">lần/ times</span>
                                                                </div>--%>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1 d-block">Nhiễm Streptococcus nhóm B/ <span class="text-primary">GBS infection:</span></label>
                                                            <div>

                                                                <label class="control-label mb-1">Con trước nhiễm trùng huyết do Streptococcus nhóm B/ <span class="text-primary">Previous infant with invasive GBS disease</span></label>
                                                                <asp:Label runat="server" ID="lbl_gbs_disease" />
                                                                <div class="form-group d-inline-block" runat="server" id="gbs_disease_wrapper">
                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_gbs_disease_false" name="rad_gbs_disease" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gbs_disease_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>

                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_gbs_disease_true" name="rad_gbs_disease" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gbs_disease_true">Có/ <span class="text-primary">Yes</span></label>
                                                                        <a href="javascript:void(0)" data-clear="rad_gbs_disease" onclick="clear_radiobutton(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare1" />
                                                                        </a>
                                                                    </div>
                                                                </div>

                                                                <label class="control-label mb-1">Nhiễm trùng tiểu do Streptococcus nhóm B trong thai kỳ lần này/ <span class="text-primary">GBS bacteriuria during any trimester of the current pregnancy</span></label>

                                                                <asp:Label runat="server" ID="lbl_gbs_bacteriuria" />
                                                                <div class="form-group  d-inline-block" runat="server" id="gbs_bacteriuria_wrapper">
                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_gbs_bacteriuria_false" name="rad_gbs_bacteriuria" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gbs_bacteriuria_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>

                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_gbs_bacteriuria_true" name="rad_gbs_bacteriuria" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gbs_bacteriuria_true">Có/ <span class="text-primary">Yes</span></label>
                                                                        <a href="javascript:void(0)" data-clear="rad_gbs_bacteriuria" onclick="clear_radiobutton(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare2" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <label class="control-label mb-1">Cấy dịch âm đạo dương tính Streptococcus nhóm B trong tam cá nguyệt cuối thai kỳ lần này/ <span class="text-primary">Positive GBS vaginal-rectal screening culture in late gestation during current pregnancy</span><asp:Label runat="server" ID="lbl_gbs_vaginal" /></label>

                                                                <div class="form-group  d-inline-block" runat="server" id="gbs_vaginal_wrapper">
                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_gbs_vaginal_false" name="rad_gbs_vaginal" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gbs_vaginal_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>

                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_gbs_vaginal_true" name="rad_gbs_vaginal" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_gbs_vaginal_true">Có/ <span class="text-primary">Yes</span></label>
                                                                        <a href="javascript:void(0)" data-clear="rad_gbs_vaginal" onclick="clear_radiobutton(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare3" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1">Đái tháo đường thai kỳ/ <span class="text-primary">Gestational Diabetes:</span></label>
                                                            <asp:Label runat="server" ID="lbl_ges_diabetes" />
                                                            <div class="d-inline-block d-inline-block" runat="server" id="ges_diabetes_wrapper">
                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_ges_diabetes_false" name="rad_ges_diabetes" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_ges_diabetes_false">Không/ <span class="text-primary">No</span></label>
                                                                </div>

                                                                <div class="custom-control custom-radio d-inline-block ml-2">
                                                                    <input type="radio" runat="server" id="rad_ges_diabetes_true" name="rad_ges_diabetes" class="custom-control-input" />
                                                                    <label class="custom-control-label" for="rad_ges_diabetes_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    <a href="javascript:void(0)" data-clear="rad_ges_diabetes" onclick="clear_radiobutton(this)">
                                                                        <icon:xsquare runat="server" ID="XSquare6" />
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1">Bất thường khác trong thai kỳ/ <span class="text-primary">Other gestational abnormalities:</span></label>
                                                            <asp:Label runat="server" ID="lbl_other_ges_abnormal" />
                                                            <div class="d-inline-block" runat="server" id="other_ges_abnormal_wrapper">
                                                                <div class="d-inline-block">
                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input type="radio" runat="server" id="rad_other_ges_abnormal_false" name="rad_other_ges_abnormal" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_other_ges_abnormal_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>

                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                        <input disabled-for="other_ges_abnormal_note_field" runat="server" type="radio" id="rad_other_ges_abnormal_true" name="rad_other_ges_abnormal" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_other_ges_abnormal_true">Có/ <span class="text-primary">Yes</span></label>
                                                                        <a href="javascript:void(0)" data-clear="rad_cough" onclick="clear_radiobutton(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare4" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group d-inline-block w-n other_ges_abnormal_note_field ml-2">
                                                                    <webUI:TextField runat="server" ID="txt_other_ges_abnormal_note" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1">Chuyển dạ khởi phát lúc/ <span class="text-primary">Labor triggered at:</span></label>
                                                            <asp:Label runat="server" ID="lbl_labor_trig_at_time" />
                                                            <div class="d-inline-block" runat="server" id="labor_trig_at_time_wrapper">
                                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_labor_trig_at_time" Width="200px" CssClass="ml-2 edit" TimeView-TimeFormat="HH:mm" DateInput-DisplayDateFormat="MM/dd/yyyy HH:mm" DateInput-DateFormat="MM/dd/yyyy HH:mm"/>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1">Dấu hiệu ban đầu/ <span class="text-primary">Preliminary signs:</span></label>
                                                            <asp:Label runat="server" ID="lbl_preliminary_signs" />
                                                            <div class="d-inline-block" runat="server" id="preliminary_signs_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_preliminary_signs" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1">Diễn tiến/ <span class="text-primary">Progression:</span></label>
                                                            <asp:Label runat="server" ID="lbl_progression" />
                                                            <div class="d-inline-block" runat="server" id="progression_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_progression" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1">Thuốc đang sử dụng/ <span class="text-primary">Current medications:</span></label>
                                                            <asp:Label runat="server" ID="lbl_obs_cur_medication" />
                                                            <div class="d-inline-block" runat="server" id="obs_cur_medication_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_obs_cur_medication" />
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">2. Tiền sử bệnh/ <span class="text-primary">Antecedent medical history:</span></label>
                                                        </legend>

                                                        <div class="col-md-12 mb-2  gt-2-a">
                                                            <label class="control-label mb-1">Bản thân/ <span class="text-primary">Personal</span></label>
                                                            <asp:Label runat="server" ID="lbl_personal" />
                                                            <div class="d-inline-block" runat="server" id="personal_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_personal" />
                                                            </div>
                                                        </div>

                                                        <div class="add-v20 col-md-12 mb-2">
                                                            <label class="control-label"><span class="font-bold">Đã từng nhiễm COVID-19 trong vòng 6 tháng qua</span>/ <span class="text-primary">Have been infected with COVID-19 within the last 6 months:</span></label>
                                                            <div class="dg-1">
                                                                <div></div>
                                                                <asp:Label runat="server" ID="lbl_infected_with_covid"></asp:Label>
                                                                <div runat="server" id="infected_with_covid_wrapper">
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input type="radio" onchange="radioButtonChange(this)" runat="server" id="rad_infected_with_covid_true" name="rad_infected_with_covid" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_infected_with_covid_true">Có/ <span class="text-primary">Yes</span></label>
                                                                    </div>
                                                                    <div class="custom-control custom-radio d-inline-block">
                                                                        <input disabled-for="allergy_field" onchange="radioButtonChange(this)" type="radio" runat="server" id="rad_infected_with_covid_false" name="rad_infected_with_covid" class="custom-control-input" />
                                                                        <label class="custom-control-label" for="rad_infected_with_covid_false">Không/ <span class="text-primary">No</span></label>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div><label class="control-label"><span class="font-bold">Tiền sử tiêm chủng</span>/ <span class="text-primary">Immunization history:</span></label></div>
                                            
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

                                                                <div class="dg-1">
                                                                    <label class="control-label">• Tiêm vắc xin khác (ghi rõ)/ <span class="text-primary">Other vaccinations (specify):</span></label>
                                                                    <asp:Label runat="server" ID="lbl_other_vaccinations"></asp:Label>
                                                                    <div class="form-group" runat="server" id="other_vaccinations_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_other_vaccinations" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="col-md-12 mb-2  gt-2-a">
                                                            <label class="control-label mb-1">Gia đình/ <span class="text-primary">Family</span></label>
                                                            <asp:Label runat="server" ID="lbl_family" />
                                                            <div class="d-inline-block" runat="server" id="family_wrapper">
                                                                <webUI:TextField runat="server" ID="txt_family" />
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">3. Tiền căn phụ khoa/ <span class="text-primary">Gynecological history:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="row">
                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Tuổi dậy thì/ <span class="text-primary">Age of menarche</span></label>
                                                                    <asp:Label runat="server" ID="lbl_age_of_menarhce" />
                                                                    <div class="form-group d-inline-block w-4" runat="server" id="age_of_menarhce_wrapper">
                                                                        <input runat="server" class="form-control" id="txt_age_of_menarhce" data-type="number" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Chu kỳ kinh/ <span class="text-primary">Menstrual cycle</span></label>
                                                                    <asp:Label runat="server" ID="lbl_menstrual_cycle" />
                                                                    <div class="form-group w-5 d-inline-block" runat="server" id="menstrual_cycle_wrapper">
                                                                        <input runat="server" data-type="number" id="txt_menstrual_cycle" class="form-control text-right" />
                                                                        <span class="append">ngày/ days</span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Số ngày hành kinh/ <span class="text-primary">Length of period</span></label>
                                                                    <asp:Label runat="server" ID="lbl_length_of_period" />

                                                                    <div class="form-group w-5 d-inline-block" runat="server" id="length_of_period_wrapper">
                                                                        <input runat="server" data-type="number" id="txt_length_of_period" class="form-control text-right" />
                                                                        <span class="append">ngày/ days</span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Lượng máu kinh/ <span class="text-primary">Amount of menstrual blood</span></label>
                                                                    <asp:Label runat="server" ID="lbl_amount_mens_blood" />
                                                                    <div class="form-group w-4 d-inline-block" runat="server" id="amount_mens_blood_wrapper">
                                                                        <input runat="server" id="txt_amount_mens_blood" class="form-control text-right" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Tuổi kết hôn/ <span class="text-primary">Marriage age</span></label>
                                                                    <asp:Label runat="server" ID="lbl_marriage_age" />
                                                                    <div class="form-group w-4 d-inline-block" runat="server" id="marriage_age_wrapper">
                                                                        <input runat="server" data-type="number" id="txt_marriage_age" class="form-control text-right" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Tuổi mãn kinh/ <span class="text-primary">Age of menopause</span></label>
                                                                    <asp:Label runat="server" ID="lbl_age_menopause" />
                                                                    <div class="form-group w-4 d-inline-block" runat="server" id="age_menopause_wrapper">
                                                                        <input runat="server" id="txt_age_menopause" class="form-control text-right" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Những bệnh phụ khoa đã mắc trước đây/ <span class="text-primary">Previous gynecological diseases</span></label>
                                                                    <asp:Label runat="server" ID="lbl_previous_gyn_diseases" />
                                                                    <div class="form-group" runat="server" id="previous_gyn_diseases_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_previous_gyn_diseases" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">4. Tiền căn sản khoa/ <span class="text-primary">Obstetric history:</span></label>
                                                        </legend>
                                                        <div class="col-md-12 mb-2">
                                                            <label class="control-label mb-1">Những bệnh phụ khoa đã mắc trước đây/ <span class="text-primary">Previous gynecological diseases</span></label>

                                                            <asp:UpdatePanel ID="updatePanel_obs_history" runat="server" UpdateMode="Always">
                                                                <ContentTemplate>
                                                                    <asp:GridView
                                                                        ShowHeaderWhenEmpty="true"
                                                                        ID="grid_obs_history"
                                                                        runat="server"
                                                                        CssClass="tb-responsive table-bordered"
                                                                        AutoGenerateColumns="false">
                                                                        <Columns>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div class="w-s pt-2 pb-2">
                                                                                        Lần mang thai thứ/ <span class="text-primary">gravidity</span>
                                                                                    </div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label runat="server" ID="label" Height="35px" Text='<%#Eval("label") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 123px">1</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_1") %>'  ID="grav_1" Width="123px" runat="server" TextMode="SingleLine" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 123px">2</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_2") %>' ID="grav_2" Width="123px" runat="server" TextMode="SingleLine" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 123px">3</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_3") %>' ID="grav_3" Width="123px" runat="server" TextMode="SingleLine" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 123px">4</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_4") %>' ID="grav_4" Width="123px" runat="server" TextMode="SingleLine" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 123px">5</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_5") %>' ID="grav_5" Width="123px" runat="server" TextMode="SingleLine" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField>
                                                                                <HeaderTemplate>
                                                                                    <div style="width: 123px">6</div>
                                                                                </HeaderTemplate>
                                                                                <ItemTemplate>
                                                                                    <webUI:TextField Value='<%#Eval("grav_6") %>' ID="grav_6" Width="123px" runat="server" TextMode="SingleLine" />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>

                                                                        </Columns>

                                                                    </asp:GridView>
                                                                    <asp:UpdateProgress ID="updateProgress_obs_history" runat="server" AssociatedUpdatePanelID="updatePanel_obs_history">
                                                                        <ProgressTemplate>
                                                                            Please wait....
                                                                        </ProgressTemplate>
                                                                    </asp:UpdateProgress>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>


                                                        </div>
                                                    </fieldset>

                                                    <div class="row mb-2">
                                                        <div class="col-md-12">
                                                            <label class="control-label mb-1 h4">III. Khám lâm sàng/ <span class="text-primary">Physical examination:</span></label>
                                                        </div>
                                                    </div>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">1. Khám tổng quát/ <span class="text-primary">General exam:</span></label>
                                                        </legend>
                                                        <div class="col-md-12">
                                                            <div class="row">
                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Tổng trạng/<span class="text-primary">General appearance</span></label>
                                                                    <asp:Label runat="server" ID="lbl_general_appearance" />
                                                                    <div class="form-group" runat="server" id="general_appearance_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_general_appearance" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Phù/ <span class="text-primary">Edema</span></label>
                                                                    <div>
                                                                        <asp:Label runat="server" ID="lbl_edema"></asp:Label>
                                                                        <label runat="server" id="edema_wrapper" class="custom-control custom-checkbox d-inline-block ml-2">
                                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_edema_true" />
                                                                            <span class="custom-control-label"></span>
                                                                        </label>
                                                                        <asp:Label runat="server" ID="lbl_edema_note"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n" runat="server" id="edema_note_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_edema_note"  TextMode="SingleLine" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Hệ tim mạch/ <span class="text-primary">Cardiovascular system</span></label>
                                                                    <asp:Label runat="server" ID="lbl_cardio_system"></asp:Label>
                                                                    <div class="form-group d-inline-block " runat="server" id="cardio_system_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_cardio_system" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Hệ hô hấp/ <span class="text-primary">Respiratory system</span></label>
                                                                    <asp:Label runat="server" ID="lbl_respiratory_system"></asp:Label>
                                                                    <div class="form-group d-inline-block " runat="server" id="respiratory_system_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_respiratory_system" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Hệ tiêu hóa/<span class="text-primary">Digestive system</span></label>
                                                                    <asp:Label runat="server" ID="lbl_digestive_system"></asp:Label>
                                                                    <div class="form-group d-inline-block " runat="server" id="digestive_system_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_digestive_system" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Hệ thần kinh/<span class="text-primary">Nervous system</span></label>
                                                                    <asp:Label runat="server" ID="lbl_nervous_system"></asp:Label>
                                                                    <div class="form-group d-inline-block " runat="server" id="nervous_system_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_nervous_system" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Hệ niệu-dục/  <span class="text-primary">Urogenital system</span></label>
                                                                    <asp:Label runat="server" ID="lbl_uro_system"></asp:Label>
                                                                    <div class="form-group d-inline-block " runat="server" id="uro_system_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_uro_system" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Hệ cơ-xương-khớp/  <span class="text-primary">Musculoskeletal system</span></label>
                                                                    <asp:Label runat="server" ID="lbl_mus_system"></asp:Label>
                                                                    <div class="form-group d-inline-block " runat="server" id="mus_system_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_mus_system" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Tai Mũi Họng/<span class="text-primary">Otorhinolaryngology</span></label>
                                                                    <asp:Label runat="server" ID="lbl_otorhinolaryngology"></asp:Label>
                                                                    <div class="form-group d-inline-block " runat="server" id="otorhinolaryngology_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_otorhinolaryngology" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Hệ da-lông/ <span class="text-primary">Integumentary system</span></label>
                                                                    <asp:Label runat="server" ID="lbl_integumentary_system"></asp:Label>
                                                                    <div class="form-group d-inline-block " runat="server" id="integumentary_system_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_integumentary_system" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Mắt/ <span class="text-primary">Ophthalmology</span></label>
                                                                    <asp:Label runat="server" ID="lbl_ophthalmology"></asp:Label>
                                                                    <div class="form-group d-inline-block " runat="server" id="ophthalmology_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_ophthalmology" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Ghi nhận khác/ <span class="text-primary">Other findings</span></label>
                                                                    <asp:Label runat="server" ID="lbl_other_findings"></asp:Label>
                                                                    <div class="form-group d-inline-block" runat="server" id="other_findings_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_other_findings" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Yêu cầu khám chuyên khoa tâm lý/ <span class="text-primary">Psychological consultation required</span></label>

                                                                    <asp:Label runat="server" ID="lbl_psy_consul_required"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n" runat="server" id="psy_consul_required_wrapper">

                                                                        <div class="custom-control custom-radio d-inline-block ml-2">
                                                                            <input type="radio" runat="server" id="rad_psy_consul_required_true" name="rad_psy_consul_required" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_psy_consul_required_true">Có/ <span class="text-primary">Yes</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio d-inline-block ml-2">
                                                                            <input type="radio" runat="server" id="rad_psy_consul_required_false" name="rad_psy_consul_required" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_psy_consul_required_false">Không/ <span class="text-primary">No</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_psy_consul_required" onclick="clear_radiobutton(this)">
                                                                                <icon:xsquare runat="server" ID="XSquare8" />
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>

                                                    <fieldset class="row mb-2">
                                                        <legend>
                                                            <label class="control-label">2. Khám chuyên khoa/ <span class="text-primary">Specific exam:</span></label>
                                                        </legend>

                                                        <div class="col-md-12 mb-2" runat="server" id="obstetrics_field1">
                                                            <fieldset class="row mb-2">
                                                                <legend>
                                                                    <label class="control-label">Khám ngoài/ <span class="text-primary">External exam:</span></label>
                                                                </legend>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Vết mổ cũ/ <span class="text-primary">Previous cicatrice</span></label>
                                                                    <asp:Label runat="server" ID="lbl_obs_pre_cicatrice"></asp:Label>
                                                                    <label runat="server" id="obs_pre_cicatrice_wrapper" class="custom-control custom-checkbox d-inline-block ml-2">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_obs_pre_cicatrice_true" />
                                                                        <span class="custom-control-label"></span>
                                                                    </label>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Hình dáng tử cung/ <span class="text-primary">Uterine shape</span></label>
                                                                    <div>
                                                                        <asp:Label runat="server" ID="lbl_obs_uterine_shape"></asp:Label>
                                                                        <div class="form-group mb-2" runat="server" id="obs_uterine_shape_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_uterine_shape" />
                                                                        </div>
                                                                        <label class="control-label mb-1">Tư thế/ <span class="text-primary">Posture</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_posture"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n" runat="server" id="obs_posture_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_posture" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Bề cao tử cung/ <span class="text-primary">Fundal height</span></label>
                                                                    <div>
                                                                        <asp:Label runat="server" ID="lbl_obs_fundal_height"></asp:Label>
                                                                        <div class="form-group w-4 d-inline-block" runat="server" id="obs_fundal_height_wrapper">
                                                                            <input runat="server" data-type="number" id="txt_obs_fundal_height" class="form-control text-right" />
                                                                            <span class="append">cm</span>
                                                                        </div>
                                                                        <label class="control-label mb-1">chu vi vòng bụng/ <span class="text-primary">abdominal circumference</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_abdominal_circum"></asp:Label>
                                                                        <div class="form-group w-4 d-inline-block" runat="server" id="obs_abdominal_circum_wrapper">
                                                                            <input runat="server" data-type="number" id="txt_obs_abdominal_circum" class="form-control text-right" />
                                                                            <span class="append">cm</span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Cơn gò tử cung/ <span class="text-primary">Uterine contraction</span></label>
                                                                    <asp:Label runat="server" ID="lbl_obs_uterine_con"></asp:Label>
                                                                    <div class="form-group" runat="server" id="obs_uterine_con_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_obs_uterine_con" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Tần số tim thai/ <span class="text-primary">Fetal heart rate</span></label>
                                                                    <div>
                                                                        <asp:Label runat="server" ID="lbl_obs_fetal_heart_rate"></asp:Label>
                                                                        <div class="form-group w-5 d-inline-block" runat="server" id="obs_fetal_heart_rate_wrapper">
                                                                            <input runat="server" data-type="number" id="txt_obs_fetal_heart_rate" class="form-control text-right" />
                                                                            <span class="append">lần/phút/ bpm</span>
                                                                        </div>
                                                                        <label class="control-label mb-1">Ngực/ <span class="text-primary">Breasts</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_breasts"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n" runat="server" id="obs_breasts_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_breasts" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </fieldset>
                                                        </div>

                                                        <div runat="server" id="gynecology_field1" class="col-md-12 mb-2">
                                                            <fieldset class="row mb-2">
                                                                <legend>
                                                                    <label class="control-label font-bold">Khám ngoài/ <span class="text-primary">External exam:</span></label>
                                                                </legend>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Bụng có sẹo phẫu thuật cũ/ <span class="text-primary">Abdominal Surgery Scars</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_abdo_sur_scars"></asp:Label>
                                                                    <label runat="server" id="gyn_abdo_sur_scars_wrapper" class="custom-control custom-checkbox d-inline-block ml-2">
                                                                        <input type="checkbox" class="custom-control-input" runat="server" id="cb_gyn_abdo_sur_scars_true" />
                                                                        <span class="custom-control-label"></span>
                                                                    </label>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Lý do/ <span class="text-primary">Reason</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_reason"></asp:Label>
                                                                    <div class="form-group" runat="server" id="gyn_reason_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_reason" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Sờ nắn và đo ngoài tử cung/ <span class="text-primary">Uterine Height</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_uterine_height"></asp:Label>
                                                                    <div class="form-group" runat="server" id="gyn_uterine_height_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_uterine_height" />
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>

                                                        <div class="col-md-12 mb-2" runat="server" id="obstetrics_field2">
                                                            <fieldset class="row mb-2">
                                                                <legend>
                                                                    <label class="control-label">Khám trong/ <span class="text-primary">Internal exam:</span></label>
                                                                </legend>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label></label>
                                                                    <div>
                                                                        <label class="control-label mb-1">Âm hộ/ <span class="text-primary">Vulva</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_vulva"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_vulva_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_vulva" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label></label>
                                                                    <div>
                                                                        <label class="control-label mb-1">Âm đạo/ <span class="text-primary">Vagina</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_vagina"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_vagina_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_vagina" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label></label>
                                                                    <div>
                                                                        <label class="control-label mb-1">Tầng sinh môn/ <span class="text-primary">Perineum</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_perineum"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_perineum_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_perineum" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label></label>
                                                                    <div>
                                                                        <label class="control-label mb-1">Cổ tử cung/ <span class="text-primary">Cervix</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_cervix"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_cervix_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_cervix" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label></label>
                                                                    <div>
                                                                        <label class="control-label mb-1">Phần phụ/ <span class="text-primary">Adnexa</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_adnexa"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_adnexa_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_adnexa" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                    <ContentTemplate>
                                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                                            <label class="control-label mb-1">Tình trạng ối/ <span class="text-primary">Membrane condition</span></label>
                                                                            <asp:Label runat="server" ID="lbl_obs_mem_condition_code"></asp:Label>
                                                                            <div class="d-inline-block" runat="server" id="obs_mem_condition_code_wrapper">
                                                                                <div>
                                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                                        <input type="radio" onclick="__doPostBack('obs_mem_condition_code_change','in')" runat="server" id="rad_obs_mem_condition_code_in" name="rad_obs_mem_condition_code" class="custom-control-input" />
                                                                                        <label class="custom-control-label" for="rad_obs_mem_condition_code_in">Nguyên vẹn/ <span class="text-primary">Intact</span></label>
                                                                                    </div>
                                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                                        <input type="radio" onclick="__doPostBack('obs_mem_condition_code_change','ru')" runat="server" id="rad_obs_mem_condition_code_ru" name="rad_obs_mem_condition_code" class="custom-control-input" />
                                                                                        <label class="custom-control-label" for="rad_obs_mem_condition_code_ru">Đã vỡ/ <span class="text-primary">Ruptured</span></label>
                                                                                        <a href="javascript:void(0)" onclick="__doPostBack('obs_mem_condition_code_change','')">
                                                                                            <icon:xsquare runat="server" ID="XSquare38" />
                                                                                        </a>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-md-12 mb-2 gt-2-a" runat="server" id="in_field">
                                                                            <label></label>
                                                                            <asp:Label runat="server" ID="lbl_obs_mem_con_attri_desc"></asp:Label>
                                                                            <div runat="server" id="obs_mem_con_attri_code_wrapper">
                                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                                        <input type="radio" runat="server" id="rad_obs_mem_con_attri_code_inflat" name="rad_obs_mem_con_attri_code" class="custom-control-input" />
                                                                                        <label class="custom-control-label" for="rad_obs_mem_con_attri_code_inflat">Phồng/ <span class="text-primary">Inflattable</span></label>
                                                                                    </div>
                                                                                    <div class="custom-control custom-radio d-inline-block ml-2">
                                                                                        <input type="radio" runat="server" id="rad_obs_mem_con_attri_code_flat" name="rad_obs_mem_con_attri_code" class="custom-control-input" />
                                                                                        <label class="custom-control-label" for="rad_obs_mem_con_attri_code_flat">Dẹt/ <span class="text-primary">Flat</span></label>
                                                                                    </div>
                                                                                </div>
                                                                        </div>

                                                                        <div class="col-md-12 mb-2 gt-2-a" runat="server" id="ru_field">
                                                                            <label class="control-label mb-1">Ối vỡ lúc/ <span class="text-primary">Rupture of membrane at</span></label>
                                                                            <div>
                                                                                <asp:Label runat="server" ID="lbl_obs_rup_of_mem_at"></asp:Label>

                                                                                <div>
                                                                                    <div class="mb-2" runat="server" id="obs_rup_of_mem_at_wrapper">
                                                                                        <telerik:RadDateTimePicker runat="server" ID="dtpk_obs_rup_of_mem_at" Width="200px" CssClass="ml-2 edit" />
                                                                                    </div>
                                                                                    <asp:Label runat="server" ID="lbl_obs_rup_of_mem_code"></asp:Label>
                                                                                    <div runat="server" id="obs_rup_of_mem_code_wrapper">
                                                                                        <div class="custom-control custom-radio d-inline-block ml-2">
                                                                                            <input type="radio" runat="server" id="rad_obs_rup_of_mem_code_s" name="rad_obs_rup_of_mem_code" class="custom-control-input" />
                                                                                            <label class="custom-control-label" for="rad_obs_rup_of_mem_code_s">Tự nhiên/ <span class="text-primary">Spontaneous</span></label>
                                                                                        </div>
                                                                                        <div class="custom-control custom-radio d-inline-block ml-2">
                                                                                            <input type="radio" runat="server" id="rad_obs_rup_of_mem_code_i" name="rad_obs_rup_of_mem_code" class="custom-control-input" />
                                                                                            <label class="custom-control-label" for="rad_obs_rup_of_mem_code_i">Can thiệp/ <span class="text-primary">Interventional</span></label>
                                                                                            <a href="javascript:void(0)" data-clear="rad_obs_rup_of_mem_code" onclick="clear_radiobutton(this)">
                                                                                                <icon:xsquare runat="server" ID="XSquare7" />
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Đặc điểm dịch ối/ <span class="text-primary">Features of amniotic fluid</span></label>
                                                                    <asp:Label runat="server" ID="lbl_obs_feat_amniotic"></asp:Label>
                                                                    <div class="d-inline-block" runat="server" id="obs_feat_amniotic_wrapper">
                                                                        <label class="custom-control custom-checkbox d-inline-block ml-2">
                                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_obs_feat_amniotic_n" />
                                                                            <span class="custom-control-label">Bình thường/ <span class="text-primary">Normal</span></span>
                                                                        </label>
                                                                        <label class="custom-control custom-checkbox d-inline-block ml-2">
                                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_obs_feat_amniotic_o" />
                                                                            <span class="custom-control-label">Thiểu ối/ <span class="text-primary">Oligohydramnios</span></span>
                                                                        </label>
                                                                        <label class="custom-control custom-checkbox d-inline-block ml-2">
                                                                            <input type="checkbox" class="custom-control-input" runat="server" id="cb_obs_feat_amniotic_p" />
                                                                            <span class="custom-control-label">Đa ối/ <span class="text-primary">Polyhydramnios</span></span>
                                                                        </label>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Màu sắc nước ối/ <span class="text-primary">Color of amniotic fluid</span></label>
                                                                    <asp:Label runat="server" ID="lbl_obs_color_amniotic"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_color_amniotic_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_obs_color_amniotic" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Ngôi thai/ <span class="text-primary">Presentation</span></label>
                                                                    <asp:Label runat="server" ID="lbl_obs_presentation_code"></asp:Label>
                                                                    <div class="d-inline-block" runat="server" id="obs_presentation_code_wrapper">
                                                                        <div class="custom-control custom-radio d-inline-block ml-2">
                                                                            <input type="radio" runat="server" id="rad_obs_presentation_code_c" name="rad_obs_presentation_code" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_obs_presentation_code_c">Đầu/ <span class="text-primary">Cephalic</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio d-inline-block ml-2">
                                                                            <input type="radio" runat="server" id="rad_obs_presentation_code_b" name="rad_obs_presentation_code" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_obs_presentation_code_b">Mông/ <span class="text-primary">Breech</span></label>
                                                                        </div>
                                                                        <div class="custom-control custom-radio d-inline-block ml-2">
                                                                            <input type="radio" runat="server" id="rad_obs_presentation_code_o" disabled-for="obs_presentation_other_field" name="rad_obs_presentation_code" class="custom-control-input" />
                                                                            <label class="custom-control-label" for="rad_obs_presentation_code_o">Ngôi khác/ <span class="text-primary">Others, specify</span></label>
                                                                            <a href="javascript:void(0)" data-clear="rad_obs_presentation_code" onclick="clear_radiobutton(this)">
                                                                                <icon:xsquare runat="server" ID="XSquare5" />
                                                                            </a>
                                                                        </div>
                                                                        <div class="form-group obs_presentation_other_field d-inline-block ml-2 w-n">
                                                                            <webUI:TextField runat="server" ID="txt_obs_presentation_other" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Vị trí ngôi thai/ <span class="text-primary">Fetal position</span></label>
                                                                    <asp:Label runat="server" ID="lbl_obs_fetal_position"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_fetal_position_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_obs_fetal_position" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Khám khung chậu/ <span class="text-primary">Pelvic exam</span></label>
                                                                    <asp:Label runat="server" ID="lbl_obs_pelvic_exam"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_pelvic_exam_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_obs_pelvic_exam" />
                                                                    </div>
                                                                </div>


                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Chỉ số Bishop/ <span class="text-primary">Bishop score</span></label>
                                                                    <asp:Label runat="server" ID="lbl_obs_bishop_score"></asp:Label>
                                                                    <div class="form-group d-inline-block w-5 ml-2" runat="server" id="obs_bishop_score_wrapper">
                                                                        <input runat="server" data-type="number" id="txt_obs_bishop_score" class="form-control text-right" />
                                                                        <span class="append">điểm/ points</span>
                                                                    </div>
                                                                </div>

                                                            </fieldset>
                                                        </div>

                                                        <div runat="server" id="gynecology_field2" class="col-md-12 mb-2">
                                                            <fieldset class="row mb-2">
                                                                <legend>
                                                                    <label class="control-label">Khám trong/ <span class="text-primary">Internal exam:</span></label>
                                                                </legend>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Âm hộ/ <span class="text-primary">Vulva</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_vulva"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_vulva_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_vulva" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Tầng sinh môn/ <span class="text-primary">Perineum</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_perineum"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_perineum_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_perineum" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Khám mỏ vịt/ <span class="text-primary">Speculum examination</span></label>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Âm đạo/ <span class="text-primary">Vagina</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_vagina"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_vagina_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_vagina" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Dịch tiết/ <span class="text-primary">Discharge</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_discharge"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_discharge_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_discharge" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Cổ tử cung/ <span class="text-primary">Cervix</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_cervix"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_cervix_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_cervix" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Phần phụ/ <span class="text-primary">Adnexa</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_adnexa"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_adnexa_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_adnexa" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Các túi cùng/ <span class="text-primary">Douglas pouchs</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_douglas_pouchs"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_douglas_pouchs_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_douglas_pouchs" />
                                                                    </div>
                                                                </div>
                                                            </fieldset>
                                                        </div>
                                                    </fieldset>

                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <div class="row mb-2">
                                                <label class="col-md-12 control-label mb-1 h5">IV. Laboratory indications and results/ <span class="text-primary">Chỉ định và kết quả xét nghiệm:</span></label>
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label></label>
                                                    <asp:Label runat="server" ID="lbl_lab_result"></asp:Label>
                                                    <div class="form-group" runat="server" id="lab_result_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_lab_result" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Khảo sát bổ sung khác/ <span class="text-primary">Additional investigations</span></label>
                                                    <asp:Label runat="server" ID="lbl_add_investigations"></asp:Label>
                                                    <div class="form-group" runat="server" id="add_investigations_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_add_investigations" />
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-12">
                                                    <label class="control-label mb-1 h5">V. Conclusion/ <span class="text-primary">Kết luận:</span></label>
                                                </div>
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1">Chẩn đoán ban đầu/ <span class="text-primary">Initial diagnosis</span></label>
                                                    <asp:Label runat="server" ID="lbl_initial_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="initial_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_initial_diagnosis" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1 ">Chẩn đoán xác định/ <span class="text-primary">Diagnosis</span></label>
                                                    <asp:Label runat="server" ID="lbl_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_diagnosis" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1 ">Chẩn đoán phân biệt/ <span class="text-primary">Differential diagnosis</span></label>
                                                    <asp:Label runat="server" ID="lbl_diff_diagnosis"></asp:Label>
                                                    <div class="form-group" runat="server" id="diff_diagnosis_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_diff_diagnosis" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1 ">Bệnh kèm theo/ <span class="text-primary">Associated conditions</span></label>
                                                    <asp:Label runat="server" ID="lbl_associated_conditions"></asp:Label>
                                                    <div class="form-group" runat="server" id="associated_conditions_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_associated_conditions" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1 ">Kế hoạch điều trị/ <span class="text-primary">Treatment plan</span></label>
                                                    <asp:Label runat="server" ID="lbl_treatment_plan"></asp:Label>
                                                    <div class="form-group" runat="server" id="treatment_plan_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_treatment_plan" />
                                                    </div>
                                                </div>
                                                <div class="col-md-12 mb-2 gt-2-a">
                                                    <label class="control-label mb-1 ">Kế hoạch xuất viện/ <span class="text-primary">Discharge Plan</span></label>
                                                    <asp:Label runat="server" ID="lbl_discharge_plan"></asp:Label>
                                                    <div class="form-group" runat="server" id="discharge_plan_wrapper">
                                                        <webUI:TextField runat="server" ID="txt_discharge_plan" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-12">
                                                <div class="form-actions">
                                                    <asp:LinkButton ValidationGroup="Group1" runat="server" OnClick="btnComplete_Click" ID="btnComplete" CssClass="btn btn-primary waves-effect">Complete</asp:LinkButton>

                                                    <asp:LinkButton ValidationGroup="Group1" OnClick="btnSave_Click" ID="btnSave" runat="server" CssClass="btn btn-primary waves-effect">Save</asp:LinkButton>

                                                    <div runat="server" onclick="showWindow('RadWindow2')" id="btnDeleteModal" class="btn btn-danger">Delete</div>

                                                    <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                    <asp:LinkButton runat="server" OnClientClick="btnPrint_Click(); return false;" ID="btnPrint" CssClass="btn btn-secondary">Print</asp:LinkButton>

                                                    <asp:LinkButton runat="server" OnClick="btnCancel_Click" ID="btnCancel" CssClass="btn btn-secondary waves-effect">Cancel</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                        <webUI:PopupModal ClientIDMode="Static" runat="server" ID="myModal">
                                            <ModalBody>
                                                <div class="text-center">
                                                    <icon:ExclamationTriangle cssClass="text-danger" Size="80" runat="server" />
                                                    <h4 class="mt-4 mb-4">Delete document?</h4>
                                                </div>
                                                <div class="text-right">
                                                    <div class="btn btn-default waves-effect" data-dismiss="modal">Close</div>
                                                    <asp:LinkButton OnClick="btnDelete_Click" OnClientClick="window.removeEventListener('beforeunload',comfirm_leave_page,true);" runat="server" ID="btnDelete" CssClass="btn btn-danger waves-effect">Delete</asp:LinkButton>
                                                </div>
                                            </ModalBody>
                                        </webUI:PopupModal>

                                        <webUI:PopupShowDelay runat="server" ID="PopupShowDelay" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:LinkButton runat="server" OnClick="clearSession_Click" ID="clearSession"></asp:LinkButton>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/alertify.js"></script>

    <script type="text/javascript">
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);
        $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });
        InputFilter("data-type='number'");

        checkboxRadiobutton_init();
        formGroup_init();

        function beforeAsyncPostBack() {
            var curtime = new Date();
        }

        function afterAsyncPostBack() {
            checkboxRadiobutton_init();
            formGroup_init();
            InputFilter("data-type='number'");
            $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });
            setTimeout(function () {
                if (document.getElementById("alertify-logs"))
                    document.getElementById("alertify-logs").classList.add("cssclsNoPrint")
            }, 1000);
        }

        function btnPrint_Click() {
  
            //if (document.getElementById("prt_diagnosis")) {
            //    document.getElementById("prt_diagnosis").innerText = document.getElementById("lbl_diff_diagnosis").innerText;
            //}

            //if (document.getElementById("lbl_is_obs_gyn").innerText == "SẢN KHOA/ OBSTETRICS")
            //{
            //    document.getElementById("div_for_gyneacology").setAttribute("style", "display: none");
            //}
            //else
            //{
            //    document.getElementById("div_for_obstetric").setAttribute("style", "display: none");
            //}

            let printContent = document.querySelector("#print_content");
            printContent.style.display = "block";

            let total = Math.ceil(printContent.offsetHeight / 1096);

            for (let i = 1; i <= total; i++) {
                let div = document.createElement("div");
                div.setAttribute("class", "watermark page");
                div.setAttribute("style", "top: " + (1093 * (i - 1)) + "px");
                //div.setAttribute("data-page", "Page " + i + " of " + total);
                document.getElementById("print_content").append(div);
            }

            setTimeout(() => { printContent.setAttribute("style", "display: none"); }, 100);

            window.print();
        }
    </script>
</body>
</html>