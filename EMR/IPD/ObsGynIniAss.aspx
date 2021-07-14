<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObsGynIniAss.aspx.cs" Inherits="EMR.IPD.ObsGynIniAss" ValidateRequest="false" %>

<%@ Register Src="~/UserControls/PopupShowDelay.ascx" TagPrefix="webUI" TagName="PopupShowDelay" %>
<%@ Register Src="~/UserControls/PatientInfo.ascx" TagPrefix="webUI" TagName="PatientInfo" %>
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
    <link href="../styles/sweetalert.min.css" rel="stylesheet" />
    <link href="../styles/alertify.css" rel="stylesheet" />
</head>
<body>
    <form method="post" action="#" id="form1" runat="server">
        <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="cssclsNoScreen">
                <table class="report-container">
                    <thead class="report-header">
                        <tr>
                            <th class="report-header-cell">
                                <div class="header-info">
                                    <img src="../images/AIH_PI_FULL.png" />
                                    <div class="header-info-title">
                                        <h4>BỆNH ÁN SẢN PHỤ KHOA</h4>
                                        <h5>OBSTETRIC & GYNECOLOGICAL INITIAL ASSESSMENT</h5>
                                    </div>
                                    <div>
                                        <webUI:Barcode runat="server" ID="prt_barcode" Width="120" Height="22" />
                                        <div>
                                            <asp:Label class="font-bold" ID="Label5" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <webUI:Line runat="server" ID="Line" />
                            </th>
                        </tr>
                    </thead>
                    <tbody class="report-content">
                        <tr>
                            <td class="report-content-cell">
                                <div class="main" runat="server" id="Div1">
                                    <!-- Code printed here -->
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label Style="font-weight: bold;">I. Lí do nhập viện/ Reason for admission: </asp:Label>
                                            <asp:Label runat="server" ID="prt_reason_admission"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label Style="font-weight: bold;">II. Bệnh sử/ Medical history: </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label Style="font-weight: bold;">1. Bệnh sử hiện tại/ Current medical history: </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: center; font-family: Tahoma; font-size: 14.5px">
                                            <asp:Label ID="prt_is_obs_gyn_True" runat="server" />
                                            <asp:Label ID="prt_is_obs_gyn_False" runat="server" />
                                            <asp:Label ID="Label2" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2  " id="div_obs" runat="server">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label>- Kinh chót/ LMP: từ/ from:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_lmp_from"></asp:Label>
                                            <asp:Label> đến/ to:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_lmp_to"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label>- Tuổi thai/ Gestational age:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_ges_age_days"></asp:Label>
                                            <asp:Label> tuần/ weeks:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_ges_age_weeks"></asp:Label>
                                            <asp:Label> ngày/days  </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label>- Khám thai/ Prenatal visit:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_prenatal_visit"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label>- Chủng ngừa uốn ván/ Tetanus vaccination:  </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 15px">
                                            <div class="row">
                                                <div class="col-2 ">
                                                </div>
                                                <div class="col-5 ">
                                                    <asp:Label ID="prt_tetanus_vaccination_False" runat="server" />
                                                    <asp:Label>Chưa/ Not yet</asp:Label>
                                                </div>
                                                <div class="col-5 ">
                                                    <asp:Label ID="prt_tetanus_vaccination_True" runat="server" />
                                                    <asp:Label>Có/yes: </asp:Label>
                                                    <asp:Label runat="server" ID="prt_tetanus_vaccin_time"></asp:Label>
                                                    <asp:Label> Lần/times </asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label>- Nhiễm Streptococcus nhóm B/ GBS infection:  </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; margin-right: 25px">
                                            <asp:Label>• Con trước nhiễm trùng huyết do Streptococcus nhóm B/ Previous infant with invasive GBS disease:  </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 15px">
                                            <div class="row">
                                                <div class="col-2 ">
                                                </div>
                                                <div class="col-5 ">
                                                    <asp:Label ID="prt_gbs_disease_False" runat="server" />
                                                    <asp:Label>Không/ No</asp:Label>
                                                </div>
                                                <div class="col-5 ">
                                                    <asp:Label ID="prt_gbs_disease_True" runat="server" />
                                                    <asp:Label>Có/yes</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin: 10px; margin-right: 25px; max-width: 99%">
                                            <asp:Label>• Nhiễm trùng tiểu do Streptococcus nhóm B trong thai kỳ lần này/ GBS bacteriuria during any trimester of the current pregnancy: </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 15px">
                                            <div class="row">
                                                <div class="col-2 ">
                                                </div>
                                                <div class="col-5 ">
                                                    <asp:Label ID="prt_gbs_bacteriuria_False" runat="server" />
                                                    <asp:Label>Không/ No</asp:Label>
                                                </div>
                                                <div class="col-5 ">
                                                    <asp:Label ID="prt_gbs_bacteriuria_True" runat="server" />
                                                    <asp:Label>Có/yes</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; margin-right: -15px; max-width: 99%">
                                            <asp:Label>• Cấy tầm soát phết âm đạo – trực tràng dương tính Streptococcus nhóm B trong tam cá nguyệt cuối thai kỳ lần này/ Positive GBS vaginal-rectal screening culture in late gestation during current pregnancy: </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 15px">
                                            <div class="row">
                                                <div class="col-2 ">
                                                </div>
                                                <div class="col-5 ">
                                                    <asp:Label ID="prt_gbs_vaginal_False" runat="server" />
                                                    <asp:Label>Không/ No</asp:Label>
                                                </div>
                                                <div class="col-5 ">
                                                    <asp:Label ID="prt_gbs_vaginal_True" runat="server" />
                                                    <asp:Label>Có/yes</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <div class="row">
                                                <div class="col-6 ">
                                                    <asp:Label>- Đái tháo đường thai kỳ/ Gestational Diabete: </asp:Label>
                                                </div>
                                                <div class="col-3 ">
                                                    <asp:Label ID="prt_ges_diabetes_False" runat="server" />
                                                    <asp:Label>Không/ No</asp:Label>
                                                </div>
                                                <div class="col-3 ">
                                                    <asp:Label ID="prt_ges_diabetes_True" runat="server" />
                                                    <asp:Label>Có/yes</asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma;">
                                            <asp:Label>- Bất thường khác trong thai kỳ/ Other gestational abnormalities: </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 15px">
                                            <div class="row">
                                                <div class="col-2 ">
                                                </div>
                                                <div class="col-5 ">
                                                    <asp:Label ID="prt_other_ges_abnormal_False" runat="server" />
                                                    <asp:Label>Không/ No</asp:Label>
                                                </div>
                                                <div class="col-5 ">
                                                    <asp:Label ID="prt_other_ges_abnormal_True" runat="server" />
                                                    <asp:Label>Có/yes</asp:Label>
                                                    <asp:Label ID="other_ges_abnormal_note" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma;">
                                            <asp:Label>- Chuyển dạ khởi phát lúc/ Labor triggered at: </asp:Label>
                                            <asp:Label ID="prt_labor_trig_at_time" runat="server" />
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma;">
                                            <asp:Label>- Dấu hiệu ban đầu/ Preliminary signs: </asp:Label>
                                            <asp:Label ID="prt_preliminary_signs" runat="server" />
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma;">
                                            <asp:Label>❖ Thuốc đang sử dụng/ Current medications </asp:Label>div_obs
                                            <asp:Label ID="prt_obs_cur_medication" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2  " id="div_gyn" runat="server">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma;">
                                            <asp:Label ID="prt_gyn_med_history" runat="server" />
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma;">
                                            <asp:Label>❖ Thuốc đang sử dụng/ Current medications</asp:Label>
                                            <asp:Label ID="prt_gyn_cur_medication" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label Style="font-weight: bold;">2. Tiền sử bệnh/ Antecedent medical history: </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label>- Cá nhân/ Personal:</asp:Label>
                                            <asp:Label ID="prt_personal" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label>- Gia đình/ Family: </asp:Label>
                                            <asp:Label ID="prt_family" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label Style="font-weight: bold;">3. Tiền căn phụ khoa/ Gynecological history: </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label>- Tuổi dậy thì/ Age of menarche: </asp:Label>
                                            <asp:Label ID="prt_age_of_menarhce" runat="server" />
                                            <asp:Label> Chu kỳ kinh/ Menstrual cycle: </asp:Label>
                                            <asp:Label ID="prt_menstrual_cycle" runat="server" />
                                            <asp:Label> ngày/ day(s). Số ngày hành kinh/ Length of period: </asp:Label>
                                            <asp:Label ID="prt_length_of_period" runat="server" />
                                            <asp:Label> ngày/ day(s), Lượng máu kinh/ Amount of menstrual blood: </asp:Label>
                                            <asp:Label ID="prt_amount_mens_blood" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label>- Tuổi kết hôn/ Marriage age: </asp:Label>
                                            <asp:Label ID="prt_marriage_age" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label>- Tuổi mãn kinh/ Age of menopause: </asp:Label>
                                            <asp:Label ID="prt_age_menopause" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label>- Những bệnh phụ khoa đã mắc trước đây/ Previous gynecological diseases: </asp:Label>
                                            <asp:Label ID="prt_previous_gyn_diseases" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label Style="font-weight: bold;">4. Tiền căn sản khoa/ Obstetric history: </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 " style=" page-break-inside: avoid">
                                        &nbsp;
                                        <div class="col-md-12 " style="font-size: 14.5px; font-family: Tahoma">
                                            <asp:UpdatePanel ID="updatePanel4" runat="server" UpdateMode="Always">
                                                <ContentTemplate>
                                                    <asp:GridView
                                                        ShowHeaderWhenEmpty="true"
                                                        ID="prt_obs_history"
                                                        runat="server"
                                                        CssClass="tb-responsive table-bordered"
                                                        AutoGenerateColumns="false">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div class="w-s pt-2 pb-2" style="font-weight: bold; margin: 5px">
                                                                        Lần mang thai thứ/ <span class="text-primary">gravidity</span>
                                                                    </div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label Style="margin: 5px" Text='<%#Eval("label") %>' runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px; text-align: center; margin: 5px">1</div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label Style="margin: 5px" Text='<%#Eval("grav_1") %>' runat="server" Width="100px" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px; text-align: center; margin: 5px">2</div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label Style="margin: 5px" Text='<%#Eval("grav_2") %>' runat="server" Width="100px" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="margin: 5px" style="width: 80px; text-align: center; margin: 5px">3</div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label Style="margin: 5px" Text='<%#Eval("grav_3") %>' runat="server" Width="100px" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px; text-align: center; margin: 5px">4</div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label Style="margin: 5px" Text='<%#Eval("grav_4") %>' runat="server" Width="100px" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px; text-align: center; margin: 5px">5</div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label Style="margin: 5px" Text='<%#Eval("grav_5") %>' runat="server" Width="100px" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <HeaderTemplate>
                                                                    <div style="width: 80px; text-align: center; margin: 5px">6</div>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:Label Style="margin: 5px" Text='<%#Eval("grav_6") %>' runat="server" Width="100px" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                        </Columns>

                                                    </asp:GridView>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label Style="font-weight: bold;">III. Khám lâm sàng/ Physical examination: </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label Style="font-weight: bold;">1. Khám tổng quát/ General exam: </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-8 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Tổng trạng/ </asp:Label>
                                            <asp:Label>General appearance: </asp:Label>
                                            <asp:Label ID="Label22" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <div class="row">
                                                <div class="col-2 ">
                                                    <asp:Label Style="font-weight: bold">Phù/ </asp:Label>
                                                    <asp:Label>Edema: </asp:Label>
                                                </div>
                                                <div class="col-2 ">
                                                    <asp:Label ID="prt_edema_False" runat="server" />
                                                    <asp:Label>Không/ No</asp:Label>
                                                </div>
                                                <div class="col-8 ">
                                                    <asp:Label ID="prt_edema_True" runat="server" />
                                                    <asp:Label>Có, chi tiết/ Yes, specify: </asp:Label>
                                                    <asp:Label ID="prt_edema_note" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Hệ tim mạch/ </asp:Label>
                                            <asp:Label>Cardiovascular system: </asp:Label>
                                            <asp:Label ID="prt_cardio_system" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Hệ hô hấp/ </asp:Label>
                                            <asp:Label>Respiratory system: </asp:Label>
                                            <asp:Label ID="prt_respiratory_system" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Hệ tiêu hóa/ </asp:Label>
                                            <asp:Label>Digestive system: </asp:Label>
                                            <asp:Label ID="prt_digestive_system" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Hệ thần kinh/ </asp:Label>
                                            <asp:Label>Nervous system: </asp:Label>
                                            <asp:Label ID="prt_nervous_system" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Hệ niệu-dục/ </asp:Label>
                                            <asp:Label>Urogenital system: </asp:Label>
                                            <asp:Label ID="prt_uro_system" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Hệ cơ-xương-khớp/ </asp:Label>
                                            <asp:Label>Musculoskeletal system: </asp:Label>
                                            <asp:Label ID="prt_mus_system" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Tai Mũi Họng/ </asp:Label>
                                            <asp:Label>Otorhinolaryngology: </asp:Label>
                                            <asp:Label ID="prt_otorhinolaryngology" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Hệ da-lông/ </asp:Label>
                                            <asp:Label>Integumentary system: </asp:Label>
                                            <asp:Label ID="prt_integumentary_system" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Mắt/ </asp:Label>
                                            <asp:Label>Ophthalmology: </asp:Label>
                                            <asp:Label ID="prt_ophthalmology" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Ghi nhận khác/ </asp:Label>
                                            <asp:Label>Other findings: </asp:Label>
                                            <asp:Label ID="prt_other_findings" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div style="font-size: 14.5px; font-family: Tahoma; max-width: 100%; margin-left: 15px; width: 520px">
                                            <asp:Label Style="font-weight: bold">❖	Yêu cầu khám chuyên khoa tâm lý/ </asp:Label>
                                            <asp:Label>Psychological consultation required: </asp:Label>
                                        </div>
                                        <div style="font-size: 14.5px; font-family: Tahoma; max-width: 100%; width: 100px">
                                            <asp:Label ID="prt_psy_consul_required_False" runat="server" />
                                            <asp:Label>Không/ No</asp:Label>
                                        </div>
                                        <div style="font-size: 14.5px; font-family: Tahoma; max-width: 100%; width: 100px">
                                            <asp:Label ID="prt_psy_consul_required_True" runat="server" />
                                            <asp:Label>Có/ Yes </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2  " id="div_for_obstetric" runat="server">
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; max-width: 100%;">
                                            <asp:Label Style="font-weight: bold">2. Khám chuyên khoa/ Specific exam: </asp:Label>
                                            <asp:Label>(Cho sản khoa/ For Obstetric) </asp:Label>
                                        </div>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; margin-left: 10px; max-width: 100%">
                                            <asp:Label Style="font-weight: bold">• Khám ngoài/ </asp:Label>
                                            <asp:Label>External exam: </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; margin-left: 12px; margin-right: 10px; font-family: Tahoma; max-width: 99%">
                                            <asp:Label>- Vết mổ cũ/ Previous cicatrice: </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_pre_cicatrice"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Hình dáng tử cung/ Uterine shape: </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_uterine_shape"></asp:Label>
                                            <asp:Label>. Tư thế/ Posture:  </asp:Label>
                                            <asp:Label runat="server" ID="Label36"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Bề cao tử cung/ Fundal height:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_fundal_height"></asp:Label>
                                            <asp:Label> cm, chu vi vòng bụng/ abdominal circumference:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_abdominal_circum"></asp:Label>
                                            <asp:Label> cm</asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Cơn gò tử cung/ Uterine contraction:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_uterine_con"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Tần số tim thai/ Fetal heart rate:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_fetal_heart_rate"></asp:Label>
                                            <asp:Label>lần/phút/ bpm  </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Ngực/ Breasts:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_breasts"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; max-width: 100%; margin-left: 10px">
                                            <asp:Label Style="font-weight: bold">• Khám trong/ </asp:Label>
                                            <asp:Label>Internal exam: </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Chỉ số Bishop/ Bishop score:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_bishop_score"></asp:Label>
                                            <asp:Label>điểm/ points</asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Âm hộ/ Vulva:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_vulva"></asp:Label>
                                            <asp:Label>- Âm đạo/ Vagina: </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_vagina"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Tầng sinh môn/ Perineum:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_perineum"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Cổ tử cung/ Cervix:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_cervix"></asp:Label>
                                            <asp:Label> Phần phụ/ Adnexa:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_obs_adnexa"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <div class="row">
                                                <div class="col-6 ">
                                                    <asp:Label>- Tình trạng ối/ Membrane condition: </asp:Label>
                                                </div>
                                                <div class="col-3 ">
                                                    <asp:Label ID="prt_obs_mem_condition_code_True" runat="server" />
                                                    <asp:Label>Nguyên vẹn/ Intact</asp:Label>
                                                </div>
                                                <div class="col-3 ">
                                                    <asp:Label ID="prt_obs_mem_condition_code_False" runat="server" />
                                                    <asp:Label>Đã vỡ/ Ruptured </asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="col-12 " style="text-align: justify;font-size: 14.5px; font-family: Tahoma;margin-left:20px;max-width:99%">
                                            <asp:Label >- Ối vỡ lúc/ Rupture of membrane at:  </asp:Label>
                                            <asp:Label runat="server" ID="Label21" ></asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify;font-size: 14.5px; font-family: Tahoma;margin-left:20px;max-width:99%">
                                           <div class="row">
                                               <div class="col-2 ">
                                                </div>
                                                <div class="col-5 ">
                                                    <asp:Label  id="" runat="server" />
				                                    <asp:Label>Tự nhiên/ Spontaneous </asp:Label>
			                                    </div>
			                                    <div class="col-5 ">
                                                    <asp:Label id="" runat="server" />
				                                    <asp:Label>Can thiệp/ Interventional </asp:Label>
			                                    </div>
                                           </div>
                                        </div>--%>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; max-width: 100%; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">- Đặc điểm dịch ối/ </asp:Label>
                                            <asp:Label>Features of amniotic fluid: </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <div class="row">
                                                <div class="col-1 ">
                                                </div>
                                                <div class="col-3 ">
                                                    <asp:Label ID="prt_N" runat="server" />
                                                    <asp:Label>Bình thường/ Normal </asp:Label>
                                                </div>
                                                <div class="col-4 ">
                                                    <asp:Label ID="prt_O" runat="server" />
                                                    <asp:Label>Thiểu ối/ Oligohydramnios </asp:Label>
                                                </div>
                                                <div class="col-4 ">
                                                    <asp:Label ID="prt_P" runat="server" />
                                                    <asp:Label>Đa ối/ Polyhydramnios </asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="col-12 " style="text-align: justify;font-size: 14.5px; font-family: Tahoma;margin-left:20px;max-width:99%">
                                           <div class="row">
                                               <div class="col-4 ">
                                                    <asp:Label  id="Label28" runat="server" />
				                                    <asp:Label>Trong/ Clear </asp:Label>
                                                </div>
                                                <div class="col-4 ">
                                                    <asp:Label  id="Label29" runat="server" />
				                                    <asp:Label>Nhuộm phân su/ Meconium-stained  </asp:Label>
			                                    </div>
			                                    <div class="col-4 ">
			                                    </div>
                                           </div>
                                        </div>--%>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; margin-left: 12px; max-width: 99%">
                                            <asp:Label>- Ngôi thai/ </asp:Label>
                                            <asp:Label>Presentation: </asp:Label>
                                        </div>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; margin-left: 12px; max-width: 99%">
                                            <div class="row">
                                                <div style="width: 20px">
                                                </div>
                                                <div style="width: 130px">
                                                    <asp:Label ID="prt_O_C" runat="server" />
                                                    <asp:Label>Đầu/ Cephalic </asp:Label>
                                                </div>
                                                <div style="width: 130px">
                                                    <asp:Label ID="prt_O_B" runat="server" />
                                                    <asp:Label>Mông/ Breech </asp:Label>
                                                </div>
                                                <div style="width: 455px; text-align: justify">
                                                    <asp:Label ID="prt_O_O" runat="server" />
                                                    <asp:Label>- Ngôi khác/ Others, specify: </asp:Label>
                                                    <asp:Label ID="prt_obs_presentation_other" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Vị trí ngôi thai/ Fetal position: </asp:Label>
                                            <asp:Label ID="Label48" runat="server" />
                                        </div>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Khám khung chậu/ Pelvic exam: </asp:Label>
                                            <asp:Label ID="Label49" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row mb-2  " id="div_for_gyneacology" runat="server">
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; max-width: 99%;">
                                            <asp:Label Style="font-weight: bold">2. Khám chuyên khoa/ Specific exam: </asp:Label>
                                            <asp:Label>(Cho phụ khoa/ For Gyneacology)</asp:Label>
                                        </div>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Khám ngoài/ </asp:Label>
                                            <asp:Label>External examination: </asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Bụng có sẹo phẫu thuật cũ/Abdominal Surgery Scars:  </asp:Label>
                                            <asp:Label runat="server" ID="prt_gyn_abdo_sur_scars"></asp:Label>
                                            <asp:Label runat="server" ID="prt_gyn_reason"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label>- Sờ nắn và đo ngoài tử cung/Uterine Height :  </asp:Label>
                                            <asp:Label runat="server" ID="prt_gyn_uterine_height"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; margin-left: 12px; margin-right: 10px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold">• Khám trong/ </asp:Label>
                                            <asp:Label>Internal examination: </asp:Label>
                                        </div>
                                        
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; margin-left: 12px; max-width: 99%">
                                            <div class="row">
                                                <div class="col-6">
                                                    <asp:Label>- Âm hộ/ Vulva:  </asp:Label>
                                                    <asp:Label runat="server" ID="prt_gyn_vulva"></asp:Label>
                                                </div>
                                                <div class="col-6">
                                                    <asp:Label>- Tầng sinh môn/ Perineum:  </asp:Label>
                                                    <asp:Label runat="server" ID="prt_gyn_perineum"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 12px; max-width: 99%">
                                            <asp:Label>Khám mỏ vịt/Speculum examination:  </asp:Label>
                                        </div>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; margin-left: 12px; max-width: 99%">
                                            <div class="row">
                                                <div class="col-6">
                                                    <asp:Label>- Âm đạo/ Vagina:  </asp:Label>
                                                    <asp:Label runat="server" ID="prt_gyn_vagina"></asp:Label>
                                                </div>
                                                <div class="col-6">
                                                    <asp:Label>- Dịch tiết/Discharge:  </asp:Label>
                                                    <asp:Label runat="server" ID="prt_gyn_discharge"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; margin-left: 12px; max-width: 99%">
                                            <div class="row">
                                                <div class="col-6">
                                                    <asp:Label>- Cổ tử cung/ Cervix:  </asp:Label>
                                                    <asp:Label runat="server" ID="prt_gyn_cervix"></asp:Label>
                                                </div>
                                                <div class="col-6">
                                                    <asp:Label>- Tử cung/Uterus:  </asp:Label>
                                                    <asp:Label runat="server" ID="prt_gyn_uterus"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 " style="font-size: 14.5px; font-family: Tahoma; margin-left: 12px; max-width: 99%">
                                            <div class="row">
                                                <div class="col-6">
                                                    <asp:Label>- Phần phụ/ Adnexa:  </asp:Label>
                                                    <asp:Label runat="server" ID="prt_gyn_adnexa"></asp:Label>
                                                </div>
                                                <div class="col-6">
                                                    <asp:Label>- Các túi cùng /Douglas pouchs:  </asp:Label>
                                                    <asp:Label runat="server" ID="prt_gyn_douglas_pouchs"></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label Style="font-weight: bold;">IV. Chỉ định và kết quả xét nghiệm /Laboratory indications and results: </asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label runat="server" ID="prt_lab_result"></asp:Label>
                                        </div>
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label runat="server" ID="prt_add_investigations"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma">
                                            <asp:Label Style="font-weight: bold;">V. Conclusion/Kết luận: </asp:Label>
                                            <asp:Label runat="server" ID="Label61"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 5px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold;">Chẩn đoán ban đầu/</asp:Label>
                                            <asp:Label>Initial diagnosis: </asp:Label>
                                            <asp:Label runat="server" ID="prt_initial_diagnosis"></asp:Label>

                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 5px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold;">Chẩn đoán phân biệt/</asp:Label>
                                            <asp:Label>Differential diagnosis: </asp:Label>
                                            <asp:Label runat="server" ID="prt_diagnosis"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 5px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold;">Bệnh kèm theo/</asp:Label>
                                            <asp:Label>Associated conditions: </asp:Label>
                                            <asp:Label runat="server" ID="prt_associated_conditions"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 5px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold;">Kế hoạch điều trị/</asp:Label>
                                            <asp:Label>Treatment Plan: </asp:Label>
                                            <asp:Label runat="server" ID="prt_treatment_plan"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row mb-2 ">
                                        <div class="col-12 " style="text-align: justify; font-size: 14.5px; font-family: Tahoma; margin-left: 5px; max-width: 99%">
                                            <asp:Label Style="font-weight: bold;">Kế hoạch xuất viện/</asp:Label>
                                            <asp:Label>Discharge plan: </asp:Label>
                                            <asp:Label runat="server" ID="prt_discharge_plan"></asp:Label>
                                        </div>
                                    </div>
                                    <br />
                                    
                                    <div class="row mb-2">
                                        <div class="col-5">
                                        </div>
                                        <div class="col-7 mb-2">
                                            <div class="col-12" style="text-align: center;">
                                                <label style="font-size: 14.5px; font-family: Tahoma">
                                                    <span style="font-weight: bold">Ngày giờ/ Date & time: </span>
                                                    <asp:Label ID="lbl_create_date" runat="server" />
                                                </label>
                                            </div>
                                            <div class="col-12" style="text-align: center;">
                                                <div class="col-12" style="text-align: center;">
                                                    <label style="font-size: 14.5px; font-family: Tahoma">
                                                        <span style="font-weight: bold">Họ tên, chữ ký & MSNV/ </span>
                                                        <span class="text-primary">Doctor’s name and ID</span>
                                                    </label>
                                                </div>
                                                <div class="col-12" style="text-align: center;">
                                                    <label style="font-size: 14.5px; font-family: Tahoma">
                                                        <span class="text-primary">Chữ ký/ Signature </span>
                                                    </label>
                                                </div>
                                            </div>

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
                    <ul class="breadcrumb" style="position: sticky; top: 0; left: 0; right: 0; margin-bottom: 0;">
                      <li><asp:LinkButton runat="server" ID="btnHome" OnClick="btnHome_Click" >Home</asp:LinkButton><span class="divider" style="margin-left: 4px;">/</span></li>
                      <li>Discharge Summary</li>
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

                        <webUI:PatientInfo runat="server" ID="PatientInfo1" />

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="text-primary">OBSTETRIC & GYNECOLOGICAL INITIAL ASSESSMENT</h4>
                                        <a href="javascript:void(0)" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne"></a>
                                    </div>
                                    <div class="card-body collapse show" id="collapseOne">
                                        <div class="form-body">
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
                                                                        <webUI:TextField runat="server" ID="txt_lmp_from" TextMode="SingleLine" />
                                                                    </div>
                                                                </div>
                                                                <div class="d-inline-block">
                                                                    <label class="control-label mb-1 ml-2">đến/ <span class="text-primary">to:</span></label>
                                                                    <asp:Label runat="server" ID="lbl_lmp_to" />
                                                                    <div class="form-group d-inline-block w-5 ml-2" runat="server" id="lmp_to_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_lmp_to" TextMode="SingleLine" />
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
                                                                        <a href="javascript:void(0)" data-clear="rad_tetanus_vaccination" onclick="clear_radiobutton(this)">
                                                                            <icon:xsquare runat="server" ID="XSquare12" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                <div runat="server" id="tetanus_vaccin_time_wrapper">
                                                                    <div runat="server" id="tetanus_vaccin_time_field" class="form-group d-inline-block w-5 ml-2">
                                                                        <input runat="server" data-type="number" id="txt_tetanus_vaccin_time" class="form-control text-right" />
                                                                        <span class="append">ngày/ days</span>
                                                                    </div>
                                                                </div>
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
                                                                    <webUI:TextField runat="server" ID="txt_other_ges_abnormal_note" TextMode="SingleLine" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mb-2 gt-2-a">
                                                            <label class="control-label mb-1">Chuyển dạ khởi phát lúc/ <span class="text-primary">Labor triggered at:</span></label>
                                                            <asp:Label runat="server" ID="lbl_labor_trig_at_time" />
                                                            <div class="d-inline-block" runat="server" id="labor_trig_at_time_wrapper">
                                                                <telerik:RadDateTimePicker runat="server" ID="dtpk_labor_trig_at_time" Width="200px" CssClass="ml-2 edit" />
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
                                                                            <webUI:TextField runat="server" ID="txt_edema_note" TextMode="SingleLine" />
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
                                                                            <webUI:TextField runat="server" ID="txt_obs_uterine_shape" TextMode="SingleLine"/>
                                                                        </div>
                                                                        <label class="control-label mb-1">Tư thế/ <span class="text-primary">Posture</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_posture"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n" runat="server" id="obs_posture_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_posture" TextMode="SingleLine"/>
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
                                                                        <webUI:TextField runat="server" ID="txt_obs_uterine_con" TextMode="SingleLine"/>
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
                                                                            <webUI:TextField runat="server" ID="txt_obs_breasts" TextMode="SingleLine"/>
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
                                                                            <webUI:TextField runat="server" ID="txt_obs_vulva" TextMode="SingleLine" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label></label>
                                                                    <div>
                                                                        <label class="control-label mb-1">Âm đạo/ <span class="text-primary">Vagina</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_vagina"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_vagina_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_vagina" TextMode="SingleLine" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label></label>
                                                                    <div>
                                                                        <label class="control-label mb-1">Tầng sinh môn/ <span class="text-primary">Perineum</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_perineum"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_perineum_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_perineum" TextMode="SingleLine" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label></label>
                                                                    <div>
                                                                        <label class="control-label mb-1">Cổ tử cung/ <span class="text-primary">Cervix</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_cervix"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_cervix_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_cervix" TextMode="SingleLine" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label></label>
                                                                    <div>
                                                                        <label class="control-label mb-1">Phần phụ/ <span class="text-primary">Adnexa</span></label>
                                                                        <asp:Label runat="server" ID="lbl_obs_adnexa"></asp:Label>
                                                                        <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_adnexa_wrapper">
                                                                            <webUI:TextField runat="server" ID="txt_obs_adnexa" TextMode="SingleLine" />
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
                                                                            <div runat="server" id="lbl_obs_rup_of_mem_code">
                                                                                <asp:Label runat="server" ID="lbl_obs_rup_of_mem_at"></asp:Label>
                                                                                <asp:Label runat="server" ID="lbl_obs_rup_of_mem_desc"></asp:Label>

                                                                            </div>
                                                                            <div runat="server" id="obs_rup_of_mem_at_wrapper">
                                                                                <div class="mb-2" >
                                                                                    <telerik:RadDateTimePicker runat="server" ID="dtpk_obs_rup_of_mem_at" Width="200px" CssClass="ml-2 edit" />
                                                                                </div>

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
                                                                        <webUI:TextField runat="server" ID="txt_obs_color_amniotic" TextMode="SingleLine" />
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
                                                                            <webUI:TextField runat="server" ID="txt_obs_presentation_other" TextMode="SingleLine" />
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Vị trí ngôi thai/ <span class="text-primary">Fetal position</span></label>
                                                                    <asp:Label runat="server" ID="lbl_obs_fetal_position"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_fetal_position_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_obs_fetal_position" TextMode="SingleLine" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Khám khung chậu/ <span class="text-primary">Pelvic exam</span></label>
                                                                    <asp:Label runat="server" ID="lbl_obs_pelvic_exam"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="obs_pelvic_exam_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_obs_pelvic_exam" TextMode="SingleLine" />
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
                                                                        <webUI:TextField runat="server" ID="txt_gyn_vulva" TextMode="SingleLine" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Tầng sinh môn/ <span class="text-primary">Perineum</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_perineum"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_perineum_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_perineum" TextMode="SingleLine" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2">
                                                                    <label class="control-label mb-1">Khám mỏ vịt/ <span class="text-primary">Speculum examination</span></label>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Âm đạo/ <span class="text-primary">Vagina</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_vagina"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_vagina_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_vagina" TextMode="SingleLine" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Dịch tiết/ <span class="text-primary">Discharge</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_discharge"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_discharge_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_discharge" TextMode="SingleLine" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Cổ tử cung/ <span class="text-primary">Cervix</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_cervix"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_cervix_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_cervix" TextMode="SingleLine" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Phần phụ/ <span class="text-primary">Adnexa</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_adnexa"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_adnexa_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_adnexa" TextMode="SingleLine" />
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 mb-2 gt-2-a">
                                                                    <label class="control-label mb-1">Các túi cùng/ <span class="text-primary">Douglas pouchs</span></label>
                                                                    <asp:Label runat="server" ID="lbl_gyn_douglas_pouchs"></asp:Label>
                                                                    <div class="form-group d-inline-block w-n ml-2" runat="server" id="gyn_douglas_pouchs_wrapper">
                                                                        <webUI:TextField runat="server" ID="txt_gyn_douglas_pouchs" TextMode="SingleLine" />
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

                                                    <div data-toggle="modal" runat="server" data-target="#myModal" id="btnDeleteModal" class="btn btn-danger waves-effect">Delete</div>

                                                    <asp:LinkButton runat="server" OnClick="btnAmend_Click" ID="btnAmend" CssClass="btn btn-secondary waves-effect">Amend</asp:LinkButton>

                                                    <asp:LinkButton runat="server" OnClick="btnPrint_Click" ID="btnPrint" CssClass="btn btn-secondary waves-effect">Print</asp:LinkButton>

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
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>

    <script src="../scripts/jquery-3.2.1.min.js"></script>
    <script src="../scripts/bootstrap.min.js"></script>
    <script src="../scripts/myScript.js"></script>
    <script src="../scripts/contenteditable.min.js"></script>
    <script src="../scripts/waves.js"></script>
    <script src="../scripts/sweetalert.min.js"></script>
    <script src="../scripts/alertify.js"></script>

    <script type="text/javascript">
        var elem = window.parent.parent.document.getElementById("myProgress");
        progress(elem);

        InputFilter("data-type='number'");
        $("[data-mode='SingleLine']").keypress(function (e) { return e.which != 13; });

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
        }

    </script>
</body>
</html>